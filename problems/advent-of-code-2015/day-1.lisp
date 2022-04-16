(defun day-1-part-1 (floor-cmds)
  "Return the final floor given a string of floor-cmds
   ( -> up   +1
   ) -> down -1
  For example:
              ()()(( ->  2
              ))((   ->  0
              ))))(  -> -3"
  (loop for cmd across floor-cmds
        if (string= "(" cmd)
        sum 1
        else
        when (string= ")" cmd)
        sum -1
        end))


(defun day-1-part-1 (floor-cmds)
  "Return the final floor given a string of floor-cmds
   ( -> up   +1
   ) -> down -1
  For example:
              ()()(( ->  2
              ))((   ->  0
              ))))(  -> -3"
  (reduce #'+ (map 'list #'(lambda (cmd)
                          (cond ((string= cmd "(") 1)
                                ((string= cmd ")") -1)
                                (t 0)))
                      floor-cmds)))


(defun day-1-part-2 (floor-cmds)
  "Return the position, counting from 1, that the elevator reaches
   the floor -1 given a string of floor-cmds
   ( -> up   +1
   ) -> down -1
   For example:
               (()))()(  -> 5
               ())()     -> 3"
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
