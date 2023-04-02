; helper funcs

(defun avg (&rest args)
  (when args
    (/ (apply #'+ args) (length args))))

(defun myprint (x)
  (princ (coerce x 'float))
  (terpri))

(defun myread ()
  (parse-integer (read-line)))
