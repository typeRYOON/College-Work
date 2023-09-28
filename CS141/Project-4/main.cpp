/* ---------------------------------------------
Program 4: Billboard Analysis

Course: CS 141, Spring 2022. Tues 2pm lab
System: Windows 10 using CLion
Author: Ryan Magdaleno
Date: 03/29/22

Description: This program has three files to choose and parse through. Using the data we can get certain songs that will
reveal things like the most occurences in a given year for example.
---------------------------------------------*/
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cctype>
using namespace std;

class SongData {
public:
    // Public use functions/constructor:
    SongData();
    // Getters for each private variable:
    string getSong() {return song;};
    string getArtist() {return artist;};
    string getDay() {return day;};
    string getMonth() {return month;};
    int getYear() {return year;};
    int getRank() {return rank;};
    int getLastWeek() {return lastWeek;};
    int getWeeksOnBoard() {return weeksOnBoard;};
    // Setter that is used to set new SongData objects
    void setValues(string Month, string Day, int Year, string Song, string Artist, int Rank, int LastWeek, int WeeksOnBoard);

private:
    // Private variables for each value (except peak-rank as it's not used in test questions).
    string month;
    string day;
    string song;
    string artist;
    int year;
    int rank;
    int lastWeek;
    int weeksOnBoard;
};

SongData::SongData() {
    // Default constructor :: Each SongData object uses this constructor.
    month = "";
    day = "";
    song = "";
    artist = "";
    year = 0;
    rank = 0;
    lastWeek = 0;
    weeksOnBoard = 0;
}

void SongData::setValues(string Month, string Day, int Year, string Song, string Artist, int Rank, int LastWeek, int WeeksOnBoard) {
    // Setter function :: This function sets a SongData object's private variables to what is passed through.
    // The function takes in string (Month, Day, Song, Artist) and int (Year, Rank, LastWeek, WeeksOnBoard) and -
    // - assigns them to the objects private variables that have similar names.
    month = Month;
    day = Day;
    year = Year;
    song = Song;
    artist = Artist;
    rank = Rank;
    lastWeek = LastWeek;
    weeksOnBoard = WeeksOnBoard;
}

void startMessage() {
    // This function displays a required message at the start of the program.
    cout << "Program 4: BillBoard Analysis \n"
            "CS 141, Spring 2022, UIC \n"
            " \n"
            "This program will analyze weekly Billboard data spanning from 1960 - 2020.\n"
            "\n"
            "Select file option:\n"
            "   1. To analyze charts top 50: 1960 - 1980 data file\n"
            "   2. To analyze charts top 50: 1981 - 2000 data file\n"
            "   3. To analyze charts top 50: 2001 - 2020 data file\n"
            "Your choice --> ";
}

void overallInformation(vector<SongData>& SongsVector) {
    // This function is menu option 1 and displays dataset row count and unique song count.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    vector<string> UniqueSongs = {SongsVector.at(0).getSong()}; // Add 0th element of SongsVector, so I can start looping through the UniqueSongs vector.
    string currentSongStr;
    int i;
    int j;
    cout << "Total number of rows: " << SongsVector.size() << endl;
    cout << "Number of unique songs represented in the dataset: ";
    for (i = 0; i < SongsVector.size(); ++i) { // Loop through all songs in dataset.
        for (j = 0; j < UniqueSongs.size(); ++j) { // Loop through current unique songs
            currentSongStr = SongsVector.at(i).getSong(); // Get current index i song from dataset.
            if (currentSongStr == UniqueSongs.at(j)) { // If there's a match then break loop to start next index i.
                break;
            }
            if (j == UniqueSongs.size() - 1) { // If the index i song didn't match with any UniqueSongs strings then pushback into UniqueSongs.
                UniqueSongs.push_back(SongsVector.at(i).getSong());
            }
        }
    }
    cout << UniqueSongs.size() << endl << endl;
}

void findMostOccurences(vector<SongData>& SongsVector, int yearOrDecadeChoice, char timeRangeChoice) {
    // This function takes in a user input date range and searches for the song(s) with the most occurrences at rank 1 in the data set vector.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    // yearOrDecadeChoice :: This parameter is an int year chosen by the user that will be used to check with the year / year's decade range.
    // timeRangeChoice :: This parameter is a char that is either 'D' or 'Y' and will decide how for to look past the int yearOrDecadeChoice (+1 or +10 years).
    vector<int> mostOccurrenceIndices; // Vector of indexes where most occurrences are, this is a vector because there may be more than one object with the same count.
    vector<string> mostOccurenceStrings; // Store the most occurence song's title and artist.
    unsigned int i;
    unsigned int j;
    int yearStopRange;
    int startIndex = -1; // Set to -1 to raise an index error if somehow the desired year is not found.
    int endIndex = 0; // Set to 0 incase the year is in another file (index 0 is the oldest song in the data set)
    int occurrences = 0;
    int mostOccurrences = 0;
    int currentIndex;
    int matchCount = 0;
    if (timeRangeChoice == 'D') {
        yearStopRange = yearOrDecadeChoice + 11; // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+10).
        if (yearOrDecadeChoice == 1981 || yearOrDecadeChoice == 2001) { // Edge case corrections.
            yearStopRange = yearStopRange - 2;
        }
    }
    else if (timeRangeChoice == 'Y') {
        yearStopRange = yearOrDecadeChoice + 1; // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+1).
    }
    for (i = SongsVector.size() - 1; i > 0; --i) { // Loop for finding start index in dataset for user inputted year.
        if (SongsVector.at(i).getYear() == yearOrDecadeChoice) { // First instance of chosen year will break loop and set start Index.
            startIndex = i;
            break;
        }
    }
    for (i = startIndex; i > 0; --i) { // Loop for finding ending index in dataset
        if (SongsVector.at(i).getYear() == yearStopRange) { // First object with a year outside the decade (yearStopRange)
            endIndex = i;
            break;
        }
    }
    for (i = startIndex; i > endIndex; --i) { // Loop within range of chosen year
        if (SongsVector.at(i).getRank() == 1) { // Only check rank 1 objects (var i)
            for (j = startIndex; j > endIndex; --j) {
                if (SongsVector.at(j).getRank() == 1) { // Only check rank 1 objects (var j)
                    if (SongsVector.at(i).getSong() == SongsVector.at(j).getSong()) { // Match so enumerate occurrences variable.
                        ++occurrences;
                    }
                }
            }
            if (occurrences > mostOccurrences) { // New highest occurence will clear previous vector contents and add new index.
                mostOccurrenceIndices.clear();
                mostOccurrences = occurrences;
                mostOccurrenceIndices.push_back(i);
            }
            else if (occurrences == mostOccurrences) { // This adds an index if its occurrence count is equal to the mostOccurrences count.
                for (j = 0; j < mostOccurrenceIndices.size(); ++j) {
                    currentIndex = mostOccurrenceIndices.at(j);
                    if (SongsVector.at(currentIndex).getSong() == SongsVector.at(i).getSong()) { // If a duplicate song then skip.
                        continue;
                    }
                }
                mostOccurrenceIndices.push_back(i); // Not a duplicate and occurrences is the same as the current highest then add to vector.
            }
            occurrences = 0; // Reset occurence count for next song to check.
        }
    }
    for (i = 0; i < mostOccurrenceIndices.size(); ++i) { // Loop for adding new strings to mostOccurenceStrings vector.
        currentIndex = mostOccurrenceIndices.at(i);
        for (j = 0; j < mostOccurenceStrings.size(); ++j) { // Adds one pair of strings (title, artist) of each song.
            if (SongsVector.at(currentIndex).getSong() == mostOccurenceStrings.at(j)) {
                matchCount = 1; // If a duplicate from an existing element then don't add.
                break;
            }
        }
        if (matchCount == 0) { // Adds to mostOccurenceStrings vector if it did not match with any element in the same vector.
            mostOccurenceStrings.push_back(SongsVector.at(currentIndex).getArtist());
            mostOccurenceStrings.push_back(SongsVector.at(currentIndex).getSong());
        }
        matchCount = 0;
    }
    for (i = mostOccurenceStrings.size() - 1; i > 0; --i) { // Reverse through vector because of order mostOccurenceStrings was made with.
       if (i % 2 == 1) { // Format so song title appears after the song title.
           cout << "        Song Title: " << mostOccurenceStrings.at(i) << endl;
       }
       else {
           cout << "        Artist: " << mostOccurenceStrings.at(i) << "\n        # of occurrences: " << mostOccurrences << endl << endl;
       }
    }
    cout << "        Artist: " << mostOccurenceStrings.at(0) << "\n        # of occurrences: " << mostOccurrences << "\n\n\n";
}

void longestLastingSong(vector<SongData>& SongsVector, int yearOrDecadeChoice, char timeRangeChoice) {
    // This function looks for the song with the highest amount of time on the charts.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    // yearOrDecadeChoice :: This parameter is an int year chosen by the user that will be used to check with the year / year's decade range.
    // timeRangeChoice :: This parameter is a char that is either 'D' or 'Y' and will decide how for to look past the int yearOrDecadeChoice (+1 or +10 years).
    int yearStopRange;
    int startIndex = -1; // Set to -1 to raise an index error if somehow the desired year is not found.
    int endIndex = 0; // Set to 0 incase the year is in another file (index 0 is the oldest song in the data set)
    unsigned int i;
    vector<int> indices;
    int mostWeeksOnBoard = 0;
    if (timeRangeChoice == 'D') { // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+10).
        yearStopRange = yearOrDecadeChoice + 11;
        if (yearOrDecadeChoice == 1981 || yearOrDecadeChoice == 2001) { // Edge case corrections.
            yearStopRange = yearStopRange - 2;
        }
    }
    else if (timeRangeChoice == 'Y') { // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+1).
        yearStopRange = yearOrDecadeChoice + 1;
    }
    for (i = SongsVector.size() - 1; i > 0; --i) { // Loop for finding start index in dataset for user inputted year.
        if (SongsVector.at(i).getYear() == yearOrDecadeChoice) { // First instance of chosen year will break loop and set start Index.
            startIndex = i;
            break;
        }
    }
    for (i = startIndex; i > 0; --i) { // Loop for finding ending index in dataset
        if (SongsVector.at(i).getYear() == yearStopRange) { // First object with a year outside the decade (yearStopRange)
            endIndex = i;
            break;
        }
    }
    for (i = startIndex; i > endIndex; --i) { // Loop within range of chosen year
        if (SongsVector.at(i).getWeeksOnBoard() > mostWeeksOnBoard) { // New highest top weeks on board count found
            mostWeeksOnBoard = SongsVector.at(i).getWeeksOnBoard();
            indices.push_back(i); // Push index of object into indices vector.
        }
        else if (SongsVector.at(i).getWeeksOnBoard() == mostWeeksOnBoard) { // If the counts are equal then push index into indices vector.
            indices.push_back(i);
        }
    }
    cout << "        " << SongsVector.at(indices.at(indices.size() - 1)).getSong() << " by " << SongsVector.at(indices.at(indices.size() - 1)).getArtist()
    << " with " << mostWeeksOnBoard << " weeks on the chart.\n" << endl; // Print statement with formatting.
}

void highestWeeklyClimb(vector<SongData>& SongsVector, int yearOrDecadeChoice, char timeRangeChoice) {
    // This function finds the song(s) with the highest weekly climb
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    // yearOrDecadeChoice :: This parameter is an int year chosen by the user that will be used to check with the year / year's decade range.
    // timeRangeChoice :: This parameter is a char that is either 'D' or 'Y' and will decide how for to look past the int yearOrDecadeChoice (+1 or +10 years).
    vector<int> highestClimbIndices;
    int i;
    int yearStopRange;
    int startIndex = -1; // Set to -1 to raise an index error if somehow the desired year is not found.
    int endIndex = 0; // Set to 0 incase the year is in another file (index 0 is the oldest song in the data set)
    int highestClimb = 0;
    int currentSongClimb;
    int currentIndex;
    if (timeRangeChoice == 'D') { // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+10).
        yearStopRange = yearOrDecadeChoice + 11;
        if (yearOrDecadeChoice == 1981 || yearOrDecadeChoice == 2001) { // Edge case corrections.
            yearStopRange = yearStopRange - 2;
        }
    }
    else if (timeRangeChoice == 'Y') { // This will make the range to search in the dataset yearOrDecadeChoice to yearStopRange(+1).
        yearStopRange = yearOrDecadeChoice + 1;
    }
    for (i = SongsVector.size() - 1; i > 0; --i) { // Loop for finding start index in dataset for user inputted year.
        if (SongsVector.at(i).getYear() == yearOrDecadeChoice) { // First instance of chosen year will break loop and set start Index.
            startIndex = i;
            break;
        }
    }
    for (i = startIndex; i > 0; --i) { // Loop for finding ending index in dataset
        if (SongsVector.at(i).getYear() == yearStopRange) { // First object with a year outside the decade (yearStopRange)
            endIndex = i;
            break;
        }
    }
    for (i = startIndex; i > endIndex; --i) { // Loop within range of chosen year
        currentSongClimb = SongsVector.at(i).getLastWeek() - SongsVector.at(i).getRank(); // Climb calculation
        if (currentSongClimb > highestClimb) { // New highest climb find and clear of previous vector elements.
            highestClimbIndices.clear();
            highestClimb = currentSongClimb;
            highestClimbIndices.push_back(i);
        }
        else if (currentSongClimb == highestClimb) { // If it's the same climb as highest then don't clear and push index of object.
            highestClimbIndices.push_back(i);
        }
    }
    for (i = highestClimbIndices.size() - 1; i >= 0; --i) { // cout objects with the highest climb loop
        currentIndex = highestClimbIndices.at(i);
        cout << "        Song Title: " << SongsVector.at(currentIndex).getSong() << endl
        << "         Artist: " << SongsVector.at(currentIndex).getArtist() << endl
        << "         Week of: " << SongsVector.at(currentIndex).getMonth() << "/" << SongsVector.at(currentIndex).getDay() << "/" << SongsVector.at(currentIndex).getYear() << endl
        << "         Previous Week Position: " << SongsVector.at(currentIndex).getLastWeek() << endl
        << "         Current Week Position: " << SongsVector.at(currentIndex).getRank() << endl
        << "         Difference of " << highestClimb << " between previous week and current week position" << endl;
    }
    cout << endl;
}

void yearOrDecade(vector<SongData>& SongsVector, int csvChoice, int menuOption) {
    // This function is used by three of the menu options to decide the user year and if they want to check a decade or year within the dataset.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    // csvChoice :: This parameter is an int that indicates which data set the user input. This is used to check if the year entered is within the dataset.
    // menuOption :: This parameter is an int that indicates which menu option the user input. Is used to call desired function/menu option.
    char timeRangeChoice;
    int yearOrDecadeChoice;
    int exitToMenu = 0;
    while (true) { // Loop until user enters a valid option.
        cout << "Enter D to select a decade or Y to select a year.\nYour choice --> ";
        cin >> timeRangeChoice;
        timeRangeChoice = toupper(timeRangeChoice); // Make all chars uppercase for easier comparison.
        if (timeRangeChoice == 'D') {
            cout << "Enter the decade you would like to choose, as a multiple of 10 (e.g. 2010)." << endl;
            cin >> yearOrDecadeChoice;
            if (yearOrDecadeChoice % 10 != 0) { // If decade year not multiple of 10 then make it the next lowest one (ex: 1987 -> 1980).
                yearOrDecadeChoice = yearOrDecadeChoice - (yearOrDecadeChoice % 10);
            }
        }
        else if (timeRangeChoice == 'Y') {
            cout << "Enter the year you would like to choose (e.g. 2001)." << endl;
            cin >> yearOrDecadeChoice;
        }
        else {
            cout << "Invalid entry. Try again." << endl;
            continue;
        }
        switch (csvChoice) { // Check if year is in dataset.
            case 1:
                if (yearOrDecadeChoice < 1960 || yearOrDecadeChoice > 1980) {
                    cout << "No songs found in that timeframe. Be sure that the timeframe you enter is "
                            "within the one covered by the dataset chosen.\n" << endl;
                    ++exitToMenu; // (Same for case 2/3) Exit function if out of chosen dataset's range.
                }
                break;
            case 2:
                if (yearOrDecadeChoice < 1980 || yearOrDecadeChoice > 2000) {
                    cout << "No songs found in that timeframe. Be sure that the timeframe you enter is "
                            "within the one covered by the dataset chosen.\n" << endl;
                    ++exitToMenu;
                }
                if (yearOrDecadeChoice == 1980) { // Edge case correction.
                    ++yearOrDecadeChoice;
                }
                break;
            case 3:
                if (yearOrDecadeChoice < 2000 || yearOrDecadeChoice > 2020) {
                    cout << "No songs found in that timeframe. Be sure that the timeframe you enter is "
                            "within the one covered by the dataset chosen.\n" << endl;
                    ++exitToMenu;
                }
                if (yearOrDecadeChoice == 2000) { // Edge case correction.
                    ++yearOrDecadeChoice;
                }
                break;
            default:
                break;
        }
        if (exitToMenu > 0) {
            return;
        }
        break; // User entered a valid option so continue program.
    }
    // Calls to different menu option functions with newly established yearOrDecadeChoice value and timeRangeChoice char.
    if (menuOption == 2) {
        cout << "\n\nThe song(s) with the most #1 occurrences for selected time period is:" << endl;
        findMostOccurences(SongsVector, yearOrDecadeChoice, timeRangeChoice);
    }
    else if (menuOption == 3){
        cout << "The song with the highest number of weeks on the charts is:" << endl;
        longestLastingSong(SongsVector, yearOrDecadeChoice, timeRangeChoice);
    }
    else { // Menu option 4:
        cout << "\nThe song(s) with the greatest climb from previous week to current week position: " << endl;
        highestWeeklyClimb(SongsVector, yearOrDecadeChoice, timeRangeChoice);
    }
}

void artistSearch(vector<SongData>& SongsVector) {
    // This function returns the Billboard info for songs that match the artist name the user enters. This is not case-sensitive. Only checks #1 songs from most recent board info.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    string originalUserStr;
    string lowercaseUserStr = "";
    string currentSongStr;
    unsigned int i;
    unsigned int j;
    unsigned int matchCounter = 0;
    cout << "Enter search text to retrieve first 10 records of #1 songs that match by artist name:" << endl;
    cin.ignore(); // Ignore current input buffer.
    getline(cin, originalUserStr); // Get full line from user.
    for (i = 0; i < originalUserStr.length(); ++i) { // Make a fully lowercase version of the userString so the program can easily compare.
        lowercaseUserStr += tolower(originalUserStr[i]);
    }
    for (i = 0; i < SongsVector.size(); ++i) {
        if (SongsVector.at(i).getRank() == 1) { // Only check #1 songs
            currentSongStr = SongsVector.at(i).getArtist(); // Get current song's artist
            for (j = 0; j < currentSongStr.length(); ++j) { // Make the artist string fully lowercase.
                currentSongStr[j] = tolower(currentSongStr[j]);
            }
            if (currentSongStr.find(lowercaseUserStr) != string::npos) { // String match condition if the user string was found in the artist string.
                ++matchCounter;
                if (matchCounter == 1) { // If atleast one song is found cout this once.
                    cout << "Retrieval of first 10 #1 records found based upon search by artist name: " << endl;
                }
                cout << matchCounter << ") Song: " << SongsVector.at(i).getSong() << endl;
                cout << "    Artist: " << SongsVector.at(i).getArtist() << endl;
                cout << "    Week of: " << SongsVector.at(i).getMonth() << "/" << SongsVector.at(i).getDay() << "/" << SongsVector.at(i).getYear() << endl;
                cout << "    Week Position: 1" << endl;
            }
        }
        if (matchCounter > 9) { // Only cout first ten records.
            break;
        }
    }
    if (matchCounter == 0) {
        cout << "No matching artists were found." << endl;
    }
    cout << endl;
}

void menuOptions(int csvChoice, vector<SongData>& SongsVector) {
    // This function prompts the user with 6 menu options and will call the desired option's function.
    // csvChoice :: This parameter is an integer that indicates what dataset the user chose (ranges between 1 - 3 inclusive)
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    int userChoice;
    bool loopCondition = true;
    while (loopCondition) { // Loop until menu option 6 is chosen.
        cout << "Select a menu option: \n"
                "   1. Display overall information about the data\n"
                "   2. Display the Billboard info of the song with the most #1 occurrences for a given decade or year\n"
                "   3. Display the Billboard info for the most long-lasting song on the charts for a given decade or year\n"
                "   4. Display the Billboard info for the song with the greatest weekly climb on the charts given a decade or year\n"
                "   5. Artist Search - Return the Billboard info for records that matches user input for artist search\n"
                "   6. Exit\n"
                "Your choice --> ";
        cin >> userChoice;
        switch (userChoice) { // Menu option paths based on int userChoice.
            case 1:
                overallInformation(SongsVector);
                break;
            case 2:
                yearOrDecade(SongsVector, csvChoice, userChoice);
                break;
            case 3:
                yearOrDecade(SongsVector, csvChoice, userChoice);
                break;
            case 4:
                yearOrDecade(SongsVector, csvChoice, userChoice);
                break;
            case 5:
                artistSearch(SongsVector);
                break;
            case 6:
                loopCondition = false; // Only program exit from menu option function.
                break;
            default:
                cout << "\nInvalid value.  Please re-enter a value from the menu options below." << endl << endl;
                break;
        }
    }
}

void dataConvert(int csvChoice, vector<SongData>& SongsVector) {
    // This function accesses a user chosen csv file and converts its contents into objects which will be stored in the SongsVector vector.
    // csvChoice :: This parameter is an int that indicates which data set the user input. This is used to check if the year entered is within the dataset.
    // SongsVector :: This parameter is a passed by reference vector of class SongData type that contains all objects parsed from data set.
    SongData CurrentSong;
    string tempString;
    string line = "";
    string csvFile;
    string artist;
    string title;
    string month;
    string day;
    int weeksOnBoard;
    int count = 0;
    int lastWeek;
    int year;
    int rank;
    stringstream inputString(tempString);
    // csv file paths:
    if (csvChoice == 1) {
        csvFile = "charts_top50_1960_1980.csv";
    }
    else if (csvChoice == 2) {
        csvFile = "charts_top50_1981_2000.csv";
    }
    else {
        csvFile = "charts_top50_2001_2020.csv";
    }
    ifstream inputFile;
    inputFile.open(csvFile);
    while (count < 6) { // Pass first row of csv file.
        getline(inputFile, line, ',');
        ++count;
    }
    getline(inputFile, line, '\n'); // Move to next row to start data parsing.
    while (inputFile.good()) { // Loop while there is something to be read in the file.
        // Parse strings into variables (some are turned into integers like year, rank, and lastWeek)
        getline(inputFile, month, '/');
        getline(inputFile, day, '/');
        getline(inputFile, tempString, ',');
        year = atoi(tempString.c_str());
        getline(inputFile, tempString, ',');
        rank = atoi(tempString.c_str());
        getline(inputFile, title, ',');
        getline(inputFile, artist, ',');
        getline(inputFile, tempString, ',');
        lastWeek = atoi(tempString.c_str());
        getline(inputFile, tempString, ','); // Peak-rank is unneeded so skipping over it.
        getline(inputFile, tempString, '\n');
        weeksOnBoard = atoi(tempString.c_str());
        // Pass current loop's variable contents into a class SongData type object and store inside the SongsVector vector.
        CurrentSong.setValues(month, day, year, title, artist, rank, lastWeek, weeksOnBoard);
        SongsVector.push_back(CurrentSong);
    }
    inputFile.close(); // Close file.
    SongsVector.pop_back(); // Last row creates an empty object so this removes it.
}

int main() {
    // main function that creates dataset vector and starts overall program.
    int csvChoice;
    vector<SongData> Songs; // Original vector that stores csv contents into objects into this vector.
    startMessage();
    cin >> csvChoice;
    cout << endl;
    if (csvChoice < 1 || csvChoice > 3) { // Invalid  path:
        cout << "Invalid value. Exiting Program.";
    }
    else { // Valid path:
        cout << endl;
        dataConvert(csvChoice, Songs); // With csvChoice turn contents into objects and store in Songs vector.
        menuOptions(csvChoice, Songs); // 6 Menu option function call.
    }
    return 0;
}
