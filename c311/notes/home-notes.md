```lisp
(setq L '())  ; nil
L             ; nil
(eq L nil)    ; t
(setq L '(1)) ; (1)
L             ; (1)
(setq M L)    ; (1)
M             ; (1)
(equal M L)   ; t

(car L)       ; 1
(pop L)       ; 1
L             ; nil
(car L)       ; nil
(cdr L)       ; nil
(push 1 L)    ; (1)
L             ; (1)
(cdr L)       ; nil

; Atoms, Pairs, Lists
'(2 . 3)      ; (2 . 3)
(cons 2 3)    ; (2 . 3)
(setq F '(2 . 3)) ; (2 . 3)
F             ; (2 . 3)
(cons 4 F)    ; (4 2 . 3)
(pop F)       ; 2
F             ; 3
(cons 4 F)    ; (4 . 3)
F             ; 3
(setq F (cons 4 F)) ; (4 . 3)
F             ; (4 . 3)
```