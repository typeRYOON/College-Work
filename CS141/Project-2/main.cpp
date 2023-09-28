/*--------------------------------------------
   Program 2: Knight Escape
   The objective of this game is to get the white knight to the empty
   square in the upper right-hand corner of the board.

	The knight can only move in the way that it does during a traditional
	chess game. This means that a knight can only move in a valid L-shape
	(two squares in a horizontal direction, then one in a vertical direction OR
	two squares in a vertical direction, then one in a horizontal direction).

    Notes from Ryan: I struggled a bit with this due to the limitations of not
    being able to use arrays/strings to represent the board. This isn't my proudest work,
    but it works at least. I tried to shorten the code as much as possible.

   Course: CS 141, Spring 2022
   System: Windows 10 using CLion
   Author: Ryan Magdaleno

 ---------------------------------------------*/
#include <iostream>
using namespace std;

// Global varibale declarations
const string BlackKnight = "\u265E";
const string WhiteKnight = "\u2658";
const string BlankPosition = " ";
int scoreAmount = 500;

// Representing 25 positions as one character long strings each
string p1 =  BlackKnight;
string p2 =  BlackKnight;
string p3 =  BlackKnight;
string p4 =  BlackKnight;
string p5 =  BlankPosition;
string p6 =  BlackKnight;
string p7 =  BlackKnight;
string p8 =  BlackKnight;
string p9 =  BlackKnight;
string p10 = BlackKnight;
string p11 = BlackKnight;
string p12 = BlackKnight;
string p13 = BlackKnight;
string p14 = BlackKnight;
string p15 = BlackKnight;
string p16 = BlackKnight;
string p17 = BlackKnight;
string p18 = BlackKnight;
string p19 = BlackKnight;
string p20 = BlackKnight;
string p21 = WhiteKnight;
string p22 = BlackKnight;
string p23 = BlackKnight;
string p24 = BlackKnight;
string p25 = BlackKnight;

void displayWelcomeMessage() {
    // This function displays the welcome message when first running the program for the first time.
    cout << "Program 2: Knight Escape \n"
         << "CS 141, Spring 2022, UIC \n"
         << " \n"
         << "The objective of this puzzle is to get the white knight "
         << "up to the empty square in the top right corner of the board. "
         << "Use standard knight moves from a traditional chess game, "
         << "where a knight moves in an L-shape. \n"
         << "This means that a knight can only move either "
         << "1) two squares in a horizontal direction, then one in a vertical direction, OR "
         << "2) two squares in a vertical direction, then one in a horizontal direction."
         << " \n"
         << "Your score decreases by 5 with each valid move, and by 10 with each invalid move. \n"
         << "Try to complete the puzzle with the smallest number of valid moves!"
         << endl;
}

void displayBoard(bool won = false) {
    // This function displays the board when called.
    cout << "\n"
    << "    Board   " << "      Position \n"
    <<  " " <<  p1 << " " <<  p2 << " " <<  p3 << " " <<  p4 << " " <<  p5 << "     1  2  3  4  5 \n"
    <<  " " <<  p6<< " " <<  p7 << " " <<  p8 << " " <<  p9 << " " <<  p10 << "     6  7  8  9 10 \n"
    <<  " " <<  p11 << " " <<  p12 << " " <<  p13 << " " <<  p14 << " " <<  p15 << "    11 12 13 14 15 \n"
    <<  " " <<  p16 << " " <<  p17 << " " <<  p18 << " " <<  p19 << " " <<  p20 << "    16 17 18 19 20 \n"
    <<  " " <<  p21 << " " <<  p22 << " " <<  p23 << " " <<  p24 << " " <<  p25 << "    21 22 23 24 25 \n"
    << endl;
    if (!won) { // When game is won, do not display the score (zyBooks test), otherwise display.
        cout << "Current score: " << scoreAmount << endl << endl;
    }

}



INSTRUCTOR
| 03/06 AT 8:04 PM
Comments missing for reset function

void resetBoard(string& a1, string& a2, string& a3, string& a4, string& a5, string& a6, string& a7, string& a8, string& a9,
                string& a10, string& a11, string& a12, string& a13, string& a14, string& a15, string& a16, string& a17,
                string& a18, string& a19, string& a20, string& a21, string& a22, string& a23, string& a24, string& a25, int& scorecurrent) {
    // Resets position strings back to original values using pass by reference in function parameter.
    a1 =  BlackKnight;
    a2 =  BlackKnight;
    a3 =  BlackKnight;
    a4 =  BlackKnight;
    a5 =  BlankPosition;
    a6 =  BlackKnight;
    a7 =  BlackKnight;
    a8 =  BlackKnight;
    a9 =  BlackKnight;
    a10 = BlackKnight;
    a11 = BlackKnight;
    a12 = BlackKnight;
    a13 = BlackKnight;
    a14 = BlackKnight;
    a15 = BlackKnight;
    a16 = BlackKnight;
    a17 = BlackKnight;
    a18 = BlackKnight;
    a19 = BlackKnight;
    a20 = BlackKnight;
    a21 = WhiteKnight;
    a22 = BlackKnight;
    a23 = BlackKnight;
    a24 = BlackKnight;
    a25 = BlackKnight;
    scorecurrent = 500;
}

INSTRUCTOR
| 03/06 AT 8:05 PM
Not needed one liner function. Instead could implement this logic wherever required

void shouldbeEmpty() {
    // Makes the checkifEmpty function shorter using this function.
    scoreAmount -= 10;
    cout << "The destination position should be empty. Try again." << endl;
}

INSTRUCTOR
| 03/06 AT 8:05 PM
Missing comments 

void checkifEmpty(int Dest) {
INSTRUCTOR
| 03/06 AT 8:06 PM
Variable not in camelCase

    // This function checks if the destination position is empty and will decrease score if not empty.
   switch (Dest) {
       case 1:
           if (p1 != " ") { // if p is anything other than an empty space then it has a knight.
               shouldbeEmpty();}
           break;
       case 2:
           if (p2 != " ") {
               shouldbeEmpty();}
           break;
       case 3:
           if (p3 != " ") {
               shouldbeEmpty();}
           break;
       case 4:
           if (p4 != " ") {
               shouldbeEmpty();}
           break;
       case 5:
           if (p5 != " ") {
               shouldbeEmpty();}
           break;
       case 6:
           if (p6 != " ") {
               shouldbeEmpty();}
           break;
       case 7:
           if (p7 != " ") {
               shouldbeEmpty();}
           break;
       case 8:
           if (p8 != " ") {
               shouldbeEmpty();}
           break;
       case 9:
           if (p9 != " ") {
               shouldbeEmpty();}
           break;
       case 10:
           if (p10 != " ") {
               shouldbeEmpty();}
           break;
       case 11:
           if (p11 != " ") {
               shouldbeEmpty();}
           break;
       case 12:
           if (p12 != " ") {
               shouldbeEmpty();}
           break;
       case 13:
           if (p13 != " ") {
               shouldbeEmpty();}
           break;
       case 14:
           if (p14 != " ") {
               shouldbeEmpty();}
           break;
       case 15:
           if (p15 != " ") {
               shouldbeEmpty();}
           break;
       case 16:
           if (p16 != " ") {
               shouldbeEmpty();}
           break;
       case 17:
           if (p17 != " ") {
               shouldbeEmpty();}
           break;
       case 18:
           if (p18 != " ") {
               shouldbeEmpty();}
           break;
       case 19:
           if (p19 != " ") {
               shouldbeEmpty();}
           break;
       case 20:
           if (p20 != " ") {
               shouldbeEmpty();}
           break;
       case 21:
           if (p21 != " ") {
               shouldbeEmpty();}
           break;
       case 22:
           if (p22 != " ") {
               shouldbeEmpty();}
           break;
       case 23:
           if (p23 != " ") {
               shouldbeEmpty();}
           break;
       case 24:
           if (p24 != " ") {
               shouldbeEmpty();}
           break;
       case 25:
           if (p25 != " ") {
               shouldbeEmpty();}
           break;
       default:
            break;
   }
}

void invalidScoreDecrease() {
    // Makes the checkValidity function shorter using this.
    cout << "The destination position should be empty. Try again." << endl;
    scoreAmount -= 10;
}

void swapChar(string& Source, string& Destination) {
    // This function swaps the source and destination position strings and will
    // reflect in the board.
    string tempchar = Source;
    Source = Destination;
    Destination = tempchar;
    scoreAmount -= 5; // Valid move = 5 point decrease.
}

void InvalidKnightLMove() {
    // This function is used in checkValidy if the source is usable (not a space), but the move isn't in an L-shape.
    cout << "Invalid move. Knights can only move in an L-shape. Try again." << endl;
    scoreAmount -= 10;
}

// Collapse this next function if you can, it's about 1000 lines.
void checkValidy(int Source, int Destination) {
    /* This function takes in a source and destination integer that will first check if the source is
     * a knight. The function then calls checkifEmpty to see if the destination position is empty.
     * If the values are valid then the function checks if there is a knight in the destination, otherwise
     * it will then swap the source and destination positions. */

    int tempscore = scoreAmount; // This will be used to check the difference between this and the global score.
    if ((Source == 1) && (p1 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) { // Returns if the score changed, meaning checkifEmpty found the move to be invalid
            return;}
        switch (Destination) {
            case 8:
                if (p8 != " ") { // Checks if there is a knight
                    invalidScoreDecrease();
                }
                else { // VALID BLOCK
                    swapChar(p1, p8); // Swaps source and destination strings
                }
                break;
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p1, p12);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }

    else if ((Source == 2) && (p2 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 9:
                if (p9 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p2, p9);
                }
                break;
            case 11:
                if (p11 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p2, p11);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p2, p13);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 3) && (p3 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 6:
                if (p6 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p3, p6);
                }
                break;
            case 10:
                if (p10 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p3, p10);
                }
                break;
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p3, p12);
                }
                break;
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p3, p14);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 4) && (p4 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 7:
                if (p7 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p4, p7);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p4, p13);
                }
                break;
            case 15:
                if (p15 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p4, p15);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 5) && (p5 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 8:
                if (p8 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p5, p8);
                }
                break;
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p5, p14);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 6) && (p6 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 3:
                if (p3 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p6, p3);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p6, p13);
                }
                break;
            case 17:
                if (p17 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p6, p17);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 7) && (p7 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 4:
                if (p4 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p7, p4);
                }
                break;
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p7, p14);
                }
                break;
            case 16:
                if (p16 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p7, p16);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p7, p18);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 8) && (p8 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 1:
                if (p1 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p1);
                }
                break;
            case 5:
                if (p5 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p5);
                }
                break;
            case 11:
                if (p11 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p11);
                }
                break;
            case 15:
                if (p15 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p15);
                }
                break;
            case 17:
                if (p17 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p17);
                }
                break;
            case 19:
                if (p19 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p8, p19);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 9) && (p9 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 2:
                if (p2 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p9, p2);
                }
                break;
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p9, p12);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p9, p18);
                }
                break;
            case 20:
                if (p20 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p9, p20);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 10) && (p10 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 3:
                if (p3 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p10, p3);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p10, p13);
                }
                break;
            case 19:
                if (p19 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p10, p19);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 11) && (p11 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 2:
                if (p2 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p11, p2);
                }
                break;
            case 8:
                if (p8 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p11, p8);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p11, p18);
                }
                break;
            case 22:
                if (p22 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p11, p22);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 12) && (p12 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 1:
                if (p1 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p1);
                }
                break;
            case 3:
                if (p3 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p3);
                }
                break;
            case 9:
                if (p9 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p9);
                }
                break;
            case 19:
                if (p19 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p19);
                }
                break;
            case 21:
                if (p21 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p21);
                }
                break;
            case 23:
                if (p23 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p12, p23);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 13) && (p13 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 2:
                if (p2 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p2);
                }
                break;
            case 4:
                if (p4 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p4);
                }
                break;
            case 6:
                if (p6 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p6);
                }
                break;
            case 10:
                if (p10 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p10);
                }
                break;
            case 16:
                if (p16 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p16);
                }
                break;
            case 20:
                if (p20 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p20);
                }
                break;
            case 22:
                if (p22 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p22);
                }
                break;
            case 24:
                if (p24 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p13, p24);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 14) && (p14 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 3:
                if (p3 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p3);
                }
                break;
            case 5:
                if (p5 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p5);
                }
                break;
            case 7:
                if (p7 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p7);
                }
                break;
            case 17:
                if (p17 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p17);
                }
                break;
            case 23:
                if (p23 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p23);
                }
                break;
            case 25:
                if (p25 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p14, p25);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 15) && (p15 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 4:
                if (p4 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p15, p4);
                }
                break;
            case 8:
                if (p8 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p15, p8);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p15, p18);
                }
                break;
            case 24:
                if (p24 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p15, p24);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 16) && (p16 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 7:
                if (p7 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p16, p7);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p16, p13);
                }
                break;
            case 23:
                if (p23 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p16, p23);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 17) && (p17 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 6:
                if (p6 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p17, p6);
                }
                break;
            case 8:
                if (p8 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p17, p8);
                }
                break;
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p17, p14);
                }
                break;
            case 24:
                if (p24 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p17, p24);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 18) && (p18 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 7:
                if (p7 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p7);
                }
                break;
            case 9:
                if (p9 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p9);
                }
                break;
            case 11:
                if (p11 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p11);
                }
                break;
            case 15:
                if (p15 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p15);
                }
                break;
            case 21:
                if (p21 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p21);
                }
                break;
            case 25:
                if (p25 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p18, p25);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 19) && (p19 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 8:
                if (p8 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p19, p8);
                }
                break;
            case 10:
                if (p10 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p19, p10);
                }
                break;
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p19, p12);
                }
                break;
            case 22:
                if (p22 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p19, p22);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 20) && (p20 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 9:
                if (p9 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p20, p9);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p20, p13);
                }
                break;
            case 23:
                if (p23 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p20, p23);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 21) && (p21 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p21, p12);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p21, p18);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 22) && (p22 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 11:
                if (p11 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p22, p11);
                }
                break;
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p22, p13);
                }
                break;
            case 19:
                if (p19 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p22, p19);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 23) && (p23 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 12:
                if (p12 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p23, p12);
                }
                break;
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p23, p14);
                }
                break;
            case 16:
                if (p16 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p23, p16);
                }
                break;
            case 20:
                if (p20 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p23, p20);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 24) && (p24 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 13:
                if (p13 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p24, p13);
                }
                break;
            case 15:
                if (p15 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p24, p15);
                }
                break;
            case 17:
                if (p17 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p24, p17);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else if ((Source == 25) && (p25 != " ")) {
        checkifEmpty(Destination);
        if (tempscore != scoreAmount) {
            return;}
        switch (Destination) {
            case 14:
                if (p14 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p25, p14);
                }
                break;
            case 18:
                if (p18 != " ") {
                    invalidScoreDecrease();
                }
                else {
                    swapChar(p25, p18);
                }
                break;
            default:
                InvalidKnightLMove();
                break;
        }
    }
    else { // This will run if you try moving an empty space.
        scoreAmount -= 10;
        cout << "The source position should have a knight. Try again." << endl;
    }
}

int main () {
    // Main function scope variables
    bool LostinGame = false;
INSTRUCTOR
| 03/06 AT 8:06 PM
not in camelCase

    bool WoninGame = false;
    bool inPlay = true;
    int destinationPosition;
    int sourcePosition;
    int tempScoreStore;
    int moveNumber = 1;
    char menuOption;
    // Greets user with instructions and board
    displayWelcomeMessage();
    displayBoard();
    while (inPlay) { // Main loop body
        if (scoreAmount <= 0) { // Ran out of moves path
            LostinGame = true;
            break;
        }
        cout << moveNumber << ". "
        << "Enter one of the following: \n"
        << "  - M to move a knight from one position to another, \n"
        << "  - R to reset the board back to the beginning, or \n"
        << "  - X to exit the game. \n"
        << "Your choice -> ";
        cin >> menuOption;
        menuOption = toupper(menuOption);
        switch (menuOption) { // User choice between three cases
            case 'X': // Exit case
                inPlay = false;
                cout << "Exiting..." << endl;
                break;

            case 'R': // Board reset case
                resetBoard(p1, p2, p3, p4, p5, p6, p7, p8, p9 ,p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
                p21, p22, p23, p24, p25, scoreAmount);
                cout << "   *** Restarting" << endl;
                displayBoard();
                moveNumber = 0;
                break;

            case 'M': // Make a move case
                tempScoreStore = scoreAmount; // Used for checking difference between this and global score (5 = valid, 10 = invalid)
                cout << "Enter the positions from and to, separated by a space "
                        "(e.g. 14 5 to move the knight in position 14 to position 5): ";
                cin >> sourcePosition >> destinationPosition;
                cout << "You have chosen to move a knight from position " << sourcePosition << " to position "  << destinationPosition << "." << endl;
                if ((sourcePosition < 1) || (sourcePosition > 25)) { // Check range for source (1 <= x <= 25) = valid
                    cout << "The source position should be a valid position on the board (1-25). Try again." << endl;
                    scoreAmount -= 10;
                    cout << "Current score: " << scoreAmount << endl << endl;
                    break;
                }
                if ((destinationPosition < 1) || (destinationPosition > 25)) { // Check range for dest (1 <= x <= 25) = valid
                    cout << "The destination position should be a valid position on the board (1-25). Try again." << endl;
                    scoreAmount -= 10;
                    cout << "Current score: " << scoreAmount << endl << endl;
                    break;
                }
                checkValidy(sourcePosition, destinationPosition); // :ogic function
                if (tempScoreStore - scoreAmount != 10) { // Valid move path, displays board atleast
                    if (p5 == "\u2658") { // Game win condition
                        WoninGame = true;
                    }
                    displayBoard(WoninGame);
                }
                else {
                    cout << "Current score: " << scoreAmount << endl << endl;
                }
                break;

            default: // Invalid menu choice case
                cout << "Invalid choice" << endl;
        }
        if (tempScoreStore - scoreAmount != 10) {
            moveNumber += 1; // Iterates if a valid move ^
            if (WoninGame) { // Can be set to true on line 1353
                break;
            }
        }
    }
    if (LostinGame) {
        cout << "You have run out of moves. Try to do better next time!" << endl;
    }
    if (WoninGame){
        cout << "\nCongratulations, you did it!" << endl;
    }
    cout << "Thank you for playing!" << endl;
    return 0;
}
