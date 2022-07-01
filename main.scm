;(##include "./deps/json.scm")
(##include "./helpers/messages.scm")
(##include "./helpers/misc-helpers.scm")
(##include "./io/ghetto-logger.scm")
;(##include "./io/method-thread.scm")

;(define mt (method-thread 'mt))
(define output (open-output-file "/Users/konstantinaa/code/scheme-lsp/stuff.json"))
(define gl (ghetto-logger 
            output
            'gl))

;(set! mt (thread-start! mt))
(set! gl (thread-start! gl))
;change this to ofc wait until shutdown message
(while #t
    ;(force-output output)
    (log (get-message) gl))