# web-trex
*pronounced web-treks*

The whole loop.

That means: 
- [an elm web-app](./elm-web-app) with some controls.
- [a racket web server.](./racket-server)
- a unity project with the T-rex
- communication between the elm app and the racket server with web sockets.
- communication between the racket server and unity with web sockets

## what's done so far?
- the racket web server can talk to a running unity game on the web! :)
- the elm app can talk to the racket server
- the T-rex unity project can run on the web; on the pi.

## how will it work?
The web app controls the t-rex with the racket server acting as an intermediary. Unity WebGL doesn't have direct socket access but we can call JavaScript from C# - which, as mentioned, works. 

## web rex on pi
![rex](./rex-on-pi.png)


