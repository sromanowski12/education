7.0.1

7.0.2

```sql
SELECT SKU, COUNT(DISTINCT Quantity, Price) FROM cape_codd.order_item
GROUP BY SKU;
```

7.0.3

7.0.4 - Write a SQL JOIN whuch denormalizes the three tables and join the order-relevant data from three tables.

- cape_codd.retail_order
- cape_codd.order_item
- cape_codd.sku_data

7.0.5
