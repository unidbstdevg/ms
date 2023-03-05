(defun temp-coffee-iter (temp_prev k temp_env dtm)
  (+ temp_prev (* k dtm (- temp_prev temp_env))))

(defparameter k -0.09)
(defun temp-coffee-k-iter (temp_prev temp_env dtm)
  (temp-coffee-iter temp_prev k temp_env dtm))

(defparameter balance_threshold 1)
(defun balancep (temp1 temp2)
  (< (abs (- temp1 temp2)) balance_threshold))

(defun print-range-temp-coffe-till-balance (temp0 temp_env0 dtm)
  (defun iter (itm temp temp_env temp_prev)
    (format t "~,2f ~,3f ~,3f~%" itm temp temp_env)
    (cond ((balancep temp temp_env) itm)
          (t
            (let* ((new_temp_env (+ temp_env (- temp_prev temp)))
                   (new_temp (temp-coffee-k-iter temp new_temp_env dtm)))
              (iter (+ itm dtm) new_temp new_temp_env temp)))))
  (iter 0 temp0 temp_env0 temp0))

(defparameter temp0 83.)
(defparameter temp_env0 23.0)
(defparameter dtm 0.1)
(print-range-temp-coffe-till-balance temp0 temp_env0 dtm)
