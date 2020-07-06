(defun search (L val)
    "this is a function"
    (cond ((null L) 0)
    ((listp (car L))
        ()))

(defun driver (L val)
  (if (not L) nil
    (catch 'found
      (dolist (elem L nil)
        (if (equal elem val)
            (throw 'found t))))))