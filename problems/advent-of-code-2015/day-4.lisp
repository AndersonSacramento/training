(ql:quickload :irconclad)

(defun day-4-part-1 (secret-key)
  (md5-hex-start-with-from secret-key "00000"))

(defun day-4-part-2 (secret-key)
  (md5-hex-start-with-from secret-key "000000"))

(defun md5-hex-str-from (input-str)
  "Digest input-str using md5 and output hash hex string."
  (ironclad:byte-array-to-hex-string
   (ironclad:digest-sequence :md5
    (ironclad:ascii-string-to-byte-array input-str))))

(defun md5-hex-start-with-from (secret-key start-str)
  "Find minimum positive natural number that produces hash hex
string, using md5 digest, that starts with start-str given the
secret-key concatenated with the string version of the minimum number."
  (let ((len-start (length start-str)))
    (loop for x = 1 then (1+ x)
         for ans = secret-key then (format nil "~A~A"
                                           secret-key
                                           (write-to-string x))
         when (string=
               start-str
               (subseq (md5-hex-str-from ans)  0 len-start))
         return x)))
