FROM ubuntu:20.04 as trexcontrol_base

RUN apt-get update; apt-get -y install racket
COPY . /webapp
WORKDIR /webapp/racket-server
EXPOSE 8081
CMD ["racket","main.rkt"]