#include <Arduino.h>

#define BLINK_DELAY_MS 1000

void setup() {
   pinMode(13, OUTPUT);
}

void loop() {
   digitalWrite(13, HIGH);

   delay(BLINK_DELAY_MS);

   digitalWrite(13, LOW);

   delay(BLINK_DELAY_MS);
}
