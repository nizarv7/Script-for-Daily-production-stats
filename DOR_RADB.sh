#!/bin/bash
. /home/rafms/.bash_profile
#HUW_EMAIL_IDS=nizarvelapuram@huawei.com
#,robin.thomas.vaidyan@huawei.com
DATEHOUR=`date +"%d-%m-%y_%HH"`
DATE1=`date +"%d-%m-%y"`
if [ -f /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_RADB_$DATE1.csv ]; then rm /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_RADB_$DATE1.csv; fi
/oracle/product/11.2.0/client/bin/sqlplus -s /NOLOG << !EOF

connect rocra_ref/rocra_ref123@raref

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
spool /rocra_binaries/Scripts/huw_scripts/out/DOR/DOR_RADB_$DATE1.csv
select '7-Hourly Parse and Dataload' from dual;
select 'Task_date'||','||'task_type'||','||'STAT_H0'||','||'STAT_H1'||','||'STAT_H2'||','||'STAT_H3'||','||'STAT_H4'||','||'STAT_H5'||','||'STAT_H6'||','||'STAT_H7'||','||'STAT_H8'||','||'STAT_H9'||','||'STAT_H10'||','||'STAT_H11'||','||'STAT_H12'||','||'STAT_H13'||','||'STAT_H14'||','||'STAT_H15'||','||'STAT_H16'||','||'STAT_H17'||','||'STAT_H18'||','||'STAT_H19'||','||'STAT_H20'||','||'STAT_H21'||','||'STAT_H22'||','||'STAT_H23' from dual;
SELECT     dayOf ||','|| upper(Sst_Name) ||','||      stat_h0||','||stat_h1||','||stat_h2||','||stat_h3||','||stat_h4||','||stat_h5||','||stat_h6||','||stat_h7||','||stat_h8||','||stat_h9||','||stat_h10||','||stat_h11||','||stat_h12||','||stat_h13||','||stat_h14||','||stat_h15||','||stat_h16||','||stat_h17||','||stat_h18||','||stat_h19||','||stat_h20||','||stat_h21||','||stat_h22||','||stat_h23
        FROM    (select trunc(tsk_end_dttm) dayOf, to_char(tsk_end_dttm,'HH24') as Date_hour, 
case when s.sst_id=7 then 'Parse' when s.sst_id in (3,59) then 'Dataload' end Sst_Name, COUNT(tsk_id) Tskcount
from task t, task_controller tc, stream_stage s where tc.tcr_id=t.tcr_id and s.sts_id=t.sts_id  and  trunc(tsk_end_dttm) >= trunc(sysdate)-4 and s.sst_id in (7,3,59)
and tsk_status='Completed' group by trunc(tsk_end_dttm), to_char(tsk_end_dttm,'HH24'), case when sst_id=7 then 'Parse' when sst_id in (3,59) then 'Dataload' end
order by trunc(tsk_end_dttm),to_char(tsk_end_dttm,'HH24'), Sst_Name desc     
   )
   PIVOT    (
SUM(Tskcount) FOR Date_hour IN (
'00' stat_h0,'01' stat_h1,'02' stat_h2,'03' stat_h3,'04' stat_h4,'05' stat_h5,'06' stat_h6,'07' stat_h7,'08' stat_h8,'09' stat_h9,'10' stat_h10,'11' stat_h11,'12' stat_h12,'13' stat_h13,'14' stat_h14,'15' stat_h15,'16' stat_h16,'17' stat_h17,'18' stat_h18,'19' stat_h19,'20' stat_h20,'21' stat_h21,'22' stat_h22,'23' stat_h23
)
)order by dayOf, upper(Sst_Name) desc;
select '-----------------------------------' from dual;
select '8-Backlogs RAFMS' from dual;
Select 'DayOf'||','||'STS_ID'||','||'STS_NAME'||','||'TaskCount' from dual; 
select trunc(tsk_created_dttm)||','|| s.sts_id||','||sts_name||','|| count(tsk_id)  from task t,stream_stage s
where t.sts_id=s.sts_id and tsk_status='Waiting' 
group by trunc(tsk_created_dttm), s.sts_id,sts_name order by trunc(tsk_created_dttm), s.sts_id,sts_name;
select '------------------------------' from dual;
select '10-Audit Requests' from dual;
select 'Recon_name'||','||'TSK_ID'||','||'TSK_STATUS'||','||'Audit_Start'||','||'Audit_End'||','||'Exec_Mins' from dual;
select replace(auq_desc,',','-') ||','|| t.tsk_id||','||tsk_status||','|| to_char(tsk_start_dttm,'dd-mon-yy hh24:mi:ss')||','||to_char (tsk_end_dttm,'dd-mon-yy hh24:mi:ss')||','||
round(24*60*(to_date(to_char(tsk_end_dttm,  'dd-mon-yy hh24:mi:ss'),'dd-mon-yy hh24:mi:ss') - 
to_date(to_char (tsk_start_dttm,'dd-mon-yy hh24:mi:ss'),'dd-mon-yy hh24:mi:ss'))) 
from task t, audit_request ar
where t.tsk_id=ar.tsk_id and 
trunc(tsk_start_dttm) >= trunc(sysdate)-8 and t.sts_id=84 and aus_id is not null
order by tsk_end_dttm desc, tsk_start_dttm desc;
select '----------------------------------' from dual;
select 'TASK_DATE'||','||'SST_NAME'||','||'SUCCESS'||','||'FAILED'||','||'WAITING'||','||'CANCELLED' from dual;
select tsk_date||','|| sst_name||','||task_success||','||task_failed||','||task_waiting||','||task_cancelled
from (select count(1) tsk_count,s.sst_id,  sst_name,
 trunc(tsk_end_dttm) tsk_date, tsk_status from task t,stream_stage s, stream_stage_type sst
where t.sts_id=s.sts_id and s.sst_id=sst.sst_id and trunc(tsk_end_dttm) >= trunc(sysdate)-5
group by s.sst_id,sst_name,
 trunc(tsk_end_dttm), tsk_status
) pivot ( sum(tsk_count) for tsk_status in (
'Completed' task_success,'Failed' task_failed,'Waiting' task_waiting,'Cancelled' task_cancelled)) order by tsk_date, sst_name;
spool off;
exit;
!EOF
