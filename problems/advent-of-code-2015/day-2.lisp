(ql:quickload :cl-ppcre)


(defun day-2-part-1 (dimensions)
  "Return the sum of the area of right rectangular prisms 
   given the input dimensions strings plus the area of the smaller
   dimensions of each right rectangular prism.
   For example:
          input:
              2x3x4
              1x1x10
          produces:
              2*6 + 2*12 + 2*8 = 52 + 2*3  = 58 from 2x3x4
              2*1 + 2*10 + 2*10 = 42 + 1x1 = 43 from 1x1x10
          output is 101"
  (loop for dimm in (cl-ppcre:split #\NewLine dimensions)
        sum (multiple-value-bind (d1 d2 d3)
            (values-list (sort (mapcar #'parse-integer
                                       (cl-ppcre:split "x" dimm))
                               #'<))
             (+ (* 2 d1 d2)
                   (* 2 d1 d3)
                   (* 2 d2 d3)
                   (* d1 d2)))))


