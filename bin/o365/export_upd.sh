#!/bin/bash
set -eu

. ./init-script.sh

get_prev_tstamp LAST_UPD_SEARCH

save_all_to_file

FILENAME_ALL_PREVIOUS=All_$PREVIOUS_SEARCH_DATE.csv

python ../../bin/o365/read_upd.py "$FILENAME_ALL_PREVIOUS" "$FILENAME_ALL" "$FILENAME_UPD"

update_tstamp LAST_UPD_SEARCH

send_ftps $FILENAME_UPD
