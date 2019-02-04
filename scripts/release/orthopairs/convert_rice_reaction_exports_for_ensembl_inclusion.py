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
            uniprot_id = cols[0].strip()

            if not cols[1].find("-OSA-") < 0:  # filter out any non-rice

                if uniprot_id in dict_rice:  # existing UniProt entry
                    dict_rice[uniprot_id].append(  # add'l entry
                        [
                            cols[1].strip(),  # stable id
                            cols[2].strip(),  # browser url
                            cols[3].strip(),  # rxn name
                            cols[4].strip(),  # discovery method
                            cols[5].strip()   # species
                        ]
                    )

                else:  # new UniProt entry
                    dict_rice[uniprot_id] = [[  # uniprot id
                        cols[1].strip(),  # stable id
                        cols[2].strip(),  # browser url
                        cols[3].strip(),  # rxn name
                        cols[4].strip(),  # discovery method
                        cols[5].strip()   # species
                    ]]
                count += 1

    fUniprotRxn.close()

    if args.verbose:
        pp.pprint(dict_rice)
        print('UniProt rxns count: ' + str(count))
    print('Uniprot reactions file loaded.')
    return dict_rice


def load_mapping_file(mapping_file) :
    """
    load mapping file, put the UniProt ID in the key, and the rice gene id(s) in the value, as an array
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
        if uniprot_id in dict_mappings:  # existing UniProt entry
            dict_mappings[uniprot_id].append(gene_id)  # add'l rice gene id
        else:  # new UniProt entry
            dict_mappings[uniprot_id] = [
                gene_id  # first rice gene id
            ]
    fMappings.close()

    if args.verbose:
        pp.pprint(dict_mappings)
        print('Rice gene id count: ' + str(count))
    print('Uniprot::OS mappings file loaded.')
    return dict_mappings


def map_data(dict_rice, dict_mappings, rice_source_filter):
    """
    map OS genes for UniProt reaction entries; options include MSU entries, RAP entries, or both
    :param dict_uniprot:
    :param dict_mappings:
    :param rice_gene_mode:
    :return:
    """
    num_mappings = 0
    for k, v in dict_mappings.items():
        if k in dict_rice:
            gene_list = v

            for gene_id in gene_list:
                    if gene_id.startswith(rice_source_filter):
                        for rice_entry in dict_rice[k]:
                            print(gene_id, rice_entry)
                            num_mappings += 1

    if args.verbose:
        print('Mappings to be appended: ' + str(num_mappings))
    print('IDs filtered and mapped; "left outer join."')
    return {}


def generate_extended_ensembl_file(dict_rice, output_expanded_reactions_file):
    """
    append mapped uniprot rice data to end of data from copied ensembl file (as new file)
    :param dict_rice:
    :param output_expanded_reactions_file:
    :return:
    """
    if args.verbose:
        print('New Ensembl file generated: ' + args.output_expanded_reactions_file)
    return


# leftover; code for stealing
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
parser.add_argument('-r', '--rice_source_filter', choices=['RAP', 'MSU'])  # not required

# other settings
parser.add_argument('-v', '--verbose', action='store_true')

args = parser.parse_args()

if not args.rice_source_filter:
    args.rice_source_filter = ''

if args.verbose:
    for arg in vars(args):
        print(arg, "=", getattr(args, arg))

dict_rice = load_reactome_reaction_file(args.uniprot_reactions_file)
dict_mappings = load_mapping_file(args.mapping_file)
dict_rice = map_data(dict_rice, dict_mappings, args.rice_source_filter)  # expand the contents of the rice rxn dictionary
#generate_extended_ensembl_file(dict_rice, args.output_expanded_reactions_file)
print("Done.")

# end ------------------------------------------------------------------------------------------------------------------
