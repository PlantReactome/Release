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

dict_rice = {}
dict_mappings = {}
pp = pprint.PrettyPrinter()

# functions ------------------------------------------------------------------------------------------------------------


def load_reactome_reaction_file(uniprot_reactions_file):
    """
    load a reactome_export file; filter out any non-rice entries based on stable_id, or missing a Uniprot value
    :param uniprot_reactions_file:
    :return:
    """
    count = 0
    fUniprotRxn = open(uniprot_reactions_file)
    for line in fUniprotRxn:
        cols = line.rstrip().split('\t')

        if cols[0]:  # make sure that UniProt column has a value
            if not cols[1].find("-OSA-") < 0:  # filter out any non-rice
                count += 1
                dict_rice[cols[0].strip()] = [  # uniprot id
                    cols[1].strip(),  # stable id
                    cols[2].strip(),  # browser url
                    cols[3].strip(),  # rxn name
                    cols[4].strip(),  # discovery method
                    cols[5].strip()   # species
                ]
    fUniprotRxn.close()

    if args.verbose:
        pp.pprint(dict_rice)
        print('count: ' + str(count) + ', Uniprot reactions file loaded.')
    return dict_rice


def load_mapping_file(mapping_file) :
    """
    load mapping file, ptu the UniProt ID in the key, and the rice gene id(s) in the value, as an array
    :param mapping_file:
    :return:
    """
    count = 0
    fMappings = open(mapping_file)
    for line in fMappings:
        cols = line.rstrip().split('\t')
        uniprot_id = cols[1].strip();
        gene_id = cols[0].strip();
        count += 1
        if dict_mappings[uniprot_id]:  # existing UniProt entry
            dict_mappings[uniprot_id] = [
                dict_mappings[uniprot_id].add(gene_id),  # add'l rice gene id
            ]
        else:  # new UniProt entry
            dict_mappings[uniprot_id] = [
                gene_id,  # first rice gene id
            ]
    fMappings.close()

    if args.verbose:
        pp.pprint(dict_mappings)
        print('rice gene id count: ' + str(count) + ', Uniprot::OS mappings file loaded.')
    return {}


def map_and_filter(dict_uniprot, dict_mappings):
    """
    map and filter OS genes for UniProt reaction entries
    :param dict_uniprot:
    :param dict_mappings:
    :return:
    """
    if args.verbose:
        print('IDs filtered and mapped; "left outer join."')
    return {}


def generate_extended_ensembl_file(dict_rice, output_expanded_reactions_file):
    """
    cat mapped uniprot rice data to end of data from copied ensembl file (as new file) - or load ensemble and output both to new file
    :param dict_rice:
    :param output_expanded_reactions_file:
    :return:
    """
    if args.verbose:
        print('New Ensembl file generated: ' + args.output_expanded_reactions_file)
    return


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

dict_rice = load_reactome_reaction_file(args.uniprot_reactions_file)
dict_mappings = load_mapping_file(args.mapping_file)
#dict_rice = map_and_filter(dict_rice, dict_mappings, rice_gene_mode)
#generate_extended_ensembl_file(dict_rice, args.output_expanded_reactions_file)
print("Done.")

# end ------------------------------------------------------------------------------------------------------------------
