#include "util.hpp"

const char* COLOR_PRESETS[NUM_COLORS]= {
    "Blue",
    "Red",
    "Green",
    "Orange",
    "Yellow",
    "Purple",
    "White"
};

static const Color COLOR_PRESET_STRUCTS[NUM_COLORS] = {
    {COLOR_PRESETS[0], 0, 0, 255},
    {COLOR_PRESETS[1], 255, 0, 0},
    {COLOR_PRESETS[2], 0, 255, 0},
    {COLOR_PRESETS[3], 255, 125, 0},
    {COLOR_PRESETS[4], 242, 240, 0},
    {COLOR_PRESETS[5], 186, 3, 252},
    {COLOR_PRESETS[6], 255, 255, 255}
};

Pattern getNextPattern(Pattern currentPattern)
{
    return (currentPattern + 1) % (MAX_PATTERN + 1);
}
Pattern getPrevPattern(Pattern currentPattern)
{
    if( (uint8_t) currentPattern == 0)
        return MAX_PATTERN;
    else
        return (uint8_t)currentPattern - 1;
}

const char* getPatternName(Pattern currentPattern)
{
    switch(currentPattern)
    {
        case FIRE:
            return "Fire";
        case SOLID:
            return "Solid";
        case MARQUEE:
            return "Marquee";
        case MARQUEE_OUT:
            return "Marquee Out";
        case MARQUEE_IN:
            return "Marquee In";
        case RAINDROPS:
            return "Water";
        default:
            return "Unknown";
    }
}

struct Color getPresetColor(const char* name)
{
    for(int i = 0; i < sizeof(COLOR_PRESETS)/sizeof(char*); i++)
    {
        if(strcmp(name, COLOR_PRESETS[i]) == 0)
        {
            return COLOR_PRESET_STRUCTS[i];
        }
    }
    return COLOR_PRESET_STRUCTS[0];
}

const char* getNextColorName(const char* name)
{
    int index = 0;
    for(int i = 0; i < sizeof(COLOR_PRESETS)/sizeof(char*); i++)
    {
        if(strcmp(name, COLOR_PRESETS[i]) == 0)
        {
            index = i;
        }
    }
    return COLOR_PRESETS[(index + 1)%(sizeof(COLOR_PRESETS)/sizeof(char*))];
}

const char* getPrevColorName(const char* name)
{
    int index = 0;
    for(int i = 0; i < sizeof(COLOR_PRESETS)/sizeof(char*); i++)
    {
        if(strcmp(name, COLOR_PRESETS[i]) == 0)
        {
            index = i;
        }
    }
    if(index == 0)
        return COLOR_PRESETS[NUM_COLORS-1];
    return COLOR_PRESETS[index - 1];
}
