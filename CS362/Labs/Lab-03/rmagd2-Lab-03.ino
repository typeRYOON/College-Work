/* rmagd2-Lab-03.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : rmagd2-Lab-03.ino :: Lab 3 - Liquid Crystal Display – LCD
 >> Course : CS 362 (47019), SP24
 >> Author : Ryan Magdaleno
 >> UIN/nID: 668523658 (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 >> TA     : Anshuman
 - -                             - -
 >> References used ::
 >> https://www.arduino.cc/reference/en/libraries/liquidcrystal/
 - -                             - -
 >> File overview ::
 >> This program controls a 16x2 LCD. I make use of the LiquidCrystal library handling
 >> of the LCD. I have a quote that gets printed, the LCD will scroll the quote to
 >> show the full quote.
--------------------------------------------------------------------------------------- */
// Preprocessor directives ::
#include <LiquidCrystal.h>

// Global variables ::
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
char temp;
char name[16],
quote[] = {
"   Just according to keikaku.    \
(Translator's note: keikaku means plan)     "
};


// Set up LCD and print name on bottom ::
void setup()
{
  lcd.begin(16, 2);
  lcd.setCursor(0, 1);
  sprintf(name, "      %s      ", "Ryan");
  lcd.println(name);
}


// Print message to top row ::
void loop()
{
  // Shift array left one char ::
  temp = quote[0];
  for (byte i = 0; i < 76; ++i) { quote[i] = quote[i + 1]; }
  quote[76] = temp;

  // Print first 16 chars ::
  lcd.setCursor(0, 0);
  for (byte i = 0; i < 16; ++i) { lcd.print(quote[i]); }
  delay(500);
}