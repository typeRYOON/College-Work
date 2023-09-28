/*main.cpp*/
/* --------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> -------------------------------------------------------
 >> Program: HW1: File I/O
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 - -                             - -
 >> Overview: The program prompts the user for input,
 >> enter the file name you would like to read from.   
 >> The program then prints the file contents to output.
-------------------------------------------------------- */
// Preprocessor directives:
#include <iostream>
#include <fstream>
using namespace std;


/** main: - -                                           - -
This function is used to run the entire program. 
It reads from input what the user would like to print
file contents from, then attempts to open, and finally
outputs the file contents. 
    - -                                                 - -
    @return int : 0/-1 indicating if execution was good. */
int main()
{
    char chr;                       // For printing loop.
    string fileName;                // User inputs name.
    getline(cin, fileName);         // Get line from user.
    ifstream fileStream(fileName);  // Attempt to open file.

    // Case - Filestream failed to open:
    if (!fileStream.is_open()) {
        cerr << "Error on file open: ";
        cerr << fileName << endl;
        return -1;


    // Print file's chars to output stream:
    while (fileStream.get(chr)) {
        cout << chr;
    }
    fileStream.close();
    return 0;
}