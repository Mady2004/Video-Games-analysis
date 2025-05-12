--create database [VG Sales];
--select top 3* from Cleaned_Data;
alter view Yearly_Sales as
select Year,round(sum(Global_Sales),2) as Yearly_Sales
from
Cleaned_Data
group by Year
go

--select * from Yearly_Sales
--order by Year;

alter view Contribution_Percentage_Of_The_Highest_Sales_Region_Yearly as
select Year,
case
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then 'NA'
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then 'EU'
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) > sum(Other_Sales) then 'JP'
	else 'Other'
end as High_Sales_Region_In_Each_Year,
case
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then cast(round((sum(NA_Sales) / sum(Global_Sales)),3) as varchar)
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then cast(round((sum(EU_Sales) / sum(Global_Sales)),3) as varchar)
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) > sum(Other_Sales) then cast(round((sum(JP_Sales) / sum(Global_Sales)),3) as varchar)
end as Percentage_Of_Global_Sales
from Cleaned_Data
group by Year
go

--select * from Contribution_Percentage_Of_The_Highest_Sales_Region_Yearly
--order by Year;