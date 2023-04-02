; helper funcs

(defun avg3 (a b c)
  (/ (+ a b c)
     3.0))

(defun myprint (x)
  (princ x)
  (terpri))

(defun myread ()
  (parse-integer (read-line)))
