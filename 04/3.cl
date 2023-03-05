(load "shared.cl")

; add cold water each N step

(defparameter k -0.09)
(defparameter temp_env 23.0)
(defun my-temp-coffee (temp_prev dtm)
  (temp-coffee temp_prev k temp_env dtm))

(defparameter mass_milk 10.)
(defparameter temp_milk 15.)
(defun my-temp-mix (temp_coffee mass_coffee)
  (temp-mix temp_coffee mass_coffee temp_milk mass_milk))

(defun print-temp-coffee-till-balance (temp0 temp_env mass0 dtm)
  (defun iter (itm temp mass)
    (format t "~,2f ~,3f ~,1f~%" itm temp mass)
    (cond ((balancep temp temp_env) itm)
          (t (let ((new_temp (my-temp-coffee temp dtm)))
               (if (lucky-time-p itm)
                 (iter (+ itm dtm) (my-temp-mix new_temp mass) (+ mass mass_milk))
                 (iter (+ itm dtm) new_temp mass))))))
  (iter .0 temp0 mass0))

(defparameter temp0 83.)
(defparameter dtm 0.1)
(defparameter mass0 150.)
(print-temp-coffee-till-balance temp0 temp_env mass0 dtm)
