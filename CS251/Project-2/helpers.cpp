/// @filename helpers.cpp
/// @author Adam T Koehler, PhD
/// @date January 26, 2023
/// @brief Several useful helper functions for the music library project.
///
/// Assignment details and provided code are created and
/// owned by Adam T Koehler, PhD - Copyright 2023.
/// University of Illinois Chicago - CS 251 Spring 2023

#include <iostream>
#include <string>
#include <algorithm>
#include <fstream>

using namespace std;

/// @brief trims the leading whitespace from a string
/// @param s the string to trim whitespace off of
/// @return a string with no more leading whitespace
string trimWhiteSpace(const string s)
{
    size_t index = 0;
    while(index < s.size() && isspace(s[index++]));
    return s.substr(index-1);
}

/// @brief splits a string into two pieces, the first word and the rest
/// @param s the string to split
/// @param first a string reference to store the first word in
/// @param remains a string reference to store everything else from s
void splitFirstWord(const string &s, string &first, string &remains)
{
    // first word or possibly the only word
    first = s.substr(0,s.find(" "));
 
    // skip all whitespace and get everything after the first word
    if (s.size() != first.size())
    {
        remains = trimWhiteSpace(s.substr(s.find(" ")));
    }
    else
    {
        remains = "";
    }

}

/// @brief converts an entire string to lowercase
/// @param s a reference to the string to convert
void tolower(string &s)
{
    transform(s.begin(), s.end(), s.begin(),
        [](unsigned char c){return tolower(c);});
}

/// @brief implementation of the menu command for help
//          prints out descriptions of all the commands
void helpCommand()
{
    cout << "Music Library Help" << endl;
    cout << "------------------" << endl;
    
    cout << "Command Options: clear, exit, export, help, load, search";
    cout << endl << endl;
    
    // print out all the help descriptions for every command
    ifstream fstr("help-commands.txt");
    if (fstr.is_open())
    {
        cout << fstr.rdbuf();
        cout << endl;
        fstr.close();
    }
}
