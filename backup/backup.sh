#!/bin/bash
DATE=$(date +%F_%T)
docker exec mariadb mysqldump -u root -prootpassword mydatabase > ./backup/mydatabase_$DATE.sql
echo "Backup created: ./backup/mydatabase_$DATE.sql"

