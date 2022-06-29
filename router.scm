(define-macro (while condition . body)
    `(let loop ()
        (cond (,condition 
            (begin . ,body) (loop)))))

(define output (open-output-file "/Users/konstantinaa/code/scheme-lsp/stuff.txt"))

(while #t
    (begin 
     (force-output output)
     (let 
        ((input (read (current-input-port))))
         (begin ;(print input)
         (write input output)))))