
## Lists

`(list ...)`
`(list? ...)`
`(length lst)`
`(cons ...)`
`(car ...)`
`(cdr ...)`
`(reverse ...)`
`(append ...)`

`(list-ref ...)`

`(assoc ...)`
`(list-copy ...)`

```sql
/* Lists */

> (list "test" "test2")
'("test" "test2")
```

## Vectors

    
`(vector ...)`
`(vector? ...)`
`(make-vector ...)`
`(vector-length ...)`
`(vector-ref ...)`
`(vector-set! ...)`
`(vector->list ...)`
`(list->vector ...)`
    

## Regular Expressions

`(regexp ...)`
`(regexp? ...)`
`(regexp-match ...)`
`(regexp-match-positions ...)`
`(regexp-match-positions-all ...)`


## `struct`

(struct ...)

(struct? ...)
(struct-ref ...)
(struct-set! ...)
(struct-copy ...)
(struct-keys ...)
(struct-values ...)
(struct-pairs ...)
(struct-map ...)
(struct-map! ...)
(struct-map-values ...)
(struct-map-values! ...)
(struct-map-keys ...)
(struct-map-keys! ...)