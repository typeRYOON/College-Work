/* rmagd2-Lab-02.ino */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Patrick Troy.
 >> University of Illinois Chicago - CS 362, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : rmagd2-Lab-02.ino :: Lab 2 - Three Bit Counter
 >> Course : CS 362 (47019), SP24
 >> Author : Ryan Magdaleno
 >> UIN/nID: 668523658 (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 >> TA     : Yousef
 - -                             - -
 >> No References used ::
 - -                             - -
 >> File overview ::
 >> This program controls 3 LEDs and a switch. If the increment button (left) is 
 >> pressed, then the internal binary number increments by 1. Same occurs with the
 >> decrement switch. Everytime the switch state/binary number is changed, the LEDs
 >> get the new internal binary number to. The switch being held down will not change
 >> the binary number. This program handles debouncing by only checking the state
 >> of the switches every 20ms.
--------------------------------------------------------------------------------------- */
// Global variables ::
const byte ledPins[] = {10, 9, 8}, switchPins[] = {12, 11};
unsigned long lastTime = millis(), curTime;
byte curState = 0, lastState = 0, bNum = 0;
const byte debounceDelay = 20;


// Set correct digital pins to OUTPUT/INPUT mode ::
void setup()
{
    for (const byte& pin : switchPins) { pinMode(pin, INPUT ); }
    for (const byte& pin : ledPins)    { pinMode(pin, OUTPUT); }
}


// Main Arduino loop ::
void loop()
{
    // Only check state every 20ms, avoids switch bouncing ::
    curTime = millis();
    if   (curTime - lastTime < debounceDelay) { return; }
    else { lastTime = curTime, lastState = curState; }

    // Retrieve current state or reset to 0 if nothing is pressed ::
    if      (digitalRead(switchPins[0])) { curState = 1; }
    else if (digitalRead(switchPins[1])) { curState = 2; }
    else    { curState = 0, lastState = 0; }

    // Holding down doesn't increment/decrement ::
    if      (lastState) { return; }

    // Increment/decrement stored binary number ::
    if      (curState == 1 && bNum < 7) { bNum++; }
    else if (curState == 2 && bNum > 0) { bNum--; }
    else                                { return; }

    // Using binary masking, write binary number to LEDs ::
    for (int i = 2, j = 1; i >= 0; --i) {
        digitalWrite(ledPins[i], bNum & j);
        j <<= 1;
    }
}