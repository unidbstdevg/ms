(defun temp-coffee-iter (temp_prev k temp_env dtm)
  (+ temp_prev (* k dtm (- temp_prev temp_env))))

(defparameter k -0.09)
(defparameter temp_env 23.0)
(defun temp-coffee-fixed-iter (temp_prev dtm)
  (temp-coffee-iter temp_prev k temp_env dtm))

(defparameter balance_threshold 1)
(defun balancep (temp1 temp2)
  (< (abs (- temp1 temp2)) balance_threshold))

(defun print-range-temp-coffe-fixed-till-balance (temp0 temp_env dtm)
  (defun iter (itm temp)
    (format t "~,2f ~,3f~%" itm temp)
    (cond ((balancep temp temp_env) itm)
          (t (let ((new_temp (temp-coffee-fixed-iter temp dtm)))
               (iter (+ itm dtm) new_temp)))))
  (iter 0 temp0))

(defparameter temp0 83.)
(defparameter dtm 0.1)
(print-range-temp-coffe-fixed-till-balance temp0 temp_env dtm)
