use AB_BI_TEST
go

/******************************************************************/

/******************************[Acct]************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([Acct]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListAccounts')
	drop table fin_dev.ListAccounts

create table fin_dev.ListAccounts(
	code int identity(1,1) not null primary key,
	[name] nvarchar(32))

insert into fin_dev.ListAccounts ([name])
select [Acct]
from (
	select cast([Acct]as char(32)) as [Acct]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Acct]

select * from fin_dev.ListAccounts

/******************************************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([Acct Name]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListAccountNames')
	drop table fin_dev.ListAccountNames

create table fin_dev.ListAccountNames(
	code int identity(1,1) not null primary key,
	[name] nvarchar(64))

insert into fin_dev.ListAccountNames ([name])
select [Acct Name]
from (
	select cast([Acct Name]as char(64)) as [Acct Name]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Acct Name]

select * from fin_dev.ListAccountNames

/******************************[Statement]************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([statement]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListStatements')
	drop table fin_dev.ListStatements

create table fin_dev.ListStatements(
	code int identity(1,1) not null primary key,
	[name] nvarchar(2))

insert into fin_dev.ListStatements ([name])
select [Statement]
from (
	select cast([Statement] as char(2)) as [Statement]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Statement]

select * from fin_dev.ListStatements

/*****************************[Sub-statement]*************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([Sub-statement]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListSubStatements')
	drop table fin_dev.ListSubStatements

create table fin_dev.ListSubStatements(
	code int identity(1,1) not null primary key,
	[name] nvarchar(32))

insert into fin_dev.ListSubStatements ([name])
select [Sub-statement]
from (
	select cast([Sub-statement] as varchar(32)) as [Sub-statement]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Sub-statement]

select * from fin_dev.ListSubStatements

/*******************************[Sub stmt Order]***********************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLenn
from (
	select datalength([Sub stmt Order]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListSubStatementOrder')
	drop table fin_dev.ListSubStatementOrder

create table fin_dev.ListSubStatementOrder(
	code int identity(1,1) not null primary key,
	[name] nvarchar(16))

insert into fin_dev.ListSubStatementOrder ([name])
select [Sub stmt Order]
from (
	select cast([Sub stmt Order] as char(16)) as [Sub stmt Order]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Sub stmt Order]

select * from fin_dev.ListSubStatementOrder

/*******************************[Primary Mapping]***********************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([Primary Mapping]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListPrimaryMapping')
	drop table fin_dev.ListPrimaryMapping

create table fin_dev.ListPrimaryMapping(
	code int identity(1,1) not null primary key,
	[name] nvarchar(48))

insert into fin_dev.ListPrimaryMapping ([name])
select [Primary Mapping]
from (
	select cast([Primary Mapping] as char(48)) as [Primary Mapping]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Primary Mapping]

select * from fin_dev.ListPrimaryMapping

/*****************************[B/S Account Group]*************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([B/S Account Group]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListBSAccountGroup')
	drop table fin_dev.ListBSAccountGroup

create table fin_dev.ListBSAccountGroup(
	code int identity(1,1) not null primary key,
	[name] nvarchar(24))

insert into fin_dev.ListBSAccountGroup ([name])
select [B/S Account Group]
from (
	select cast([B/S Account Group] as char(24)) as [B/S Account Group]
	from fin_dev.Stage_AcctMapping
	) t1
group by [B/S Account Group]

select * from fin_dev.ListBSAccountGroup

/******************************[I/S Account Group]************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([I/S Account Group]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListISAccountGroup')
	drop table fin_dev.ListISAccountGroup

create table fin_dev.ListISAccountGroup(
	code int identity(1,1) not null primary key,
	[name] nvarchar(24))

insert into fin_dev.ListISAccountGroup ([name])
select [I/S Account Group]
from (
	select cast([I/S Account Group] as char(24)) as [I/S Account Group]
	from fin_dev.Stage_AcctMapping
	) t1
group by [I/S Account Group]

select * from fin_dev.ListISAccountGroup

/******************************[LOS Mapping]************************************/

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([LOS Mapping]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListLOSMapping')
	drop table fin_dev.ListLOSMapping

create table fin_dev.ListLOSMapping(
	code int identity(1,1) not null primary key,
	[name] nvarchar(40))

insert into fin_dev.ListLOSMapping ([name])
select [LOS Mapping]
from (
	select cast([LOS Mapping] as char(40)) as [LOS Mapping]
	from fin_dev.Stage_AcctMapping
	) t1
group by [LOS Mapping]

select * from fin_dev.ListLOSMapping order by [name]

/******************************[G&A Budget Mapping]************************************/	

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([G&A Budget Mapping]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListGABudgetMapping')
	drop table fin_dev.ListGABudgetMapping

create table fin_dev.ListGABudgetMapping(
	code int identity(1,1) not null primary key,
	[name] nvarchar(56))

insert into fin_dev.ListGABudgetMapping ([name])
select [G&A Budget Mapping]
from (
	select cast([G&A Budget Mapping] as char(56)) as [G&A Budget Mapping]
	from fin_dev.Stage_AcctMapping
	) t1
group by [G&A Budget Mapping]

select * from fin_dev.ListGABudgetMapping

/******************************[Capex Mapping]************************************/	

select	  max(t1.charlen) as maxCharLen
		, (((max(t1.charlen)/8)+1*2)*8) colLen
from (
	select datalength([Capex Mapping]) as charlen
	from fin_dev.Stage_AcctMapping
	) t1

if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'ListCapexMapping')
	drop table fin_dev.ListCapexMapping

create table fin_dev.ListCapexMapping(
	code int identity(1,1) not null primary key,
	[name] nvarchar(40))

insert into fin_dev.ListCapexMapping ([name])
select [Capex Mapping]
from (
	select cast([Capex Mapping] as char(40)) as [Capex Mapping]
	from fin_dev.Stage_AcctMapping
	) t1
group by [Capex Mapping]

select * from fin_dev.ListCapexMapping

/****************************[ Find primary key. ]**************************************/	

select	Major, Acct, count(*)
from (
	select	  Major
			, cast(Acct as varchar(32)) as Acct
			--, cast([Acct Name] as varchar(64)) as [Acct Name]
	from fin_dev.Stage_AcctMapping
	) t
group by Major, Acct
having count(*) > 1

select	Acct, count(*)
from (
	select	  Major
			, cast(Acct as varchar(32)) as Acct
			--, cast([Acct Name] as varchar(64)) as [Acct Name]
	from fin_dev.Stage_AcctMapping
	) t
group by Acct
having count(*) > 1




/*****************************[Create table AcctMappingDim]*************************************/	
select *
from (
	select t1.Major
		 , t1.Acct
		 , t1.calcMajor
		 , case when t1.Major = t1.calcMajor then 'match'
			else 'no match' end as CorrectCalc
	from (
		select major, Acct, left(cast(acct as varchar(32)), 4) as calcMajor
		from fin_dev.Stage_AcctMapping
		) t1
	) t2
where t2.calcMajor = 'no match'


if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'AcctMappingDim')
	drop table fin_dev.AcctMappingDim

create table fin_dev.[AcctMappingDim] (
	Acct varchar(32) not null,
	[Acct Name] varchar(64) not null,
	[Statement] varchar(2) null,
	[Sub-statement] varchar(32) null,
	[Sub stmt order] varchar(16) null,
	[Primary Mapping] varchar(48) null,
	[B/S Account Group] varchar(24) null,
	[I/S Account Group] varchar(24) null,
	[LOS Mapping] varchar(40) null,
	[G&A Budget Mapping] varchar(56) null,
	[Capex Mapping] varchar(40) null,
	Major as left(Acct, 4) persisted,
	CreatedBy nvarchar(100) not null,
	CreatedDttm datetime not null,
	ModifiedBy nvarchar(100) null,
	ModifiedDttm datetime null
)
go
alter table fin_dev.AcctMappingDim add constraint pk_fin_dev_AcctMappingDim primary key clustered (Acct)
go


/*****************************[Populate table AcctMappingDim]*************************************/

insert into fin_dev.AcctMappingDim
(
    Acct
  , [Acct Name]
  , Statement
  , [Sub-statement]
  , [Sub stmt order]
  , [Primary Mapping]
  , [B/S Account Group]
  , [I/S Account Group]
  , [LOS Mapping]
  , [G&A Budget Mapping]
  , [Capex Mapping]
  , CreatedBy
  , CreatedDttm
)
select Acct
     , cast([Acct Name] as varchar(100))
     , cast([Statement] as varchar(100))
     , cast([Sub-statement] as varchar(100))
     , cast([Sub stmt Order] as varchar(100))
     , cast([Primary Mapping] as varchar(100))
     , cast([B/S Account Group] as varchar(100))
     , cast([I/S Account Group] as varchar(100))
     , cast([LOS Mapping] as varchar(100))
     , cast([G&A Budget Mapping] as varchar(100))
     , cast([Capex Mapping] as varchar(100))
	 , system_user
	 , getdate()
from fin_dev.Stage_AcctMapping


/*****************************[Create table AcctMapping]*************************************/	
select *
from (
	select t1.Major
		 , t1.Acct
		 , t1.calcMajor
		 , case when t1.Major = t1.calcMajor then 'match'
			else 'no match' end as CorrectCalc
	from (
		select major, Acct, left(cast(acct as varchar(32)), 4) as calcMajor
		from fin_dev.Stage_AcctMapping
		) t1
	) t2
where t2.calcMajor = 'no match'


if exists(
	select s.[name], t.[name]
	from sys.tables t 
		join sys.schemas s on s.schema_id = t.schema_id 
	where s.[name] = 'fin_dev' and t.[name] = 'AcctMapping')
	drop table fin_dev.AcctMapping

create table fin_dev.[AcctMapping] (
	Acct varchar(32) not null,
	[Acct Name] int not null,
	[Statement] int null,
	[Sub-statement] int null,
	[Sub stmt order] int null,
	[Primary Mapping] int null,
	[B/S Account Group] int null,
	[I/S Account Group] int null,
	[LOS Mapping] int null,
	[G&A Budget Mapping] int null,
	[Capex Mapping] int null,
	Major as left(Acct, 4) persisted,
	CreatedBy nvarchar(100) not null,
	CreatedDttm datetime not null,
	ModifiedBy nvarchar(100) null,
	ModifiedDttm datetime null
)
go
alter table fin_dev.AcctMapping add constraint pk_fin_dev_AcctMapping primary key clustered (Acct)
go


/*****************************[Populate table AcctMapping]*************************************/

if (select count(*) from fin_dev.AcctMapping) > 0
	truncate table fin_dev.AcctMapping
go

insert into fin_dev.AcctMapping
(
    Acct
  , [Acct Name]
  , Statement
  , [Sub-statement]
  , [Sub stmt order]
  , [Primary Mapping]
  , [B/S Account Group]
  , [I/S Account Group]
  , [LOS Mapping]
  , [G&A Budget Mapping]
  , [Capex Mapping]
  , CreatedBy
  , CreatedDttm
)
select
       Acct
     , (select code from fin_dev.ListAccountNames where [name] = cast([Acct Name] as nvarchar(100))) as [Acct Name]
     , (select code from fin_dev.ListStatements where [name] = cast([Statement] as nvarchar(100))) as [Statement]
     , (select code from fin_dev.ListSubStatements where [name] = cast([Sub-statement] as nvarchar(100))) as [Sub-statement]
     , (select code from fin_dev.ListSubStatementOrder where [name] = cast([Sub stmt Order] as nvarchar(100))) as [Sub stmt Order]
     , (select code from fin_dev.ListPrimaryMapping where [name] = cast([Primary Mapping] as nvarchar(100))) as [Primary Mapping]
     , (select code from fin_dev.ListBSAccountGroup where [name] = cast([B/S Account Group] as nvarchar(100))) as [B/S Account Group]
     , (select code from fin_dev.ListISAccountGroup where [name] = cast([I/S Account Group] as nvarchar(100))) as [I/S Account Group]
     , (select code from fin_dev.ListLOSMapping where [name] = cast([LOS Mapping] as nvarchar(100))) as [LOS Mapping]
     , (select code from fin_dev.ListGABudgetMapping where [name] = cast([G&A Budget Mapping] as nvarchar(100))) as [G&A Budget Mapping]
     , (select code from fin_dev.ListCapexMapping where [name] = cast([Capex Mapping] as nvarchar(100))) as [Capex Mapping]
	 , system_user
	 , getdate()
from fin_dev.Stage_AcctMapping
go

/*****************************[Create AcctMapping View]*************************************/

create view fin_dev.AcctMapping_Vw as
select Acct
     , Major
     , accNam.[name] as [Acct Name]
     , stmts.[name] as Statement
     , subStm.[name] as [Sub-statement]
     , subStmOrd.[name] as [Sub stmt order]
     , primMap.[name] as [Primary Mapping]
     , bsAcc.[name] as [B/S Account Group]
     , isAcc.[name] as [I/S Account Group]
     , losMap.[name] as [LOS Mapping]
     , gaBud.[name] as [G&A Budget Mapping]
     , capMap.[name] as [Capex Mapping]
from fin_dev.AcctMapping accMap
	left join fin_dev.ListAccountNames accNam
		on accMap.[Acct Name] = accNam.code
	left join fin_dev.ListStatements stmts
		on accMap.[Statement] = stmts.code
	left join fin_dev.ListSubStatements subStm
		on accMap.[Sub-statement] = subStm.code
	left join fin_dev.ListSubStatementOrder subStmOrd
		on accMap.[Sub stmt order] = subStmOrd.code
	left join fin_dev.ListPrimaryMapping primMap
		on accMap.[Primary Mapping] = primMap.code
	left join fin_dev.ListBSAccountGroup bsAcc
		on accMap.[B/S Account Group] = bsAcc.code
	left join fin_dev.ListISAccountGroup isAcc
		on accMap.[I/S Account Group] = isAcc.code
	left join fin_dev.ListLOSMapping losMap
		on accMap.[LOS Mapping] = losmap.code
	left join fin_dev.ListGABudgetMapping gaBud
		on accMap.[G&A Budget Mapping] = gaBud.code
	left join fin_dev.ListCapexMapping capMap
		on accMap.[Capex Mapping] = capMap.code
