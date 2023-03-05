(defun temp-coffee (temp_prev k temp_env dtm)
  (+ temp_prev (* k dtm (- temp_prev temp_env))))

; only for 3 and 4
(defun temp-mix (temp_coffee mass_coffee temp_milk mass_milk)
  (/ (+ (* temp_coffee mass_coffee) (* temp_milk mass_milk))
     (+ mass_coffee mass_milk)))

(defparameter balance_threshold 1)
(defun balancep (temp1 temp2)
  (< (abs (- temp1 temp2)) balance_threshold))

; only for 3 and 4
(defun lucky-time-p (tm)
  (= .0 (mod (floor (* tm 10)) 50)))
