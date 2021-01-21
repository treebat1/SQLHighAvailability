--run at either primary or secondary.

select d.name, dm.database_id, mirroring_state, mirroring_state_desc, mirroring_role, mirroring_role_desc
from sys.database_mirroring dm
join sys.databases d on dm.database_id = d.database_id
--where mirroring_state_desc not in ('synchronized')


use master 
go

ALTER DATABASE UBSP_Content_Admin SET PARTNER OFF  