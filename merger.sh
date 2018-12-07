#!/bin/bash
#merges hit table with matching gene abbreviations
paste -d',' hitTableFinalprotein.csv GeneNames.csv > hitTableFinalprotAbreviated.csv