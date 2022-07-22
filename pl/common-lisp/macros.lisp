;;; Macros: Defining Your Own
;;; Ref. https://gigamonkeys.com/book/macros-defining-your-own.html

;; the job of a macro isn't to do anything directly
;; its job is to generate code that will later do what
;; you want


;;; A sample macro: do-primes

(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))


(defmacro once-only ((&rest names) &body body)
  (let ((gensyms (loop for n in names collect (gensym))))
    `(let (,@(loop for g in gensyms collect `(,g (gensym))))
       `(let (,,@(loop for g in gensyms for n in names collect ``(,,g ,,n)))
          ,(let (,@(loop for n in names for g in gensyms collect `(,n ,g)))
             ,@body)))))


(defmacro do-primes ((var start end) &body body)
  (once-only (start end)
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
         ((> ,var , end))
       ,@body)))

(do-primes (p 0 19)
  (format t "~d " p))
