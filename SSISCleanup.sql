
DECLARE @role int
DECLARE @status tinyint

SET @role = (SELECT [role] FROM [sys].[dm_hadr_availability_replica_states] hars 
INNER JOIN [sys].[availability_databases_cluster] adc ON hars.[group_id] = adc.[group_id] 
WHERE hars.[is_local] = 1 AND adc.[database_name] ='SSISDB')

IF @role = 1
BEGIN
	select 'got here 1'
	EXEC [SSISDB].[internal].[refresh_replica_status] @server_name = N'CHDC-CAR-PHSQL5\DATAMARTPROD'
	, @status = @status OUTPUT
	IF @status = 1
		Print 'got here 2'
		--EXEC [SSISDB].[catalog].[startup]
END