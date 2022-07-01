
; responsible for actually dispatching stuff based on messages received from the router.
; also responsible for sending the shutdown signal

(define (method-thread name)
    (make-thread method-loop name))

(define (method-loop)
    (begin 
     (thread-receive)
     (method-loop)))