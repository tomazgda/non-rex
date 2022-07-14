import asyncio
import websockets

# recieves message from each socket and broadcasts it to all other sockets

# websocket_clients = set()

# create handler for each connection
async def handler(websocket, path):
    # print("[Connection Recieved]", websocket)
    # websocket_clients.add(websocket)
    # await websocket.send("hello client") # line required to work 
    while(True):
        async for message in websocket:
            await websocket.send(message)
        # data = await websocket.recv()
        # print(data)
        # for c in websocket_clients:
        #     await c.send(data)

async def main():
    async with websockets.serve(handler, "0.0.0.0", 8081):
        await asyncio.Future()  # run forever
    
asyncio.run(main())
