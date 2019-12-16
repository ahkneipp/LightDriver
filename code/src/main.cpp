#include <Arduino.h>
#include "util.hpp"
#include <Adafruit_NeoPixel.h>
#include <LiquidCrystal_PCF8574.h>
#include <Wire.h>

#define NUMPIXELS 12
#define NEOPIXEL_PIN 6

LiquidCrystal_PCF8574 lcd(0x27);
Adafruit_NeoPixel pxl(NUMPIXELS, NEOPIXEL_PIN, NEO_GRB + NEO_KHZ800);

#define ROTENC_BTN        4
#define ROTENC_A          2
#define ROTENC_B          3

volatile bool aTriggered = false;
volatile bool bTriggered = false;
//Positive is CW, negative CCW
volatile int encPos = 0;

const int debounceConst = 50;

void encALow_ISR();
void encBLow_ISR();
void runLedFromConfig(struct Config c);
void printStringToLCD(LiquidCrystal_I2C* lcd, char* str);

void setup()
{
  int error;

  Serial.begin(115200);
  Serial.println("LCD...");

  Serial.println("Dose: check for LCD");

  // See http://playground.arduino.cc/Main/I2cScanner how to test for a I2C device.
  Wire.begin();
  Wire.beginTransmission(0x27);
  error = Wire.endTransmission();
  Serial.print("Error: ");
  Serial.print(error);

  if (error == 0) {
    Serial.println(": LCD found.");
    lcd.begin(16, 2); // initialize the lcd

  } else {
    Serial.println(": LCD not found.");
  } // if

  pxl.begin();
  lcd.begin(16,2);
  //Setup the rotary encoder pins
  pinMode(ROTENC_BTN, INPUT);
  pinMode(ROTENC_A, INPUT);
  pinMode(ROTENC_B, INPUT);
  //Setup the rotary encoder interrupts for counting the ticks
  attachInterrupt(digitalPinToInterrupt(ROTENC_A), encALow_ISR, FALLING);
  attachInterrupt(digitalPinToInterrupt(ROTENC_B), encBLow_ISR, FALLING);

  //Set up the neopixel strip by turning everything off
  pxl.show();
  lcd.home ();                   // go home
  lcd.print("Hello, ARDUINO ");
  lcd.setCursor ( 0, 1 );        // go to the next line
  lcd.print (" WORLD!");
  Serial.println("Sanity Check");
}

enum MenuState
{
  //Power up welcome screen
  WELCOME,
  /**
   * Setup state to record the current state of the rotary encoder so we know when and where to move in the menus.
   * Requires nextState to be set so it knows where to move next.
   */
  MENUITEM_SETUP,
  /**
   * Menu item to display the current LED pattern and allows the user to go to the select state.
   */
  PATTERN,
  /**
   * Allows the user to select which pattern they want active
   */
  PATTERN_SELECT,
  /**
   * Shows the current color and allows the user to change to another color
   */
  COLOR,
  /**
   * Allows the user to select a preset color
   */
  COLOR_SEL_PRESET,
  /**
   * Allows the user to set the red value for the current color
   */
  COLOR_SEL_RED,
  /**
   * Allows the user to set the green value for the current color.
   */
  COLOR_SEL_GREEN,
  /**
   * Allows the user to set the blue value for the current color.
   */
  COLOR_SEL_BLUE,
  /**
   * Shows the current brightness and allows the user to adjust it
   */
  BRIGHTNESS,
  /**
   * Allows the user to set the current brightness
   */
  BRIGHTNESS_SELECT,
  /**
   * Allows the user to change to another or save a preset value
   */
  PRESET,
  /**
   * Allows the user to select a preset to load
   */
  PRESET_SELECT,
  PRESET_CHOOSE,
  /**
   * Allows the user to save the current state to a preset
   */
  PRESET_SAVE,
  PRESET_SAVE_CHOOSE,
  /**
   * Saves the current state, shuts everything down, and waits for a human input to wake up again
   */
  POWEROFF,
  WAIT_IN_SHUTDOWN
};

MenuState currentState = WELCOME;
MenuState nextState = WELCOME;

bool prevButtonValue;
bool currentButtonValue;
bool buttonPressed = false;
unsigned long int timeOfLastPrint = 0;
unsigned long int timeOfLastPress = 0;

char* text = "Welcome";
int storedEncPos = 0;

//TODO initialize this from shutdown EEPROM in WELCOME state
Config conf =
{
    FIRE,
    {
        (char*) "default",
        128, 20, 100
    },
    255
};

void loop()
{
  currentButtonValue = digitalRead(ROTENC_BTN) == HIGH ? true : false;
  if(currentButtonValue && currentButtonValue != prevButtonValue)
  {
    buttonPressed = true;
    timeOfLastPress = millis();
      lcd.home ();                   // go home
      lcd.print("Hello, ARDUINO ");
      lcd.setCursor ( 0, 1 );        // go to the next line
      lcd.print (" WORLD!");
  }
  prevButtonValue = currentButtonValue;
  runLedFromConfig(conf);

  if( (millis() - timeOfLastPress) > 500)
  {
    timeOfLastPress = millis();
  }
}

const int STARTUP_TIME = 5000;
const int NUM_PRESETS = 10;
int presetChoice = 0;

void runLedFromConfig(struct Config c)
{
    //TODO pattern
    for(int i = 0; i < NUMPIXELS; i++)
    {
        pxl.setPixelColor(i, pxl.Color(c.color.color_rVal, c.color.color_gVal, c.color.color_bVal));
    }
    pxl.setBrightness(c.brightness);
    pxl.show();
}

void printStringToLCD(LiquidCrystal_I2C* lcd, char* str)
{
    //lcd->clear();
    lcd->home();
    int len = strlen(str);
    lcd->print(str);
    for(int i = 0; i < len; i++)
    {
    }
}

void runStateMachine()
{
  switch(currentState)
  {
    case WELCOME:
      //TODO make sure the LEDs and the LCD are turned on
      text = "Welcome!";
      if(millis() > STARTUP_TIME)
      {
        currentState = MENUITEM_SETUP;
        nextState = PRESET;
      }
    break;
    case MENUITEM_SETUP:
      storedEncPos = encPos;
      currentState = nextState;
    break;
    case PRESET:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = PRESET_SELECT;
      }
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS;
      }
    break;
    case PRESET_SELECT:
      if(buttonPressed)
      {
        buttonPressed = false;
        presetChoice = 0;
        currentState = MENUITEM_SETUP;
        nextState = PRESET_CHOOSE;
      }
      if(encPos != storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PRESET_SAVE;
      }
    break;
    case PRESET_CHOOSE:
      if(buttonPressed)
      {
        buttonPressed = false;
        //TODO load the preset from EEPROM
        currentState = MENUITEM_SETUP;
        nextState = PRESET;
      }
      if(encPos > storedEncPos)
      {
        presetChoice = (presetChoice + 1) % NUM_PRESETS;
        storedEncPos = encPos;
      }
      else if (encPos < storedEncPos)
      {
        presetChoice = (presetChoice - 1) % NUM_PRESETS;
        storedEncPos = encPos;
      }
    break;
    case PRESET_SAVE:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = PRESET_SAVE_CHOOSE;
        presetChoice = 0;
      }
      if(encPos != storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PRESET_SELECT;
      }
    break;
    case PRESET_SAVE_CHOOSE:
      if(buttonPressed)
      {
        buttonPressed = false;
        //TODO save the current configuration to EEPROM
        currentState = MENUITEM_SETUP;
        nextState = PRESET;
      }
      if(encPos > storedEncPos)
      {
        presetChoice = (presetChoice + 1) % NUM_PRESETS;
        storedEncPos = encPos;
      }
      else if (encPos < storedEncPos)
      {
        presetChoice = (presetChoice - 1) % NUM_PRESETS;
        storedEncPos = encPos;
      }
    break;
    case PATTERN:
      text = "Select Pattern";
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = PATTERN_SELECT;
      }
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PRESET;
      }
    break;
    case PATTERN_SELECT:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
      if(encPos > storedEncPos)
      {
        conf.pattern = getNextPattern(conf.pattern);
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.pattern = getPrevPattern(conf.pattern);
        storedEncPos = encPos;
      }
    break;
    case COLOR:
      text = "Select Color";
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        if(conf.color.name == NULL)
        {
          nextState = COLOR_SEL_RED;
        }
        else
        {
          nextState = COLOR_SEL_PRESET;
        }
      }
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = POWEROFF;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
    break;
    case COLOR_SEL_PRESET:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
      }
      if(encPos > storedEncPos)
      {
        conf.color = getPresetColor(getNextColorName(conf.color.name));
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.color = getPresetColor(getPrevColorName(conf.color.name));
        storedEncPos = encPos;
      }
    break;
    case COLOR_SEL_RED:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = COLOR_SEL_GREEN;
      }
      if(encPos > storedEncPos)
      {
        conf.color.color_rVal++;
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.color.color_rVal--;
        storedEncPos = encPos;
      }
    break;
    case COLOR_SEL_GREEN:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = COLOR_SEL_BLUE;
      }
      if(encPos > storedEncPos)
      {
        conf.color.color_gVal++;
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.color.color_gVal--;
        storedEncPos = encPos;
      }
    break;
    case COLOR_SEL_BLUE:
      if(buttonPressed)
      {
        buttonPressed = false;
        conf.color.name = NULL;
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
      }
      if(encPos > storedEncPos)
      {
        conf.color.color_bVal++;
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.color.color_bVal--;
        storedEncPos = encPos;
      }
    break;
    case POWEROFF:
      if(buttonPressed)
      {
        buttonPressed = false;
        //TODO shut down the lights, store the current config, shut down the display
        currentState = MENUITEM_SETUP;
        nextState = WAIT_IN_SHUTDOWN;
      }
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
      }
    break;
    case BRIGHTNESS:
      text = "Brightness";
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS_SELECT;
      }
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PRESET;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = POWEROFF;
      }
    break;
    case BRIGHTNESS_SELECT:
      if(buttonPressed)
      {
        buttonPressed = false;
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS;
      }
      if(encPos > storedEncPos)
      {
        conf.brightness++;
        storedEncPos = encPos;
      }
      if(encPos < storedEncPos)
      {
        conf.brightness--;
        storedEncPos = encPos;
      }
    break;
    case WAIT_IN_SHUTDOWN:
      //On any human interaction, zero everything and go back to start
      if(encPos != storedEncPos || buttonPressed)
      {
        encPos = 0;
        storedEncPos = 0;
        buttonPressed = false;
        currentState = WELCOME;
      }
    break;
  }

}

void encALow_ISR()
{
  aTriggered = true;
  if(bTriggered)
  {
    encPos--;
    aTriggered = false;
    bTriggered = false;
  }
}

void encBLow_ISR()
{
  bTriggered = true;
  if(aTriggered)
  {
    encPos++;
    aTriggered = false;
    bTriggered = false;
  }
}
