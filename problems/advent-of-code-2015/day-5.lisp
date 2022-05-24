(ql:quickload :cl-ppcre)


(defun day-5-part-1 (string-lines)
  (count-fn-in-lines string-lines #'nice-string-p))

(defun day-5-part-2 (string-lines)
  (count-fn-in-lines string-lines #'new-nice-string-p))

(defun count-fn-in-lines (string-lines fn)
  (loop for test-string in (cl-ppcre:split #\NewLine string-lines)
        counting (funcall fn test-string)))

(defun nice-string-p (in-string)
  "Checks whether in-string have these properties:
It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), 
 or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of
 the other requirements."
  (cl-ppcre:scan "(?=(.*(a|e|i|o|u)){3,})(?=.*(.)\\1{1,})(?=^(?!.*ab|.*cd|.*pq|.*xy).*$)" in-string))

(defun new-nice-string-p (in-string)
  "Checks whether in-string have these properties:
It contains a pair of any two letters that appears at least twice in the string
 without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but
 it overlaps).
It contains at least one letter which repeats with exactly one letter between them,
 like xyx, abcdefeghi (efe), or even aaa."
  (cl-ppcre:scan "(?=.*(.{1})(.{1}).*\\1\\2)(?=.*(.{1}).{1}\\3)" in-string))

