    # ------------------------------------------------------------------- 
    # Dockerfile to create a Docker image that runs a C WebSockets server.
    # --------------------------------------------------------------------

    # docker image with some preconfigurations for gcc
FROM gcc:latest

    # copy the contents of the github repo
COPY . /webapp

WORKDIR /webapp/server

    # expose port 9010 in order to recieve web socket messages
EXPOSE 9010

    # download the C library for web sockets and make
RUN git clone https://github.com/Theldus/wsServer; cd wsServer; make

    # compile the c web server
RUN gcc -I wsServer/include -std=c99 -pthread -pedantic test.c -o test wsServer/libws.a

    # needed for docker to execute binary files
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
    # run web server
CMD ["./server"]


