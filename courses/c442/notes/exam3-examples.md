

```sql
select trigger_schema, trigger_name, action_statement
from information_schema.triggers
where trigger_schema like 'vrg'
;
```