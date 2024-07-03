#!/bin/bash
. /home/rafms/.bash_profile
#HUW_EMAIL_IDS=nizarvelapuram@huawei.com
#,robin.thomas.vaidyan@huawei.com
DATEHOUR=`date +"%d-%m-%y_%HH"`
DATE1=`date +"%d-%m-%y"`
/oracle/product/11.2.0/client/bin/sqlplus -s /NOLOG << !EOF

connect rocfm/rocfm123@fmref

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
spool /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_FMDB_$DATE1.csv
select '12-SubscriberCount' from dual;
select 'DATE1'||','||'PREPAID_COUNT'||','||'POSTPAID_COUNT'||','||'FRAUD_CANCELLED_COUNT'||','||'ACTIVE_COUNT'||','||'DISCONNECT_COUNT' from dual;
select trunc(Sysdate-1)||','|| sum(case when PRODUCT_TYPE=2 then 1 else 0 end) ||','||
sum(case when PRODUCT_TYPE=1 then 1 else 0 end)  ||','||
sum(case when status=0 then 1 else 0 end)  ||','||
sum(case when status='1' and account_id >1024 then 1 else 0 end) ||','||
sum(case when status='3' then 1 else 0 end) from subscriber;

select '13-Hourly PM Processing' from dual;
select 'DAYOF'||','||'STAT_H0'||','||'STAT_H1'||','||'STAT_H2'||','||'STAT_H3'||','||'STAT_H4'||','||'STAT_H5'||','||'STAT_H6'||','||'STAT_H7'||','||'STAT_H8'||','||'STAT_H9'||','||'STAT_H10'||','||'STAT_H11'||','||'STAT_H12'||','||'STAT_H13'||','||'STAT_H14'||','||'STAT_H15'||','||'STAT_H16'||','||'STAT_H17'||','||'STAT_H18'||','||'STAT_H19'||','||'STAT_H20'||','||'STAT_H21'||','||'STAT_H22'||','||'STAT_H23'
from dual;
 SELECT  DAYOF||','||
stat_h0||','||
stat_h1||','||
stat_h2||','||
stat_h3||','||
stat_h4||','||
stat_h5||','||
stat_h6||','||
stat_h7||','||
stat_h8||','||
stat_h9||','||
stat_h10||','||
stat_h11||','||
stat_h12||','||
stat_h13||','||
stat_h14||','||
stat_h15||','||
stat_h16||','||
stat_h17||','||
stat_h18||','||
stat_h19||','||
stat_h20||','||
stat_h21||','||
stat_h22||','||
stat_h23
FROM    (
            select trunc(start_time) dayOf, to_char(start_time,'HH24') as Date_hour, sum(total_count) Hourly_PM_count from audit_files_processed
         where trunc(start_time) > trunc(sysdate)-4 group by trunc(start_time), to_char(start_time,'HH24')
 order by trunc(start_time), to_char(start_time,'HH24')
                )
        PIVOT    (
                    SUM(Hourly_PM_count) FOR Date_hour IN (
                    '00' stat_h0,
'01' stat_h1,
'02' stat_h2,
'03' stat_h3,
'04' stat_h4,
'05' stat_h5,
'06' stat_h6,
'07' stat_h7,
'08' stat_h8,
'09' stat_h9,
'10' stat_h10,
'11' stat_h11,
'12' stat_h12,
'13' stat_h13,
'14' stat_h14,
'15' stat_h15,
'16' stat_h16,
'17' stat_h17,
'18' stat_h18,
'19' stat_h19,
'20' stat_h20,
'21' stat_h21,
'22' stat_h22,
'23' stat_h23
                    )
    )order by dayOf;
select '14-ALARM COUNT' from dual;
select 'Created_date'||','||'ALARM_COUNT'||','|| 'FRAUD'||','||'NONFRAUD'||','||'NEW'||','||'INVESTIGATION' from dual;
select trunc(created_date) ||','|| count(1)  ||','||
sum(case when status=2 then 1 else 0 end) ||','||
sum(case when status=4 then 1 else 0 end) ||','||
sum(case when status=6 then 1 else 0 end) ||','||
sum(case when status=3 then 1 else 0 end)  from alarms where trunc(created_date) > trunc(Sysdate-5) 
group by trunc(created_date) order by trunc(created_date) asc;
select '15-Rule Reports' from dual;
select 'rule_created_on'||','||'Rulename'||','||'alert_no'||','|| 'AlarmCount' from dual;
select trunc(a.created_date) ||','|| r.name ||','||substr(r.name,0,9)||','|| count(1) from alarms a,alerts al, rules r 
where al.event_instance_id=r.key and alarm_id=a.id and r.is_active=1 and trunc(a.created_date)>=trunc(Sysdate-3) 
group by trunc(a.created_date), r.name ,substr(r.name,0,9) order by trunc(a.created_date), r.name;
spool off;
exit;
!EOF
