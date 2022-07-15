# WebSockets Server 

## Dependencies 
- make 
- a C99 compatible C compiler
## Building

From this directory clone the C library [wsServer](https://theldus.github.io/wsServer/).
```bash
git clone https://github.com/Theldus/wsServe
```
Make
```bash
cd wsServer 
make
```
Then compile (and run) *server.c*
``` bash
cd ..
gcc -I wsServer/include -std=c99 -pthread -pedantic test.c -o test wsServer/libws.a
./server 
```


