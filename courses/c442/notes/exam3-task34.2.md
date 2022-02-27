
**Task 34.2.3** - Auto-populate table column using UPDATE and INSERT trigger

Firstly, execute the following script in MySQL Workbench. The script creates test_db database which
- Contains the two tables linked by a foreign key promotion_code as shown in the schema above.
- Discount type and value
  - promotion.discount_type takes an integer indicating the type of discount, 1 for percentage or 2 for deduction amount. The default is 0. The column is not used in this case.
  - promotion.discount_value is a percentage if promotion.discount_type is 1 and deduction amount for type 2.

The deduction amount is a negative value; the minus sign indicates its discount type, 2.

**Task 34.2.3.1** - Using UPDATE

The following UPDATE calculates the order total for order_id = 1 and write the value in the total column

```sql
WITH coupon AS 
(
   SELECT discount_type, discount_value
   FROM promotion p join sales_order s 
   on order_id = 1 and p.promotion_code = s.promotion_code
)
UPDATE sales_order
   set total = subtotal + subtotal*tax_rate/100 + shipping - (
    case when (select discount_value from coupon) > 0 then subtotal*(select discount_value from coupon)/100
    else -1 * (select discount_value from coupon)
    end
) 
where order_id = 1 and promotion_code not like '0'
; 
```