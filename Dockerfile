FROM gcc:latest

COPY . /webapp
WORKDIR /webapp/server

EXPOSE 9000

# RUN git clone https://github.com/Theldus/wsServer; cd wsServer; make

# RUN gcc -I wsServer/include -std=c99 -pthread -pedantic test.c -o test wsServer/libws.a

CMD ["python3","server.py"]

# ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
# CMD ["./test"]


