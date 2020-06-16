/************************************************************************************************
Latest Instance For Financial Period - Annual Net EPS - Diluted value

Packages Required:
Premium Financials Core 
Premium Financials Detail
Premium Financials Statement

Primary ID's Used:
companyid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
25\05\2020

DatasetKey:
10

The following sample query below retrieves Latest Instance For Financial Period
Annual Net EPS - Diluted value for International Business Machines Corporation (112350).

***********************************************************************************************/

select
co.companyId,
co.companyName,
fp.fiscalYear,
fi.filingDate,
fi.periodEndDate,
di.dataitemid,
fcd.dataitemvalue,
fi.latestFilingForInstanceFlag,
fi.latestForFinancialPeriodFlag

from
ciqFinPeriod fp
join ciqFinInstance fi
	on fi.financialPeriodId = fp.financialPeriodId
join ciqFinInstanceToCollection itc
	on itc.financialInstanceId = fi.financialInstanceId
join ciqFinCollection fc
	on fc.financialCollectionId = itc.financialCollectionId
join ciqFinCollectionData fcd
	 on fcd.financialCollectionId = fc.financialCollectionId
join ciqCompany co
	on co.companyId = fp.companyId
join ciqdataitem di
	on di.dataitemId = fcd.dataitemId
	
where fp.companyId =112350 -- International Business Machines Corporation
and fp.periodTypeId =1 -- Annual
and fcd.dataItemid =8 --Net EPS - Diluted
and latestForFinancialPeriodFlag = 1 --Latest Instance For Financial Period

order by fiscalYear DESC, filingDate