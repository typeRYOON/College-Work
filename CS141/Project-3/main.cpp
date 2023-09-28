/* ---------------------------------------------
Program 3: Wordle Reload

Course: CS 141, Spring 2022. Tues 2pm lab
System: Windows using CLion
Author: Ryan Magdaleno

Description of program: This program simulates the online game wordle in a 3 and 5 letter variant. The goal is to
guess a random 3/5-letter word in the amount of attempts and time given. The program will indicate whether a character
is in the right spot, wrong spot, or not in the word at all.
----------------------------------------------*/
#include <iostream>
#include <fstream>
#include <cassert> // used for reading a text file
#include <vector>
#include <cctype> // tolower/upper functions
#include <ctime> // for counting time
using namespace std;

void startDisplay() {
    // This function displays the starting game message.
    cout << "Program 3: Wordle Reload\n"
            "CS 141, Spring 2022, UIC\n"
            "\n"
            "The objective of this game is to guess the randomly selected\n"
            "word within a given number of attempts. You can select either\n"
            "a three or five word board.\n"
            "At the conlusion of the game, stats will be displayed.\n"
            "Indicators will be given if characters of the user entered\n"
            "word are reflected in the guessed word.\n"
            "  - If the character is in the correct position, the character\n"
            "    will display as an uppercase value.\n"
            "  - If the character is within the random word, the character\n"
            "    will display as a lowercase value.\n"
            "  - If you enter a character that is not in the word, an asterisk '*'\n"
            "    will display." << endl;
}

void readWordsIntoDictionary(vector <string>& dictionary) {
    // This function reads a text file and outputs its contents into the dictionary vector that's passed by reference through parameter
    // This function is mostly the example given by C Fulton on the CS 141 website.
    ifstream inStream; // Declare an input stream for reading
    inStream.open("wordlewords.txt"); // Open dictionary file
    assert(inStream.fail() == false); // Ensure file open worked
    dictionary.clear();
    string newWord; // Store a single input word
    while(inStream >> newWord) { // While there is another word to be read
        dictionary.push_back(newWord);
    }
    inStream.close(); // Close file
}

void splitVector (vector<string>& dictionary, vector<string>& threeLetter, vector<string>& fiveLetter) {
    // This function takes in a string vector (dictionary) that will then sort its 3 and 5 character strings into their specific vectors.
    // 3-letter words -> vector threeLetter, 5-letter words -> vector fiveLetter
    string currentWord;
    unsigned int i;
    for (i = 0; i < dictionary.size(); ++i) {
        currentWord = dictionary.at(i);
        if (currentWord.length() == 3) { // 3 char words go into threeLetter vector path
            threeLetter.push_back(currentWord);
        }
        else if (currentWord.length() == 5) { // 5 char words go into fiveLetter vector path
            fiveLetter.push_back(currentWord);
        }
    }
}

int changeBoard (char board[6][5], string targetWord, string userWord, int attemptNum, int wordleType) {
    // This function takes a char board up to size [6][5] that will be looped inside to change its char elements.
    // Using targetWord we compare that to userWord to check of the user's word matches the target word.
    // Var attemptNum is used to change the most recent char board row's elements.
    // Var wordleType is used to change loop range depending on wordle word length (3 / 5 word).
    unsigned int i;
    unsigned int k;
    unsigned int r;
    int correctChar = 0;
    vector<char> targetWordChars;
    for (i = 0; i < wordleType; ++i) { // Store targetWord's letters as chars in vector
        targetWordChars.push_back(targetWord[i]);
    }
    for (k = 0; k < wordleType; ++k) {
        if (targetWord[k] == userWord[k]) { // If userWord matched targetWord then update most recent row
            board[attemptNum][k] = toupper(targetWord[k]);
            correctChar += 1; // If user char matched, if correctChar == 3 or 5 then full word matched (depending on wordleType)
        }
        else { // If the current user char did not match target char
            for (r = 0; r < targetWordChars.size(); ++r) { // Check if any targetWord chars match the current userWord char
                if (userWord[k] == targetWordChars.at(r)) {
                    board[attemptNum][k] = userWord[k];
                    break; // If one match then that means there is a match somewhere with current userWord char
                }
                else {
                    board[attemptNum][k] = '*'; // If no match at all then print *
                }
            }
        }
    }
    for (i = 0; i < attemptNum + 1; ++i) { // Display board loop
        for (k = 0; k < wordleType; ++k) {
            cout << "[ " << board[i][k] << " ] ";
        }
        cout << endl;
    }
    cout << endl;
    if (correctChar == wordleType) { // If all chars matched this will return 0 indicating a correctChar guess
        return 0;
    }
    return -1; // Return -1 to indicate game is not won
}

int binarySearch(const vector<string>& dictionary, const string& wordIndex) {
    // Variable dictionary is the valid word vector that is to be searched
    // Variable wordIndex is the string that is being searched for within dictionary
    // This functinon uses the binary search algorithm to search for string wordIndex efficiently within dictionary
    int high = dictionary.size();
    int low = 0;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (dictionary.at(mid) == wordIndex) {
            return 0; // returns int 0 if found wordIndex
        }
        if (dictionary.at(mid) < wordIndex) {
            low = mid + 1;
        }
        else {
            high = mid - 1;
        }
    }
    return -1; // returns int -1 if wordIndex was not found
}

void wordleThree(vector<int>& Stats, vector<string>& dictionary, vector<int>& timeVector, int& streak) {
    // Three letter version of game.
    // This function asks the user to enter a 3-letter word to try and match a randomly picked target word.
    // The changeBoard function will be called using those words to check if a match occurs and to change the board accordingly.
    // The dictionary vector is used for getting a random word and doing a binary search on.
    // The stats (streak, total win count) are stored in Stats vector.
    // The times are also stored to later be divided to find the average time, inside timeVector.
    // Streak is for enumerating how many wins in a row the user has won without losing.
    unsigned int i;
    int random_num = rand() % dictionary.size(); // random num index range from 0 - dictionary size/length
    int elapsedSeconds;
    int firstLoop = 0;
    int attempts = 0;
    int winCondition;
    int validity;
    string userWord;
    time_t startTime;
    char board [6][5] = {{' ', ' ', ' '}, // char board of size [6][5] but will only use [4][3] size (one size array for both games)
                         {' ', ' ', ' '},
                         {' ', ' ', ' '},
                         {' ', ' ', ' '},
    };
    string randomWord = dictionary.at(random_num); // Get a word in dictionary vector at index random_num
    cout << "\nTo get started, enter your first 3 letter word.\n"
            "You have 4 attempts to guess the random word.\n"
            "The timer will start after your first word entry.\n"
            "Try to guess the word within 20 seconds.\n" << endl;
    while (true) { // Continue game until lose condition breaks loop
        cout << "Please enter word --> ";
        cin >> userWord;
        cout << "\n";
        if (userWord.length() != 3) {
            cout << "Invalid word entry - please enter a word that is 3 characters long." << endl;
            continue;
        }
        for (i = 0; i < 3; ++i) { // Make all characters in userWord and randomWord lowercase
            userWord[i] = tolower(userWord[i]);
            randomWord[i] = tolower(randomWord[i]);
        }
        validity = binarySearch(dictionary, userWord); // Searches inside dicionary using binary search to check if userWord is a valid word
        if (validity == -1) { // If validity == -1 then userWord was not found in the dictionary vector
            cout << "Not a playable word, please select another word.\n" << endl;
            continue;
        }
        if (firstLoop == 0) { // Start timer on first loop
            startTime = time(nullptr);
            firstLoop += 1;
        }
        cout << "\n";
        // Will call changeBoard if userWord  are valid, also of wordleType 3 letter
        winCondition = changeBoard(board, randomWord, userWord, attempts, 3);
        elapsedSeconds = difftime(time(nullptr), startTime); // Store current elapsed time after each word attempt.
        attempts += 1;
        if (elapsedSeconds > 20) { // Lose condition, elapsed seconds > 20
            cout << "Your time has expired.  Try again." << endl;
            cout << " - You are " << elapsedSeconds - 20 << " seconds over the 20 second time limit.";
            streak = 0; // Reset current streak
            return;
        }
        if (winCondition == 0) {
            cout << "Nice Work!  You guessed the correct word\n - You completed the board in: " << elapsedSeconds << " seconds." << endl;
            cout << " - It took you " << attempts << "/4 attempts.";
            timeVector.push_back(elapsedSeconds);
            Stats.at(0) += 1; // Stats.at(0) = win count
            streak += 1; // Increment current streak
            if (streak > Stats.at(1)) { // Check if current streak is greater than currently stored streak that is highest
                Stats.at(1) = streak;
            }
            return;
        }
        if (attempts == 4) { // Lose condition, attempts == 4 (starts on 0).
            cout << "Maximum amount of attempts have been reached. Try again.";
            streak = 0;
            break;
        }
    }
}

void wordleFive(vector<int>& Stats, vector<string>& dictionary, vector<int>& timeVector, int& streak) {
    // Five letter version of game.
    // This function asks the user to enter a 5-letter word to try and match a randomly picked target word.
    // The changeBoard function will be called using those words to check if a match occurs and to change the board accordingly.
    // The dictionary vector is used for getting a random word and doing a binary search on.
    // The stats (streak, total win count) are stored in Stats vector.
    // The times are also stored to later be divided to find the average time, inside timeVector.
    // Streak is for enumerating how many wins in a row the user has won without losing.
    unsigned int i;
    int random_num = rand() % dictionary.size(); // random num index range from 0 - dictionary size/length
    int elapsedSeconds;
    int firstLoop = 0;
    int attempts = 0;
    int winCondition;
    int validity;
    string userWord;
    time_t startTime;
    char board [6][5] = {{' ', ' ', ' ', ' ', ' '}, // char board of size [6][5] (one size array for both games)
                         {' ', ' ', ' ', ' ', ' '},
                         {' ', ' ', ' ', ' ', ' '},
                         {' ', ' ', ' ', ' ', ' '},
                         {' ', ' ', ' ', ' ', ' '},
                         {' ', ' ', ' ', ' ', ' '}
    };
    string randomWord = dictionary.at(random_num); // Get a word in dictionary vector at index random_num
    cout << "\nTo get started, enter your first 5 letter word.\n"
            "You have 6 attempts to guess the random word.\n"
            "The timer will start after your first word entry.\n"
            "Try to guess the word within 40 seconds.\n" << endl;
    while (true) { // Continue game until lose condition breaks loop
        cout << "Please enter word --> ";
        cin >> userWord;
        cout << "\n";
        if (userWord.length() != 5) {
            cout << "Invalid word entry - please enter a word that is 5 characters long." << endl;
            continue;
        }
        for (i = 0; i < 5; ++i) { // Make all characters in userWord and randomWord lowercase
            userWord[i] = tolower(userWord[i]);
            randomWord[i] = tolower(randomWord[i]);
        }
        validity = binarySearch(dictionary, userWord); // Searches inside dicionary using binary search to check if userWord is a valid word
        if (validity == -1) { // If validity == -1 then userWord was not found in the dictionary vector
            cout << "Not a playable word, please select another word.\n" << endl;
            continue;
        }
        if (firstLoop == 0) { // Start timer on first loop
            startTime = time(nullptr);
            firstLoop += 1;
        }
        cout << "\n";
        // Will call changeBoard if userWord  are valid, also of wordleType 5 letter
        winCondition = changeBoard(board, randomWord, userWord, attempts, 5);
        elapsedSeconds = difftime(time(nullptr), startTime);
        attempts += 1;
        if (elapsedSeconds > 40) { // Lose condition, elapsed seconds > 40
            cout << "Your time has expired.  Try again." << endl;
            cout << " - You are " << elapsedSeconds - 40 << " seconds over the 40 second time limit." << endl;
            streak = 0;
            return;
        }
        if (winCondition == 0) {
            cout << "Nice Work!  You guessed the correct word\n - You completed the board in: " << elapsedSeconds << " seconds." << endl;
            cout << " - It took you " << attempts << "/6 attempts.";
            timeVector.push_back(elapsedSeconds);
            Stats.at(0) += 1; // Stats.at(0) = win count
            streak += 1; // Increment current streak
            if (streak > Stats.at(1)) { // Check if current streak is greater than currently stored streak that is highest
                Stats.at(1) = streak;
            }
            return;
        }
        if (attempts == 6) { // Lose condition, attempts == 6 (starts on 0).
            cout << "Maximum amount of attempts have been reached. Try again.";
            streak = 0;
            break;
        }
    }
}



int main() {
    // This function starts the program by prompting the user a menu which will be inside the inPlay loop.
    // main() calls the wordleThree/Five functions which start the game up for the user.
    // To leave the inPlay loop the user would have to press 3 on the menu to exit out the loop to then exit main().
    // Stat for the wordle games the user played will be displayed last in main().
    srand(1);
    vector<string> dictionary;
    vector<string> threeLetter;
    vector<string> fiveLetter;
    vector<int> overallStats = {0, 0}; // pos 0 = total win count, pos 1 = the highest streak
    vector<int> timeCompletions;
    bool inPlay = true;
    int sumTime = 0;
    int streak = 0;
    int avgTime;
    int choice;
    startDisplay();
    readWordsIntoDictionary(dictionary);
    splitVector(dictionary, threeLetter, fiveLetter);
    while (inPlay) { // Main gameplay loop
        cout << "\n\nSelect a menu option:\n"
                "   1. To play Wordle Reload 3 letter play\n"
                "   2. To play Wordle Reload 5 letter play\n"
                "   3. Exit the program\n"
                "Your choice --> ";
        cin >> choice;
        switch (choice) {
            case 1: // Three letter wordle path
                wordleThree(overallStats, threeLetter, timeCompletions, streak);
                break;

            case 2: // Five letter wordle path
                wordleFive(overallStats, fiveLetter, timeCompletions, streak);
                break;

            case 3: // Exit/stats display path
                if (!timeCompletions.empty()) { // run if timeCompletions vector is not empty
                    for (int timeCompletion : timeCompletions) { // ranged for loop using timeCompletion vector
                        sumTime += timeCompletion;
                    }
                    avgTime = sumTime / timeCompletions.size();
                }
                cout << "Overall Stats:\n"
                        "  - You guessed: " << overallStats.at(0) <<
                     "\n  - Your longest streak is: " << overallStats.at(1);
                if (overallStats.at(0) == 0) { // If no words were guessed correctly, then time should be N/A
                    cout <<  "\n  - Average word completion time: N/A";
                }
                else {
                    cout << "\n  - Average word completion time: " << avgTime;
                }
                cout << "\nExiting program" << endl;
                inPlay = false;
                break;

            default: // In case user enters something that's not 1, 2, or 3.
                cout << "Invalid choice." << endl;
                break;
        }
    }
    return 0;
}
