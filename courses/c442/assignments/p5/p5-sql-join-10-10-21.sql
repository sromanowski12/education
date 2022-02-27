/* 3.10.5 - Question 1 */
SELECT SUM(order_item.ExtendedPrice) AS SalesTotal
FROM order_item
WHERE SKU IN (
    SELECT SKU
    FROM sku_data
    WHERE sku_data.Department = 'Water Sports'
);

/* 4.2.6 - Question 1 */
SELECT StoreNumber, StoreZip, SUM(ExtendedPrice) AS total_sales, COUNT(DISTINCT retail_order.OrderNumber) AS order_count, COUNT(order_item.SKU) AS sale_item_count
FROM retail_order
JOIN order_item ON order_item.OrderNumber = retail_order.OrderNumber
JOIN sku_data ON sku_data.SKU = order_item.SKU
GROUP BY StoreNumber, StoreZip;

/* 4.2.6 - Question 2 */
SELECT warehouse.WarehouseID, CONCAT(warehouse.WarehouseCity, " ", warehouse.WarehouseState) AS city_state,
COUNT(DISTINCT inventory.SKU) AS distinct_sku_count,
SUM(inventory.QuantityOnHand) AS current_inventory,
SUM(inventory.QuantityOnOrder) AS quantity_ordered
FROM warehouse
JOIN inventory ON inventory.WarehouseID = warehouse.WarehouseID
GROUP BY warehouse.WarehouseID, city_state;   

/* 4.3.5 - Question 1 */
SELECT sku_data.Department, SUM(order_item.Quantity) AS saleitem_quantity
FROM order_item
RIGHT JOIN sku_data ON sku_data.SKU = order_item.SKU
GROUP BY sku_data.Department
ORDER BY saleitem_quantity DESC;

/* 4.3.5 - Question 2 */
SELECT warehouse.WarehouseID, CONCAT(warehouse.WarehouseCity, " ", warehouse.WarehouseState) AS city_state, 
COUNT(DISTINCT inventory.SKU) AS distinct_sku_count,
SUM(inventory.QuantityOnHand) AS current_inventory,
SUM(inventory.QuantityOnOrder) AS quantity_ordered
FROM warehouse
LEFT JOIN inventory ON inventory.WarehouseID = warehouse.WarehouseID
GROUP BY warehouse.WarehouseID;  

/* 4.4.5 - Question 1 */
SELECT warehouse.WarehouseID, CONCAT(warehouse.WarehouseCity, " ", warehouse.WarehouseState) AS city_state,
warehouse.WarehouseState,
warehouse.Manager,
warehouse.SquareFeet,
COUNT(inventory.SKU) AS sku_count,
(CASE 
    WHEN SUM(inventory.QuantityOnHand) IS NULL THEN 0
    ELSE SUM(inventory.QuantityOnHand)
END) AS total_quantityonhand
FROM warehouse
LEFT JOIN inventory ON inventory.WarehouseID = warehouse.WarehouseID
GROUP BY warehouse.WarehouseID;

/* 4.5.4 - Question 1 */
SELECT catalog_sku_2014.SKU
FROM catalog_sku_2014
WHERE catalog_sku_2014.SKU IN (SELECT catalog_sku_2015.SKU
FROM catalog_sku_2015);