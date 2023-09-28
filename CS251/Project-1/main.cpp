/* ----------------------------------------------------------------------------
 >> Program: Gerrymandering
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview: This program will read in 2 text files into a vector of
 >> structs and will use this data to do calculations later on. This program's
 >> main focus is on a state's district data which has Republican and Democrat
 >> vote counts. We will do calculations to determine if a state has been
 >> gerrymandered and the stats alongside it. There's also a plot function.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#include "ourvector.h"
#include <algorithm>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cmath>
using namespace std;


struct stateData {
    // Used to store each state's data into a vector of this type of struct.
    string stateName;        // first part of txt file lines.
    string data;             // 1,xx,xx,2,xx,xx,..51,xx,xx.
    int eligibleVoters = 0;
    int districtsCount = 0;  // Store district count for printing format.
};


void insertionSort(ourvector<struct stateData> &stateDataVector) {
    /** This function is used to sort the vector that is passed.
    I had to use my own sorting function as the professor's vector implementation
    doesn't work with the <algorithm> sort function. (specifically when passing vec.begin() and vec.end() and using
    a comparator function.)
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @return : void
    */
    int i = 1, j;
    struct stateData key;
    for (;i < stateDataVector.size(); ++i) {      // Insertion sort algorithm:
        key = stateDataVector[i];
        j = i - 1;
        while (j >= 0 && stateDataVector[j].stateName > key.stateName) {
            stateDataVector[j + 1] = stateDataVector[j];
            j = j - 1;
        }
        stateDataVector[j + 1] = key;
    }
}


int binarySearch(ourvector<struct stateData> &stateDataVector, const string &key) {
    /** This function is a O(logN) searching algorithm that's used in finding the state's name key
    that gets passed from the user during the search function. This function will return the key to
    state struct element the user asked for, or -1 if not found.
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @param key : A string that is used to search for the desired state in the stateData vector.
    @return : int | A index value of of the desired state's element or -1 if not found.
    */
    int l = 0, r = stateDataVector.size() - 1, midPoint;
    while (l <= r) {
        midPoint = l + ((r - l) / 2);                        // Mid-point calculation.
        if (stateDataVector[midPoint].stateName < key)
            l = midPoint + 1;                                // Shift left pointer to mid + 1.
        else if (stateDataVector[midPoint].stateName > key)
            r = midPoint - 1;                                // Shift right pointer to mid - 1.
        else
            return midPoint;                                 // Desired state is found.
    }
    return -1;                                               // Desired state is not found.
}


int districtParse(string &districtData) {
    /** This function takes in a data string that stores a state's district/voter information and is used
    to find the last district number to get a total. This reverses through the string by skipping the last
    two commas to find the final district number.
    @param districtData : A string that contains the district/voter info: "1,xx,xx,2,xx,xx,..51,xx,xx"
    @return : int | The district number total of the passed stateData string.
    */
    unsigned int i = districtData.length() - 1, commaCount = 0, j;
    while (i > 0) {                    // Reverse through string until it reaches index 0.
        if (districtData[i] == ',') {
            ++commaCount;
            if (commaCount == 2)
                j = i;                 // Comma after final district number: 1,xx,2,xx,3(,)xx,xx.
            else if (commaCount == 3)  // Comma before final district number is found: 1,xx,2,xx(,)3,xx,xx.
                return stoi(districtData.substr(i + 1, j - i - 1));  // Return this district num as int.
        }
        --i;
    }
    return 1;  // Full traversal means there is no third comma therefore only one district.
}


void loadFiles(ourvector<struct stateData> &stateDataVector, string &loadedStatus) {
    /** This function takes in an empty vector that will open two text files that contain district/voter
    information for states and will append those values as stateData structs.
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @param loadedStatus : A string that will be changed to store if files are loaded in.
    @return : void
    */
    string districtsFile, eligibleVotersFile, lineContents;
    struct stateData temp;
    int i, j;
    cin >> districtsFile >> eligibleVotersFile;
    cout << "\n-----------------------------\n" << endl;
    ifstream fileStream(districtsFile);                        // Attempt load on district file.
    if (!fileStream.is_open()) {                               // Invalid load.
        cout << "Invalid first file, try again.\n" << endl;
        return;
    }
    while (!fileStream.eof()) {
        getline(fileStream, lineContents);
        if (lineContents.empty()) {                            // Edge case: empty line at end of file.
            break;
        }
        i = lineContents.find(',');
        temp.stateName = lineContents.substr(0, i);                     // Retrieve state name before first comma.
        temp.data = lineContents.substr(i + 1, lineContents.length());  // Retrieve all data after first comma.
        temp.districtsCount = districtParse(temp.data);                 // Retrieve last district number.
        stateDataVector.push_back(temp);  // After assigning the temp structs' data, push temp into vector.
    }
    cout << "Reading: " << districtsFile << endl;
    for (stateData &state : stateDataVector) {
        cout << "..." << state.stateName << "..." << state.districtsCount << " districts total" << endl;
    }
    fileStream.close();
    fileStream.open(eligibleVotersFile);  // Attempt load on voter file.
    insertionSort(stateDataVector);
    if (!fileStream.is_open()) {          // Invalid load.
        cout << "\nInvalid second file, try again.\n" << endl;
        return;
    }
    cout << "\nReading: " << eligibleVotersFile << endl;
    while (!fileStream.eof()) {
        getline(fileStream, lineContents);
        if (lineContents.empty()) {       // Edge case: empty line at end of file.
            break;
        }
        i = lineContents.find(',');
        j = binarySearch(stateDataVector, lineContents.substr(0, i));  // Pass state name to find index
        if (j == -1) {  // No state key found in stateDataVector, so continue.
            continue;
        }
        stateDataVector[j].eligibleVoters = stoi(lineContents.substr(i + 1, lineContents.size()));
        cout << "..." << stateDataVector[j].stateName << "..." << stateDataVector[j].eligibleVoters;
        cout << " eligible voters" << endl;
    }
	cout << endl;
    fileStream.close();
    loadedStatus = "Yes";
}


void capitalizeStr(string &stateName) {
    /** This function takes in a string and will capitalize the words within it like so:
    Passed: "nEw yoRk", Output: "New York"
    @param stateName : A passed string that will be capitalized.
    @return : void
    */
    bool inStr = false;
    for (char &c : stateName) {
        if (!inStr && isalpha(c)) {    // Entered a word.
            c = (char)toupper(c);      // Uppercase first char.
            inStr = true;
        }
        else if (inStr && c == ' ')    // Entered gap between words or trailing space.
            inStr = false;
        else if (inStr && isalpha(c))  // Lowercase all other characters in word.
            c = (char)tolower(c);
    }
}


void search(ourvector<struct stateData> &stateDataVector, int &index, string &state) {
    /** This function takes in a vector that contains all the states' data and searches for the
    passed string inside the vector using binary search. The index and state name are stored for later
    use in other functions that require it.
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @param index : A int that will hold a state's index position in the stateDataVector.
    @param state : A string that will hold the name of the state if found.
    @return : void
    */
    string userState;
    cin.ignore();
    getline(cin, userState);
    capitalizeStr(userState);
    index = binarySearch(stateDataVector, userState);  // Set index to state struct element.
    cout << "\n-----------------------------\n" << endl;
    if (index == -1) {  // State name not found in vector.
        cout << "\nState does not exist, search again." << endl;
        return;
    }
    state = userState;  // Change passed by referenced state name to be used in future functions.
}


void addToWastedVotes(const double &overHalf, int &wastedDem, int &wastedRep, int &demVotes, int &repVotes) {
    /** This function will calculate the wasted votes for both Republicans and Democrats and
    uses the demVotes, repVotes, overHalf values to do so.
    @param overHalf : The sum of the rep and dem votes divided by two, round to up/+1 to nearest integer.
    @param wastedDem : Passed to be added to during this function.
    @param wastedRep : Passed to be added to during this function.
    @param demVotes : The Democrat vote count for the last district.
    @param repVotes : The Republican vote count for the last district.
    @return : void
    */
    if (demVotes > repVotes) {                       // Dems winning over Reps:
        wastedRep += repVotes;                       // Add all Rep votes to wastedRep votes.
        wastedDem += abs((int)overHalf - demVotes);  // Add excess Dem votes to wastedDem votes.
    }
    else {                                           // Reps winning over Dems:
        wastedDem += demVotes;                       // Add all Dems votes to wastedDem votes.
        wastedRep += abs((int)overHalf - repVotes);  // Add excess Rep votes to wastedRep votes.
    }
}


void stats(ourvector<struct stateData> &stateDataVector, const int &index) {
    /** This function takes in the stateDataVector and an index that points to a state struct element.
    This function will get the rep and dem votes, wasted votes, efficiency percentage, and makes a judgement on if
    the state is gerrymandered or not, and who is gerrymandered against.
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @param index : A int that will hold a state's index position in the stateDataVector.
    @return : void
    */
    int wastedDemVotes = 0, wastedRepVotes = 0, demVotes = 0, repVotes = 0, lineCount = 0, lastDem, lastRep;
    string stateDataStr = stateDataVector[index].data + ",0", res;  // Append a ",0" so while loop runs 1 more time.
    stringstream strStream(stateDataStr);
    double overHalf;
    while (getline(strStream, res, ',')) {               // Split data string into res string.
        if ((lineCount + 2) % 3 == 0) {                  // Dem vote number path:
            lastDem = stoi(res);
            demVotes += lastDem;
        }
        else if ((lineCount + 1) % 3 == 0) {             // Rep vote number path:
            lastRep = stoi(res);
            repVotes += lastRep;
        }
        else if (lineCount % 3 == 0 && lineCount > 0) {  // District number calculations:
            overHalf = (lastRep + lastDem) / 2.0;        // Using last 2 vote numbers, calculate overHalf value.
            if (overHalf == (int)overHalf)               // Compare if double needs rounding or +1.
                ++overHalf;
            else
                overHalf = ceil(overHalf);
            addToWastedVotes(overHalf, wastedDemVotes, wastedRepVotes, lastDem, lastRep);
        }
        lineCount++;
    }
    double percentDem = (double)abs(wastedDemVotes - wastedRepVotes) / (demVotes + repVotes);
    string gerrymanderedAgainst = "Republicans", gerrymandered = (percentDem > 0.07 ) ? "Yes" : "No";
    if (stateDataVector[index].districtsCount < 3) {     // Edge case: States w/ <3 districts can't be gerrymandered.
        gerrymandered = "No";
    }
    cout << "\n-----------------------------\n\nGerrymandered: " << gerrymandered << endl;
    if (percentDem > 0.07 && stateDataVector[index].districtsCount > 2) {  // Gerrymandered extra info:
        if (wastedDemVotes > wastedRepVotes) {
            gerrymanderedAgainst = "Democrats";
        }
        cout << "Gerrymandered against: " << gerrymanderedAgainst << endl;
        cout << "Efficiency Factor: " << percentDem * 100 << "%" << endl;
    }
    cout << "Wasted Democratic votes: " << wastedDemVotes << endl;
    cout << "Wasted  Republican votes: " << wastedRepVotes << endl;
    cout << "Eligible voters: " << stateDataVector[index].eligibleVoters << endl << endl;
}


void plot(ourvector<struct stateData> &stateDataVector, const int &index) {
    /** This is a function reads in the stateDataVector and a index which points to the index position of the
    desired state. This function plots D/Rs and is done so based on how the percentage of Democrat votes and
    Republican votes.
    @param stateDataVector : A stateData struct vector that contains all the states data.
    @param index : A int that will hold a state's index position in the stateDataVector.
    @return : void
    */
    string stateDataStr = stateDataVector[index].data + ",0", res;  // Append a ",0" so while loop runs 1 more time.
    stringstream strStream(stateDataStr);
    int districtCount = 1, lineCount = 0, demVotes, repVotes;
    double percentDem;
    cout << "\n-----------------------------\n" << endl;
    while (getline(strStream, res, ',')) {             // Split data string into res string.
        if ((lineCount + 2) % 3 == 0) {                // Dem vote number path:
            demVotes = stoi(res);
        }
        else if ((lineCount + 1) % 3 == 0) {           // Rep vote number path:
            repVotes = stoi(res);
        }
        else if (lineCount % 3 == 0 && lineCount > 0) {             // District number calculations:
            percentDem = (double)demVotes / (demVotes + repVotes);  // Using last 2 vote numbers, calculate percent dem.
            cout << "District: " << districtCount++ << endl;
            if (demVotes == 0 && repVotes == 0) {                   // Edge case: 0 votes = crash when plotting D/R.
                lineCount++;
                continue;
            }
            cout << string((int)floor(percentDem * 100), 'D') <<    // Plot D/R based on Dem percentage.
            string(100 - (int)floor(percentDem * 100), 'R') << endl;
        }
        lineCount++;
    }
    cout << endl;
}


int main() {
    /** This is the main function that sets up the initial ourvector vector of stateData structs.
    This block of code serves as the menu option and entry into each of the users desired commands such as
    load, search, stats, plot, and exit.
    @return : int | Return of 0 indicating good program execution.
    */
    string fileLoadedStatus = "No", state = "N/A", userCommand, trash;
    ourvector<struct stateData> stateData;
    int index = -1;
    cout << "Welcome to the Gerrymandering App!\n\n";
    while (true) {
        cout << "Data loaded? " << fileLoadedStatus << endl;
        cout << "State: " << state << "\n\nEnter command: ";
        cin >> userCommand;
        if (userCommand == "exit") {             // Exit path:
            break;
        }
        else if (userCommand == "load") {        // Load function path:
            if (stateData.size() > 0) {          // Case: already loaded files.
                getline(cin, trash);             // Remove potential extra input buffer contents.
                cout << "\n-----------------------------\n" << endl;
                cout << "Already read data in, exit and start over." << endl;
                continue;
            }
            loadFiles(stateData, fileLoadedStatus);
        }
        else if (userCommand == "search") {      // Search function path:
            if (stateData.size() == 0) {         // Case: Searching an empty vector.
                getline(cin, trash);             // Remove potential extra input buffer contents.
                cout << "\n-----------------------------\n" << endl;
                cout << "No data loaded, please load data first.\n" << endl;
                continue;
            }
            search(stateData, index, state);
        }
        else if (state == "N/A") {               // Case: State is not selected.
            cout << "\n-----------------------------\n" << endl;
            cout << "No state indicated, please search for state first." << endl;
            continue;
        }
        else if (stateData.size() == 0 || fileLoadedStatus == "No") {  // Case: Empty vector / no selected state.
            cout << "\n-----------------------------\n" << endl;
            cout << "No data loaded, please load data first.\n" << endl;
            continue;
        }
        else if (userCommand == "plot") {        // Plot function path:
            plot(stateData, index);
        }
        else if (userCommand == "stats") {       // Stats function path:
            stats(stateData, index);
        }
    }
    cout << "\n-----------------------------\n" << endl;
    return 0;
}
