use AccountingDataMart_TEST
go

select *
from dbo.Stage_GLDetailCopy


/*****************************[Get field lengths]***********************************/

select	  max(datalength([Trans no.])) as [Trans no.]
        , max(datalength([Dist co])) as [Dist co]
        , max(datalength(Account)) as Account
        , max(datalength([Account Name])) as [Account Name]
        , max(datalength(Description)) as Description
        , max(datalength([Voucher ref])) as [Voucher ref]
        , max(datalength([Vou src])) as [Vou src]
        , max(datalength([Cost center name])) as [Cost center name]
        , max(datalength([Cost Center])) as [Cost Center]
        , max(datalength(Project)) as Project        
		, max(datalength([Field Name])) as [Field Name]
        , max(datalength([Name ID])) as [Name ID]
        , max(datalength([Name 1])) as [Name 1]
        , max(datalength([Acctg period])) as [Acctg period]
        , max(datalength([Gen acct])) as [Gen acct]
        , max(datalength([Gen Account Name])) as [Gen Account Name]
        , max(datalength([ACTIVITY.MM/YYYY])) as [ACTIVITY.MM/YYYY]
        , max(datalength([Activity period])) as [Activity period]
        , max(datalength([Debit amt])) as [Debit amt]
        , max(datalength([Credit amt])) as [Credit amt]
        , max(datalength(Amount)) as Amount
        , max(datalength(Oper)) as Oper
        , max(datalength([Gross amount])) as [Gross amount]
        , max(datalength(Qty)) as Qty
        , max(datalength(Qty2)) as Qty2
from dbo.Stage_GLDetailCopy
