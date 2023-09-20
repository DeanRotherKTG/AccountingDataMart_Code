use AB_BI_TEST
go

/************************************* Data Discovery *******************************************

select top 1
			  max(datalength([SOURCE])) as Source_len
			, max(datalength([WELL NUMBER])) as WellNumber_len
			, max(datalength([WELL NAME])) as WellName_len
			, max(datalength([Lease No.])) as LeaseNumber_len
			, max(datalength([Lease Name Tag])) as LeaseNameTag_len
			, max(datalength([Lessor])) as Lessor_len
	from fin_dev.Stage_LeaseMapping

select	 [SOURCE], datalength([SOURCE]) as Source_len,
		[WELL NUMBER], datalength([WELL NUMBER]) as WellNumber_len,
		[WELL NAME], datalength([WELL NAME]) as WellName_len,
		[Lease No.], datalength([Lease No.]) as LeaseNumber_len,
		[Lease Name Tag], datalength([Lease Name Tag]) as LeaseNameTag_len,
		[Lessor], datalength([Lessor]) as Lessor_len
from fin_dev.Stage_LeaseMapping
*/

/************************************** Create Tables *******************************************/


execute DropTable 'fin_dev','LeaseMappingDim';
create table fin_dev.LeaseMappingDim (
	id int identity(1,1) not null primary key,
	Source varchar(24) not null,
	WellNumber varchar(24) null,
	WellName nvarchar(128) not null,
	LeaseNumber varchar(24) not null,
	LeaseNameTag nvarchar(128) not null,
	Lessors nvarchar(max)
);

insert into fin_dev.LeaseMappingDim
(
    Source
  , WellNumber
  , WellName
  , LeaseNumber
  , LeaseNameTag
  , Lessors
)
select [SOURCE ]
     , [WELL NUMBER]
     , [WELL NAME]
     , [Lease No.]
     , [Lease Name Tag]
     , Lessor
from fin_dev.Stage_LeaseMapping;

/*	LeaseMapping_ListSource	*/
exec dbo.DropTable 'fin_dev', 'LeaseMapping_ListSource';
create table fin_dev.LeaseMapping_ListSource(
	code int not null identity(1,1) primary key,
	[name] varchar(24) not null
);
insert into fin_dev.LeaseMapping_ListSource ([name])
select Source from fin_dev.LeaseMappingDim group by Source;


/*	LeaseMapping_ListWellNumber	*/
exec dbo.DropTable 'fin_dev', 'LeaseMapping_ListWellNumber';
create table fin_dev.LeaseMapping_ListWellNumber(
	code int not null identity(1,1) primary key,
	[name] varchar(24) not null
);
insert into fin_dev.LeaseMapping_ListWellNumber ([name])
select WellNumber from fin_dev.LeaseMappingDim group by WellNumber;

/*	LeaseMapping_ListWellName	*/
exec dbo.DropTable 'fin_dev', 'LeaseMapping_ListWellName';
create table fin_dev.LeaseMapping_ListWellName(
	code int not null identity(1,1) primary key,
	[name] nvarchar(128) not null
);
insert into fin_dev.LeaseMapping_ListWellName
select WellName from fin_dev.LeaseMappingDim group by WellName;

/*	LeaseMapping_ListLeaseNumber	*/
exec dbo.DropTable 'fin_dev', 'LeaseMapping_ListLeaseNumber';
create table fin_dev.LeaseMapping_ListLeaseNumber(
	code int not null identity(1,1) primary key,
	[name] varchar(24) not null
);
insert into fin_dev.LeaseMapping_ListLeaseNumber
select LeaseNumber from fin_dev.LeaseMappingDim group by LeaseNumber;

/*	LeaseMapping_ListLeaseNameTag	*/
exec dbo.DropTable 'fin_dev', 'LeaseMapping_ListLeaseNameTag';
create table fin_dev.LeaseMapping_ListLeaseNameTag(
	code int not null identity(1,1) primary key,
	[name] nvarchar(128) not null
);
insert into fin_dev.LeaseMapping_ListLeaseNameTag
select LeaseNameTag from fin_dev.LeaseMappingDim group by LeaseNameTag;


execute DropTable 'fin_dev','LeaseMapping';
create table fin_dev.LeaseMapping (
	id int identity(1,1) not null primary key,
	Source int not null,
	WellNumber int not null,
	WellName int not null,
	LeaseNumber int not null,
	LeaseNameTag int not null,
	Lessors nvarchar(max) not null
);



/************************************** Inspect Tables *******************************************/

select * from fin_dev.LeaseMapping_ListSource;
select * from fin_dev.LeaseMapping_ListWellNumber;
select * from fin_dev.LeaseMapping_ListWellName;
select * from fin_dev.LeaseMapping_ListLeaseNumber;
select * from fin_dev.LeaseMapping_ListLeaseNameTag;
select * from fin_dev.LeaseMappingDim;
