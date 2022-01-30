```racket
(and <expr>*)
(or <expr>*)
```

```racket
(define (reply-non-sting s)
    (if (and (string? s) (string-prefix? s "hello "))
        "hi!"
        "huh?"))
```

```
> (reply-non-string "hello racket")
"hi!"
```
