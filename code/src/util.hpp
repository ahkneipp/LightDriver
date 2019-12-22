#ifndef UTIL_HPP
#define UTIL_HPP

#include "stdint.h"
#include <string.h>

#define NUMPIXELS 90

#define MAX_PATTERN 5
enum Pattern:uint8_t
{
    FIRE = 0,
    SOLID = 1,
    MARQUEE = 2,
    MARQUEE_OUT = 3,
    MARQUEE_IN = 4,
    RAINDROPS = 5
};

#define NUM_COLORS 7

extern const char* COLOR_PRESETS[NUM_COLORS];

struct Color
{
    char* name;
    uint8_t color_rVal;
    uint8_t color_gVal;
    uint8_t color_bVal;
};

#define MAX_BRIGHTNESS 255;

struct Config{
    Pattern pattern;
    struct Color color;
    uint8_t brightness;
};

Pattern getNextPattern(Pattern currentPattern);
Pattern getPrevPattern(Pattern currentPattern);
const char* getPatternName(Pattern currentPattern);

struct Color getPresetColor(const char* name);
const char* getNextColorName(const char* name);
const char* getPrevColorName(const char* name);

#endif //UTIL_HPP
