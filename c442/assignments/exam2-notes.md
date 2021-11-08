7.0.1

7.0.2

```sql
SELECT SKU, COUNT(DISTINCT Quantity, Price) FROM cape_codd.order_item
GROUP BY SKU;
```

