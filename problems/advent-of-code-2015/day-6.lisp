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

(defmacro x-pos (point)
  `(car ,point))

(defmacro y-pos (point)
  `(cdr ,point))

(defmacro aref-light (lights point)
  `(aref ,lights (x-pos ,point) (y-pos ,point)))

(defun turn-on (point lights)
  (setf (aref-light lights point) 1))

(defun turn-off (point lights)
  (setf (aref-light lights point) 0))

(defun inc-light (point lights &optional (delta 1))
  (incf (aref-light lights point) delta))

(defun dec-light (point lights &optional (delta 1))
  (when (>= (aref-light lights point) 1)
    (decf (aref-light lights point) delta)))

(defun litp (point lights)
  (not (zerop (aref lights (x-pos point) (y-pos point)))))

(defun toggle (point lights)
  (if (litp point lights)
      (turn-off point lights)
      (turn-on point lights)))

(defun count-lit-lights (lights)
  (loop for i from 0 below 1000
        sum (loop for j from 0 below 1000
                  when (litp (cons i j) lights)
                  sum (aref-light lights (cons i j)))))

(defun run-cmd (cmd-fn points lights)
  (mapc #'(lambda (point)
            (funcall cmd-fn point lights))
        points))

(defun day-6-part-1 (instructions)
  (lights-interpreter instructions))

(defun day-6-part-2 (instructions)
  (lights-interpreter instructions
                      :turn-on-fn #'inc-light
                      :turn-off-fn #'dec-light
                      :toggle-fn #'(lambda (point lights)
                                     (inc-light point
                                                lights
                                                2))))


(defun lights-interpreter (instructions
                           &key (turn-on-fn #'turn-on)
                                (turn-off-fn #'turn-off)
                                (toggle-fn #'toggle))
  (let ((lights (make-array '(1000 1000)
                            :element-type 'integer
                            :initial-element 0)))
    (loop for instruction in (cl-ppcre:split #\NewLine instructions)
          do (let ((cmd (cmd-from instruction))
                   (points (multiple-value-bind (upper-left down-right)
                               (positions-from instruction)
                             (gen-points upper-left down-right))))
               (cond ((string= cmd "turn on")
                      (run-cmd turn-on-fn points lights))
                     ((string= cmd "toggle")
                      (run-cmd toggle-fn points lights))
                     ((string= cmd "turn off")
                      (run-cmd turn-off-fn points lights)))))
    (count-lit-lights lights)))




