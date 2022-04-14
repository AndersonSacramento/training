(defun day-1-part-1 (floor-cmds)
  (loop for cmd across floor-cmds
        if (string= "(" cmd)
        sum 1
        else
        when (string= ")" cmd)
        sum -1
        end))


(defun day-1-part-1 (floor-cmds)
  (reduce #'+ (map 'list #'(lambda (cmd)
                          (cond ((string= cmd "(") 1)
                                ((string= cmd ")") -1)
                                (t 0)))
                      floor-cmds)))


(defun day-1-part-2 (floor-cmds)
  (loop for cmd across floor-cmds
        for i = 1 then (1+ i)
        if (string= "(" cmd)
            sum 1 into floor
        else
            when (string= ")" cmd)
                sum -1 into floor
        end
        when (= floor -1)
        return i))
