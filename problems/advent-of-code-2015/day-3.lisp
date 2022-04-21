(defun day-3-part-1 (moves)
  "Counts the number of uniquely locations that receives packages
given input moves: ^ north,  v south, < left, and > right. Each position
receives only one package. The starting position receives one package.
For example:
      input: >          output: 2
      input: ^>v<       output: 4
      input: ^v^v^v^v^v output: 2"

  (let ((delivery-coordinates (make-hash-table :test #'equal))
        (cur-pos (cons 0 0)))
    (setf (gethash (copy-tree cur-pos) delivery-coordinates) 1)
    (loop for move across moves
          do (progn
               (cond ((string= move ">")
                      (incf (car cur-pos)))
                     ((string= move "<")
                      (decf (car cur-pos)))
                     ((string= move "^")
                      (incf (cdr cur-pos)))
                     ((string= move "v")
                      (decf (cdr cur-pos))))
               (if (gethash cur-pos delivery-coordinates)
                   (incf (gethash cur-pos delivery-coordinates))
                   (setf (gethash (copy-tree cur-pos) delivery-coordinates) 1))))
    (hash-table-count delivery-coordinates)))


(defun day-3-part-2 (moves)
  "Counts the number of uniquely locations that receives packages
from two deliveries that take turn given input moves:
 ^ north,  v south, < left, and > right. Each position
receives only one package. The starting position receives two package. 
Both deliveries start at the same location.
For example:
      input: ^v         output: 3
      input: ^>v<       output: 3
      input: ^v^v^v^v^v output: 11"
  (let ((delivery-coordinates (make-hash-table :test #'equal))
        (santa-pos (cons 0 0))
        (robo-pos (cons 0 0))
        (cur-pos (cons 0 0)))
    (setf (gethash (copy-tree cur-pos) delivery-coordinates) 2)
    (loop for move across moves
          for i = 0 then (1+ i)
          do (progn
               (if (evenp i)
                   (setf cur-pos santa-pos)
                   (setf cur-pos robo-pos))
               (cond ((string= move ">")
                      (incf (car cur-pos)))
                     ((string= move "<")
                      (decf (car cur-pos)))
                     ((string= move "^")
                      (incf (cdr cur-pos)))
                     ((string= move "v")
                      (decf (cdr cur-pos))))
               (if (gethash cur-pos delivery-coordinates)
                   (incf (gethash cur-pos delivery-coordinates))
                   (setf (gethash (copy-tree cur-pos) delivery-coordinates) 1))))
    (hash-table-count delivery-coordinates)))
