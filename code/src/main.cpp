#include <Arduino.h>
#include <Wire.h>
#include <LCD.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

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

void setup()
{
  Serial.begin(9600);
  pinMode(ROTENC_BTN, INPUT);
  pinMode(ROTENC_A, INPUT);
  pinMode(ROTENC_B, INPUT);
  attachInterrupt(digitalPinToInterrupt(ROTENC_A), encALow_ISR, FALLING);
  attachInterrupt(digitalPinToInterrupt(ROTENC_B), encBLow_ISR, FALLING);
}

enum MenuState
{
  WELCOME,
  MENUITEM_SETUP,
  PATTERN,
  PATTERN_SELECT,
  COLOR,
  COLOR_SEL_PRESET,
  COLOR_SEL_RED,
  COLOR_SEL_GREEN,
  COLOR_SEL_BLUE,
  BRIGHTNESS,
  BRIGHTNESS_SELECT,
  PRESET,
  PRESET_SELECT,
  PRESET_SAVE,
  POWEROFF
};
MenuState currentState = WELCOME;
MenuState nextState = WELCOME;

bool prevButtonValue;
bool currentButtonValue;
unsigned long int timeOfLastPrint = 0;
unsigned long int timeOfLastPress = 0;

char* text = "Welcome";
int storedEncPos = 0;

void loop()
{
  currentButtonValue = digitalRead(ROTENC_BTN) == HIGH ? true : false;
  if(currentButtonValue && currentButtonValue != prevButtonValue)
  {
    Serial.println("BtnPressed");
    timeOfLastPress = millis();
  }
  prevButtonValue = currentButtonValue;

  if( (millis() - timeOfLastPress) > 500)
  {
    Serial.println();
    Serial.println(text);
    Serial.println();
    timeOfLastPress = millis();
  }
}

void runStateMachine()
{
  switch(currentState)
  {
    case WELCOME:
      text = "Welcome!";
      if(millis() > 5000)
      {
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
      break;
    case MENUITEM_SETUP:
      storedEncPos = encPos;
      currentState = nextState;
      break;
    case PATTERN:
      text = "Select Pattern";
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS;
      }
      break;
    case COLOR:
      text = "Select Color";
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = BRIGHTNESS;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
      break;
    case BRIGHTNESS:
      text = "Select Brightness";
      if(encPos > storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = PATTERN;
      }
      if(encPos < storedEncPos)
      {
        currentState = MENUITEM_SETUP;
        nextState = COLOR;
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