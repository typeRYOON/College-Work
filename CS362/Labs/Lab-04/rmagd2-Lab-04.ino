/* rmagd2-Lab-04.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : rmagd2-Lab-04.ino :: Lab 4 - Photoresistor (LDR – Light Dependent Resistor)
 >> Author : Ryan Magdaleno
 >> UIN/nID: 668523658 (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 >> TA     : David Levit
 - -                             - -
 >> References used ::
 >> https://docs.wokwi.com/parts/wokwi-photoresistor-sensor
 - -                             - -
 >> File overview ::
 >> This program makes use of a 16x2 LCD along with a photoresistor. The photoresistor
 >> gets the light level and sends its analog output to the arduino to be displayed
 >> on the 16x2 with predefined light level messages. The 16x2 LCD will also be
 >> displaying the time in ms since the start of the program.
--------------------------------------------------------------------------------------- */
// Preprocessor directives ::
#include <LiquidCrystal.h>

// Global variables ::
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
byte prevLux, curLux;
String luxText[] = {
  "brightly lit    ",
  "fully lit       ",
  "medium          ",
  "partially dark  ",
  "dark            "
};
int ranges[][2] = {
  {501, 2000},
  {201, 500},
  {51, 200},
  {16, 50},
  {0, 15}
};


void setup()
{
  // Set up devices ::
  lcd.begin(16, 2);

  // Set inital values on lcd ::
  prevLux = getLuxIndex();
  lcd.print(luxText[prevLux]);
  lcd.setCursor(0, 1);
  lcd.print("                ");
  lcd.print(millis());
}


byte getLuxIndex()
{
  int lux = analogRead(A0);
  for (byte i = 0; i < 5; ++i) {
    if (lux >= ranges[i][0] && lux <= ranges[i][1]) {
        return i;
    }
  }
  return -1;
}


void loop()
{
  curLux = getLuxIndex();
  if (prevLux != curLux) {
    lcd.setCursor(0, 0);
    lcd.print(luxText[curLux]);
    prevLux = curLux;
  }
  lcd.print(millis());
  lcd.setCursor(0, 1);
}