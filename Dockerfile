FROM alpine:3.12.1

WORKDIR /project

RUN apk add --no-cache gcc-avr=9.2.0-r0
RUN apk add --no-cache binutils-avr=2.34-r0
RUN apk add --no-cache avr-libc=2.0.0-r3
RUN apk add --no-cache make=4.3-r0
