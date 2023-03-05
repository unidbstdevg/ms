(defun temp-coffee-iter (temp_prev k temp_env dtm)
  (+ temp_prev (* k dtm (- temp_prev temp_env))))

(defparameter k -0.09)
(defparameter temp_env 23.0)
(defun temp-coffee-fixed-iter (temp_prev dtm)
  (temp-coffee-iter temp_prev k temp_env dtm))

(defun print-range-temp-coffe-till (tm temp0 dtm)
  (let ((temp_prev temp0))
    (loop for itm from 0 below tm by dtm
      do
        (format t "~,2f ~,2f~%" itm temp_prev)
        (setf temp_prev (temp-coffee-fixed-iter temp_prev dtm)))))

(defparameter temp0 83.)
(defparameter dtm 0.1)
(print-range-temp-coffe-till 1.7 temp0 dtm)
