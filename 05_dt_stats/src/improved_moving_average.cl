(load "src/utils.cl")

(defun calc (prev cur)
  (let* ((next (myread))
         (Si (avg3 prev cur next)))
    ; (format t "~d ~d ~d~%" prev cur next)
    (myprint Si)
    (calc Si next)))

(terpri)
(calc (myread) (myread))
