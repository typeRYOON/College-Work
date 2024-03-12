/* rmagd2Lab6.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois at Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File    :: rmagd2Lab6.ino :: Lab 6 - Computer I/O
 >> Course  :: CS 362 (47019), SP24
 >> Author  :: Ryan Magdaleno
 >> UIN/nID :: 668523658 (rmagd2)
 >> System  :: Windows 10 w/ Mingw-w64
 >> TA      :: Yousef
 - -                               - -
 >> References used ::
 >> https://www.pjrc.com/teensy/td_libs_Time.html
 - -                               - -
 >> File overview ::
 >> This program has a single 16x2 lcd, for this lab we take a 
 >> more software heavy approach. We want to prompt the user
 >> via serial monitor a date and time to change the lcd time/date to.
 >> Valid checks are in place and include leap years.
--------------------------------------------------------------------------------------- */
// Preprocessor Directives ::
#include <LiquidCrystal.h>
#include <TimeLib.h>

// Global Variables ::
LiquidCrystal lcd(12, 11, 10, 9, 8, 2);
int iMonth, iDay, iHour, iMin, iSec;
byte progress = 0;
char buffer[64];
int iYear;


/** setup :: - -                                                                       - -
Set up lcd and initial time settings.
    - -                                                                                 */
void setup()
{
  lcd.begin(16, 2);
  Serial.begin(9600);
  setTime(11, 11, 11, 30, 10, 2002);
  Serial.println("\n :: Enter a date in format MM/DD/YYYY HH:MM:SS.");
}


/** isDate :: - -                                                                      - -
Check if given date is valid and can be converted to the
a correct integer representation.
    - -                                                                                 */
bool isValid()
{
  if (strlen(buffer) != 19) { return false; }

  // Extract substrings ::
  char sYear[5], sMonth[3], sDay[3];
  strncpy(sMonth, buffer, 2);
  strncpy(sDay, buffer + 3, 2);
  strncpy(sYear, buffer + 6, 4);
  sMonth[2] = '\0';
  sYear[4]  = '\0';
  sDay[2]   = '\0';

  // Convert substrings to integers ::
  iMonth = atoi(sMonth), iYear = atoi(sYear), iDay = atoi(sDay);

// Check various date conditions : :
  if (iMonth < 1 || iMonth > 12 || iDay < 1 || iDay > 31 || iYear < 1000 || iYear > 9999) {
    return false;
  } else if ((iMonth == 4 || iMonth == 6 || iMonth == 9 || iMonth == 11) && iDay > 30) {
    return false;
  } else if (iMonth == 2) {
    if (leapYear() && iDay > 29) {
      return false;
    } else if (!leapYear() && iDay > 28) {
      return false;
    }
  }

  // Extract substrings ::
  char sHour[3], sMin[3], sSec[3];
  strncpy(sHour, buffer + 11, 2);
  strncpy(sMin, buffer + 14, 2);
  strncpy(sSec, buffer + 17, 2);
  sHour[2] = '\0';
  sMin[2] = '\0';
  sSec[2] = '\0';

  // Convert substrings to integers ::
  iHour = atoi(sHour), iMin = atoi(sMin), iSec = atoi(sSec);
  return (iHour >= 0 && iHour < 24 && iMin >= 0 && iMin < 60 && iSec >= 0 && iSec < 60);
}


/** displayTime :: - -                                                                 - -
Display underlying time to lcd screen.
    - -                                                                                 */
void displayTime()
{
  char top[16];
  char bot[16];

  sprintf(top, "%02d/%02d/%04d", month(), day(), year());
  sprintf(bot, "%02d:%02d:%02d", hour(), minute(), second());

  lcd.setCursor(0, 0);
  lcd.print(top);

  lcd.setCursor(0, 1);
  lcd.print(bot);
}


/** leapYear :: - -                                                                    - -
Leap year condition check.
    - -                                                                                 */
bool leapYear()
{
  return (!(iYear % 4) && iYear % 100) || !(iYear % 400);
}


/** loop :: - -                                                                        - -
Main Arduino program loop.
    - -                                                                                 */
void loop()
{
  displayTime();
  if (Serial.available())
  {
    for (int i = 0; i < 64; i++) { buffer[i] = '\0'; }
    Serial.readBytesUntil('\n', buffer, 64);

    switch (progress)
    {
      case 0:
        if (!isValid())
        {
          Serial.println(" :: Invalid date/time.");
          Serial.println("\n :: Enter a date in format MM/DD/YYYY HH:MM:SS.");
          return;
        }
        setTime(iHour, iMin, iSec, iDay, iMonth, iYear);
        Serial.println(" :: Please enter a date in format MM/DD/YYYY HH:MM:SS.");
        break;
    }
  }
}   //                                                                                  */
