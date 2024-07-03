#!/bin/bash
HUW_EMAIL_IDS=nizarvelapuram@huawei.com,saisurya@huawei.com
date3=`date +"%d-%m-%y"`
if [ -f /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_MAIN_$date3.csv ]; then rm /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_MAIN_$date3.csv; fi
cd /rocra_binaries/Scripts/huw_scripts/out/DOR
cat DOR_mount_$date3.out >> DOR_MAIN_$date3.csv
cat DOR_FILECOUNT_$date3.out >> DOR_MAIN_$date3.csv
cat DOR_XDR_COUNT_$date3.csv >> DOR_MAIN_$date3.csv
cat DOR_RADB_$date3.csv >> DOR_MAIN_$date3.csv
cat DOR_FMDB_$date3.csv >> DOR_MAIN_$date3.csv
echo " Mail report on DOR for RAFMS is attached" | mail -s " RAFMS Daily Production Report $date3" -a /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_MAIN_$date3.csv $HUW_EMAIL_IDS
cd /rocra_binaries/Scripts/huw_scripts/out/DOR
find . -maxdepth 1 -type f ! -name "DOR_MAIN*"  -mtime +2 -delete
find . -maxdepth 1 -type f  -name "DOR_MAIN*.csv"  -mtime +30 -delete
