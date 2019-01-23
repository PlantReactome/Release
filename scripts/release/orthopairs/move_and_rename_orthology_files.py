#!/bin/python
"""
Distribute orthology files from both Ensembl Compara and Inparanoid downloads. Move and rename, based on config file
of projected species abbvs.
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
    description='Distribute orthology files from both Ensembl Compara and Inparanoid downloads. Move and rename, '
                'based on config file of projected species abbvs. Sample execution:'
                'move_and_rename_orthology_files.py -c ./Plant_Reactome_projection_list.tsv '
                '-e ~/Documents/projects/plant_reactome/releases/r60/orthology_data/compara/v2 '
                '-i ~/Documents/projects/plant_reactome/releases/r60/orthology_data/inparanoid '
                '-o ~/Documents/projects/plant_reactome/plant_reactome_site/projection/rice_to '
                '-s 17 -r 42 -v')

# input settings
parser.add_argument('-c', '--projected_species_configs', help='tab file containing projected species and abbvs', required=True)
parser.add_argument('-e', '--ensembl_input_path', help='path to ensembl compara orthology files')
#  ~/Documents/projects/plant_reactome/releases/r60/orthology_data/compara/v2/test
parser.add_argument('-i', '--inparanoid_input_path', help='path to inparanoid supercluster orthology files')
#  ~/Documents/projects/plant_reactome/releases/r60/orthology_data/inparanoid/test
parser.add_argument('-s', '--slice_version_number', type=int)
parser.add_argument('-r', '--ensembl_release_number', type=int)

# output settings
parser.add_argument('-o', '--output_orthopair_path', help='path to renamed, redistributed orthology files, binned in folders by species abbv')
#  ~/Documents/projects/plant_reactome/plant_reactome_site/projection/rice_to

# other settings
parser.add_argument('-v', '--verbose', action='store_true')

args = parser.parse_args()
if args.verbose:
    print(args)

dict_projected_species = load_configs(args.projected_species_configs)
rename_and_deploy(dict_projected_species, args.ensembl_input_path, args.inparanoid_input_path,
                  args.slice_version_number, args.ensembl_release_number, args.output_orthopair_path)

print('Files renamed and moved.')

# end ------------------------------------------------------------------------------------------------------------------
