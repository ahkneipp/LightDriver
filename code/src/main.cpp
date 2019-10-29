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

bool prevButtonValue;
bool currentButtonValue;
unsigned long int timeOfLastPrint = 0;
unsigned long int timeOfLastPress = 0;

void loop()
{
  currentButtonValue = digitalRead(ROTENC_BTN) == HIGH ? true : false;
  if(currentButtonValue && currentButtonValue != prevButtonValue)
  {
    Serial.println("BtnPressed");
    timeOfLastPress = millis();
  }
  prevButtonValue = currentButtonValue;

  if( (millis() - timeOfLastPress) > 5000)
  {
    //Serial.print("Encoder Pos:");
    //Serial.println(encPos);
    Serial.println();
    Serial.println("Cleared");
    Serial.println();
    timeOfLastPress = millis();
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