/* rmagd2-Lab-01.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : rmagd2-Lab-01.ino :: Lab 1 - Three Blinking Lights
 >> Course : CS 362 (47019), SP24
 >> Author : Ryan Magdaleno
 >> UIN/nID: 668523658 (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 >> TA     : Yousef
 - -                             - -
 >> References used:
 >> https://docs.arduino.cc/built-in-examples/digital/BlinkWithoutDelay/
 - -                             - -
 >> File overview:
 >> This code is to be run on an Arduino device. Three LEDs are to be set to digital
 >> pins 11, 12, and 13. The code will turn on each LED in sequence. This was my first
 >> experience working on a hardware project, it was quite fun. I made use of a bit
 >> queue to handle the alternating LED states.
--------------------------------------------------------------------------------------- */
// Global variables:
unsigned long timeNow, startTime;
short pinQueue = 0x6, frontPin = 0x2;  // 0b 00 0110
const byte pins[] = {11, 12, 13};
const short period = 1000;


void setup()
{   // Set correct digital pins to OUTPUT mode:
    for (const byte& pin : pins) { pinMode(pin, OUTPUT); }
    startTime = millis();
}


void loop()
{
    timeNow = millis();
    if (timeNow - startTime < period) { return; }

    // Reset previous pin to LOW voltage:
    digitalWrite(pins[frontPin], LOW);

    // "Pop" front index from bit pinQueue:
    frontPin = pinQueue & 0x3;
    pinQueue = pinQueue >> 2 | frontPin << 4;

    // Set next pin to HIGH voltage:
    digitalWrite(pins[frontPin], HIGH);

    // New start time:
    startTime = timeNow;
}
