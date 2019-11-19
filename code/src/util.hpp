#ifndef UTIL_HPP
#define UTIL_HPP

#include "stdint.h"

enum Pattern:uint8_t 
{
    FIRE,
    SOLID,
    MARQUEE,
    MARQUEE_OUT,
    MARQUEE_IN,
    RAINDROPS
};

extern const char* COLOR_PRESETS[6];

struct Color
{
    char* name;
    uint8_t color_rVal;
    uint8_t color_gVal;
    uint8_t color_bVal;
};

struct Config{
    Pattern pattern;
    struct Color color;
    uint8_t brightness;
};

Pattern getNextPattern(Pattern currentPattern);
Pattern getPrevPattern(Pattern currentPattern);

struct Color getPresetColor(const char* name);
const char* getNextColorName(const char* name);
const char* getPrevColorName(const char* name);

#endif //UTIL_HPP