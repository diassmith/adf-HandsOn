create procedure SalesLT.remove_colors_duplicated
as
with cte as
(
select 
row_number () OVER(PARTITION BY id ORDER BY id) as rank_colors_duplicated,
*
from [SalesLT].[Cor]

)
delete from cte
where rank_colors_duplicated > 1