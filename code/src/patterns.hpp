#ifndef _PATTERNS_HPP
#define _PATTERNS_HPP

#include <LiquidCrystal_PCF8574.h>
#include <Adafruit_NeoPixel.h>
#include "util.hpp"

void initMarquee(struct Config c);
void runMarquee(Adafruit_NeoPixel& pixels, struct Config c);
void initMarqueeIn(struct Config c);
void runMarqueeIn(Adafruit_NeoPixel& pixels, struct Config c);
void initMarqueeOut(struct Config c);
void runMarqueeOut(Adafruit_NeoPixel& pixels, struct Config c);
void initFire(struct Config c);
void runFire(Adafruit_NeoPixel& pixels, struct Config c);
void initSolid(struct Config c);
void runSolid(Adafruit_NeoPixel& pixels, struct Config c);
void initRaindrops(struct Config c);
void runRaindrops(Adafruit_NeoPixel& pixels, struct Config c);
#endif
