use AccountingDataMart_TEST
go

select top 5 * from dbo.Stage_GLDetailCopy


/*****************************[Get field lengths])) as ***********************************/

select top 1
	max(datalength([Trans no.])) as [Trans no. Len]
  , max(datalength([Dist co])) as [Dist co Len]
  , max(datalength(Account)) as [Account Len]
  , max(datalength([Account Name])) as [Account Name Len]
  , max(datalength(Description)) as [Description Len]
  , max(datalength([Voucher ref])) as [Voucher ref Len]
  , max(datalength([Vou src])) as [Vou src Len]
  , max(datalength([Cost center name])) as [Cost center name Len]
  , max(datalength([Cost Center])) as [Cost Center Len]
  , max(datalength(Project)) as [Project Len]
  , max(datalength([Field Name])) as [Field Name Len]
  , max(datalength([Name ID])) as [Name ID Len]
  , max(datalength([Name 1])) as [Name 1 Len]
  , max(datalength([Acctg period])) as [Acctg period Len]
  , max(datalength([Gen acct])) as [Gen acct Len]
  , max(datalength([Gen Account Name])) as [Gen Account Name Len]
  , max(datalength([ACTIVITY.MM/YYYY])) as [ACTIVITY.MM/YYYY Len]
  , max(datalength([Activity period])) as [Activity period Len]
  , max(datalength([Debit amt])) as [Debit amt Len]
  , max(datalength([Credit amt])) as [Credit amt Len]
  , max(datalength(Amount)) as [Amount Len]
  , max(datalength(Oper)) as [Oper Len]
  , max(datalength([Gross amount])) as [Gross amount Len]
  , max(datalength(Qty)) as [Qty Len]
  , max(datalength(Qty2)) as [Qty2 Len]
from dbo.Stage_GLDetailCopy

/************************[gl.GLDetailCopy]******************************
exec dbo.DropTable 'gl','GLDetailCopy'
go
create table gl.GLDetailCopy (
	Id int not null,
	TranNumber nvarchar(24) not null,
	DistCo nvarchar(8) not null,
	Account nvarchar(24) not null,
	AccountName nvarchar(96) not null,
	[Description] nvarchar(480) null,
	VoucherRef nvarchar(64) not null,
	CostCenterName nvarchar(128) not null,
	CostCenter nvarchar(32) not null,
	Project nvarchar(16) null,
	FieldName nvarchar(4) null,
	Name1 nvarchar(64) not null,
	AcctgPeriod nvarchar(8) not null,
	GenAcct nvarchar(8) not null,
	ActivityMMYYY nvarchar(8)
***/