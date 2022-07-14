#lang racket

;; when a message is recieved from the web app, the message is echoed to unity

(module+ main
  (require net/rfc6455)
  (define port 8081)
  (define unity-conn null)
  
  (command-line #:once-each
                ["--port" PORT "Set service port"
                          (set! port (string->number PORT))])

  ;; called by ws-serve which runs handler as a thread
  (define (connection-handler c s)
    (define id (gensym 'conn))
    (printf "~a: Connection received\n" id)

    ;; if the connection identifies itself as unity
    (cond
      ;; we are talking to unity
      [(equal? "Unity" (ws-recv c #:payload-type 'text))
       (set! unity-conn c)
       (let loop ()
         (sleep 0.1)
         (loop))
       ]

      ;; we are not talking to unity
      [else 
       (let loop ()
         (match (ws-recv c #:payload-type 'text)
           [(? eof-object?) (void)]
           [m (ws-send! unity-conn m)])
         (loop))])
    
    (printf "~a: Close status: ~v ~v\n"
            id
            (ws-conn-close-status c)
            (ws-conn-close-reason c))
    (ws-close! c)
    (printf "~a: Connection closed\n" id))
  
  (define stop-service (ws-serve #:port port connection-handler))
  (printf "Server running. Hit enter to stop service.\n")
  (void (read-line))
  (stop-service))
