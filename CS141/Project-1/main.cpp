
#include <iostream>
using namespace std;

/**---------------------------------------------

    Program 1: Matryoshka Dolls
        Prompt for the number of dolls and display
        ASCII Matryoshka dolls in decending order
        above each other.

    Course: CS 141, Spring 2022.
    System: Windows 10 using Clion
    Author: Ryan Magdaleno
    Purpose: This program gives the user a prompt to choose between displaying Matryoshka dolls,
    my own graphic, and exiting the program.

    Extra note: I chose not to use setw() because I wanted to add a bit more challenge to this assignment.
    This has helped me understand more about how nested loops can be used to slowly changed variables
    in their own unique ways.

    ASCII GRAPHIC:
      _ __   ___   ___  _ __   ___   ___  _ __   ___  ___ _ __   ___  ___
     | '_ \ / _ \ / _ \| '_ \ / _ \ / _ \| '_ \ / _ \/ _ \ '_ \ / _ \/ _ \
     | |_) | (_) | (_) | |_) | (_) | (_) | |_) |  __/  __/ |_) |  __/  __/
     | .__/ \___/ \___/| .__/ \___/ \___/| .__/ \___|\___| .__/ \___|\___|
     | |               | |               | |             | |
     |_|               |_|               |_|             |_|

 ---------------------------------------------*/


int main() {
    int leftSpace; //                                                Left side spaces of doll, keeps track of how many whitespaces needed
    int userChoice; //                                               User inputed decision for running the three later case paths
    int dollAmount; //                                               User enters amount of dolls
    int layerStack = 1; //                                           This stores how many layers the doll has currently
    int upperInsideSpacer; //                                        Keeps track of how many spaces are needed inside the upper half of the doll
    int lowerInsideSpacer; //                                        Keeps track of how many spaces are needed inside the lower half of the doll
    string dollHead = "( )";
    cout << "Program 1: Matryoshka Dolls            \nChoose from among the following options:  " << endl;
    cout << "   1. Display original graphic  \n   2. Display Matryoshka Dolls         \n   3. Exit the program          " << endl;
    cout << "Your choice -> ";
    cin >> userChoice;

    switch (userChoice) { //                                         Three paths (1, 2, 3) with a default if an invalid number was chosen

        case 1: //                                                   Orginal graphic path
            cout << "  _ __   ___   ___  _ __   ___   ___  _ __   ___  ___ _ __   ___  ___ " << endl;
            cout << R"( | '_ \ / _ \ / _ \| '_ \ / _ \ / _ \| '_ \ / _ \/ _ \ '_ \ / _ \/ _ \)" << endl;
            cout << R"( | |_) | (_) | (_) | |_) | (_) | (_) | |_) |  __/  __/ |_) |  __/  __/)" << endl;
            cout << R"( | .__/ \___/ \___/| .__/ \___/ \___/| .__/ \___|\___| .__/ \___|\___|)" << endl;
            cout << R"( | |               | |               | |             | |              )" << endl;
            cout << R"( |_|               |_|               |_|             |_|              )" << endl;
            cout << "\n\"poopoopeepee\" by Ryan Magdaleno :)" << endl;
            break;

        case 2: //                                                   Matryoshka Doll path
            cout << "Number of dolls -> ";
            cin >> dollAmount;
            while (layerStack <= dollAmount) { //                    Outermost loop to operate based on how many dolls user chose
                upperInsideSpacer = 3; //                            Start with three spaces

                for (int i = 0; i < dollAmount; ++i) { //            DOLL HEAD LAYER LOOP
                    cout << " ";
                }
                cout << dollHead << endl;

                leftSpace = dollAmount - 1; //                       Resets outside whitespace to this
                for (int i = 0; i < layerStack; ++i) { //            TOP-HALF LAYER LOOP
                    if (i == 0) { //                                 Unique first layer -> "/ - \" or "/ : \"
                        for (int j = 0; j < leftSpace; ++j) {
                            cout << " ";
                        }
                        cout << "/ ";
                        if (layerStack % 2 == 1) { //                Flips unique top layer char between "-" and ":"
                            cout << "- \\";
                        }
                        else {
                            cout << ": \\";
                        }
                        leftSpace -= 1;
                    }
                    else {
                        for (int j = 0; j < leftSpace; ++j) {
                            cout << " "; //                          Cout spaces on leftside of current layer
                        }
                        cout << "/";
                        for (int j = 0; j < upperInsideSpacer; ++j) {
                            cout << " "; //                          Cout spaces on the inside of doll
                        }
                        cout << "\\";
                        leftSpace -= 1; //                           More layers = less space on outside
                    }
                    cout << endl; //                                 Ends the line for next layer
                    upperInsideSpacer += 2; //                       More layers = more space on inside of doll
                }

                leftSpace = dollAmount - layerStack + 1; //          Starting lowerhalf spaces formula
                lowerInsideSpacer = upperInsideSpacer - 4;
                for (int i = 0; i < layerStack; ++i) { //            LOWER-HALF LAYER LOOP
                    for (int j = 0; j < leftSpace; ++j) {
                        cout << " ";
                    }
                    cout << "\\";
                    for (int j = 0; j < lowerInsideSpacer; ++j) {
                        cout << " ";
                    }
                    cout << "/" << endl;
                    leftSpace += 1; //                               As lowerhalf progresses, more spaces on outside
                    lowerInsideSpacer -= 2; //                       Inverse is true here based on previous comment
                }

                for (int i = 0; i < dollAmount + 1; ++i) { //        DOLL FOOT LAYER LOOP
                    cout << " ";
                }
                cout << "-" << endl;
                layerStack += 1; //                                  Increase layer amount for next outermost iteration
            }
            break;

        case 3: //                                                   Menu exit path
            break;

        default: //                                                  Default path in the case of no matching case
            cout << "Invalid choice." << endl;
            break;

    }
    cout << "Exiting" << endl;
    return 0;
}
