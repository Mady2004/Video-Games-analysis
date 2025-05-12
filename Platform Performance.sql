--select Year,Platform,Sales from Yearly_Platform_Sales where Rank = 1
select * from Cleaned_Data
where NA_Sales = EU_Sales

alter view [Platform Dominance In Regions] as
select Year,Platform,
case
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then 'NA'
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then 'EU'
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) > sum(Other_Sales) then 'JP'
	when sum(NA_Sales) < sum(Other_Sales) and sum(EU_Sales) < sum(Other_Sales) and sum(JP_Sales) < sum(Other_Sales) then 'Other'
	when sum(NA_Sales) >= sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then 'NA & EU'
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) >= sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then 'NA & JP'
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) >= sum(Other_Sales) then 'NA & Others'
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) >= sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then 'EU & JP'
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) >= sum(Other_Sales) then 'EU & Others'
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) >= sum(Other_Sales) then 'JP & Others'
end as [Region Dominance],
case
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then round(sum(NA_Sales),2)
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then round(sum(EU_Sales),2)
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) > sum(Other_Sales) then round(sum(JP_Sales),2)
	when sum(NA_Sales) < sum(Other_Sales) and sum(EU_Sales) < sum(Other_Sales) and sum(JP_Sales) < sum(Other_Sales) then round(sum(Other_Sales),2)
	when sum(NA_Sales) >= sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then round(sum(NA_Sales),2)
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) >= sum(JP_Sales) and sum(NA_Sales) > sum(Other_Sales) then round(sum(NA_Sales),2)
	when sum(NA_Sales) > sum(EU_Sales) and sum(NA_Sales) > sum(JP_Sales) and sum(NA_Sales) >= sum(Other_Sales) then round(sum(NA_Sales),2)
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) >= sum(JP_Sales) and sum(EU_Sales) > sum(Other_Sales) then round(sum(EU_Sales),2)
	when sum(NA_Sales) < sum(EU_Sales) and sum(EU_Sales) > sum(JP_Sales) and sum(EU_Sales) >= sum(Other_Sales) then round(sum(EU_Sales),2)
	when sum(NA_Sales) < sum(JP_Sales) and sum(EU_Sales) < sum(JP_Sales) and sum(JP_Sales) >= sum(Other_Sales) then round(sum(JP_Sales),2)
end as Sales
from Cleaned_Data
group by Year,Platform
go

alter view [Platform Longevity] as
select Platform,Year,round(sum(Global_Sales),2) as Sales
from Cleaned_Data
where Platform in ('PS','PS2','PS3','PS4')
group by Platform,Year
go