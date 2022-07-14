# FROM racket/racket:8.5

# COPY . /webapp
# WORKDIR /webapp/server/racket-server

# EXPOSE 8081

# RUN raco pkg install --auto rfc6455

# CMD ["racket" "main.rkt"]

FROM gcc:latest

COPY . /webapp
WORKDIR /webapp/server

EXPOSE 8000

RUN git clone https://github.com/Theldus/wsServer; cd wsServer; make

RUN gcc -I wsServer/include -std=c99 -pthread -pedantic test.c -o test wsServer/libws.a

CMD ["python3","-m","http.server","&"]

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["./test"]


