(load "src/utils.cl")

(defun calc (prevS cur)
  (let* ((next (myread))
         (Si (avg prevS cur next)))
    ; (format t "~d ~d ~d~%" prevS cur next)
    (myprint Si)
    (calc Si next)))

(let* ((prev (myread))
       (cur (myread))
       (Si (avg prev cur)))
  (myprint Si)
  (calc Si cur))
