use AB_BI_TEST
go


alter procedure dbo.DropTable
	@schema nvarchar(32),
	@name nvarchar(64)
as
begin
	declare @sql nvarchar(3999)
	 
	set @sql = 'if exists(	select s.[name], t.[name]
				from sys.schemas s
					join sys.tables t
						on s.schema_id = t.schema_id
				where s.[name] = ''' + @schema + ''' and t.[name] = ''' + @name + ''')
			drop table ' + @schema + '.' + @name + ';'
	print @sql

	execute sp_executesql @sql;

end 
go

--execute dbo.DropTable
--    @schema = N'fin_dev' -- nvarchar(32)
--  , @name = N'LeaseMapping'   -- nvarchar(64)
