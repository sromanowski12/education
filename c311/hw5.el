(defun gcd (n m)
  "Function to determine the greatest common divisor"
  (if (> n m)
      (let ((dividend n) (divisor m) (remainder 1))
        (while (not (= remainder 0))
          (setq remainder (% dividend divisor))
          (setq dividend divisor)
          (setq divisor remainder))
        dividend)
    (gcd m n)))


(setq L '(3 1 5 6 3 2 3))
(3 1 5 6 3 2 3)

(setq z 3)
3

(setq y 9)
9

(defun replace (L z y)
  (setq k (lambda (x) (if (= x z) y x)))
  (mapcar k L))
replace

(replace L z y)
(9 1 5 6 9 2 9)

(defun print-list (L)
  (mapc (lambda (x) (princ x) (princ " ")) L))
print-list

(print-list L)
3 1 5 6 3 2 3 (3 1 5 6 3 2 3)

(funcall 'print-list L)
3 1 5 6 3 2 3 (3 1 5 6 3 2 3)

(apply 'replace (list L z y))
(9 1 5 6 9 2 9)
