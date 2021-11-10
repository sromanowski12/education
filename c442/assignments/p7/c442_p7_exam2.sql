USE cape_codd;

/* 7.0.2 - Test FD in SQL */
SELECT SKU, COUNT(DISTINCT Quantity, Price)  AS SKU_COUNT FROM `cape_codd`.`order_item`
GROUP BY SKU;

-- 7.0.3 - Normalize the cape_codd.sku_data table to BCNF 
--   sku_data(sku, sku_description, department, buyer) 

-- 1. Non-key FD: buyer --> department 

-- 2. Move FD to a new table 
-- n_buyer(buyer, department)

-- 3. Make PK - (Surrogate Key) 

n_buyer(buyer_id, buyer, department)

-- BCNF? 3NF + every determinant must be a candidate key 

drop table if exists n_buyer;
create table if not exists n_buyer
    (buyer_id int primary key auto_increment)
    -- Remove duplicates 
    select distinct buyer, department from sku_data
    ;


-- 4. Update sku_data in a new table 
drop table if exists n_sku;
create table if not exists n_sku
    (sku int primary key auto_increment)
    select sku, sku_description, buyer_id 
    from sku_data s join n_buyer b 
    on s.buyer = b.buyer
    ;

-- Define FK 
alter table n_sku
    add constraint sku_fk
    foreign key (buyer_id) reference n_buyer (buyer_id)
;

-- show create table SKUS; 



-- Denormalize tables
select sku, sku_description, buyer, department
from n_sku s join n_buyer b
on s.buyer_id = b.buyer_id
;

-- 7.0.4 - Write a SQL JOIN statement which denormalizes the three tables and join the order-relevant data from the following three 
-- tables. cape_codd.retail_order, cape_codd.order_item, cape_codd.sku_data 

drop table if exists retail_orderItem_sku;
create table if not exists retail_orderItem_sku
    select o.OrderNumber AS OrderNumber, o.StoreNumber, o.StoreZip, o.OrderMonth, o.OrderYear, o.OrderTotal,
        i.OrderNumber AS OrderNumber2, i.SKU, i.Quantity, i.Price, i.ExtendedPrice,
        s.SKU AS SKU2, s.SKU_Description, s.Department, s.Buyer
    from retail_order o
        join order_item i on o.OrderNumber = i.OrderNumber
        join sku_data s on i.SKU = s.SKU;





