#ifndef UTIL_HPP
#define UTIL_HPP

enum Pattern: __UINT8_TYPE__
{
    FIRE,
    SOLID,
    MARQUEE,
    MARQUEE_OUT,
    MARQUEE_IN,
    RAINDROPS
}

struct Config{
    Pattern pattern;
    uint8_t color_rVal;
    uint8_t color_gVal;
    uint8_t color_bVal;
    uint8_t brightness;
}

#endif //UTIL_HPP