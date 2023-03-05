(load "shared.cl")

; temperature of environment increases as coffee getting cold

(defparameter k -0.09)
(defun my-temp-coffee (temp_prev temp_env dtm)
  (temp-coffee temp_prev k temp_env dtm))

(defun print-temp-coffee-till-balance (temp0 temp_env0 dtm)
  (defun iter (itm temp temp_env temp_prev)
    (format t "~,2f ~,3f ~,3f~%" itm temp temp_env)
    (cond ((balancep temp temp_env) itm)
          (t
            (let* ((new_temp_env (+ temp_env (- temp_prev temp)))
                   (new_temp (my-temp-coffee temp new_temp_env dtm)))
              (iter (+ itm dtm) new_temp new_temp_env temp)))))
  (iter 0 temp0 temp_env0 temp0))

(defparameter temp0 83.)
(defparameter temp_env0 23.0)
(defparameter dtm 0.1)
(print-temp-coffee-till-balance temp0 temp_env0 dtm)
