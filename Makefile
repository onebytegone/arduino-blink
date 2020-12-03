PROJECT_NAME = blink
PROJECT_OUTPUT_FILE = src/$(PROJECT_NAME).hex
SRC_C = src/$(PROJECT_NAME).c

DEVICE = atmega328p
CPU_FREQ = 16000000 # in Hz

INCLUDE_DIRECTORIES = ./src

SRC_C += $(wildcard $(ARDUINO_CORE_DIR)/*.c)

OBJECT_FILES = $(SRC_C:.c=.c.o)

build: $(PROJECT_OUTPUT_FILE) reportsize

reportsize:
	avr-size -A $(PROJECT_OUTPUT_FILE)

%.c.o: %.c
	avr-gcc -c -g -Os -Wall -mmcu=$(DEVICE) -DF_CPU=$(CPU_FREQ) $(patsubst %,-I%,$(INCLUDE_DIRECTORIES)) $< -o $@

.SECONDARY: src/$(PROJECT_NAME).elf
.PRECIOUS: $(OBJECT_FILES)
%.elf: $(OBJECT_FILES)
	avr-gcc -g -Os -Wall -mmcu=atmega328p $(patsubst %,-I%,$(INCLUDE_DIRECTORIES)) $(OBJECT_FILES) -o $@ -lm

%.hex: %.elf
	avr-objcopy -O ihex -R .eeprom $< $@

clean:
	rm -f $(PROJECT_OUTPUT_FILE)
	rm -f src/$(PROJECT_NAME).elf
	rm -f $(OBJECT_FILES)
