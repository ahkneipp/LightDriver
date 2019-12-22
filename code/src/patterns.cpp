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

void runMarquee(Adafruit_NeoPixel& pixels, struct Config c)
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

static void flipLedSegment(int start, int end)
{
    int numLedsToFlip = end-start;
    struct RGB tmp[numLedsToFlip];
    for(int i = numLedsToFlip - 1; i >= 0; i--)
    {
        tmp[i] = leds[end-(i+1)];
    }
    for(int i = start; i < end; i++)
    {
        leds[i] = tmp[i-start];
    }
}

static void mirrorLeds(int dstStart, int srcStart, int srcEnd)
{
    int num = srcEnd - srcStart;
    //Copy the pattern to mirror into the destination leds
    for(int i = 0; i < num; i++)
    {
        leds[i+dstStart] = leds[i+srcStart];
    }
    //Flip the destination segment
    flipLedSegment(dstStart, dstStart+num);
}

void initMarqueeIn(struct Config c)
{
    initMarquee_gen(c, 0, NUMPIXELS);
}

void runMarqueeIn(Adafruit_NeoPixel& pixels, struct Config c)
{
    if(millis() - lastUpdateTimeMillis < 50)
    {
        return;
    }

    RGB lastPixel = leds[NUMPIXELS/2];
    for(int i = NUMPIXELS/2; i >= 0; i--)
    {
        leds[i] = leds[i-1];
    }
    leds[0] = lastPixel;
    mirrorLeds(NUMPIXELS/2, 0, NUMPIXELS/2);

    for(int i = 0; i < NUMPIXELS; i++)
    {
        pixels.setPixelColor(i, pixels.Color(leds[i].R, leds[i].G, leds[i].B));
    }
    pixels.setBrightness(c.brightness);
    pixels.show();
    lastUpdateTimeMillis = millis();
}

void initMarqueeOut(struct Config c)
{
    initMarquee_gen(c, 0, NUMPIXELS);
}

void runMarqueeOut(Adafruit_NeoPixel& pixels, struct Config c)
{
    if(millis() - lastUpdateTimeMillis < 50)
    {
        return;
    }

    RGB firstPixel = leds[0];
    for(int i = 0; i < (NUMPIXELS/2) - 1; i++)
    {
        leds[i] = leds[i+1];
    }
    leds[(NUMPIXELS/2)-1] = firstPixel;
    mirrorLeds(NUMPIXELS/2, 0, NUMPIXELS/2);

    for(int i = 0; i < NUMPIXELS; i++)
    {
        pixels.setPixelColor(i, pixels.Color(leds[i].R, leds[i].G, leds[i].B));
    }
    pixels.setBrightness(c.brightness);
    pixels.show();
    lastUpdateTimeMillis = millis();
}

static void setPixelHeatColor (int Pixel, byte temperature) {
  // Scale 'heat' down from 0-255 to 0-191
  byte t192 = round((temperature/255.0)*191);

  // calculate ramp up from
  byte heatramp = t192 & 0x3F; // 0..63
  heatramp <<= 2; // scale up to 0..252

  struct RGB tmp;
  // figure out which third of the spectrum we're in:
  if( t192 > 0x80) {                     // hottest
      tmp.R = 255;
      tmp.G = 255;
      tmp.B = heatramp;
  } else if( t192 > 0x40 ) {             // middle
      tmp.R = 255;
      tmp.G = heatramp;
      tmp.B = 0;
  } else {                               // coolest
      tmp.R = heatramp;
      tmp.G = 0;
      tmp.B = 0;
  }
  leds[Pixel] = tmp;
}

static void Fire(int Cooling, int Sparking) {
  static byte heat[NUMPIXELS];
  int cooldown;

  // Step 1.  Cool down every cell a little
  for( int i = 0; i < NUMPIXELS; i++) {
    cooldown = random(0, ((Cooling * 10) / NUMPIXELS) + 2);

    if(cooldown>heat[i]) {
      heat[i]=0;
    } else {
      heat[i]=heat[i]-cooldown;
    }
  }

  // Step 2.  Heat from each cell drifts 'up' and diffuses a little
  for( int k= NUMPIXELS - 1; k >= 2; k--) {
    heat[k] = (heat[k - 1] + heat[k - 2] + heat[k - 2]) / 3;
  }

  // Step 3.  Randomly ignite new 'sparks' near the bottom
  if( random(255) < Sparking ) {
    int y = random(7);
    heat[y] = heat[y] + random(160,255);
    //heat[y] = random(160,255);
  }

  // Step 4.  Convert heat to LED colors
  for( int j = 0; j < NUMPIXELS; j++) {
    setPixelHeatColor(j, heat[j] );
  }
}

void initFire(struct Config c)
{
    clearLeds();
    //We grabbed all the fire code from https://www.tweaking4all.com/hardware/arduino/adruino-led-strip-effects/
}

const static int FIRE_COOLING = 7;
const static int FIRE_SPARKING = 20;
const static int FIRE_TIME_DELAY = 30;

void runFire(Adafruit_NeoPixel& pixels, struct Config c)
{
    if(millis() - lastUpdateTimeMillis < FIRE_TIME_DELAY)
    {
        return;
    }
    Fire(FIRE_COOLING, FIRE_SPARKING);
    for(int i = 0; i < NUMPIXELS; i++)
    {
        pixels.setPixelColor(i, pixels.Color(leds[i].R, leds[i].G, leds[i].B));
    }
    pixels.setBrightness(c.brightness);
    pixels.show();
    lastUpdateTimeMillis = millis();
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
{
    clearLeds();
}
void runRaindrops(Adafruit_NeoPixel& pixels, struct Config c)
{

}
