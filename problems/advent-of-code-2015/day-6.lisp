(ql:quickload :cl-ppcre)

(defun gen-points (upper-left-pos down-right-pos)
  (loop for i from (car upper-left-pos) upto (car down-right-pos)
        append (loop for j from (cdr upper-left-pos) upto (cdr down-right-pos)
                     collect (cons i j))))


(defun cmd-from (in-str)
  (multiple-value-bind (s e reg-starts reg-ends)
      (cl-ppcre:scan "(.*?) [0-9]*,[0-9]* through [0-9]*,[0-9]*" in-str)
    (declare (ignore s e))
    (subseq in-str
            (aref reg-starts 0)
            (aref reg-ends 0))))

(defun positions-from (in-str)
  (multiple-value-bind (s e reg-starts reg-ends)
      (cl-ppcre:scan ".* (.*?),(.*?) through (.*?),(.*?)$" in-str)
    (declare (ignore s e))
    (let ((positions (map 'list
                          #'(lambda (s e)
                              (parse-integer (subseq in-str s e)))
                             reg-starts
                             reg-ends)))
      (values-list
       (loop repeat 2
             collect (cons (pop positions)
                           (pop positions)))))))

(defun turn-on (point lights)
  (setf (aref lights (car point) (cdr point)) 1))

(defun turn-off (point lights)
  (setf (aref lights (car point) (cdr point)) 0))

(defun litp (point lights)
  (not (zerop (aref lights (car point) (cdr point)))))

(defun toggle (point lights)
  (if (litp point lights)
      (turn-off point lights)
      (turn-on point lights)))

(defun count-lights-lit (lights)
  (loop for i from 0 below 1000
        sum (loop for j from 0 below 1000
                  when (litp (cons i j) lights)
                  sum 1)))

(defun run-cmd (cmd-fn points lights)
  (mapc #'(lambda (point)
            (funcall cmd-fn point lights))
        points))

(defun day-6-part-1 (instructions)
  (let ((lights (make-array '(1000 1000) :element-type '(unsigned-byte 1))))
    (loop for instruction in (cl-ppcre:split #\NewLine instructions)
          do (let ((cmd (cmd-from instruction))
                   (points (multiple-value-bind (upper-left down-right)
                               (positions-from instruction)
                             (gen-points upper-left down-right))))
               (cond ((string= cmd "turn on")
                      (run-cmd #'turn-on points lights))
                     ((string= cmd "toggle")
                      (run-cmd #'toggle points lights))
                     ((string= cmd "turn off")
                      (run-cmd #'turn-off points lights)))))
    (count-lights-lit lights)))




