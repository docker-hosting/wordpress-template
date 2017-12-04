#!/bin/sh

if [ "${#}" -eq 0 ]; then
  echo Usage: backup.sh [backupdir] [backupname]
  exit
fi

BACKUP_DIR=${1:-./backups}
BACKUP_FILE=${2:-backup.tar.gz}
BACKUP_DIR=`realpath $BACKUP_DIR`

docker run --rm \
    -v $BACKUP_DIR:/backups \
    -v $PWD/db_backup:/db_dumps \
    -v $PWD/html:/var/www/html \
    alpine sh -c \
        "tar cf /tmp/mysql.tar -C /db_dumps . \
        && tar cf /tmp/www.tar -C /var/www/html . \
        && tar czf /backups/$BACKUP_FILE -C /tmp mysql.tar www.tar"
