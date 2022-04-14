

(defparameter *seqs* '((5 40 'blue)
                       (10 25 'yellow)
                       (15 20 'pink)
                       (16 18 'red)
                       (40 60 'white)
                       (50 80 'orange)))


;; there are only two configurations:
;; - the next span is all inside the first one
;; - or when the next span continues outside the first one
;; considering we take two ordered spans at a time
(defun split-seqs (seq)
  (let ((seq (copy-list seq))
        (outseq (list)))
    (do ((i 0 (1+ i)))
        ((>= i (length seq)))
      (let ((e1s (first (nth i seq)))
            (e1e (second (nth i seq)))
            (e1c (third (nth i seq)))
            (splitp nil))
        (do ((j (1+ i) (1+ j)))
            ((>= j (length seq)))
          (let ((e2s (first (nth j seq)))
                (e2e (second (nth j seq))))
            (if (< e1s e2s e1e e2e) ;second span surpass the first from left
                (progn (push (list e1s e2s e1c) outseq)
                       (setf splitp T))
                (when (< e1s e2s e2e e1e) ;second span inside the first
                  (progn
                    (setf splitp T)
                    (push (list e1s e2s e1c) outseq)
                    (push (list e2e e1e e1c)
                          (cdr (if (>= (1+ j) (length seq))
                                   (nthcdr j seq)
                                   (nthcdr (1+ j) seq))))
                    (return))))))
        (unless splitp
               (push (list e1s e1e  e1c) outseq))))
    (reverse (sort outseq #'> :key #'first))))
