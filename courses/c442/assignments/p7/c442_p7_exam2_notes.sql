-- SELECT ALL in n_buyer

-- SELECT ALL in n_sku
SELECT * FROM cape_codd.n_sku;


SELECT * FROM n_sku s JOIN n_buyer b
ON s.buyer_id = b.buyer_id
;



-- Denormalize tables
select sku, sku_description, buyer, department
from n_sku s join n_buyer b
on s.buyer_id = b.buyer_id
;