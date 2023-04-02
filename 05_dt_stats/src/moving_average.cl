; helper funcs

(defun avg3 (a b c)
  (/ (+ a b c)
     3.0))

(defun myprint (x)
  (princ x)
  (terpri))

(defun myread ()
  (parse-integer (read-line)))

;;;


(defun calc-S-with-next (prev cur)
  (let* ((next (myread))
         (Si (avg3 prev cur next)))
    ; (format t "~d ~d ~d~%" prev cur next)
    (myprint Si)
    next))

(defun calc (prev cur)
  (let ((next (calc-S-with-next prev cur)))
    (calc cur next)))

(terpri)
(calc (myread) (myread))
