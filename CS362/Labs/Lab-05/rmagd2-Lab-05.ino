/* rmagd2-Lab-05.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : rmagd2-Lab-05.ino :: Lab 5 - Multiple Inputs and Outputs
 >> Author : Ryan Magdaleno
 >> UIN/nID: 668523658 (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 >> TA     : Anshuman
 - -                             - -
 >> References used ::
 >> https://docs.arduino.cc/built-in-examples/digital/toneMelody/
 - -                             - -
 >> File overview   ::
 >> This program takes a photoresistor value and in five ranges, the 4 LEDs onboard will
 >> light up depending on the value. Onboard there is also a potentiometer that controls
 >> the buzzer via the pote's analog value. There are 7 ranges that play a buzzer for
 >> 1 second each (except range 0), then delay based on the range the potentiometer's
 >> analog value is in.
--------------------------------------------------------------------------------------- */
// Global variables ::
# define scale 146.15
# define C4 262
byte prevLux, curLux, prevBuzz, curBuzz;
byte potePin = A1, buzzPin = 8;
bool inBuzz = false;
unsigned long start, now, delta;
byte ledPins[]  = {12, 11, 10, 9};
int ranges[][2] = {
    {801, 2000},
    {601, 800},
    {401, 600},
    {201, 400},
    {0, 200}
};


// Set up start variables and pin modes ::
void setup()
{
    // Serial.begin(9600);
    start = millis();
    pinMode(potePin, INPUT) ;  // Potentiometer.
    pinMode(buzzPin, OUTPUT);  // Buzzer.
    for (const byte& pin : ledPins)    { pinMode(pin, OUTPUT); }
    prevLux  = getLuxIndex();
    prevBuzz = getBuzzIndex();
}


// Retrieve lux range array index ::
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


// Get Buzzer range (0-6) ::
byte getBuzzIndex() { return analogRead(potePin) / scale; }


// Main Arduino loop ::
void loop()
{
    // LED / photoresistor module ::
    curLux = getLuxIndex();
    if (prevLux != curLux)
    {
        prevLux = curLux;

        // Turn ON / OFF the correct # of LEDs ::
        for (byte i = 0; i < curLux; ++i) { digitalWrite(ledPins[i],     HIGH); }
        for (; curLux < 5; ++curLux)      { digitalWrite(ledPins[curLux], LOW); }
    }

     // Potentiometer / Buzzer module ::
    curBuzz = getBuzzIndex();
    now = millis();
    // Serial.println(curBuzz);

    if (prevBuzz != curBuzz)
    {
        prevBuzz = curBuzz;
        inBuzz = true;
        start = now;
        if (curBuzz) { tone(buzzPin, C4); }
    }

    // Buzz correct amount of time ::
    switch (curBuzz)
    {
        case 0:  // No Buzz ::
            noTone(buzzPin);
            break;

        case 6: // Constant Buzz ::
            tone(buzzPin, C4);
            break;

        default: // Depending on range (1-5) play correct interval ::
            // 1 second buzz check ::
            if (inBuzz && now - start >= 1000)
            {
                noTone(buzzPin);
                inBuzz = false;
                start = now;
            }
            // Correct delay interval check ::
            else if (!inBuzz && now - start >= (unsigned)(8000 >> (curBuzz - 1)))
            {
                tone(buzzPin, C4);
                inBuzz = true;
                start = now;
            }
    }
}