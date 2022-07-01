(##include "helpers.scm")

;; make this a table later?
;; prob unnecessary tho
(define (get-message)
     (list
      'content-length
      (begin 
       (read-line (current-input-port) #\space)
       (string->number (read-line (current-input-port) #\return)))
      'json-as-string
      (begin
       (read-line (current-input-port) #\{)
       (call-with-output-string 
        (lambda (p)
         (letrec 
          ((json-capturer 
            (lambda (bracket-count)
            (if (> bracket-count 0)
             (let ((cur-char (read-char (current-input-port))))
               (print port: p cur-char)
               (json-capturer
                (cond
                 ((equal? cur-char #\{) (+ bracket-count 1))
                 ((equal? cur-char #\}) (- bracket-count 1))
                 (#t bracket-count))))
            'done))))
         (print port: p #\{)
         (json-capturer 1)))))))