# Elm Web App

A single page web app which connects to "ws://localhost:8081/". Button presses cause elm to call javascript functions to send messages to the server through web sockets.

[[./images/example.png]]

In order to compile elm to javascript run:
``` bash
elm make src/Main.elm --output="elm.js"
```
