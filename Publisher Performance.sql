alter view [Top 10 Publishers Performing High Sales] as
select top 10 Publisher,round(sum(Global_Sales),2) as Sales,dense_rank() over (order by sum(Global_Sales) desc) as Rank
from Cleaned_Data
group by Publisher
go

alter view [Highest Genre Sales To Each Publisher In 1980s] as
select Publisher,Genre,round(sum(Global_Sales),2) as Sales,dense_rank() over (partition by Publisher order by sum(Global_Sales) desc) as Rank
from Cleaned_Data
where Year between 1980 and 1989
group by Publisher,Genre
go

alter view [Highest Genre Sales To Each Publisher In 1990s] as
select Publisher,Genre,round(sum(Global_Sales),2) as Sales,dense_rank() over (partition by Publisher order by sum(Global_Sales) desc) as Rank
from Cleaned_Data
where Year between 1990 and 1999
group by Publisher,Genre
go

alter view [Highest Genre Sales To Each Publisher In 2000s] as
select Publisher,Genre,round(sum(Global_Sales),2) as Sales,dense_rank() over (partition by Publisher order by sum(Global_Sales) desc) as Rank
from Cleaned_Data
where Year between 2000 and 2009
group by Publisher,Genre
go

alter view [Highest Genre Sales To Each Publisher In 2010s] as
select Publisher,Genre,round(sum(Global_Sales),2) as Sales,dense_rank() over (partition by Publisher order by sum(Global_Sales) desc) as Rank
from Cleaned_Data
where Year between 2010 and 2019
group by Publisher,Genre
go



select top 10 Publisher,Genre,Sales
from [Highest Genre Sales To Each Publisher In 1990s]
where Rank = 1
order by Sales desc