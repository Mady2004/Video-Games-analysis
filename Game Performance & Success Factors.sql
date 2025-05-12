alter view [Top 10 Selling Games In 1980s] as
select top 10 Name,round(sum(Global_Sales),2) as Sales,dense_rank() over (order by round(sum(Global_Sales),2) desc) as Rank
from Cleaned_Data
where Year between 1980 and 1989
group by Name
go

alter view [Top 10 Selling Games In 1990s] as
select top 10 Name,round(sum(Global_Sales),2) as Sales,dense_rank() over (order by round(sum(Global_Sales),2) desc) as Rank
from Cleaned_Data
where Year between 1990 and 1999
group by Name
go

alter view [Top 10 Selling Games In 2000s] as
select top 10 Name,round(sum(Global_Sales),2) as Sales,dense_rank() over (order by round(sum(Global_Sales),2) desc) as Rank
from Cleaned_Data
where Year between 2000 and 2009
group by Name
go

alter view [Top 10 Selling Games In 2010s] as
select top 10 Name,round(sum(Global_Sales),2) as Sales,dense_rank() over (order by round(sum(Global_Sales),2) desc) as Rank
from Cleaned_Data
where Year between 2010 and 2019
group by Name
go

