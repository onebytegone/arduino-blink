FROM alpine:3.12.1

WORKDIR /project

RUN apk add --no-cache gcc-avr=9.2.0-r0
RUN apk add --no-cache binutils-avr=2.34-r0
RUN apk add --no-cache avr-libc=2.0.0-r3
RUN apk add --no-cache make=4.3-r0
RUN apk add --no-cache wget=1.20.3-r1
RUN cd /tmp \
   && wget "https://github.com/arduino/ArduinoCore-avr/archive/1.8.3.zip" -O arduino-avr.zip \
   && unzip arduino-avr.zip \
   && mv ArduinoCore-avr-1.8.3 /arduino-avr \
   && rm arduino-avr.zip
