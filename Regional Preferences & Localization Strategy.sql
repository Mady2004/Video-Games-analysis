alter view [Each Region Sales In 1980s] as
select 'NA' as Region,round(sum(NA_Sales),2) as Sales
from Cleaned_Data
where Year between 1980 and 1989
union all
select 'EU' as Region,round(sum(EU_Sales),2) as Sales
from Cleaned_Data
where Year between 1980 and 1989
union all
select 'JP' as Region,round(sum(JP_Sales),2) as Sales
from Cleaned_Data
where Year between 1980 and 1989
go

alter view [Each Region Sales In 1990s] as
select 'NA' as Region,round(sum(NA_Sales),2) as Sales
from Cleaned_Data
where Year between 1990 and 1999
union all
select 'EU' as Region,round(sum(EU_Sales),2) as Sales
from Cleaned_Data
where Year between 1990 and 1999
union all
select 'JP' as Region,round(sum(JP_Sales),2) as Sales
from Cleaned_Data
where Year between 1990 and 1999
go

alter view [Each Region Sales In 2000s] as
select 'NA' as Region,round(sum(NA_Sales),2) as Sales
from Cleaned_Data
where Year between 2000 and 2009
union all
select 'EU' as Region,round(sum(EU_Sales),2) as Sales
from Cleaned_Data
where Year between 2000 and 2009
union all
select 'JP' as Region,round(sum(JP_Sales),2) as Sales
from Cleaned_Data
where Year between 2000 and 2009
go

alter view [Each Region Sales In 2010s] as
select 'NA' as Region,round(sum(NA_Sales),2) as Sales
from Cleaned_Data
where Year between 2010 and 2019
union all
select 'EU' as Region,round(sum(EU_Sales),2) as Sales
from Cleaned_Data
where Year between 2010 and 2019
union all
select 'JP' as Region,round(sum(JP_Sales),2) as Sales
from Cleaned_Data
where Year between 2010 and 2019
go




