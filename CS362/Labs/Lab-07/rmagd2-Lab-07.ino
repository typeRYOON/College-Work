/* rmagd2-Lab-07.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois at Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File    :: rmagd2-Lab-07.ino :: Lab 7 - Communication between Arduinos
 >> Course  :: CS 362 (47019), SP24
 >> Author  :: Ryan Magdaleno, John Ezra See
 >> UIN/nID :: 668523658 (rmagd2), 668942698 (jsee4)
 >> System  :: Windows 10 w/ Mingw-w64
 >> TA      :: Jon
 >> Date Demonstrated :: 03/11/2024
 - -                               - -
 >> References used ::
 >> Nothing
 - -                               - -
 >> File overview ::
 >> This program communicates button presses to leds on different boards via
 >> serial connection.
--------------------------------------------------------------------------------------- */
// Global Variables ::
bool bState = false, lastBState = false;
bool ledState = false;

// Set up pins ::
void setup()
{
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(3, OUTPUT);
  digitalWrite(3, LOW);
}

// Constant button check ::
void loop()
{
  bool curBState = digitalRead(2);
  
  // Debounce button ::
  if (curBState != lastBState)
  {
    delay(10);
    if (digitalRead(2) == curBState) {
      lastBState = curBState;
      // Only change LED state on press:
      if (curBState) {
        ledState = !ledState;
        Serial.print(ledState);
      }
    }
  }

  // Serial input from other board ::
  if (Serial.available()) {
    digitalWrite(3, (Serial.read() == '1' ? HIGH : LOW));
  }
}