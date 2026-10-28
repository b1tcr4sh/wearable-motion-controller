#define LED_PIN     25           // Data pin number
#define NUM_LEDS    30          // Number of LEDs
#define LED_TYPE    WS2812B     // Your LED strip type
#define COLOR_ORDER GRB         // Color channel order

CRGB leds[NUM_LEDS];

void SetupLED() {
  FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS);
}

void SetAll(int red, int green, int blue, int brightness) {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB(red, green, blue);
  }
  FastLED.show();
}

void SetLed(int index, int red, int green, int blue, int brightness) {
  leds[index] = CRGB(red, green, blue);
  FastLED.show();
}

void Blackout() {
  for (int i = 0; i < NUM_LEDS; i++) {
      fill_solid(leds, NUM_LEDS, CRGB(0, 0, 0));
      FastLED.show();
  }
}

void SetState(const uint8_t* data, int len) {
  if (data == NULL || len == 0) {
      Serial.println("There was an error receiving data on /led/set/state");
      return;
    }

    int led = 0;
    for (int i = 0; i < len - 2; i += 3) { // do for every led
      uint8_t r = *(data + i); // get first value in 3 byte chunk
      uint8_t g = *(data + i + 1); // 2nd
      uint8_t b = *(data + i + 2); // 3rd

      leds[led] = CRGB(r, g, b); // set LEDs buffer
      led++;
    }

    FastLED.show(); // then upate the strip
}