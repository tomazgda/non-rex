#lang racket

(module+ main
  (require net/rfc6455)

  (define port 8081)

  (ws-serve #:port port (lambda (c s) (ws-send! c "Hello world!")))

  )



