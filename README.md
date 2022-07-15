# web-trex
*pronounced web-treks*

The whole loop.

That means: 
- [The Web App](./client) with some controls to control the T-Rex.
- [The Web Sockets Server](./server) which forwards messages from all clients to unity.
- [The Unity Project](./unity) with the T-rex.

## What Am I Installing Where?

You are installing the Web App and the WebSockets server to the VM and the Unity Project to the Pi.

## Reproducing

### Azure
#### Setup
Spin up a VM.

Currently port 8000 is used for the Web App, and 9010 is used for the WebSockets server, so these must be configured in the azure portal:

Settings->Networking->Add inbound port rule(do for each port)->

...then specify the port and set protocol to Any.

It may be the case that your network blocks the IP of the VM so you may have to request that it is unblocked.

Clone this Repo.
```bash
git clone https://github.com/tomazgda/web-trex.git
```
#### Web App
Install python then:
```bash
python3 -m http.server 8000 --directory [PATH_TO/index.html]
```
#### WebSockets Server
Follow instructions [here](./server).

### Pi
Follow instructions [here](./unity).

## Image of T-Rex on WebGL
![rex](./rex-on-pi.png)


