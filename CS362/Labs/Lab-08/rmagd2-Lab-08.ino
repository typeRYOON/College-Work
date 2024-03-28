/* rmagd2-Lab-08.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois at Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File    :: rmagd2-Lab-08.ino :: Lab 8 - Interrupts
 >> Course  :: CS 362 (47019), SP24
 >> Author  :: Ryan Magdaleno
 >> UIN/nID :: 668523658 (rmagd2)
 >> System  :: Windows 10 w/ Mingw-w64
 >> TA      :: David
 - -                               - -
 >> References used ::
 >> https://www.allaboutcircuits.com/technical-articles/using-interrupts-on-arduino/
 - -                               - -
 >> File overview ::
 >> This program showcases Arduino interrupts using pins 2 and 3.
--------------------------------------------------------------------------------------- */
// Preprocessor directives ::
#include <LiquidCrystal.h>

// Global Variables ::
LiquidCrystal lcd(12, 11, 10, 9, 8, 7);
const uint8_t bPin1 = 2, bPin2 = 3;
volatile bool state0 = true;
volatile uint32_t prevTime = 0;
uint32_t curTime, seconds = 0;

// Interrupt function for button 1 ::
void b1_ISR()
{
  lcd.clear();
  lcd.print("Interrupt!");
  lcd.setCursor(0, 1);
  lcd.print("Press button 2.");
  state0 = false;
}

// Interrupt function for button 2 ::
void b2_ISR()
{
  if (!state0)
  {
    lcd.clear();
    prevTime = millis();
    seconds = 0;
    lcd.clear();
    lcd.print("System running. ");
    lcd.setCursor(0, 1);
    lcd.print("Time: 0");
    state0 = true;
  }
}

// Set up pins and attach interrupts ::
void setup()
{
  pinMode(bPin1, INPUT);
  pinMode(bPin2, INPUT);

  attachInterrupt(digitalPinToInterrupt(bPin1), b1_ISR, FALLING);
  attachInterrupt(digitalPinToInterrupt(bPin2), b2_ISR, FALLING);

  lcd.begin(16, 2);
  lcd.println("System running. ");
  lcd.setCursor(0, 1);
  lcd.print("Time: 0");
}

// Constantly update second counter, every 1000ms ::
void loop()
{
  curTime = millis();
  if (curTime - prevTime < 1000) { return; }
  prevTime = curTime;
  seconds++;

  if (state0)
  {
    lcd.setCursor(0, 1);
    lcd.print("                ");
    lcd.setCursor(0, 1);
    lcd.print("Time: ");
    lcd.print(seconds);
  }
}