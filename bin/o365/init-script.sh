#!/bin/bash
set -eu
SEARCH_DATE=`date '+%s'`
NOW=`date +"%Y%m%d%H%M%S"`
FILENAME_ALL=All_$SEARCH_DATE.csv
FILENAME_NEW=Uudet_$NOW.csv
FILENAME_UPD=Muokatut_$NOW.csv
FILENAME_DEL=Poistetut_$NOW.csv

SCRIPT_DIR=$(dirname "$0")
CONF_DIR="${SCRIPT_DIR}/../../etc"
WORK_DIR="${SCRIPT_DIR}/../../var/o365-export-members"

if [[ "${1-}" == "-y" ]]; then
  DO_FTP=yes
else
  DO_FTP=no
fi

. ./functions.sh

mkdir -p "${WORK_DIR}"

cd "${WORK_DIR}"

touch All_0.csv
init_tstamps_reg

