CREATE DEFINER=`root`@`%` PROCEDURE `getCategoryAdList`()
BEGIN

select category.CategoryId, 
CategoryDesc, 
CategoryImageUrl, 
count(AdId) as ProductCount
from category left outer join posted_ad
on category.CategoryId = posted_ad.CategoryId
where StatusId = 0
group by category.CategoryId;

END