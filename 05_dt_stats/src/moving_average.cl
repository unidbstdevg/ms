(load "src/utils.cl")

(defun calc-S-with-next (prev cur)
  (let* ((next (myread))
         (Si (avg prev cur next)))
    ; (format t "~d ~d ~d~%" prev cur next)
    (myprint Si)
    next))

(defun calc (prev cur)
  (let ((next (calc-S-with-next prev cur)))
    (calc cur next)))

(terpri)
(calc (myread) (myread))
