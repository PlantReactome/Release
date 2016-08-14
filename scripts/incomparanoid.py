#!/bin/python
"""
InComparaNoid: Script with different analysis methods used to compare Ensembl and Inparanoid species projections.
"""

#----------------------------------------------------------------------------------------------------------------------
# modules
#----------------------------------------------------------------------------------------------------------------------
import os
import sys
import argparse
import re
from matplotlib_venn import venn2
from matplotlib import pyplot as plt

#----------------------------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------------------------
list_stats = []
dict_uniprot_map = {}
dict_ens_map = {}
dict_inp_map = {}
COUNT_TOTAL_REF_LOCI = 0 # num of TOTAL curated reference loci used to generate orthology projections  

#----------------------------------------------------------------------------------------------------------------------
# functions
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
def create_dict_uniprot_map(uniprot_substitution_path) :
#----------------------------------------------------------------------------------------------------------------------
    """
    create reference-to-uniprot mapping dictionary
    """
    dict_uniprot_map = {} # local
    # read map file, populate dict (it is possible to have a many-to-1 LOC-to-Uniprot relationship; this is ok for projection inference)
    UNI = open(uniprot_substitution_path)
    for line in UNI :
        cols = line.rstrip().split()
        loc = cols[0]
        uniprot = cols[1]
        if loc in dict_uniprot_map :
            # this should not occur; 1-to-many LOC-to-Uniprot relationships not allowed (only the inverse)
            dict_uniprot_map[loc].add(uniprot)
        else :
            dict_uniprot_map[loc] = uniprot
    UNI.close()
    
    return dict_uniprot_map


#----------------------------------------------------------------------------------------------------------------------
def create_inp_map(inparanoid_input_path, dict_uniprot_map) :
#----------------------------------------------------------------------------------------------------------------------
    """
    open the inparanoid file (which is already loci-filtered for curated reference set and does not require RAP-to-MSU back-conversion) and generate a 2-col mapping of PRJ to LOC loci
    """ 
    dict_inp_map = {} # local ensembl orthology dict

    INP = open(inparanoid_input_path)
    for line in INP :
        cols = line.rstrip().split()
        # for now, this next step is suspended. we are accepting all transcripts: isoformic, multiple sequencing lane IDs, etc.
        # ignore non-canonical orthologs
        #if int(cols[1][-1]) > 1 :
        #    continue
        os_locus = cols[0].rstrip("1").rstrip(".")
        # swap loc for uniprot, if specified
        if dict_uniprot_map :
            os_locus = dict_uniprot_map[os_locus]
        #prj_locus = cols[1].rsplit("_",1)[0].rsplit(".",1)[0].rsplit("-",1)[0] # remove any isoform suffixes (i.e. '.#', '_T0#', '-#')
        prj_locus = cols[1]
        if os_locus in dict_inp_map :
            dict_inp_map[os_locus].add(prj_locus)
        else :
            dict_inp_map[os_locus] = set([prj_locus])
    INP.close()
    
    return dict_inp_map


#----------------------------------------------------------------------------------------------------------------------
def create_ens_map(filtering_loci_path, ensembl_input_path, rap_map_path, recip_id, dict_uniprot_map, is_confident) :
#----------------------------------------------------------------------------------------------------------------------
    """
    open the ensemble plants and rap::irgsp mapping files and generate a hash mapping of reference to projected loci where 
    reciprocal identity is >= recip_id% and confidence is high. also pre-filter against set of curated Plant Reactome 
    reference loci
    """
    dict_ens_map = {} # local ensembl orthology dict
    dict_rap_map = {} # local MSU-RAP dict, using only filtered canonical LOC loci (lowest available: ".1" is first preference, ".2" second preference, and so on)

    # generate internal MSU-RAP map    
    RAP_MAP = open(rap_map_path)
    for line in RAP_MAP:
        if line.strip() != "" :
            cols = line.rstrip().split()
            rap_id = cols[0].upper()

            set_loc_ids = set(cols[1].upper().split(","))
            # select only the first locus, if it exists
            for loc_id in set_loc_ids :
                if loc_id != "NONE" :
                    canonical = loc_id.split(".")
                    dict_rap_map[rap_id] = canonical[0]
                    break;                    
    RAP_MAP.close()

    #for keys, values in dict_rap_map.items() :
    #    print(keys + " | " + values)

    # generate ref loci filter 
    FILTER = open(filtering_loci_path)
    loci_filter = set()
    for line in FILTER :
        loci_filter.add(line.rstrip())

    global COUNT_TOTAL_REF_LOCI
    COUNT_TOTAL_REF_LOCI = len(loci_filter)

    #for locus in loci_filter :
    #    print locus

    ENS = open(ensembl_input_path)
    for line in ENS :
        cols = line.rstrip().split()
        if len(cols) == 5 :
            if dict_uniprot_map :
                # if this ens os is already in uniprot list
                if cols[0] in dict_uniprot_map :
                    # get uniprot id and build into ens_map
                    os_locus = dict_uniprot_map[cols[0]]
                    # reciprocal identity is >= recip_id%, optional high confidence
                    if int(cols[2]) >= recip_id and int(cols[3]) >= recip_id and int(cols[4]) >= is_confident :
                        if os_locus in dict_ens_map :
                            dict_ens_map[os_locus].add(cols[1])
                        else :
                            dict_ens_map[os_locus] = set([cols[1]])
                else :
                    if cols[0] in dict_rap_map :
                        os_locus = dict_rap_map[cols[0]]
                        if os_locus in loci_filter :
                            # swap loc for uniprot
                            os_locus = dict_uniprot_map[os_locus]
                            # reciprocal identity is >= recip_id%, optional high confidence
                            if int(cols[2]) >= recip_id and int(cols[3]) >= recip_id and int(cols[4]) >= is_confident :
                                if os_locus in dict_ens_map :
                                    dict_ens_map[os_locus].add(cols[1])
                                else :
                                    dict_ens_map[os_locus] = set([cols[1]])
    ENS.close()
    
    return dict_ens_map


#----------------------------------------------------------------------------------------------------------------------
def compare_maps(dict_cmp_map, dict_inp_map, comparison_file_path, compara_output_path, inparanoid_output_path) :
#----------------------------------------------------------------------------------------------------------------------
    """compare Ensembl and Inparanoid projection results"""
    
    # reference loci
    inp_ref_loci = len(dict_inp_map.keys()) # inparanoid ref loci
    cmp_ref_loci = len(dict_cmp_map.keys()) # compara ref loci

    set_inp_ref_loci = set(dict_inp_map.keys())
    set_cmp_ref_loci = set(dict_cmp_map.keys())
    
    inp_exc_ref_loci = len(set_inp_ref_loci - set_cmp_ref_loci)         # inparanoid exclusive ref loci
    cmp_exc_ref_loci = len(set_cmp_ref_loci - set_inp_ref_loci)         # compara exclusive ref loci
    union_ref_loci = len(set_inp_ref_loci | set_cmp_ref_loci)           # all ref loci 
    intersection_ref_loci = len(set_inp_ref_loci & set_cmp_ref_loci)    # all shared ref loci

    # JP - not needed at this time; coverage over total curated set of reference loci is more useful
    #inp_ref_loci_coverage = '{:.2%}'.format(inp_ref_loci/float(union_ref_loci))
    #cmp_ref_loci_coverage = '{:.2%}'.format(cmp_ref_loci/float(union_ref_loci))

    """
    projected loci (all non-unique, meaning recounted relative to each ref locus; in other words, 
    not a collapsed set of projections that would ignore 1-to-many ref loci projections
    """
    inp_prj_loci = sum([len(v) for v in dict_inp_map.itervalues()]) # total inparanoid projected loci
    cmp_prj_loci = sum([len(v) for v in dict_cmp_map.itervalues()]) # total compara projected loci

    # iterate over both map files and build an overlap map, for the purpose of counting inclusive and exclusive projections by locus
    # ref_dict structure: {os locus : [[ens projected locus, ...], [inp projected locus, ...], # of common loci]}
    ref_dict = {}
    
    # build ref_dict (Compara)
    for ref_locus, prj_loci in dict_cmp_map.iteritems() :
        if ref_locus in ref_dict :
            ref_dict[ref_locus][0].extend(prj_loci) # add Compara projected loci in the first list slot
        else :
            ref_dict[ref_locus] = [prj_loci, []]

    # continue build of ref_dict (Inparanoid)
    for ref_locus, prj_loci in dict_inp_map.iteritems() :
        if ref_locus in ref_dict :
            ref_dict[ref_locus][1].extend(prj_loci) # put the Inparanoid projected loci in the second list slot
        else :
            ref_dict[ref_locus] = [[], prj_loci] # create an empty slot for the Compara projected loci, put the Inparanoid projected loci in the second list slot

    inp_exc_prj_loci = 0        # inparanoid exclusive projected loci
    cmp_exc_prj_loci = 0        # compara exclusive projected loci
    union_prj_loci = 0          # all projections, duplicates removed only at the ref locus level
    intersection_prj_loci = 0   # all overlapping projections 

    # calculate common projected loci overlap sets
    for k, v in ref_dict.iteritems() :
        curr_intersection_prj_loci = len(set(v[0]) & set(v[1]))
        v.append(curr_intersection_prj_loci)
        intersection_prj_loci += curr_intersection_prj_loci

        union_prj_loci += len(set(v[0]) | set(v[1]))
        inp_exc_prj_loci += len(set(v[1]) - set(v[0]))
        cmp_exc_prj_loci += len(set(v[0]) - set(v[1]))

    # JP - not needed at this time
    #inp_prj_loci_coverage = '{:.2%}'.format(inp_prj_loci/float(union_prj_loci)) 
    #cmp_prj_loci_coverage = '{:.2%}'.format(cmp_prj_loci/float(union_prj_loci))

    # percent coverage of orig. curated reference loci set
    inp_prj_curated_loci_coverage = '{:.2%}'.format(inp_ref_loci/float(COUNT_TOTAL_REF_LOCI))
    cmp_prj_curated_loci_coverage = '{:.2%}'.format(cmp_ref_loci/float(COUNT_TOTAL_REF_LOCI))
    
    # other stats
    #avg_projections_per_locus
    #avg_overlapping_projections_per_locus

    # calculate avg. common projected loci overlaps    
    #avg_prj_overlap = float(total_intersection_projections) / float(len(ref_dict))
    #avg_inc_prj_overlap = float(total_union_projections) / float(inc_os)

    list_stats.extend([{"[Comparison Stats]": ""},
            
        {"\n-- Reference Loci --":""}, 
        {"Total number of curated reference loci:": str(COUNT_TOTAL_REF_LOCI)},
        {"Inparanoid reference loci:": str(inp_ref_loci)}, 
        {"Compara reference loci:": str(cmp_ref_loci)}, 
        {"Exclusive Inparanoid reference loci:": str(inp_exc_ref_loci)}, 
        {"Exclusive Compara reference loci:": str(cmp_exc_ref_loci)}, 
        {"All reference loci (union):": str(union_ref_loci)},
        {"All shared reference loci (intersection):": str(intersection_ref_loci)},
        #{"Inparanoid reference loci coverage:": inp_ref_loci_coverage},
        #{"Compara reference loci coverage:": cmp_ref_loci_coverage},
        {"Inparanoid coverage of curated reference loci:": inp_prj_curated_loci_coverage},
        {"Compara coverage of curated reference loci:": cmp_prj_curated_loci_coverage},
        
        {"\n-- Projected Loci (all non-unique with respect to reference loci) --":""}, 
        {"Inparanoid projected loci:": str(inp_prj_loci)},
        {"Compara projected loci:": str(cmp_prj_loci)},
        {"Inparanoid exclusive projected loci:": str(inp_exc_prj_loci)},
        {"Compara exclusive projected loci:": str(cmp_exc_prj_loci)},
        {"All projected loci (union):": str(union_prj_loci)},
        {"All shared projected loci (intersection):": str(intersection_prj_loci)},
        #{"Inparanoid projected loci coverage:": inp_prj_loci_coverage},
        #{"Compara projected loci coverage:": cmp_prj_loci_coverage},

    ])     

    for item in list_stats :
        for k, v in item.iteritems() :
            print(k + " " + v)

    if comparison_file_path :
        COMP_STATS = open(comparison_file_path, 'w')
        for item in list_stats :
            for k, v in item.iteritems() :
                COMP_STATS.write(k + " " + v + "\n")
        COMP_STATS.close()

    if inparanoid_output_path :
        INP_OUT_FILE = open(inparanoid_output_path,'w')
        INP_FLAT_OUT_FILE = open(inparanoid_output_path + ".flat",'w')
        for k, v in sorted(dict_inp_map.iteritems()) :
            INP_OUT_FILE.write(k + "\t" + " ".join(v) + "\n")
            for projection in sorted(v) :
                INP_FLAT_OUT_FILE.write(k + "\t" + projection + "\n")
        INP_OUT_FILE.close()
        INP_FLAT_OUT_FILE.close()

    if compara_output_path :
        CMP_OUT_FILE = open(compara_output_path,'w')
        CMP_FLAT_OUT_FILE = open(compara_output_path + ".flat",'w')
        for k, v in sorted(dict_cmp_map.iteritems()) :
            CMP_OUT_FILE.write(k + "\t" + " ".join(v) + "\n")
            for projection in sorted(v) :
                CMP_FLAT_OUT_FILE.write(k + "\t" + projection + "\n")
        CMP_OUT_FILE.close()
        CMP_FLAT_OUT_FILE.close()

    return [[set_inp_ref_loci, set_cmp_ref_loci], [inp_exc_prj_loci, cmp_exc_prj_loci, intersection_prj_loci], [inp_prj_curated_loci_coverage, cmp_prj_curated_loci_coverage]]

#----------------------------------------------------------------------------------------------------------------------
def write_reactome_files(dict_map, reactome_gene_protein_path, reactome_projection_path, projection_prefix) :
#----------------------------------------------------------------------------------------------------------------------
    """
    accepts a single projection map source and outputs the appropriate reference::projection protein and gene::protein
    "orthopair" format files, including a projection prefix as needed
    """
    val_set = set() # hold unique protein list
    
    REACTOME_GENE_PROTEIN_OUT_FILE = open(reactome_gene_protein_path,'w')
    REACTOME_PROJECTION_OUT_FILE = open(reactome_projection_path,'w')
    for k, v_list in sorted(dict_map.iteritems()) :
        REACTOME_PROJECTION_OUT_FILE.write(k + "\t" + " ".join(map(lambda x: x.replace(x, (projection_prefix if projection_prefix else "") + x), v_list)) + "\n")
        for v in v_list :
            if v not in val_set :
                val_set.add(v)
                REACTOME_GENE_PROTEIN_OUT_FILE.write(v + "\t" + (projection_prefix if projection_prefix else "") + v + "\n")
    REACTOME_GENE_PROTEIN_OUT_FILE.close()
    REACTOME_PROJECTION_OUT_FILE.close()


#----------------------------------------------------------------------------------------------------------------------
def generate_venn(venn_data, list_coverage, colors, is_ref, ref_species, proj_species, reciprocal_id, confidence, venn_output_path) :
#----------------------------------------------------------------------------------------------------------------------
    """build and display Venn diagrams representing reference loci overlap"""

    plt.figure(figsize=(9, 9 if is_ref else 8))

    if is_ref :
        intersection_loci = len(venn_data[0] & venn_data[1])
        union_loci = len(venn_data[0] | venn_data[1])
        inp_exc_loci = len(venn_data[0] - venn_data[1])
        cmp_exc_loci = len(venn_data[1] - venn_data[0])
        
        v = venn2(venn_data, ('Inparanoid', 'Compara'))

    else :
        intersection_loci = venn_data[2]
        inp_exc_loci = venn_data[0]
        cmp_exc_loci = venn_data[1]
        union_loci = inp_exc_loci + intersection_loci + cmp_exc_loci
        
        v = venn2(subsets = venn_data)
    
    v.get_patch_by_id('10').set_alpha(0.5)
    v.get_patch_by_id('10').set_color(colors[0])
    
    v.get_patch_by_id('01').set_alpha(0.5)
    v.get_patch_by_id('01').set_color(colors[1])
    
    v.get_patch_by_id('11').set_alpha(0.75)
    v.get_patch_by_id('11').set_color(colors[2])
    
    v.get_label_by_id('10').set_text('')
    v.get_label_by_id('01').set_text('')
    v.get_label_by_id('11').set_text('')
    
    plt.annotate(str(inp_exc_loci), xy = v.get_label_by_id('10').get_position(), xytext = (0,-10), size = 'x-large',
                ha = 'center', textcoords = 'offset points')
    plt.annotate(str(cmp_exc_loci), xy = v.get_label_by_id('01').get_position(), xytext = (0,-10), size = 'x-large',
                ha = 'center', textcoords = 'offset points')
    plt.annotate(str(intersection_loci), xy = v.get_label_by_id('11').get_position(), xytext = (0,-10), size = 'x-large',
                ha = 'center', textcoords = 'offset points')
    
    v.get_label_by_id('A').set_text('')
    v.get_label_by_id('B').set_text('')

    plt.annotate('Inparanoid', xy = v.get_label_by_id('10').get_position(), xytext = (-30,-70), size = 'x-large',
        ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad=0.5', fc = colors[3], alpha = 0.3))
     
    plt.annotate('Compara', xy = v.get_label_by_id('01').get_position(), xytext = (30,-70), size = 'x-large',
                ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = colors[4], alpha = 0.3))

    # show percentage coverage of curated reference loci on reference diagram only
    if is_ref :
        plt.annotate('[Coverage of curated reference loci]\nInparanoid: ' + list_coverage[0] + '\nCompara: ' + list_coverage[1], xy = v.get_label_by_id('11').get_position(), xytext = (0,-300), size = 'large',
                    ha = 'center', va = 'bottom', textcoords = 'offset points')

    plt.title('[' + ref_species + ' > ' + proj_species + ']\n' + (' Reference ' if is_ref else ' Projection ') + 'loci (' + str(union_loci) + ' projected' + (' of ' + str(COUNT_TOTAL_REF_LOCI) + ' total' if is_ref else '') + ') coverage comparison\nbetween Inparanoid super-clusters and Compara orthology data,\ngiven ' + str(reciprocal_id) + '% Compara reciprocal identity' + (', high-confidence only' if confidence else ''))

    if venn_output_path :
        plt.savefig(venn_output_path + '/incomparanoid_' + ref_species.replace(' ','_') + '_2_' + proj_species.replace(' ','_') + '_recip_' 
                        + str(reciprocal_id) + ('_all_confidence' if confidence else '') + ('_reference_loci' if is_ref else '_projection_loci') + '_comparison.png', 
                    dpi=None, facecolor='w', edgecolor='w',
                    orientation=None, papertype=None, format='png',
                    transparent=True, bbox_inches=None, pad_inches=0.1,
                    frameon=None)

    plt.show()

#----------------------------------------------------------------------------------------------------------------------
# main
#----------------------------------------------------------------------------------------------------------------------

# process args
parser = argparse.ArgumentParser(description='Script with different analysis methods used to compare Ensembl and Inparanoid species projections.')

# input settings
parser.add_argument('-f', '--filtering_loci_path', help='list of curated reference loci user for filtering')
parser.add_argument('-e', '--ensembl_input_path', help='ensembl compara input file')
parser.add_argument('-i', '--inparanoid_input_path', help='inparanoid supercluster input file')
parser.add_argument('-m', '--rap_map_path', help='MSU-RAP mapping file')
parser.add_argument('-r', '--reciprocal_id', type=int, help='reciprocal identity percentage')
parser.add_argument('-C', '--confidence_high', help='only use ensembl projections marked as high-confidence', action='store_true')
parser.add_argument('-u', '--uniprot_substitution', help='file path to UniProt substitution data for reference loci')
parser.add_argument('--ref_species', help='reference species')
parser.add_argument('--proj_species', help='projection species')
# TODO: add an "inparanoid super-cluster vs. conventional input" flag

# output settings
parser.add_argument('-p', '--projection_prefix', help='add a platform-specific prefix to the projected protein identifiers', default='') # e.g. 'MaizeGDB:'
parser.add_argument('-c', '--comparison_file_path', help='output file containing statistical comparisons')
parser.add_argument('-E', '--ensembl_output_path', help='output file containing flat (1-to-many) ensemble ortho pairs')
parser.add_argument('-I', '--inparanoid_output_path', help='output file containing flat (1-to-many) inparanoid ortho pairs')
parser.add_argument('-g', '--generate_reactome_output', help='produce ortho_pair files required by Reactome projection inference script for specified projection source', choices=['ensembl', 'inparanoid'])
parser.add_argument('-R', '--reactome_gene_protein_path', help='output file containing gene::protein mappings for Reactome projection inference') # e.g. 'zmay_gene_protein_mapping.txt'
parser.add_argument('-P', '--reactome_projection_path', help='output file containing reference::projection protein mappings for Reactome inference') # e.g. 'osat_zmay_mapping.txt'
parser.add_argument('-V', '--venn_diagram', help='generate Venn diagram', action='store_true')
parser.add_argument('-v', '--venn_output_path', help='save Venn diagrams to this directory')

args = parser.parse_args()
#print args

# create ref loci::UniProt map, if specified
if args.uniprot_substitution :
    dict_uniprot_map = create_dict_uniprot_map(args.uniprot_substitution)

# create projection maps
if (args.inparanoid_input_path) :
    dict_inp_map = create_inp_map(args.inparanoid_input_path, dict_uniprot_map)
if (args.ensembl_input_path) :
    dict_ens_map = create_ens_map(args.filtering_loci_path, args.ensembl_input_path, args.rap_map_path, args.reciprocal_id, dict_uniprot_map, 1 if args.confidence_high else 0)

# generate stats and output them; assumes both inparanoid and ensembl data have been provided
if (args.comparison_file_path) :
    all_venn_data = compare_maps(dict_ens_map, dict_inp_map, args.comparison_file_path, args.ensembl_output_path, args.inparanoid_output_path)

if args.generate_reactome_output == 'ensembl' :
    write_reactome_files(dict_ens_map, args.reactome_gene_protein_path, args.reactome_projection_path, args.projection_prefix)
if args.generate_reactome_output == 'inparanoid' :
    write_reactome_files(dict_inp_map, args.reactome_gene_protein_path, args.reactome_projection_path, args.projection_prefix)

# NOTE: requires local matplotlib backend configuration
if args.venn_diagram :
    generate_venn(all_venn_data[0], all_venn_data[2], ['red', 'yellow', 'orange', 'blue', 'lime'], 1, args.ref_species, args.proj_species, args.reciprocal_id, 1 if args.confidence_high else 0, args.venn_output_path)
    generate_venn(all_venn_data[1], all_venn_data[2], ['green', 'yellow', 'lightgreen', 'blue', 'lime'], 0, args.ref_species, args.proj_species, args.reciprocal_id, 1 if args.confidence_high else 0, args.venn_output_path)

#----------------------------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------------------------

