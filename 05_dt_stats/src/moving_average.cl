(load "src/utils.cl")

(defun calc (prev cur)
  (let* ((next (myread))
         (Si (avg prev cur next)))
    ; (format t "~d ~d ~d~%" prev cur next)
    (myprint Si)
    (calc cur next)))

(let ((prev (myread))
      (cur (myread)))
  (terpri)
  (calc prev cur))
