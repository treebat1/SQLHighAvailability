select d.name,
dm.mirroring_state_desc, 
dm.mirroring_safety_level_desc, 
dm.mirroring_role_desc,
dm.mirroring_witness_state_desc
from sys.database_mirroring dm
join sys.databases d on dm.database_id = d.database_id
--where mirroring_state_desc not in ('synchronized')
order by d.name