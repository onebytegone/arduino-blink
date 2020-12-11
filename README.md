# Arduino Blink

This is an experiment in using Docker, make, avr-gcc, and avrdude to standardize the
process for building and uploading code to an Arduino.

Note: While it would be ideal for avrdude to also be installed on and run from the Docker
container, macOS and Windows do not readily support binding a USB device on the host
machine to a Docker container. Thus, it is currently necessary for avrdude to be installed
on the host.

## Setup

   1. Install Docker
   1. Install avrdude
      * e.g. `brew install avrdude`
   1. `git clone git@github.com:onebytegone/arduino-blink.git`
   1. `cd arduino-blink`
   1. `docker build --rm -t onebytegone/arduino-blink .`

## Usage

To build the code, run:

```bash
./bin/build.sh
```

To list the ports that your device might be attached to:

```bash
ls /dev/tty.*
```

To upload the built code to your device, run:

```bash
./bin/flash.sh /dev/tty.usbmodem123
```

## Tested on

   * Arduino Uno

## License

This software is released under the MIT license. See [the license file](LICENSE) for more
details.
