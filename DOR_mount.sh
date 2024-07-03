#!/bin/bash
HUW_EMAIL_IDS=nizarvelapuram@huawei.com
#!/bin/bash
HUW_EMAIL_IDS=nizarvelapuram@huawei.com
date3=`date +"%d-%m-%y"`
#date4=`date -d "now + 1 days" +'%Y%m%d'`
if [ -f /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out ]; then rm /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out; fi
echo "Mount stats for RA-APP on $date3" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
df -Pkh | sed 's/Mounted on/MounteOn/g' | awk '{print $1","$2","$3","$4","$5","$6}' >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
echo "-------------------------------------" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
echo "Mount stats for FM-APP on $date3" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
ssh rafms@10.192.221.229 'df -Pkh' | sed 's/Mounted on/MounteOn/g' | awk '{print $1","$2","$3","$4","$5","$6}' >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
echo "-------------------------------------" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
echo "Mount stats for WEB on $date3" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
ssh rafms@10.192.221.250 'df -Pkh' | sed 's/Mounted on/MounteOn/g' | awk '{print $1","$2","$3","$4","$5","$6}' >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_mount_$date3.out
#cd /rocra_binaries/Scripts/huw_scripts/out
#find -maxdepth 1 -type f -name "Bscs_sub_profile_RA_check*" -mtime +7 -delete
