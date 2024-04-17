/* rmagd2-Lab-09.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois at Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File    :: rmagd2-Lab-09.ino :: Lab 9 - RGB LEDs
 >> Course  :: CS 362 (47019), SP24
 >> Author  :: Ryan Magdaleno
 >> UIN/nID :: 668523658 (rmagd2)
 >> System  :: Windows 10 w/ Mingw-w64
 >> TA      :: Absent.
 - -                               - -
 >> References used ::
 >> None
 - -                               - -
 >> File overview ::
 >> This program allows us to control an RGB Leds and 3 single leds.
--------------------------------------------------------------------------------------- */
// Global Variables ::
const uint8_t inPins[]     = { A0, A1, A2 };  // x, y, z
const uint8_t s_ledPins[]  = { 3, 5, 6    };  // r, g, b
const uint8_t r_ledPins[]  = { 9, 10, 11  };  // r, g, b
uint16_t sigRGB[]          = { 0, 0, 0    };  // r, g, b
uint32_t curTime, prevTime = 0;

void setup()
{
  for (uint8_t i = 0; i < 3; ++i)
  {
    pinMode(inPins[i],    INPUT );
    pinMode(s_ledPins[i], OUTPUT);
    pinMode(r_ledPins[i], OUTPUT);
  }
}

void loop()
{
  curTime = millis();
  if (curTime - prevTime < 15) { return; }

  // Read and map signal values to RGB values ::
  for (uint8_t i = 0; i < 3; ++i) {
    sigRGB[i] = map(analogRead(inPins[i]), 0x0, 0x3FF, 0x0, 0xFF);
  }

  // Write to LEDs ::
  for (uint8_t i = 0; i < 3; ++i)
  {
    analogWrite(s_ledPins[i], sigRGB[i]);
    analogWrite(r_ledPins[i], sigRGB[i]);
  }
  prevTime = curTime;
}