(load "shared.cl")

; fixed temperature of environment

(defparameter k -0.09)
(defparameter temp_env 23.0)
(defun my-temp-coffee (temp_prev dtm)
  (temp-coffee temp_prev k temp_env dtm))

(defun print-temp-coffee-till-balance (temp0 temp_env dtm)
  (defun iter (itm temp)
    (format t "~,2f ~,3f~%" itm temp)
    (cond ((balancep temp temp_env) itm)
          (t (let ((new_temp (my-temp-coffee temp dtm)))
               (iter (+ itm dtm) new_temp)))))
  (iter 0 temp0))

(defparameter temp0 83.)
(defparameter dtm 0.1)
(print-temp-coffee-till-balance temp0 temp_env dtm)
