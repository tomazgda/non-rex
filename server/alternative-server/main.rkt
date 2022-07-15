;;; -----------------------------------------------------------
;;; Racket WebSockets Server.
;;; -----------------------------------------------------------

#lang racket                            

(module+ main
  ;; require library for web sockets
  (require net/rfc6455)
  (define port 9010)                   
  (define unity-conn null)

  ;; command line functionally to change port
  (command-line #:once-each
                ["--port" PORT "Set service port"
                          (set! port (string->number PORT))])
  
  ;; called by ws-serve which runs handler as a thread
  (define (connection-handler c s)
    (define id (gensym 'conn))
    (printf "~a: Connection received\n" id)

    ;; check if the connection identifies itself as unity
    (cond
      [(equal? "Unity" (ws-recv c #:payload-type 'text))
       ;; we are talking to unity
       (set! unity-conn c)              ; mutate global variable containing the connection to the unity socket

       ;; loop forever so the socket doesn't close -- probably bad practice
       (let loop ()
         (sleep 0.1)
         (loop))
       ]

      ;; we are not talking to unity
      [else 
       (let loop ()
         ;; forward recieved messages to the unity socket
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
