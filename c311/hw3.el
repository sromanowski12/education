; Seth Romanowski
; C311
; Programming Languages

; Implement the following functions
; is-const
(setq L '())
nil

(setq L '(1))
(1)

(setq L '(1 1 1))
(1 1 1)

(setq L '(1 2 3 4))
(1 2 3 4)

(defun is-const (L)
  "Function to determine if a list is a constant list"
  (let ((i (car L)) (result nil))
   (if (not L) t
     (dolist (e L result)
       (if (equal e i) (setq result t)
         (setq result nil))))))

(is-const L)
; t --> Result of '()

(is-const L)
; t --> Result of '(1)

(is-const L)
; t --> Result of '(1 1 1)

(is-const L)
; nil --> Result of '(1 2 3 4)

; element-i
(setq L '())
nil

(setq L '(1))
(1)

(setq L '(4 6 8 10))
(4 6 8 10)

(defun element-i (L index)
  "Function to determine the element of a list"
  (let ((result nil) (count 0))
    (if (or (not L) (> index (length L))) nil
      (if (or (not (cdr L)) (= index 0)) (setq result (car L))
        (dotimes (count index result)
          (setq result (car (cdr L)))
          (pop L))))))
element-i

(element-i L 0)
; nil --> Result of '()

(element-i L 0)
; 1 --> Result of  '(1)

(element-i L 0)
; 4 --> Result of L = '(4 6 8 10) &
;       index = 0

(element-i L 1)
; 6 --> Result of L = '(4 6 8 10) &
;       index = 1

(element-i L 5)
; nil --> Result of L = '(4 6 8 10) &
;         index = 5

; is-sorted
(setq L '())
nil

(setq L '(1))
(1)

(setq L '(1 1 1 1))
(1 1 1 1)

(setq L '(1 2 3 4))
(1 2 3 4)

(setq L '(4 3 2 1))
(4 3 2 1)

(defun is-sorted (L)
  "Function to determine if a list is sorted"
  (let ((prev 0) (result nil))
  (if (or (not L) (not (cdr L))) t
    (dolist (e L result)
      (if (< e prev) (setq result nil)
        (setq prev e) (setq result t))))))
is-sorted

(is-sorted L)
; t --> Result of '()

(is-sorted L)
; t --> Result of '(1)

(is-sorted L)
; t --> Result of '(1 1 1 1)

(is-sorted L)
; t --> Result of '(1 2 3 4)

(is-sorted L)
; nil --> Result of '(4 3 2 1)


; reverse
(setq L '())
nil

(setq L '(1))
(1)

(setq L '(1 2 3 4))
(1 2 3 4)

(defun reverse (L)
  "Function to reverse a list"
  (let ((result nil) (M '()))
  (if (not L) nil
    (if (not (cdr L)) (push (car L) M)
      (dolist (e L M)
        (push e M))))))
reverse

(reverse L)
; nil --> Result of '()

(reverse L)
; (1) --> Result of '(1)

(reverse L)
; (4 3 2 1) --> Result of '(1 2 3 4)



