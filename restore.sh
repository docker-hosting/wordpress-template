#!/bin/sh

if [ "${#}" -eq 0 ]; then
  echo Usage: restore.sh [backuparchive]
  exit
fi

BACKUP_FILE=`realpath $1`

docker run --rm \
    -v $BACKUP_FILE:/backup.tar.gz \
    -v $PWD/database:/var/lib/mysql \
    -v $PWD/html:/var/www/html \
    alpine \
    sh -c 'tar xzf /backup.tar.gz -C /tmp \
      && rm -rf /var/lib/mysql/* /var/www/html/* \
      && tar xf /tmp/www.tar -C /var/www/html \
      && tar xf /tmp/mysql.tar --exclude mysqld.sock --exclude *.pid -C /var/lib/mysql'
