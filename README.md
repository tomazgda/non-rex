# web-trex
*pronounced web-treks*

The whole loop.

That means: 
- [an elm web-app](./elm-web-app) with some controls.
- [a racket web server.](./racket-server)
- a unity project with the trex
- communication between the elm app and the racket server with web sockets.
- communication between the racket server and unity with web sockets

## what's done so far
- the racket web server can talk to a running unity game on the web! :)
- the elm app can talk to the racket server

## todo
- the full loop whereby the app controls the t-rex with the racket server acting as an intermediary.

## dependencies 
- elm 
- racket
- the racket library rfc6455.
``` bash
raco pkg install rfc6455
```
