FROM ubuntu:24.04

RUN apt update && apt install fp-compiler -y
WORKDIR /app
COPY *.pas .
RUN bash -c "fpc zadanie1.pas"
CMD ["./zadanie1"]