#!/bin/bash
. /home/rafms/.bash_profile
#HUW_EMAIL_IDS=nizarvelapuram@huawei.com,robin.thomas.vaidyan@huawei.com
DATE=`date +"%d-%m-%y"`
DA1=`date -d"now - 1 days" +"%d-%m-%Y"`
DA2=`date -d"now - 2 days" +"%d-%m-%Y"`
DA3=`date -d"now - 3 days" +"%d-%m-%Y"`
DA4=`date -d"now - 4 days" +"%d-%m-%Y"`

A1=`sqlplus -s rocra_ref/rocra_ref123@raref << EOF 2>/dev/null
set feedback off
set heading off
set echo off
set space 1
set tab off
set termout off
set trimspool on
set wrap off
set lines 5000
set pagesize 0
set pages 0
set serveroutput off
set pagesize 0

select distinct usp_table_suffix from usage_server_partition  usp
inner join usage_partition  upn
on upn.upn_id=usp.upn_id
inner join usage_group usg
on usg.usg_id=upn.usg_id
inner join schema_tbl sc on sc.usg_id=usg.usg_id
INNER JOIN TABLE_INST ti on ti.sch_id=sc.sch_id
where trunc(to_date(upn_from,'yyyy/mm/dd hh24:mi:ss'))=trunc(sysdate-1)
and tin_table_name not like 'u_subscribr_profle%'
and tin_table_name not in ('u_in_occ','u_in_occ_rerated','u_tapout_intl','u_smsc_intl','u_med_inter_intl','u_in_ccn_intl','u_mocomm_intl','u_mss_intl',
'u_tapin_intl','u_mmsc_intl','u_bscs_udr_intl','u_tap_rtx_intl','u_ims_intl','u_invoice','u_inv_detail');
EOF
exit`

A2=`sqlplus -s rocra_ref/rocra_ref123@raref << EOF 2>/dev/null
set feedback off
set heading off
set echo off
set space 1
set tab off
set termout off
set trimspool on
set wrap off
set lines 5000
set pagesize 0
set pages 0
set serveroutput off
set pagesize 0

select distinct usp_table_suffix from usage_server_partition  usp
inner join usage_partition  upn
on upn.upn_id=usp.upn_id
inner join usage_group usg
on usg.usg_id=upn.usg_id
inner join schema_tbl sc on sc.usg_id=usg.usg_id
INNER JOIN TABLE_INST ti on ti.sch_id=sc.sch_id
where trunc(to_date(upn_from,'yyyy/mm/dd hh24:mi:ss'))=trunc(sysdate-2)
and tin_table_name not like 'u_subscribr_profle%'
and tin_table_name not in ('u_in_occ','u_in_occ_rerated','u_tapout_intl','u_smsc_intl','u_med_inter_intl','u_in_ccn_intl','u_mocomm_intl','u_mss_intl',
'u_tapin_intl','u_mmsc_intl','u_bscs_udr_intl','u_tap_rtx_intl','u_ims_intl','u_invoice','u_inv_detail');
EOF
exit`

A3=`sqlplus -s rocra_ref/rocra_ref123@raref << EOF 2>/dev/null
set feedback off
set heading off
set echo off
set space 1
set tab off
set termout off
set trimspool on
set wrap off
set lines 5000
set pagesize 0
set pages 0
set serveroutput off
set pagesize 0

select distinct usp_table_suffix from usage_server_partition  usp
inner join usage_partition  upn
on upn.upn_id=usp.upn_id
inner join usage_group usg
on usg.usg_id=upn.usg_id
inner join schema_tbl sc on sc.usg_id=usg.usg_id
INNER JOIN TABLE_INST ti on ti.sch_id=sc.sch_id
where trunc(to_date(upn_from,'yyyy/mm/dd hh24:mi:ss'))=trunc(sysdate-3)
and tin_table_name not like 'u_subscribr_profle%'
and tin_table_name not in ('u_in_occ','u_in_occ_rerated','u_tapout_intl','u_smsc_intl','u_med_inter_intl','u_in_ccn_intl','u_mocomm_intl','u_mss_intl',
'u_tapin_intl','u_mmsc_intl','u_bscs_udr_intl','u_tap_rtx_intl','u_ims_intl','u_invoice','u_inv_detail');
EOF
exit`

A4=`sqlplus -s rocra_ref/rocra_ref123@raref << EOF 2>/dev/null
set feedback off
set heading off
set echo off
set space 1
set tab off
set termout off
set trimspool on
set wrap off
set lines 5000
set pagesize 0
set pages 0
set serveroutput off
set pagesize 0

select distinct usp_table_suffix from usage_server_partition  usp
inner join usage_partition  upn
on upn.upn_id=usp.upn_id
inner join usage_group usg
on usg.usg_id=upn.usg_id
inner join schema_tbl sc on sc.usg_id=usg.usg_id
INNER JOIN TABLE_INST ti on ti.sch_id=sc.sch_id
where trunc(to_date(upn_from,'yyyy/mm/dd hh24:mi:ss'))=trunc(sysdate-4)
and tin_table_name not like 'u_subscribr_profle%'
and tin_table_name not in ('u_in_occ','u_in_occ_rerated','u_tapout_intl','u_smsc_intl','u_med_inter_intl','u_in_ccn_intl','u_mocomm_intl','u_mss_intl',
'u_tapin_intl','u_mmsc_intl','u_bscs_udr_intl','u_tap_rtx_intl','u_ims_intl','u_invoice','u_inv_detail');
EOF
exit`
echo "A1=$A1 A2=$A2 A3=$A3 A4=$A4" 
/oracle/product/11.2.0/client/bin/sqlplus -s /NOLOG << !EOF

connect rocra_usg/rocra_usg123@usage

set linesize 5000
set trimspool on
set verify off
set termout off
set echo off
set feedback off
set heading off
set pagesize 50000
set colsep ,
set underline off
set NEWPAGE NONE
set TAB off

#DEFINE DELIMITER='${TAB_SPACE}'
spool /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_XDR_COUNT_$DATE.csv
select 'CP_count for $DA1' from dual;
select 'MSC' control_point, 1 ind_no, count(1) XDR_Count from  U_MSS$A1 union
select 'IN CCN' control_point, 2 ind_no, count(1) XDR_Count from  U_IN_CCN$A1 union
select 'IN AIR' control_point, 3 ind_no, count(1) XDR_Count from  U_IN_AIR_RECHARGE$A1 union
select 'IN SDP' control_point, 4 ind_no, count(1) XDR_Count from  U_INSDP$A1 union
select 'SDP DUMP MA' control_point, 5 ind_no, count(1) XDR_Count from  U_SDP_DUMP_MA$A1 union
select 'SDP DUMP DA' control_point, 6 ind_no, count(1) XDR_Count from  U_SDP_DUMP_DA$A1 union
select 'TAPIN GPRS' control_point, 7 ind_no, count(1) XDR_Count from  U_TAPIN_GPRS$A1 union
select 'TAPIN CDR' control_point, 8 ind_no, count(1) XDR_Count from  U_TAPIN$A1 union
select 'TAPOUT GPRS' control_point, 9 ind_no, count(1) XDR_Count from  U_TAPOUT_GPRS$A1 union
select 'TAPOUT' control_point, 10 ind_no, count(1) XDR_Count from  U_TAPOUT$A1 union
select 'NRTRDE GPRS' control_point, 11 ind_no, count(1) XDR_Count from  NIK_NRTRDE_GPRS$A1 union
select 'NRTRDE' control_point, 12 ind_no, count(1) XDR_Count from  NIK_NRTRDE_CDR$A1 union
select 'SBP' control_point, 13 ind_no, count(1) XDR_Count from  U_SBP$A1 union
select 'Postpaid TAP Rated CDR' control_point, 14 ind_no, count(1) XDR_Count from  U_TAP_RTX$A1 union
select 'Paymobile All Recharges' control_point, 15 ind_no, count(1) XDR_Count from U_PAYMOBILE_RECHRG$A1 union
select 'Paymobile D2D' control_point, 16 ind_no, count(1) XDR_Count from U_PAYMOBILE_D2D$A1 union
select 'BSCS Fees' control_point, 17 ind_no, count(1) XDR_Count from  U_BSCS_FEES$A1 union
select 'HUR' control_point, 18 ind_no, count(1) XDR_Count from  NIK_HUR$A1 union
select 'MMSC' control_point, 19 ind_no, count(1) XDR_Count from  U_MMSC$A1 union
select 'Collect Call' control_point, 20 ind_no, count(1) XDR_Count from  U_COLLECT_CALL$A1 union
select 'RAS Orders' control_point, 21 ind_no, count(1) XDR_Count from  NIK_RAS_ORDERS$A1 union
select 'RAS Charges' control_point, 22 ind_no, count(1) XDR_Count from  U_RAS_CHARGES$A1 union
select 'RAS Discounts' control_point, 23 ind_no, count(1) XDR_Count from  NIK_RAS_DISCOUNTS$A1 union
select 'LMS' control_point, 24 ind_no, count(1) XDR_Count from  U_LMS$A1 union
select 'GGSN' control_point, 25 ind_no, count(1) XDR_Count from  U_GGSN$A1 union
select 'SGSN' control_point, 26 ind_no, count(1) XDR_Count from  U_SGSN$A1 union
select 'Billing Suspended and Rejected' control_point, 27 ind_no, count(1) XDR_Count from  NIK_BILL_SUSP_REJ$A1 union
select 'BILLING_INTERCONNECT' control_point, 28 ind_no, count(1) XDR_Count from  U_BILLING_INTERCON$A1 union
select 'BSCS_UDR' control_point, 29 ind_no, count(1) XDR_Count from  U_BSCS_UDR$A1 union
select 'CSSP' control_point, 30 ind_no, count(1) XDR_Count from  U_CSSP$A1 union
select 'IN_HXC' control_point, 31 ind_no, count(1) XDR_Count from  U_IN_HXC$A1 union
select 'MEDIATION_INTERCONNECT' control_point, 32 ind_no, count(1) XDR_Count from  U_MED_INTERCONNECT$A1 union
select 'MEDIATION_MMSC' control_point, 33 ind_no, count(1) XDR_Count from  U_MEDIATION_MMSC$A1 union
select 'MEDIATION_MSC' control_point, 34 ind_no, count(1) XDR_Count from  U_MEDIATION_MSC$A1 union
select 'MOCOMM' control_point, 35 ind_no, count(1) XDR_Count from  U_MOCOMM$A1 union
select 'MSDP' control_point, 36 ind_no, count(1) XDR_Count from  U_MSDP$A1 union
select 'RAS_SALES_ORDERS' control_point, 37 ind_no, count(1) XDR_Count from  U_RAS_SALES_ORDERS$A1 union
select 'RBT' control_point, 38 ind_no, count(1) XDR_Count from  U_RBT$A1 union
select 'ROAMWARE' control_point, 39 ind_no, count(1) XDR_Count from  U_ROAMWARE$A1 union
select 'RTCG' control_point, 40 ind_no, count(1) XDR_Count from  U_RTCG$A1 union
select 'SMSC' control_point, 41 ind_no, count(1) XDR_Count from  U_SMSC$A1 union
select 'DCH' control_point, 42 ind_no, count(1) XDR_Count from  U_DCH$A1 union
select 'INTERCONNECT_PARTNER' control_point, 43 ind_no, count(1) XDR_Count from  U_INTER_PARTNER$A1 union
select 'VENDOR_IAT' control_point, 44 ind_no, count(1) XDR_Count from  U_VENDOR_IAT$A1 order by ind_no;

select 'CP_count for $DA2' from dual;

select 'MSC' control_point, 1 ind_no, count(1) XDR_Count from  U_MSS$A2 union
select 'IN CCN' control_point, 2 ind_no, count(1) XDR_Count from  U_IN_CCN$A2 union
select 'IN AIR' control_point, 3 ind_no, count(1) XDR_Count from  U_IN_AIR_RECHARGE$A2 union
select 'IN SDP' control_point, 4 ind_no, count(1) XDR_Count from  U_INSDP$A2 union
select 'SDP DUMP MA' control_point, 5 ind_no, count(1) XDR_Count from  U_SDP_DUMP_MA$A2 union
select 'SDP DUMP DA' control_point, 6 ind_no, count(1) XDR_Count from  U_SDP_DUMP_DA$A2 union
select 'TAPIN GPRS' control_point, 7 ind_no, count(1) XDR_Count from  U_TAPIN_GPRS$A2 union
select 'TAPIN CDR' control_point, 8 ind_no, count(1) XDR_Count from  U_TAPIN$A2 union
select 'TAPOUT GPRS' control_point, 9 ind_no, count(1) XDR_Count from  U_TAPOUT_GPRS$A2 union
select 'TAPOUT' control_point, 10 ind_no, count(1) XDR_Count from  U_TAPOUT$A2 union
select 'NRTRDE GPRS' control_point, 11 ind_no, count(1) XDR_Count from  NIK_NRTRDE_GPRS$A2 union
select 'NRTRDE' control_point, 12 ind_no, count(1) XDR_Count from  NIK_NRTRDE_CDR$A2 union
select 'SBP' control_point, 13 ind_no, count(1) XDR_Count from  U_SBP$A2 union
select 'Postpaid TAP Rated CDR' control_point, 14 ind_no, count(1) XDR_Count from  U_TAP_RTX$A2 union
select 'Paymobile All Recharges' control_point, 15 ind_no, count(1) XDR_Count from U_PAYMOBILE_RECHRG$A2 union
select 'Paymobile D2D' control_point, 16 ind_no, count(1) XDR_Count from U_PAYMOBILE_D2D$A2 union
select 'BSCS Fees' control_point, 17 ind_no, count(1) XDR_Count from  U_BSCS_FEES$A2 union
select 'HUR' control_point, 18 ind_no, count(1) XDR_Count from  NIK_HUR$A2 union
select 'MMSC' control_point, 19 ind_no, count(1) XDR_Count from  U_MMSC$A2 union
select 'Collect Call' control_point, 20 ind_no, count(1) XDR_Count from  U_COLLECT_CALL$A2 union
select 'RAS Orders' control_point, 21 ind_no, count(1) XDR_Count from  NIK_RAS_ORDERS$A2 union
select 'RAS Charges' control_point, 22 ind_no, count(1) XDR_Count from  U_RAS_CHARGES$A2 union
select 'RAS Discounts' control_point, 23 ind_no, count(1) XDR_Count from  NIK_RAS_DISCOUNTS$A2 union
select 'LMS' control_point, 24 ind_no, count(1) XDR_Count from  U_LMS$A2 union
select 'GGSN' control_point, 25 ind_no, count(1) XDR_Count from  U_GGSN$A2 union
select 'SGSN' control_point, 26 ind_no, count(1) XDR_Count from  U_SGSN$A2 union
select 'Billing Suspended and Rejected' control_point, 27 ind_no, count(1) XDR_Count from  NIK_BILL_SUSP_REJ$A2 union
select 'BILLING_INTERCONNECT' control_point, 28 ind_no, count(1) XDR_Count from  U_BILLING_INTERCON$A2 union
select 'BSCS_UDR' control_point, 29 ind_no, count(1) XDR_Count from  U_BSCS_UDR$A2 union
select 'CSSP' control_point, 30 ind_no, count(1) XDR_Count from  U_CSSP$A2 union
select 'IN_HXC' control_point, 31 ind_no, count(1) XDR_Count from  U_IN_HXC$A2 union
select 'MEDIATION_INTERCONNECT' control_point, 32 ind_no, count(1) XDR_Count from  U_MED_INTERCONNECT$A2 union
select 'MEDIATION_MMSC' control_point, 33 ind_no, count(1) XDR_Count from  U_MEDIATION_MMSC$A2 union
select 'MEDIATION_MSC' control_point, 34 ind_no, count(1) XDR_Count from  U_MEDIATION_MSC$A2 union
select 'MOCOMM' control_point, 35 ind_no, count(1) XDR_Count from  U_MOCOMM$A2 union
select 'MSDP' control_point, 36 ind_no, count(1) XDR_Count from  U_MSDP$A2 union
select 'RAS_SALES_ORDERS' control_point, 37 ind_no, count(1) XDR_Count from  U_RAS_SALES_ORDERS$A2 union
select 'RBT' control_point, 38 ind_no, count(1) XDR_Count from  U_RBT$A2 union
select 'ROAMWARE' control_point, 39 ind_no, count(1) XDR_Count from  U_ROAMWARE$A2 union
select 'RTCG' control_point, 40 ind_no, count(1) XDR_Count from  U_RTCG$A2 union
select 'SMSC' control_point, 41 ind_no, count(1) XDR_Count from  U_SMSC$A2 union
select 'DCH' control_point, 42 ind_no, count(1) XDR_Count from  U_DCH$A2 union
select 'INTERCONNECT_PARTNER' control_point, 43 ind_no, count(1) XDR_Count from  U_INTER_PARTNER$A2 union
select 'VENDOR_IAT' control_point, 44 ind_no, count(1) XDR_Count from  U_VENDOR_IAT$A2 order by ind_no;

select 'CP_count for $DA3' from dual;

select 'MSC' control_point, 1 ind_no, count(1) XDR_Count from  U_MSS$A3 union
select 'IN CCN' control_point, 2 ind_no, count(1) XDR_Count from  U_IN_CCN$A3 union
select 'IN AIR' control_point, 3 ind_no, count(1) XDR_Count from  U_IN_AIR_RECHARGE$A3 union
select 'IN SDP' control_point, 4 ind_no, count(1) XDR_Count from  U_INSDP$A3 union
select 'SDP DUMP MA' control_point, 5 ind_no, count(1) XDR_Count from  U_SDP_DUMP_MA$A3 union
select 'SDP DUMP DA' control_point, 6 ind_no, count(1) XDR_Count from  U_SDP_DUMP_DA$A3 union
select 'TAPIN GPRS' control_point, 7 ind_no, count(1) XDR_Count from  U_TAPIN_GPRS$A3 union
select 'TAPIN CDR' control_point, 8 ind_no, count(1) XDR_Count from  U_TAPIN$A3 union
select 'TAPOUT GPRS' control_point, 9 ind_no, count(1) XDR_Count from  U_TAPOUT_GPRS$A3 union
select 'TAPOUT' control_point, 10 ind_no, count(1) XDR_Count from  U_TAPOUT$A3 union
select 'NRTRDE GPRS' control_point, 11 ind_no, count(1) XDR_Count from  NIK_NRTRDE_GPRS$A3 union
select 'NRTRDE' control_point, 12 ind_no, count(1) XDR_Count from  NIK_NRTRDE_CDR$A3 union
select 'SBP' control_point, 13 ind_no, count(1) XDR_Count from  U_SBP$A3 union
select 'Postpaid TAP Rated CDR' control_point, 14 ind_no, count(1) XDR_Count from  U_TAP_RTX$A3 union
select 'Paymobile All Recharges' control_point, 15 ind_no, count(1) XDR_Count from U_PAYMOBILE_RECHRG$A3 union
select 'Paymobile D2D' control_point, 16 ind_no, count(1) XDR_Count from U_PAYMOBILE_D2D$A3 union
select 'BSCS Fees' control_point, 17 ind_no, count(1) XDR_Count from  U_BSCS_FEES$A3 union
select 'HUR' control_point, 18 ind_no, count(1) XDR_Count from  NIK_HUR$A3 union
select 'MMSC' control_point, 19 ind_no, count(1) XDR_Count from  U_MMSC$A3 union
select 'Collect Call' control_point, 20 ind_no, count(1) XDR_Count from  U_COLLECT_CALL$A3 union
select 'RAS Orders' control_point, 21 ind_no, count(1) XDR_Count from  NIK_RAS_ORDERS$A3 union
select 'RAS Charges' control_point, 22 ind_no, count(1) XDR_Count from  U_RAS_CHARGES$A3 union
select 'RAS Discounts' control_point, 23 ind_no, count(1) XDR_Count from  NIK_RAS_DISCOUNTS$A3 union
select 'LMS' control_point, 24 ind_no, count(1) XDR_Count from  U_LMS$A3 union
select 'GGSN' control_point, 25 ind_no, count(1) XDR_Count from  U_GGSN$A3 union
select 'SGSN' control_point, 26 ind_no, count(1) XDR_Count from  U_SGSN$A3 union
select 'Billing Suspended and Rejected' control_point, 27 ind_no, count(1) XDR_Count from  NIK_BILL_SUSP_REJ$A3 union
select 'BILLING_INTERCONNECT' control_point, 28 ind_no, count(1) XDR_Count from  U_BILLING_INTERCON$A3 union
select 'BSCS_UDR' control_point, 29 ind_no, count(1) XDR_Count from  U_BSCS_UDR$A3 union
select 'CSSP' control_point, 30 ind_no, count(1) XDR_Count from  U_CSSP$A3 union
select 'IN_HXC' control_point, 31 ind_no, count(1) XDR_Count from  U_IN_HXC$A3 union
select 'MEDIATION_INTERCONNECT' control_point, 32 ind_no, count(1) XDR_Count from  U_MED_INTERCONNECT$A3 union
select 'MEDIATION_MMSC' control_point, 33 ind_no, count(1) XDR_Count from  U_MEDIATION_MMSC$A3 union
select 'MEDIATION_MSC' control_point, 34 ind_no, count(1) XDR_Count from  U_MEDIATION_MSC$A3 union
select 'MOCOMM' control_point, 35 ind_no, count(1) XDR_Count from  U_MOCOMM$A3 union
select 'MSDP' control_point, 36 ind_no, count(1) XDR_Count from  U_MSDP$A3 union
select 'RAS_SALES_ORDERS' control_point, 37 ind_no, count(1) XDR_Count from  U_RAS_SALES_ORDERS$A3 union
select 'RBT' control_point, 38 ind_no, count(1) XDR_Count from  U_RBT$A3 union
select 'ROAMWARE' control_point, 39 ind_no, count(1) XDR_Count from  U_ROAMWARE$A3 union
select 'RTCG' control_point, 40 ind_no, count(1) XDR_Count from  U_RTCG$A3 union
select 'SMSC' control_point, 41 ind_no, count(1) XDR_Count from  U_SMSC$A3 union
select 'DCH' control_point, 42 ind_no, count(1) XDR_Count from  U_DCH$A3 union
select 'INTERCONNECT_PARTNER' control_point, 43 ind_no, count(1) XDR_Count from  U_INTER_PARTNER$A3 union
select 'VENDOR_IAT' control_point, 44 ind_no, count(1) XDR_Count from  U_VENDOR_IAT$A3 order by ind_no;

select 'CP_count for $DA4' from dual;

select 'MSC' control_point, 1 ind_no, count(1) XDR_Count from  U_MSS$A4 union
select 'IN CCN' control_point, 2 ind_no, count(1) XDR_Count from  U_IN_CCN$A4 union
select 'IN AIR' control_point, 3 ind_no, count(1) XDR_Count from  U_IN_AIR_RECHARGE$A4 union
select 'IN SDP' control_point, 4 ind_no, count(1) XDR_Count from  U_INSDP$A4 union
select 'SDP DUMP MA' control_point, 5 ind_no, count(1) XDR_Count from  U_SDP_DUMP_MA$A4 union
select 'SDP DUMP DA' control_point, 6 ind_no, count(1) XDR_Count from  U_SDP_DUMP_DA$A4 union
select 'TAPIN GPRS' control_point, 7 ind_no, count(1) XDR_Count from  U_TAPIN_GPRS$A4 union
select 'TAPIN CDR' control_point, 8 ind_no, count(1) XDR_Count from  U_TAPIN$A4 union
select 'TAPOUT GPRS' control_point, 9 ind_no, count(1) XDR_Count from  U_TAPOUT_GPRS$A4 union
select 'TAPOUT' control_point, 10 ind_no, count(1) XDR_Count from  U_TAPOUT$A4 union
select 'NRTRDE GPRS' control_point, 11 ind_no, count(1) XDR_Count from  NIK_NRTRDE_GPRS$A4 union
select 'NRTRDE' control_point, 12 ind_no, count(1) XDR_Count from  NIK_NRTRDE_CDR$A4 union
select 'SBP' control_point, 13 ind_no, count(1) XDR_Count from  U_SBP$A4 union
select 'Postpaid TAP Rated CDR' control_point, 14 ind_no, count(1) XDR_Count from  U_TAP_RTX$A4 union
select 'Paymobile All Recharges' control_point, 15 ind_no, count(1) XDR_Count from U_PAYMOBILE_RECHRG$A4 union
select 'Paymobile D2D' control_point, 16 ind_no, count(1) XDR_Count from U_PAYMOBILE_D2D$A4 union
select 'BSCS Fees' control_point, 17 ind_no, count(1) XDR_Count from  U_BSCS_FEES$A4 union
select 'HUR' control_point, 18 ind_no, count(1) XDR_Count from  NIK_HUR$A4 union
select 'MMSC' control_point, 19 ind_no, count(1) XDR_Count from  U_MMSC$A4 union
select 'Collect Call' control_point, 20 ind_no, count(1) XDR_Count from  U_COLLECT_CALL$A4 union
select 'RAS Orders' control_point, 21 ind_no, count(1) XDR_Count from  NIK_RAS_ORDERS$A4 union
select 'RAS Charges' control_point, 22 ind_no, count(1) XDR_Count from  U_RAS_CHARGES$A4 union
select 'RAS Discounts' control_point, 23 ind_no, count(1) XDR_Count from  NIK_RAS_DISCOUNTS$A4 union
select 'LMS' control_point, 24 ind_no, count(1) XDR_Count from  U_LMS$A4 union
select 'GGSN' control_point, 25 ind_no, count(1) XDR_Count from  U_GGSN$A4 union
select 'SGSN' control_point, 26 ind_no, count(1) XDR_Count from  U_SGSN$A4 union
select 'Billing Suspended and Rejected' control_point, 27 ind_no, count(1) XDR_Count from  NIK_BILL_SUSP_REJ$A4 union
select 'BILLING_INTERCONNECT' control_point, 28 ind_no, count(1) XDR_Count from  U_BILLING_INTERCON$A4 union
select 'BSCS_UDR' control_point, 29 ind_no, count(1) XDR_Count from  U_BSCS_UDR$A4 union
select 'CSSP' control_point, 30 ind_no, count(1) XDR_Count from  U_CSSP$A4 union
select 'IN_HXC' control_point, 31 ind_no, count(1) XDR_Count from  U_IN_HXC$A4 union
select 'MEDIATION_INTERCONNECT' control_point, 32 ind_no, count(1) XDR_Count from  U_MED_INTERCONNECT$A4 union
select 'MEDIATION_MMSC' control_point, 33 ind_no, count(1) XDR_Count from  U_MEDIATION_MMSC$A4 union
select 'MEDIATION_MSC' control_point, 34 ind_no, count(1) XDR_Count from  U_MEDIATION_MSC$A4 union
select 'MOCOMM' control_point, 35 ind_no, count(1) XDR_Count from  U_MOCOMM$A4 union
select 'MSDP' control_point, 36 ind_no, count(1) XDR_Count from  U_MSDP$A4 union
select 'RAS_SALES_ORDERS' control_point, 37 ind_no, count(1) XDR_Count from  U_RAS_SALES_ORDERS$A4 union
select 'RBT' control_point, 38 ind_no, count(1) XDR_Count from  U_RBT$A4 union
select 'ROAMWARE' control_point, 39 ind_no, count(1) XDR_Count from  U_ROAMWARE$A4 union
select 'RTCG' control_point, 40 ind_no, count(1) XDR_Count from  U_RTCG$A4 union
select 'SMSC' control_point, 41 ind_no, count(1) XDR_Count from  U_SMSC$A4 union
select 'DCH' control_point, 42 ind_no, count(1) XDR_Count from  U_DCH$A4 union
select 'INTERCONNECT_PARTNER' control_point, 43 ind_no, count(1) XDR_Count from  U_INTER_PARTNER$A4 union
select 'VENDOR_IAT' control_point, 44 ind_no, count(1) XDR_Count from  U_VENDOR_IAT$A4 order by ind_no;

spool off;
exit;
!EOF

