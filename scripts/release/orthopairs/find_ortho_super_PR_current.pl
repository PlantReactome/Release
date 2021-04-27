#!/usr/bin/perl

###########################################################################
#    Written by Justin Elser 4/14/10                                      #
#                                                                         #
#    This program takes an input file with a list of genes and            #
#      finds the orthologs (and paralogs if the score in sth_get_ortho    #
#      is changed) from the supercluster table                            #
#                                                                         #
###########################################################################

use strict;
use warnings;

if($#ARGV != 1) {
	print "usage: find_ortho_super.pl input_gene_list output_file_prefix\n";
	exit;
}

use lib "$ENV{HOME}/scripts/jaiswallab/interactome_scripts";

use DbiFloret;

my $dbh = DbiFloret::dbconnect;

print $ARGV[1];

#my @species_array = ("Oryza_sativa",
my @species_array = ("Oryza_sativa.japonica.IRGSP",
#my @species_array = ("Oryza_sativa.japonica.MSU", #irrelevant; identical results to "Oryza_sativa.japonica.IRGSP", probably due to the '.' following "Oryza_sativa"
	# use db inparanoid_data_plantreactome
                "Arachis_duranensis",
		"Arachis_ipaensis",
		"Cajanus_cajan", # still pulling from inparanoid while Ensembl decides when to bring it back
		"Cicer_arietinum",
		"Citrus_sinensis",
		"Erythranthe_guttata",
		"Eucalyptus_grandis",
		"Fragaria_vesca",
	#"Gossypium_hirsutum", # on hold
		"Jatropha_curcas",
		"Malus_domestica",
	#"Oryza_australiensis", # see ...AUS.kasalath
		"Oryza_granulata",
		"Oryza_minuta",
		"Oryza_officinalis",
		"Oryza_sativa.AUS.kasalath", # actually Oryza_australiensis
	#"Oryza_sativa.AUS.kasalath", # use file from old inparanoid run for now
		"Phoenix_dactylifera",
		"Picea_abies",
		"Pinus_taeda",
		"Synechocystis_sp.pcc.6803", # Synechocystis_pcc6803
	# start r62 additions from new inparanoid run
		"Asparagus_officinalis",
		"Cannabis_sativa.CRBRx", # Cannabis sativa
		"Cannabis_sativa.Purple.Kush", # Cannabis sativa subsp. Indica
		"Capsella_rubella",
		"Citrullus_lanatus",
		"Corchorus_olitorius",
		"Humulus_lupulus.haplotig", # Humulus lupulus haplotig
		"Humulus_lupulus.primary", # Humulus lupulus primary
		"Nelumbo_nucifera",
		"Phyllostachys_heterocycla", # Phyllostachys edulis
		"Salvia_hispanica",
		"Zoysia_japonica.Nagirizaki" # Zoysia japonica
	);
#my @species_array = ("Oryza_sativa.japonica.IRGSP", $ARGV[1]);
#my @species_array = ("Ath", "Maize");
my $spec_array_size = @species_array;
#print join(", ", @species_array);
#exit(0);

# read in list of genes from csv file given as argument
my $in_file = $ARGV[0];

open (in_file, "$in_file");

my @in_gene_array;

while(<in_file>) {
	my $in_gene = $_;
	chomp $in_gene;	
	$in_gene =~ s/\s//g;
	#print "$in_gene before ::";
	if ($in_gene !~ /\.\d$/) {
		if ($in_gene =~ /^LOC/) {
			$in_gene .= ".1"; # add the suffix back so that the gene matches the db
			$in_gene =~ s/G/g/g;
			$in_gene =~ s/S/s/g;
		}
		if ($in_gene =~ /^OS/) {
			$in_gene .= "-01"; # for IRGSP
			$in_gene =~ s/S/s/g;
			$in_gene =~ s/G/t/g;
		}
	}
	push(@in_gene_array, $in_gene);
	#print " after $in_gene\n";
}
close(in_file);

#for (my $i = 1; $i<$spec_array_size; $i++) {
#	print "$species_array[$i]\n";
#}
#exit(0);

for (my $i = 1; $i<$spec_array_size; $i++) {

	my $out_file = $ARGV[1] . "_$species_array[$i].txt";
	open(out_file, ">$out_file");
	
	my $table = "super_clust";
	#print out_file "$species_array[$i]\t$table\n";
	
	# set up the db query statement
	my $sth_get_id = $dbh->prepare("select super_id from $table where gene = ?");
	
	# set up db query statement to get the orthologs using the cluster id
	my $sth_get_ortho = $dbh->prepare("select gene from $table where super_id = ? and species = '$species_array[$i]'");
	#my $sth_get_ortho = $dbh->prepare("select gene,species from $table where super_id = ?");

	foreach my $gene (@in_gene_array) {
		
		my $rv1 = $sth_get_id->execute($gene);
		if (!$rv1) {
			next;
		}
		
		while (my $id = $sth_get_id->fetchrow_array()) {

			my $rv2 = $sth_get_ortho->execute($id);
			if (!$rv2) {
				next;
			}
			
			while (my ($ortho, $species) = $sth_get_ortho->fetchrow_array()) {
				$gene =~ s/s/S/g;
				$gene =~ s/g/G/g;
				$gene =~ s/t/G/g;
				$gene =~ s/-0\d$//g; # remove -0#
				print out_file "$gene\t$ortho\n";
			}
		}
	}
	close(out_file);
}

