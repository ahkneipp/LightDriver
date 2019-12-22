#include "patterns.hpp"


struct RGB {
    uint8_t R;
    uint8_t G;
    uint8_t B;
};

static struct RGB leds[NUMPIXELS];

static void clearLeds()
{
    struct RGB tmpColor;
    for(int i = 0; i < NUMPIXELS; i++)
    {
        tmpColor.R = 0;
        tmpColor.G = 0;
        tmpColor.B = 0;
        leds[i] = tmpColor;
    }
}
static long unsigned int lastUpdateTimeMillis = 0;

static void initMarquee_gen(struct Config c, int startPxl, int end)
{
    clearLeds();
    struct RGB tmpColor;
    if (startPxl < end)
    {
        for(int i = startPxl; i < end; i++)
        {
            if((i-startPxl) % 6 == 0 || (i-startPxl) % 6 == 1)
            {
                tmpColor.R = c.color.color_rVal;
                tmpColor.G = c.color.color_gVal;
                tmpColor.B = c.color.color_bVal;
            }
            else
            {
                tmpColor.R = 0;
                tmpColor.G = 0;
                tmpColor.B = 0;
            }
            leds[i] = tmpColor;
        }
    }
    else
    {
        for(int i = startPxl; i > end; i--)
        {
            if((i-startPxl) % 6 == 0 || (i-startPxl) % 6 == 1)
            {
                tmpColor.R = c.color.color_rVal;
                tmpColor.G = c.color.color_gVal;
                tmpColor.B = c.color.color_bVal;
            }
            else
            {
                tmpColor.R = 0;
                tmpColor.G = 0;
                tmpColor.B = 0;
            }
            leds[i] = tmpColor;
        }
    }
    lastUpdateTimeMillis = millis();
}

void initMarquee(struct Config c)
{
    initMarquee_gen(c, 0, NUMPIXELS);
}

static void runMarquee_gen(Adafruit_NeoPixel& pixels, struct Config c, int startPxl, int end)
{
    if(millis() - lastUpdateTimeMillis < 50)
    {
        return;
    }

    RGB lastPixel = leds[NUMPIXELS-1];
    for(int i = NUMPIXELS-1; i > 0; i--)
    {
        leds[i] = leds[i-1];
    }
    leds[0] = lastPixel;
    // struct RGB tmp;
    // tmp.R = 255;
    // tmp.G = 255;
    // tmp.B = 255;
    // leds[0] = tmp;
    for(int i = 0; i < NUMPIXELS; i++)
    {
        pixels.setPixelColor(i, pixels.Color(leds[i].R, leds[i].G, leds[i].B));
    }
    pixels.setBrightness(c.brightness);
    pixels.show();
    lastUpdateTimeMillis = millis();
}

void runMarquee(Adafruit_NeoPixel& pixels, struct Config c)
{
    runMarquee_gen(pixels, c, 0, NUMPIXELS);
}

void initMarqueeIn(struct Config c)
{
    initMarquee_gen(c, 0, NUMPIXELS/2);
    initMarquee_gen(c, NUMPIXELS-1, NUMPIXELS/2);
}

void runMarqueeIn(Adafruit_NeoPixel& pixels, struct Config c)
{

}

void initMarqueeOut(struct Config c)
{}
void runMarqueeOut(Adafruit_NeoPixel& pixels, struct Config c)
{

}

void initFire(struct Config c)
{}
void runFire(Adafruit_NeoPixel& pixels, struct Config c)
{

}

void initSolid(struct Config c)
{
    clearLeds();

    struct RGB tmpColor;
    for(int i = 0; i < NUMPIXELS; i++)
    {
        tmpColor.R = c.color.color_rVal;
        tmpColor.G = c.color.color_gVal;
        tmpColor.B = c.color.color_bVal;
        leds[i] = tmpColor;
    }
    lastUpdateTimeMillis = millis()-1000;
}
void runSolid(Adafruit_NeoPixel& pixels, struct Config c)
{
    if(millis() - lastUpdateTimeMillis < 1000)
    {
        return;
    }
    for(int i = 0; i < NUMPIXELS; i++)
    {
        pixels.setPixelColor(i, pixels.Color(leds[i].R, leds[i].G, leds[i].B));
    }
    pixels.setBrightness(c.brightness);
    pixels.show();
    lastUpdateTimeMillis = millis();
}

void initRaindrops(struct Config c)
{}
void runRaindrops(Adafruit_NeoPixel& pixels, struct Config c)
{

}
