(define (ghetto-logger output-port name)
     (make-thread (lambda () (ghetto-logger-loop output-port)) name))

;; message format: ('method '(arglist))
(define (ghetto-logger-loop output-port)
     (let ((message (thread-receive)))
          (cond 
           ((equal? (car message) 'log) (log-backend (cdr message) output-port)))
          (ghetto-logger-loop output-port)))

;; API for logger, returns what you were trying to log for prettier code
;; composition with side effects, no one will see it coming
(define (log stuff logger-thread)
    (begin
     (thread-send logger-thread (cons 'log stuff))
     stuff))

(define (log-backend args output-port)
    (begin
     (write args output-port))
     (force-output output-port))