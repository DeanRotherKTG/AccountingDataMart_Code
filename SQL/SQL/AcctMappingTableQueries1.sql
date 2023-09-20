use AB_BI_TEST
go

select *
from fin_dev.AcctMappingDim
order by Acct


select *
from fin_dev.AcctMapping
order by Acct

select *
from fin_dev.ListAccountNames


select	accmap.Acct
      , accnam.[name] as [Acct Name]
      , st.[name] as Statement
      , subst.[name] as [Sub-statement]
      , subord.[name] as [Sub stmt order]
      , pmap.[name] as [Primary Mapping]
      , bsacc.[name] as [B/S Account Group]
      , isacc.[name] as [I/S Account Group]
      , losm.[name] as [LOS Mapping]
      , gab.[name] as [G&A Budget Mapping]
      , capm.[name] as [Capex Mapping]
      , Major
      , CreatedBy
      , CreatedDttm
      , ModifiedBy
      , ModifiedDttm
from fin_dev.AcctMapping accmap
	left join fin_dev.ListAccountNames accnam
		on accmap.[Acct Name] = accnam.code
	left join fin_dev.ListStatements st
		on accmap.[Statement] = st.code
	left join fin_dev.ListSubStatements subst
		on accmap.[Sub-statement] = subst.code
	left join fin_dev.ListSubStatementOrder subord
		on accmap.[Sub stmt order] = subord.code
	left join fin_dev.ListPrimaryMapping pmap
		on accmap.[Primary Mapping] = pmap.code
	left join fin_dev.ListBSAccountGroup bsacc
		on accmap.[B/S Account Group] = bsacc.code
	left join fin_dev.ListISAccountGroup isacc
		on accmap.[I/S Account Group] = isacc.code
	left join fin_dev.ListLOSMapping losm
		on accmap.[LOS Mapping] = losm.code
	left join fin_dev.ListGABudgetMapping gab
		on accmap.[G&A Budget Mapping] = gab.code
	left join fin_dev.ListCapexMapping capm
		on accmap.[Capex Mapping] = capm.code
order by accmap.Acct

