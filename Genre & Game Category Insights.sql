--select * from Cleaned_Data

alter view [Most Profitable Genres] as
select Genre,round(sum(Global_Sales),2) as Sales
from Cleaned_Data
group by Genre
go

alter view [Genre Dominanace In Regions] as
select Genre,
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
group by Genre
go

alter view [Change Of Genre Preferences Over Time] as
select Year,Genre,round(sum(Global_Sales),2) as Sales
from Cleaned_Data
--where Genre = 'Strategy'
group by Year,Genre
go