
(##include "helpers.scm")
(##include "messages.scm")

(define output (open-output-file "/Users/konstantinaa/code/scheme-lsp/stuff.json"))
;(print (string->json "{\"weed\": \"sus\"}"))
(while #t
    (force-output output)
    (write (get-message) output))