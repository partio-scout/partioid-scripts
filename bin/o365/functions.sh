function init_tstamps_reg(){
    if [ ! -f export_tstamps.reg ]; then
        echo LAST_NEW_SEARCH=0 > export_tstamps.reg
        echo LAST_UPD_SEARCH=0 >> export_tstamps.reg
        echo LAST_DEL_SEARCH=0 >> export_tstamps.reg
    fi
}

function update_tstamp(){
    local tstamp=$1
    sed --in-place=bck "s/$tstamp=\(.*\)/$tstamp=$SEARCH_DATE/g" export_tstamps.reg
}

function get_prev_tstamp(){
    local tstamp=$1
    PREVIOUS_SEARCH_DATE=`grep $tstamp export_tstamps.reg | cut -d = -f 2`
}

function send_ftps(){
    local filename=$1
    if [[ "${DO_FTP}" == "yes" ]]; then
        echo -n "Triggering FTPS file transfer for $filename"
        curl -T $filename  -u $(cat ../../etc/ftps-user) --ftp-ssl ftp://ftp.partio.eu/QA/
    else
        echo "Not triggering FTPS file transfer as "-y" switch was not given. CSV to be exported was saved in $WORK_DIR/$filename"
    fi
}

function save_all_to_file() {
    ../../bin/mysql --skip-column-names -B -e "select membernumber, upn, firstname, lastname, email, postalcode, is_suspended, is_o365_suspended from users where upn is not null" |  awk -F'\t' '{print $1","$2","$3","$4","$5","$6","$7","$8}' > $FILENAME_ALL
}
