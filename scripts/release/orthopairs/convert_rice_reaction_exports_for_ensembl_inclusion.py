#!/bin/python
"""
Convert the UniProt entries in UniProt2PlantReactomeReactions.txt to Oryza sativa gene ids. This allows the data to be
used both by Gramene Search and Ensembl Plants. Make sure there are values in every column; filter out non-rice entries
that have slipped in via the Reactome export process. Make it optional whether to include MSU and/or RAP ids; at least
one is required.
Inputs: UniProt2PlantReactomeReactions.txt, os_loc_2_os_uniprot_rice_slice_17_manual.txt, Ensembl2PlantReactomeReactions.txt
Output: an expanded Ensembl2PlantReactomeReactions.txt, now including rice entries.
"""

# modules --------------------------------------------------------------------------------------------------------------

import os
import shutil
import sys
import argparse
import pprint
import re

# globals --------------------------------------------------------------------------------------------------------------

dict_projected_species = {}
pp = pprint.PrettyPrinter()

# functions ------------------------------------------------------------------------------------------------------------


def load_configs(projected_species_path):
    """
    import projected species and abbs from tab file
    """
    dict_projected_species = {} # local
    # read map file, populate dict
    config = open(projected_species_path)
    next(config)
    for line in config:
        cols = line.rstrip().split('\t')

        species_name = cols[0]
        stable_abbv = cols[1]
        two_digit_abbv = cols[2]
        four_digit_abbv = cols[3]
        gspecies_abbv = cols[4]
        homology_method = cols[5]
        recip_id = cols[6]
        ext_ref = cols[7]
        seq_source = cols[8]
        clade = cols[9]
        ncbi_tax_id = int(cols[10]) if (len(cols) == 11 or len(cols) == 12) else ""
        familiar_name = cols[11] if len(cols) == 12 else ""

        dict_projected_species[species_name] = [
            stable_abbv,
            two_digit_abbv,
            four_digit_abbv,
            gspecies_abbv,
            homology_method,
            recip_id,
            ext_ref,
            seq_source,
            clade,
            str(ncbi_tax_id),
            familiar_name
        ]

    config.close()
    if args.verbose:
        pp.pprint(dict_projected_species)

    return dict_projected_species


def rename_and_deploy(dict_projected_species, ensembl_input_path, inparanoid_input_path,
                      slice_version_number, ensembl_release_number, output_orthopair_path):
    """
    iterate over projected species, get orthology sources, copy (and rename) files according to templates, placing them
     in the appropriate output folder location
    """
    ensembl_species_count = 0
    inparanoid_species_count = 0

    for k, v in dict_projected_species.items():
        genus = k.split(' ')[0]
        species = k.split(' ')[1].title()  # uc 1st char
        if v[4] == "Compara":
            ensembl_species_count += 1
            shutil.copy2(ensembl_input_path + "/" + genus + species + "_osj.rtm",
                      output_orthopair_path + "/slice_" + str(slice_version_number) + "/" + v[1] + "/ensembl_plants_"
                      + str(ensembl_release_number) + "_os_2_" + v[1].lower() + "_sorted.tab")
        else:
            inparanoid_species_count += 1
            shutil.copy2(inparanoid_input_path + "/Oryza_sativa.japonica.IRGSP_" + genus + "_" + species.lower() + ".txt",
                      output_orthopair_path + "/slice_" + str(slice_version_number) + "/" + v[1] + "/inparanoid_os_2_" + v[1].lower() + "_sorted.tab")
        if args.verbose:
            print(k,v)

    print("ensembl_species_count: " + str(ensembl_species_count) + ", inparanoid_species_count: " + str(inparanoid_species_count))

# main -----------------------------------------------------------------------------------------------------------------

# process args
parser = argparse.ArgumentParser(
    description='Convert the UniProt entries in UniProt2PlantReactomeReactions.txt to Oryza sativa gene ids. This'
                    ' allows the data to be used both by Gramene Search and Ensembl Plants. Make sure there are values in every column;'
                    ' filter out non-rice entries that have slipped in via the Reactome export process. Make it optional whether to include'
                    ' MSU and/or RAP ids; at least one is required.'
                    ' Inputs: UniProt2PlantReactomeReactions.txt, os_loc_2_os_uniprot_rice_slice_17_manual.txt, '
                    '   Ensembl2PlantReactomeReactions.txt; Output: an expanded Ensembl2PlantReactomeReactions.txt, now including rice entries.')

# settings
parser.add_argument('-u', '--uniprot_reactions_file', help='path to uniprot reactions export file', required=True)
#  ~/Documents/projects/plant_reactome/releases/r60/exports/UniProt2PlantReactomeReactions.txt
parser.add_argument('-e', '--ensembl_reactions_file', help='path to ensembl reactions export file', required=True)
#  ~/Documents/projects/plant_reactome/releases/r60/exports/Ensembl2PlantReactomeReactions.txt
parser.add_argument('-m', '--mapping_file', help='path to os-2-uniprot mapping file for current release', required=True)
#  ~/Documents/projects/plant_reactome/plant_reactome_site/projection/loc_to_uniprot/os_loc_2_os_uniprot_rice_slice_17_manual.txt
parser.add_argument('-o', '--output_expanded_reactions_file', help='path to expanded ensembl reactions export file, now inlcuding rice entries', required=True)
#  ~/Documents/projects/plant_reactome/releases/r60/exports/Ensembl2PlantReactomeReactions_expanded.txt
parser.add_argument('-r', '--rice_gene_mode', default="RAP", choices=['RAP', 'MSU', 'both'])

# other settings
parser.add_argument('-v', '--verbose', action='store_true')

args = parser.parse_args()
if args.verbose:
    for arg in vars(args):
        print(arg, "=", getattr(args, arg))

# load reactome_export files - once uniprot
# load mapping file
# map (and filter)
# cat mapped uniprot rice data to end of data from copied ensembl file (as new file) - or load ensemble and output both to new file

dict_uniprot = load_reactome_reaction_file(args.uniprot_reactions_file)
dict_mappings = load_mapping_file(args.mapping_file)
map_and_filter(dict_uniprot, dict_mappings)
generate_extended_ensembl_file(args.output_expanded_reactions_file)
#rename_and_deploy(dict_projected_species, args.ensembl_input_path, args.inparanoid_input_path,
#                  args.slice_version_number, args.ensembl_release_number, args.output_orthopair_path)

#print('Files renamed and moved.')

# end ------------------------------------------------------------------------------------------------------------------
