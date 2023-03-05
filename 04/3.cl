(defun temp-coffee-iter (temp_prev k temp_env dtm)
  (+ temp_prev (* k dtm (- temp_prev temp_env))))

(defparameter k -0.09)
(defparameter temp_env 23.0)
(defun temp-coffee-fixed-iter (temp_prev dtm)
  (temp-coffee-iter temp_prev k temp_env dtm))

(defun temp-mix (temp_coffe mass_coffee temp_milk mass_milk)
  (/ (+ (* temp_coffe mass_coffee) (* temp_milk mass_milk))
     (+ mass_coffee mass_milk)))

(defparameter mass_milk 10.)
(defparameter temp_milk 15.)
(defun my-temp-mix (temp_coffee mass_coffee)
  (temp-mix temp_coffee mass_coffee temp_milk mass_milk))

(defparameter balance_threshold 1)
(defun balancep (temp1 temp2)
  (< (abs (- temp1 temp2)) balance_threshold))

(defun lucky-time-p (tm)
  (= .0 (mod (floor (* tm 10)) 50)))

(defun print-range-temp-coffe-fixed-till-balance (temp0 temp_env mass0 dtm)
  (defun iter (itm temp mass)
    (format t "~,2f ~,3f ~,1f~%" itm temp mass)
    (cond ((balancep temp temp_env) itm)
          (t (let ((new_temp (temp-coffee-fixed-iter temp dtm)))
               (if (lucky-time-p itm)
                 (iter (+ itm dtm) (my-temp-mix new_temp mass) (+ mass mass_milk))
                 (iter (+ itm dtm) new_temp mass))))))
  (iter .0 temp0 mass0))

(defparameter temp0 83.)
(defparameter dtm 0.1)
(defparameter mass0 150.)
(print-range-temp-coffe-fixed-till-balance temp0 temp_env mass0 dtm)
