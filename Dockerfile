FROM racket/racket:8.5

COPY . /webapp
WORKDIR /webapp/server/racket-server

EXPOSE 8081

RUN raco pkg install --auto rfc6455

CMD ["racket" "main.rkt"]
