cat hitTableFinal.csv | sed 's/'Transcript10'/'synaptoporin'/g' | sed 's/'Transcript09'/'LIM_homeobox_protein_2'/g' | sed 's/'Transcript08'/'ATPase'/g' 
| sed 's/'Transcript06'/'tyrosine_phosphatase'/g' | sed 's/'Transcript02'/'asc-type_AA_transporter_2'/g' | sed 
's/'Transcript01'/'glutathione_S_transferase'/g' > hitTableFinalprotein.csv

