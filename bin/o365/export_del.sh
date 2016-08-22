#!/bin/bash
set -eu

. ./init-script.sh

get_prev_tstamp LAST_DEL_SEARCH

save_all_to_file

FILENAME_ALL_PREVIOUS=All_$PREVIOUS_SEARCH_DATE.csv

python ../../bin/o365/read_del.py "$FILENAME_ALL_PREVIOUS" "$FILENAME_ALL" "$FILENAME_DEL"

update_tstamp LAST_DEL_SEARCH

send_ftps $FILENAME_DEL
