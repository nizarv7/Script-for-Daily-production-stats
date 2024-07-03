date3=`date +"%d-%m-%y"`
dtgrp1=`date -d "now - 1 day"  +"%Y%m%d"`
dtgrp2=`date -d "now - 1 day"  +"%h %_d"`
dtgrp3=`date -d "now - 1 day"  +"%Y-%m-%d"`
dtgrp4=`date -d "now - 1 day"  +"%d-%m-%Y"`
dtgrp5=`date -d "now - 1 day"  +"%Y%h%d"`
echo "extracting filecount for $dtgrp1"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/Huawei_MSC/
echo "MSS,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_CCN/
echo "IN CCN,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_AIR/
echo "IN AIR,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_HXC/
echo "IN HXC,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_SDP/
echo "IN SDP,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_MA/
echo "SDP DUMP MA,`ls *$dtgrp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_DA/
echo "SDP DUMP DA,`ls *$dtgrp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPIN/
echo "TAPIN,`ls -ltr | grep "$dtgrp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPOUT
echo "TAPOUT,`ls -ltr | grep "$dtgrp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/NRTRDE/
echo "NRTRDE,`ls -ltr | grep "$dtgrp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SBP
echo "SBP,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/GGSN
echo "GGSN,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SGSN
echo "SGSN,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAP_RTX/
echo "TAP_RTX,`ls *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_C2C/
echo "PAYMOBILE_C2C,`ls *$dtgrp4* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_D2D/
echo "PAYMOBILE_D2D,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_FEES/
echo "BSCS_FEES,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/HUR
echo "HUR,`ls -ltr |grep "$dtgrp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MMSC
echo "MMSC,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/COLLECT_CALL/
echo "COLLECT_CALL,`ls -ltr |grep "$dtgrp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_ORDERS/
echo "RAS_ORDERS,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_CHARGES/
echo "RAS_CHARGES,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_DISCOUNT/
echo "RAS_DISCOUNT,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/LMS
echo "LMS,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BILLING_INTERCONNECT/
echo "BILLING_INTERCONNECT,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_UDR/
echo "BSCS_UDR,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/CSSP
echo "CSSP,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_INTERCONNECT/
echo "MEDIATION_INTERCONNECT,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_MMSC/
echo "MEDIATION_MMSC,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MSDP
echo "MSDP,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MOCOMM/
echo "MOCOMM,`ls -ltr |grep "$dtgrp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_SALES_ORDERS/
echo "RAS_SALES_ORDERS,`ls -ltr |grep "$dtgrp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RBT
echo "RBT,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/ROAMWARE/
echo "ROAMWARE,`ls *$dtgrp5* | wc -l`" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RTCG/
echo "RTCG,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SMSC/
echo "SMSC,`ls -ltr *$dtgrp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/DCH
echo "DCH,`ls -ltr |grep "$dtgrp3" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out

dt2grp1=`date -d "now - 2 day"  +"%Y%m%d"`
dt2grp2=`date -d "now - 2 day"  +"%h %_d"`
dt2grp3=`date -d "now - 2 day"  +"%Y-%m-%d"`
dt2grp4=`date -d "now - 2 day"  +"%d-%m-%Y"`
dt2grp5=`date -d "now - 2 day"  +"%Y%h%d"`
echo "extracting filecount for $dt2grp1"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/Huawei_MSC/
echo "MSS,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_CCN/
echo "IN CCN,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_AIR/
echo "IN AIR,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_HXC/
echo "IN HXC,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_SDP/
echo "IN SDP,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_MA/
echo "SDP DUMP MA,`ls *$dt2grp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_DA/
echo "SDP DUMP DA,`ls *$dt2grp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPIN/
echo "TAPIN,`ls -ltr | grep "$dt2grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPOUT
echo "TAPOUT,`ls -ltr | grep "$dt2grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/NRTRDE/
echo "NRTRDE,`ls -ltr | grep "$dt2grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SBP
echo "SBP,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/GGSN
echo "GGSN,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SGSN
echo "SGSN,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAP_RTX/
echo "TAP_RTX,`ls *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_C2C/
echo "PAYMOBILE_C2C,`ls *$dt2grp4* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_D2D/
echo "PAYMOBILE_D2D,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_FEES/
echo "BSCS_FEES,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/HUR
echo "HUR,`ls -ltr |grep "$dt2grp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MMSC
echo "MMSC,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/COLLECT_CALL/
echo "COLLECT_CALL,`ls -ltr |grep "$dt2grp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_ORDERS/
echo "RAS_ORDERS,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_CHARGES/
echo "RAS_CHARGES,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_DISCOUNT/
echo "RAS_DISCOUNT,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/LMS
echo "LMS,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BILLING_INTERCONNECT/
echo "BILLING_INTERCONNECT,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_UDR/
echo "BSCS_UDR,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/CSSP
echo "CSSP,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_INTERCONNECT/
echo "MEDIATION_INTERCONNECT,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_MMSC/
echo "MEDIATION_MMSC,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MSDP
echo "MSDP,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MOCOMM/
echo "MOCOMM,`ls -ltr |grep "$dt2grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_SALES_ORDERS/
echo "RAS_SALES_ORDERS,`ls -ltr |grep "$dt2grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RBT
echo "RBT,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/ROAMWARE/
echo "ROAMWARE,`ls *$dt2grp5* | wc -l`" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RTCG/
echo "RTCG,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SMSC/
echo "SMSC,`ls -ltr *$dt2grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/DCH
echo "DCH,`ls -ltr |grep "$dt2grp3" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out

dt3grp1=`date -d "now - 3 day"  +"%Y%m%d"`
dt3grp2=`date -d "now - 3 day"  +"%h %_d"`
dt3grp3=`date -d "now - 3 day"  +"%Y-%m-%d"`
dt3grp4=`date -d "now - 3 day"  +"%d-%m-%Y"`
dt3grp5=`date -d "now - 3 day"  +"%Y%h%d"`
echo "extracting filecount for $dt3grp1"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/Huawei_MSC/
echo "MSS,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_CCN/
echo "IN CCN,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_AIR/
echo "IN AIR,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_HXC/
echo "IN HXC,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/IN_SDP/
echo "IN SDP,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_MA/
echo "SDP DUMP MA,`ls *$dt3grp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SDP_DUMP_DA/
echo "SDP DUMP DA,`ls *$dt3grp3* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPIN/
echo "TAPIN,`ls -ltr | grep "$dt3grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAPOUT
echo "TAPOUT,`ls -ltr | grep "$dt3grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/NRTRDE/
echo "NRTRDE,`ls -ltr | grep "$dt3grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SBP
echo "SBP,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/GGSN
echo "GGSN,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SGSN
echo "SGSN,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/TAP_RTX/
echo "TAP_RTX,`ls *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_C2C/
echo "PAYMOBILE_C2C,`ls *$dt3grp4* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/PAYMOBILE_D2D/
echo "PAYMOBILE_D2D,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_FEES/
echo "BSCS_FEES,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/HUR
echo "HUR,`ls -ltr |grep "$dt3grp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MMSC
echo "MMSC,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/COLLECT_CALL/
echo "COLLECT_CALL,`ls -ltr |grep "$dt3grp2" |wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_ORDERS/
echo "RAS_ORDERS,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_CHARGES/
echo "RAS_CHARGES,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_DISCOUNT/
echo "RAS_DISCOUNT,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/LMS
echo "LMS,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BILLING_INTERCONNECT/
echo "BILLING_INTERCONNECT,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/BSCS_UDR/
echo "BSCS_UDR,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/CSSP
echo "CSSP,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_INTERCONNECT/
echo "MEDIATION_INTERCONNECT,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MEDIATION_MMSC/
echo "MEDIATION_MMSC,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MSDP
echo "MSDP,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/MOCOMM/
echo "MOCOMM,`ls -ltr |grep "$dt3grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RAS_SALES_ORDERS/
echo "RAS_SALES_ORDERS,`ls -ltr |grep "$dt3grp2" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RBT
echo "RBT,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/ROAMWARE/
echo "ROAMWARE,`ls *$dt3grp5* | wc -l`" >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/RTCG/
echo "RTCG,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/SMSC/
echo "SMSC,`ls -ltr *$dt3grp1* | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out
cd /rocra_collected/DCH
echo "DCH,`ls -ltr |grep "$dt3grp3" | wc -l`"  >> /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FILECOUNT_$date3.out

