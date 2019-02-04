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
import argparse
import pprint

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


def map_data_and_generate_extended_file(dict_rice, dict_mappings, rice_source_filter, ensembl_reactions_file,
                                        output_expanded_reactions_file):
    """
    Map OS genes for UniProt reaction entries; options include MSU entries, RAP entries, or both
    Output results to extended copy of Ensembl2PlantReactomeReactions.txt
    :param dict_rice:
    :param dict_mappings:
    :param rice_source_filter:
    :return:
    """
    shutil.copy2(ensembl_reactions_file, output_expanded_reactions_file)

    choices = {'MSU': 'LOC', 'RAP': 'OS'}
    rice_id_filter = choices.get(rice_source_filter, '')

    num_mappings = 0

    ext_out_file = open(output_expanded_reactions_file, 'a');

    for k, v in dict_mappings.items():
        if k in dict_rice:
            gene_list = v

            for gene_id in gene_list:
                    if gene_id.startswith(rice_id_filter):
                        for rice_entry in dict_rice[k]:
                            if args.verbose:
                                print(gene_id, rice_entry)
                            ext_out_file.write(gene_id + '\t' + '\t'.join(map(str, rice_entry)) + '\n')
                            num_mappings += 1

    if args.verbose:
        print('Mappings to be appended: ' + str(num_mappings))
    print('IDs filtered and mapped; "left outer join."')

    ext_out_file.close()
    print('New Ensembl file generated: ' + args.output_expanded_reactions_file)
    return


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

map_data_and_generate_extended_file(dict_rice,
                                    dict_mappings,
                                    args.rice_source_filter,
                                    args.ensembl_reactions_file,
                                    args.output_expanded_reactions_file)  # expand the contents of the rice rxn dictionary
print("Done.")

# end ------------------------------------------------------------------------------------------------------------------
