INCLUDE = -I wsServer/include
CFLAGS = $(INCLUDE) -std=c99 -pthread -pedantic
LIB = wsServer/libws.a

server: server.c $(LIB)
	gcc $(CFLAGS) server.c -o server $(LIB)
