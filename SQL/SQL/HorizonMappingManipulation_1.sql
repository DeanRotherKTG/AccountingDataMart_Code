use AB_BI_TEST
go

/******************************************************************/


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
from fin_dev.Stage_HorizonMapping

--delete 
--from fin_dev.Stage_HorizonMapping
--where ID = '284 records listed'

--' =90246'

/*****************************[HorizonID]*************************************/
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
	from fin_dev.Stage_HorizonMapping
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
	from fin_dev.Stage_HorizonMapping

exec dbo.DropTable 'fin_dev', 'HorizonMappingDim';
create table fin_dev.HorizonMappingDim (
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

insert into fin_dev.HorizonMappingDim
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
from fin_dev.Stage_HorizonMapping

select * from fin_dev.HorizonMappingDim


exec DropTable 'fin_dev', 'HorizonMapping_BoloIDList';
create table fin_dev.HorizonMapping_BoloIDList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(16) null);
insert into fin_dev.HorizonMapping_BoloIDList([value])
select BoloID from fin_dev.HorizonMappingDim group by BoloID;

exec DropTable 'fin_dev', 'HorizonMapping_BoloLeaseIDList';
create table fin_dev.HorizonMapping_BoloLeaseIDList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
insert into fin_dev.HorizonMapping_BoloLeaseIDList([value])
select BoloLeaseID from fin_dev.HorizonMappingDim group by BoloLeaseID;

exec DropTable 'fin_dev', 'HorizonMapping_WellNameList';
create table fin_dev.HorizonMapping_WellNameList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(128) null);
insert into fin_dev.HorizonMapping_WellNameList([value])
select WellName from fin_dev.HorizonMappingDim group by WellName;

exec DropTable 'fin_dev', 'HorizonMapping_APIList';
create table fin_dev.HorizonMapping_APIList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(32) null);
insert into fin_dev.HorizonMapping_APIList([value])
select API from fin_dev.HorizonMappingDim group by API;

exec DropTable 'fin_dev', 'HorizonMapping_OperatorNameList';
create table fin_dev.HorizonMapping_OperatorNameList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(128) null);
insert into fin_dev.HorizonMapping_OperatorNameList([value])
select OperatorName from fin_dev.HorizonMappingDim group by OperatorName;

exec DropTable 'fin_dev', 'HorizonMapping_CountyList';
create table fin_dev.HorizonMapping_CountyList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(32) null);
insert into fin_dev.HorizonMapping_CountyList([value])
select County from fin_dev.HorizonMappingDim group by County;

exec DropTable 'fin_dev', 'HorizonMapping_BoloFormationList';
create table fin_dev.HorizonMapping_BoloFormationList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
insert into fin_dev.HorizonMapping_BoloFormationList([value])
select ProducingFormationBolo from fin_dev.HorizonMappingDim group by ProducingFormationBolo;


exec DropTable 'fin_dev', 'HorizonMapping_KTGFormationList';
create table fin_dev.HorizonMapping_KTGFormationList (
	[key] int not null identity(1,1) primary key,
	[value] nvarchar(64) null);
insert into fin_dev.HorizonMapping_KTGFormationList([value])
select ProducingFormationKTG from fin_dev.HorizonMappingDim group by ProducingFormationKTG;



select * from fin_dev.HorizonMapping_BoloIDList;
select * from fin_dev.HorizonMapping_BoloLeaseIDList;
select * from fin_dev.HorizonMapping_WellNameList;
select * from fin_dev.HorizonMapping_APIList;
select * from fin_dev.HorizonMapping_OperatorNameList;
select * from fin_dev.HorizonMapping_CountyList;
select * from fin_dev.HorizonMapping_BoloFormationList;
select * from fin_dev.HorizonMapping_KTGFormationList;


exec dbo.DropTable 'fin_dev', 'HorizonMapping';
create table fin_dev.HorizonMapping (
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

insert into fin_dev.HorizonMapping(BoloID, BoloLeaseID, WellName, API, OperatorName, County, ProducingFormationBolo, ProducingFormationKTG, Notes)
select	(select [key] from fin_dev.HorizonMapping_BoloIDList where [value] = BoloID) as BoloID
      , (select [key] from fin_dev.HorizonMapping_BoloLeaseIDList where [value] = BoloLeaseID) as BoloLeaseID
      , (select [key] from fin_dev.HorizonMapping_WellNameList where [value] = WellName) as WellName
      , (select [key] from fin_dev.HorizonMapping_APIList where [value] = API) as API
      , (select [key] from fin_dev.HorizonMapping_OperatorNameList where [value] = OperatorName) as OperatorName
      , (select [key] from fin_dev.HorizonMapping_CountyList where [value] = County) as County
      , (select [key] from fin_dev.HorizonMapping_BoloFormationList where [value] = ProducingFormationBolo) as ProducingFormationBolo
      , (select [key] from fin_dev.HorizonMapping_KTGFormationList where [value] = ProducingFormationKTG) as ProducingFormationKTG
      , Notes
from fin_dev.HorizonMappingDim

select * from fin_dev.HorizonMapping;


alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_BoloID
	foreign key(BoloID) references fin_dev.HorizonMapping_BoloIDList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_BoloLeaseID
	foreign key(BoloLeaseID) references fin_dev.HorizonMapping_BoloLeaseIDList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_WellName
	foreign key(WellName) references fin_dev.HorizonMapping_WellNameList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_API
	foreign key(API) references fin_dev.HorizonMapping_APIList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_OperatorName
	foreign key(OperatorName) references fin_dev.HorizonMapping_OperatorNameList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_County
	foreign key(County) references fin_dev.HorizonMapping_CountyList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_ProducingFormationBolo
	foreign key(ProducingFormationBolo) references fin_dev.HorizonMapping_BoloFormationList([key])
	on delete cascade on update cascade;

alter table fin_dev.HorizonMapping add constraint fk_HorizonMapping_ProducingFormationKTG
	foreign key(ProducingFormationKTG) references fin_dev.HorizonMapping_KTGFormationList([key])
	on delete cascade on update cascade;

go


--create view fin_dev.HorizonMapping_vw as
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
from fin_dev.HorizonMapping h
	left join fin_dev.HorizonMapping_BoloIDList bi
		on h.BoloID = bi.[key]
	left join fin_dev.HorizonMapping_BoloLeaseIDList bli
		on h.BoloLeaseID = bli.[key]
	left join fin_dev.HorizonMapping_WellNameList wn
		on h.WellName = wn.[key]
	left join fin_dev.HorizonMapping_APIList a
		on h.API = a.[key]
	left join fin_dev.HorizonMapping_OperatorNameList op
		on h.OperatorName = op.[key]
	left join fin_dev.HorizonMapping_CountyList c
		on h.County = c.[key]
	left join fin_dev.HorizonMapping_BoloFormationList bf
		on h.ProducingFormationBolo = bf.[key]
	left join fin_dev.HorizonMapping_KTGFormationList kf
		on h.ProducingFormationKTG = kf.[key];


select * from fin_dev.HorizonMapping_vw;
