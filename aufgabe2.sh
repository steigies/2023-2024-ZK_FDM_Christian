#! /usr/bin/bash
# get ISSN and Date from IN file

#IN = "2023-12-01-Article_list_dirty.tsv"
#OUT = "2023-12-01-Dates_and_ISSNs.tsv"

# ISSN is column 5
# Date is column 12

#> wc -l 2023-12-01-Article_list_dirty.tsv 
#131 2023-12-01-Article_list_dirty.tsv
#> grep ^IMPORTANT 2023-12-01-Article_list_dirty.tsv | wc -l
#8
#> grep ^# 2023-12-01-Article_list_dirty.tsv | wc -l
#9

# tail -n +2           # skip first line
# grep -v ^\#          # skip lines starting with #
# grep [-v] IMPORTANT  # line starting with[out] IMPORTANT
# cut -f 5, 12         # pick fields 5 and 12 only
tail -n +2 2023-12-01-Article_list_dirty.tsv | grep -v ^\#  | grep -v ^IMPORTANT | cut -f 5,12 > fields.tsv
tail -n +2 2023-12-01-Article_list_dirty.tsv | grep -v ^\#  | grep ^IMPORTANT | cut -f 7,14 >> fields.tsv

# https://www.tutorialspoint.com/how-to-convert-dos-windows-newline-crlf-to-unix-newline-lf-in-a-bash-script
# remove windows EOL character
# https://recoverit.wondershare.com/linux-recovery/bash-remove-empty-lines.html
# remove empty lines
# remove all combinations of ISSN:
# remove remaining spaces
# sort and remove duplications
cat fields.tsv | tr -d '\r' | sed '/^[[:space:]]*$/d' | sed s/[iI][sS][sS][nN][:*[:space:]]// | sed -E 's/^\s+//' | sort | uniq > 2023-12-01-Dates_and_ISSNs.tsv

#grep -v '^[[:space:]]*$' fields.tsv | sed s/[iI][sS][sS][nN][:*[:space:]]// | sed -E 's/^\s+//' | sort | uniq > 2023-12-01-Dates_and_ISSNs.tsv

#grep -v '^[[:space:]]*$' fields.tsv | tr '[:lower:]' '[:upper:]' | sed s/ISSN[:*[:space:]]// | sed -E 's/^\s+//' | sort | uniq > 2023-12-01-Dates_and_ISSNs.tsv
 
diff -u 2023-12-01-Dates_and_ISSNs.tsv 2023-12-01-Dates_and_ISSNs.tsv_solution


