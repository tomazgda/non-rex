import asyncio
import websockets
import time

# recieves message from each socket and broadcasts it to all other sockets

# websocket_clients = set()

unity_conn = None

# create handler for each connection
async def handler(websocket, path):
    print("joined")

    # if socket is unity
    id = await websocket.recv();
    if (id == "Unity"):
        global unity_conn
        unity_conn = websocket
        while(True):
            time.sleep(1)
            print("listening...")
            # don't do anything
    else:
        while (True):
            data = await websocket.recv()
            unity_conn.send(data)
        
async def main():
    async with websockets.serve(handler, "0.0.0.0", 8081):
        await asyncio.Future()  # run forever
    
asyncio.run(main())
