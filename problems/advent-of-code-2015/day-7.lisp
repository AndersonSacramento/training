(ql:quickload :cl-ppcre)


(defun read-value (lpart rpart)
  (let* ((*wires* *wires*)
         (in (parse-integer lpart))
         (out rpart))
    (setf (gethash out *wires*) in)))


(defun read-unary (lpart rpart)
  (let ((*wires* *wires*)
        (out rpart))
    (multiple-value-bind (cmd in)
        (values-list (cl-ppcre:split " " lpart))
      (cond ((string= cmd "NOT")
             (setf  (gethash out *wires*)
                    (lognot (gethash in *wires*))))))))

(defun read-binary (lpart rpart)
  (let ((*wires* *wires*)
        (out rpart))
    (multiple-value-bind (in1 cmd in2)
        (values-list (cl-ppcre:split " " lpart))
      (cond ((string= cmd "AND")
             (setf (gethash out *wires*)
                   (logand (gethash in1 *wires*)
                           (gethash in2 *wires*) )))
            ((string= cmd "OR")
             (setf (gethash out *wires*)
                   (logior (gethash in1 *wires*)
                          (gethash in2 *wires*))))
            ((string= cmd "LSHIFT")
             (setf (gethash out *wires*)
                   (ash (gethash in1 *wires*)
                        (parse-integer in2))))
            ((string= cmd "RSHIFT")
             (setf (gethash out *wires*)
                   (ash (gethash in1 *wires*)
                        (* -1 (parse-integer in2)))))))))



(defun read-cmd (cmd)
  (let* ((parts (cl-ppcre:split " -> " cmd))
         (lpart (first parts))
         (rpart (second parts))
         (lpart-size (length (cl-ppcre:split " " lpart))))
    (print cmd)
    (cond ((= 1 lpart-size)
           (read-value lpart rpart))
          ((= 2 lpart-size)
           (read-unary lpart rpart))
          ((= 3 lpart-size)
           (read-binary lpart rpart)))))


(defun load-circuit (circuit-cmds)
  (defparameter *wires* (make-hash-table :test #'equalp))
  (loop for cmd in (cl-ppcre:split #\NewLine circuit-cmds)
        do (read-cmd cmd)))
