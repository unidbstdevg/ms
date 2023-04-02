(load "src/utils.cl")

(defparameter *alpha* 0.5)
(defun calcS (cur prevS)
  (+ (* *alpha* cur)
     (* prevS (- 1 *alpha*))))

(defun calc (prevS)
  (let* ((cur (myread))
         (Si (calcS prevS cur)))
    ; (format t "~d ~d ~d~%" prev cur next)
    (myprint Si)
    (calc Si)))

(let ((prev (myread)))
  (myprint prev)
  (calc prev))
