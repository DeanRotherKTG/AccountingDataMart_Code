use AccountingDataMart_TEST
go

/******************************************************************/


/****** Object:  Table [gl].[Stage_HorizonMapping]    Script Date: 2023-09-20 15:55:37 ****
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[gl].[Stage_HorizonMapping]') AND type in (N'U'))
DROP TABLE [gl].[Stage_HorizonMapping]
GO
**/
/****** Object:  Table [gl].[Stage_HorizonMapping]    Script Date: 2023-09-20 15:55:37 ***
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE gl.[Stage_HorizonMapping](
	[ID] [nvarchar](max) NOT NULL,
	[CC no.] [nvarchar](max) NOT NULL,
	[Well name] [nvarchar](max) NOT NULL,
	[API no.] [nvarchar](max) NOT NULL,
	[Operator name] [nvarchar](max) NOT NULL,
	[County] [nvarchar](max) NOT NULL,
	[Producing formation] [nvarchar](max) NOT NULL,
	[Producing formation 2] [nvarchar](max) NOT NULL,
	[Producing formation 3] [nvarchar](max) NOT NULL,
	[Producing formation 4] [nvarchar](max) NOT NULL,
	[Producing formation 5] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


truncate table gl.Stage_HorizonMapping;
insert into gl.Stage_HorizonMapping
(
    ID
  , [CC no.]
  , [Well name]
  , [API no.]
  , [Operator name]
  , County
  , [Producing formation]
  , [Producing formation 2]
  , [Producing formation 3]
  , [Producing formation 4]
  , [Producing formation 5]
  , Notes
)
select	  ID
		, [CC no.]
		, [Well name]
		, [API no.]
		, [Operator name]
		, County
		, [Producing formation]
		, [Producing formation 2]
		, [Producing formation 3]
		, [Producing formation 4]
		, [Producing formation 5]
		, Notes
from AB_BI_TEST.gl.Stage_HorizonMapping

--delete 
--from gl.Stage_HorizonMapping
--where ID = '284 records listed'

--' =90246'
***/
/*****************************[Get field lengths]***********************************
select top 1
			  max(datalength(replace([ID], ' =', ''))/2) as ID_len
			, max(datalength([CC no.])/2) as CCNo_len
			, max(datalength([Well name])/2) as WellName_len
			, max(datalength([API no.])/2) as API_len
			, max(datalength([Operator name])/2) as OperatorName_len
			, max(datalength([County])/2) as County_len
			, max(datalength([Producing formation])/2) as ProducingFormationBolo_len
			, max(datalength([Producing formation 5])/2) as ProducingFormationKTG_len
			, max(datalength([Notes])/2) as Notes_len
	from gl.Stage_HorizonMapping
union all
select top 1
			  max(datalength(replace([ID], ' =', ''))) as ID_len
			, max(datalength([CC no.])) as CCNo_len
			, max(datalength([Well name])) as WellName_len
			, max(datalength([API no.])) as API_len
			, max(datalength([Operator name])) as OperatorName_len
			, max(datalength([County])) as County_len
			, max(datalength([Producing formation])) as ProducingFormationBolo_len
			, max(datalength([Producing formation 5])) as ProducingFormationKTG_len
			, max(datalength([Notes])) as Notes_len
	from gl.Stage_HorizonMapping
**/

begin transaction HorizonTable

exec dbo.DropTable 'gl', 'HorizonMappingDim';
go
create table gl.HorizonMappingDim (
	id int identity(1,1) not null primary key,
	BoloID nvarchar(16) null,
	BoloLeaseID nvarchar(64) null,
	WellName nvarchar(128) null,
	API nvarchar(32) null,
	OperatorName nvarchar(128) null,
	County nvarchar(32) null,
	ProducingFormationBolo nvarchar(64) null,
	ProducingFormationKTG nvarchar(64) null,
	Notes nvarchar(max)
)
go

insert into gl.HorizonMappingDim
(
    BoloID
  , BoloLeaseID
  , WellName
  , API
  , OperatorName
  , County
  , ProducingFormationBolo
  , ProducingFormationKTG
  , Notes
)
select ID
     , [CC no.]
     , [Well name]
     , [API no.]
     , [Operator name]
     , County
     , [Producing formation]
     , [Producing formation 5]
     , Notes
from gl.Stage_HorizonMapping
go



exec DropTable 'gl', 'HorizonMapping_BoloIDList';
go
create table gl.HorizonMapping_BoloIDList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(16) null);
go
insert into gl.HorizonMapping_BoloIDList([value])
select BoloID from gl.HorizonMappingDim group by BoloID;
go

exec DropTable 'gl', 'HorizonMapping_BoloLeaseIDList';
go
create table gl.HorizonMapping_BoloLeaseIDList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
go
insert into gl.HorizonMapping_BoloLeaseIDList([value])
select BoloLeaseID from gl.HorizonMappingDim group by BoloLeaseID;
go

exec DropTable 'gl', 'HorizonMapping_WellNameList';
go
create table gl.HorizonMapping_WellNameList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(128) null);
go
insert into gl.HorizonMapping_WellNameList([value])
select WellName from gl.HorizonMappingDim group by WellName;
go

exec DropTable 'gl', 'HorizonMapping_APIList';
go
create table gl.HorizonMapping_APIList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(32) null);
go
insert into gl.HorizonMapping_APIList([value])
select API from gl.HorizonMappingDim group by API;
go

exec DropTable 'gl', 'HorizonMapping_OperatorNameList';
go
create table gl.HorizonMapping_OperatorNameList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(128) null);
go
insert into gl.HorizonMapping_OperatorNameList([value])
select OperatorName from gl.HorizonMappingDim group by OperatorName;
go

exec DropTable 'gl', 'HorizonMapping_CountyList';
go
create table gl.HorizonMapping_CountyList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(32) null);
go
insert into gl.HorizonMapping_CountyList([value])
select County from gl.HorizonMappingDim group by County;
go

exec DropTable 'gl', 'HorizonMapping_BoloFormationList';
go
create table gl.HorizonMapping_BoloFormationList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
go
insert into gl.HorizonMapping_BoloFormationList([value])
select ProducingFormationBolo from gl.HorizonMappingDim group by ProducingFormationBolo;
go


exec DropTable 'gl', 'HorizonMapping_KTGFormationList';
go
create table gl.HorizonMapping_KTGFormationList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
go
insert into gl.HorizonMapping_KTGFormationList([value])
select ProducingFormationKTG from gl.HorizonMappingDim group by ProducingFormationKTG;
go





exec dbo.DropTable 'gl', 'HorizonMapping';
go
create table gl.HorizonMapping (
	id int identity(1,1) not null primary key,
	BoloID int not null,
	BoloLeaseID int not null,
	WellName int not null,
	API int not null,
	OperatorName int not null,
	County int not null,
	ProducingFormationBolo int not null,
	ProducingFormationKTG int not null,
	Notes nvarchar(max)
)
go

insert into gl.HorizonMapping(BoloID, BoloLeaseID, WellName, API, OperatorName, County, ProducingFormationBolo, ProducingFormationKTG, Notes)
select	(select [key] from gl.HorizonMapping_BoloIDList where [value] = BoloID) as BoloID
      , (select [key] from gl.HorizonMapping_BoloLeaseIDList where [value] = BoloLeaseID) as BoloLeaseID
      , (select [key] from gl.HorizonMapping_WellNameList where [value] = WellName) as WellName
      , (select [key] from gl.HorizonMapping_APIList where [value] = API) as API
      , (select [key] from gl.HorizonMapping_OperatorNameList where [value] = OperatorName) as OperatorName
      , (select [key] from gl.HorizonMapping_CountyList where [value] = County) as County
      , (select [key] from gl.HorizonMapping_BoloFormationList where [value] = ProducingFormationBolo) as ProducingFormationBolo
      , (select [key] from gl.HorizonMapping_KTGFormationList where [value] = ProducingFormationKTG) as ProducingFormationKTG
      , Notes
from gl.HorizonMappingDim
go




alter table gl.HorizonMapping add constraint fk_HorizonMapping_BoloID
	foreign key(BoloID) references gl.HorizonMapping_BoloIDList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_BoloLeaseID
	foreign key(BoloLeaseID) references gl.HorizonMapping_BoloLeaseIDList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_WellName
	foreign key(WellName) references gl.HorizonMapping_WellNameList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_API
	foreign key(API) references gl.HorizonMapping_APIList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_OperatorName
	foreign key(OperatorName) references gl.HorizonMapping_OperatorNameList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_County
	foreign key(County) references gl.HorizonMapping_CountyList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_ProducingFormationBolo
	foreign key(ProducingFormationBolo) references gl.HorizonMapping_BoloFormationList([key])
	on delete cascade on update cascade;
go

alter table gl.HorizonMapping add constraint fk_HorizonMapping_ProducingFormationKTG
	foreign key(ProducingFormationKTG) references gl.HorizonMapping_KTGFormationList([key])
	on delete cascade on update cascade;
go


create view gl.HorizonMapping_vw as
select	h.id
      , bi.value as BoloID
      , bli.value as BoloLeaseID
      , wn.value as WellName
      , a.value as API
      , op.value as OperatorName
      , c.value as County
      , bf.value as ProducingFormationBolo
      , kf.value as ProducingFormationKTG
      , h.Notes
from gl.HorizonMapping h
	left join gl.HorizonMapping_BoloIDList bi
		on h.BoloID = bi.[key]
	left join gl.HorizonMapping_BoloLeaseIDList bli
		on h.BoloLeaseID = bli.[key]
	left join gl.HorizonMapping_WellNameList wn
		on h.WellName = wn.[key]
	left join gl.HorizonMapping_APIList a
		on h.API = a.[key]
	left join gl.HorizonMapping_OperatorNameList op
		on h.OperatorName = op.[key]
	left join gl.HorizonMapping_CountyList c
		on h.County = c.[key]
	left join gl.HorizonMapping_BoloFormationList bf
		on h.ProducingFormationBolo = bf.[key]
	left join gl.HorizonMapping_KTGFormationList kf
		on h.ProducingFormationKTG = kf.[key];
go


commit transaction HorizonTable;


select * from gl.HorizonMappingDim
select * from gl.HorizonMapping_BoloIDList;
select * from gl.HorizonMapping_BoloLeaseIDList;
select * from gl.HorizonMapping_WellNameList;
select * from gl.HorizonMapping_APIList;
select * from gl.HorizonMapping_OperatorNameList;
select * from gl.HorizonMapping_CountyList;
select * from gl.HorizonMapping_BoloFormationList;
select * from gl.HorizonMapping_KTGFormationList;
select * from gl.HorizonMapping;
select * from gl.HorizonMapping_vw;
