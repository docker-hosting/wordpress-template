#!/bin/bash
# Rename backup file.
if [[ -n "$DB_DUMP_DEBUG" ]]; then
    set -x
fi

if [ -e ${DUMPFILE} ];
then
    now=$(date +"%Y-%m-%d")

    # gzip html content while preserving permissions
    tar czpvf backup-${now}.tar.gz /data "${DUMPFILE}"
    
    # move file
    mkdir -p /backups
    mv backup-${now}.tar.gz /backups/
else
    echo "ERROR: Backup file ${DUMPFILE} does not exist!"
fi
