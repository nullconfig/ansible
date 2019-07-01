#!/bin/sh
# 
CUR_DATE=`date "+%Y%m%d"`
MYSQLDUMP='/usr/bin/mysqldump'
MYSQL_FULL="--events --skip-lock-tables --single-transaction --flush-logs --hex-blob"
BACKUP_DIR="/mnt/backups/DB/`hostname`"
MYSQL_USER='phpipam'
MYSQL_PASS='phpipamadmin'

# create backup directory
if [ ! -d "$BACKUP_DIR" ]
then
  mkdir -p ${BACKUP_DIR}
fi

# verify mysql is up to continue
service mariadb status > /dev/null
RETVAL=$?
if [ $RETVAL == 0 ]
then
    echo `date`
    # Remove old backups
    find "$BACKUP_DIR" -type f -mtime +7 -exec /bin/rm -f {} +
    # grab databases
    databases=`echo "show databases;" | mysql --user=${MYSQL_USER} --password=${MYSQL_PASS} | egrep -v "Database|lost\+found|binlogs|information_schema"`

    for DATABASE in $databases
    do
        BACKUP_FILE="${BACKUP_DIR}/${DATABASE}-${CUR_DATE}"
        # Dump routines
        echo "$MYSQLDUMP --no-data --no-create-info --routines ${DATABASE} | gzip > ${BACKUP_FILE}-routines.gz"
            $MYSQLDUMP --user=${MYSQL_USER} --password=${MYSQL_PASS} --no-data --no-create-info --routines ${DATABASE} | gzip > ${BACKUP_FILE}-routines.gz
        # dump schema
        echo "$MYSQLDUMP --events --no-data --no-create-info ${DATABASE} | gzip > ${BACKUP_FILE}-schema.gz"
            $MYSQLDUMP --user=${MYSQL_USER} --password=${MYSQL_PASS} --events --no-data ${DATABASE} | gzip > ${BACKUP_FILE}-schema.gz
        # full dump
        echo "$MYSQLDUMP ${MYSQL_FULL} ${DATABASE} | gzip > ${BACKUP_FILE}.gz"
            $MYSQLDUMP --user=${MYSQL_USER} --password=${MYSQL_PASS} ${MYSQL_FULL} ${DATABASE} | gzip > ${BACKUP_FILE}.gz
    done
else
    echo `date`
fi

exit 0