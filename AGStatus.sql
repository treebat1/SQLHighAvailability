
select *
from sys.dm_hadr_availability_group_states

select *
from sys.dm_hadr_availability_replica_states

select d.name, d.database_id, hdrs.is_local, hdrs.last_commit_time, hdrs.last_commit_lsn, hdrs.synchronization_state_desc
,hdrs.synchronization_health_desc, hdrs.database_state_desc, hdrs.is_suspended, hdrs.suspend_reason
--, hdrs.*
from sys.databases d
join sys.dm_hadr_database_replica_states hdrs
on d.database_id = hdrs.database_id
order by d.name, hdrs.is_local


