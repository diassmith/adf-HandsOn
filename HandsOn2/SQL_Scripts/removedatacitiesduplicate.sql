create procedure SalesLT.remove_cities_duplicated
as
with cte as
(
select 
row_number () OVER(PARTITION BY cod_cidade ORDER BY cod_cidade) as rank_cities_duplicated,
*
from [SalesLT].[cidades]
)
delete from cte
where rank_cities_duplicated > 1