/* ----------------------------------------------
Program 5: March Madness Frenzy

Course: CS 141, Spring 2022. Tues 2pm lab
System: Windows 10 using CLion
Author: Ryan Magdaleno
Description: This program prompts the user to enter a string file path of a csv file to create a vector of.
The file contents are of March Madness brackets.
The vector use objects of the class GameData which will be used to analyze the vector's data using function options.

There are 6 ways to analyze the data:
1: Display overall information about the data.
2: Display the path of the winning team to the championship.
3: Determine which region is expected to win the championship based on a given round.
4: Identify the best underdog within a given round.
5: Find the shoo-in and nail-biting games within a given round, or overall.
6: Compare the actual brackets to your predicted brackets.
Better decriptions for each menu option can be found in their respective functions.
-----------------------------------------------*/

#include <iostream> // character input and output streams.
#include <vector> // for creating vectors and using vector functions
#include <fstream> // for file operations
#include <sstream> // for atoi function (string to int function)
using namespace std;

class GameData{
    // This class is for storing csv file contents into objects.
public:
    GameData(); // Default Constructor
    // Fully-qualified constructor:
    GameData(string RegionType, int TeamRankOne, string TeamOne, int TeamOneScore, int TeamRankTwo,
             string TeamTwo, int TeamTwoScore, string WinningTeam, int RoundNumber, int GameNumber);
    // Getter utility functions:
    string getTeamOne() {return teamOne;};
    string getTeamTwo() {return teamTwo;};
    string getRegionType() {return regionType;};
    string getWinningTeam() {return winningTeam;};
    int getTeamOneRank() const {return teamOneRank;};
    int getTeamTwoRank() const {return teamTwoRank;};
    int getTeamOneScore() const {return teamOneScore;};
    int getTeamTwoScore() const {return teamTwoScore;};
    int getRoundNumber() const {return roundNumber;};
    int getGameNumber() const {return gameNumber;};

private: // Private variables to be used in public functions.
    string regionType;
    string teamOne;
    string teamTwo;
    string winningTeam;
    int teamOneRank;
    int teamOneScore;
    int teamTwoRank;
    int teamTwoScore;
    int roundNumber;
    int gameNumber;
};

GameData::GameData() { // Default constructor:
    regionType = "";
    teamOne = "";
    teamTwo = "";
    winningTeam = "";
    teamOneRank = 0;
    teamOneScore = 0;
    teamTwoRank = 0;
    teamTwoScore = 0;
    roundNumber = 0;
    gameNumber = 0;
}
// Fully-qualified constructor:
GameData::GameData(string RegionType, int TeamRankOne, string TeamOne, int TeamOneScore, int TeamRankTwo,
                   string TeamTwo, int TeamTwoScore, string WinningTeam, int RoundNumber, int GameNumber) {
    regionType = std::move(RegionType);
    teamOneRank = TeamRankOne;
    teamOne = std::move(TeamOne);
    teamOneScore = TeamOneScore;
    teamTwoRank = TeamRankTwo;
    teamTwo = std::move(TeamTwo);
    teamTwoScore = TeamTwoScore;
    winningTeam = std::move(WinningTeam);
    roundNumber = RoundNumber;
    gameNumber = GameNumber;
}

void convertDataToObject(string& csvChoice, vector<GameData>& GameDataVector) {
    // This function opens a csv file and converts each line into an object to be pushed back into the GameDataVector.
    // csvChoice :: This parameter is a passed by reference string that indicates what csv file path to open.
    // GameDataVector :: This parameter is a passed by reference vector that will contain all objects after running this function.
    GameData CurrentLine;
    string winningTeam;
    string tempString;
    string regionType;
    string teamOne;
    string teamTwo;
    int teamOneRank;
    int teamOneScore;
    int teamTwoRank;
    int teamTwoScore;
    int roundNumber;
    int gameNumber;
    stringstream inputString(tempString); // for atoi
    ifstream inputFile; // to open file
    inputFile.open(csvChoice); //open specific csv file
    getline(inputFile, tempString, '\n'); // Skip over label row
    while (inputFile.good()) { // Loop until nothing left to be read.
        // Get file contents into specific variables.
        getline(inputFile, regionType, ',');
        // for int vars, put into a temp string then
        // convert using atoi and assign to specific var.
        getline(inputFile, tempString, ',');
        teamOneRank = atoi(tempString.c_str());
        getline(inputFile, teamOne, ',');
        getline(inputFile, tempString, ',');
        teamOneScore = atoi(tempString.c_str());
        getline(inputFile, tempString, ',');
        teamTwoRank = atoi(tempString.c_str());
        getline(inputFile,teamTwo, ',');
        getline(inputFile, tempString, ',');
        teamTwoScore = atoi(tempString.c_str());
        getline(inputFile,winningTeam, ',');
        getline(inputFile, tempString, ',');
        roundNumber = atoi(tempString.c_str());
        getline(inputFile, tempString, '\n');
        gameNumber = atoi(tempString.c_str());
        // Assign variables to CurrentLine object and use fully qualified constructor to set values.
        CurrentLine = GameData(regionType, teamOneRank, teamOne, teamOneScore, teamTwoRank,
                               teamTwo, teamTwoScore, winningTeam, roundNumber, gameNumber);
        GameDataVector.push_back(CurrentLine); // Push current line's object into vector.
    }
    GameDataVector.pop_back(); // Last object is blank, so pop_back() it.
}

void overallInformation(vector<GameData>& GameDataVector, string csvFileChoice) {
    // This function displays the # of games played and final game teams.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    // csvFileChoice :: This parameter is a string for when checking the 1st char ('m' or 'w') that will indicate male or female regions.
    cout << "Total number of games played in tournament: " << GameDataVector.size() << endl;
    cout << "The Final Four contestants are:" << endl;
    if (csvFileChoice[0] == 'm') { // mens csv file path
        cout << "        West region:    " << GameDataVector.at(1).getTeamOne() << endl;
        cout << "        South region:   " << GameDataVector.at(2).getTeamOne() << endl;
        cout << "        East region:    " << GameDataVector.at(1).getTeamTwo() << endl;
        cout << "        Midwest region:   " << GameDataVector.at(2).getTeamTwo() << "\n\n\n";
        return;
    }
    // else block: (womens csv file path)
    cout << "\tGreensboro region:\t" << GameDataVector.at(1).getTeamOne() << endl;
    cout << "\tWichita region:\t" << GameDataVector.at(1).getTeamTwo() << endl;
    cout << "\tSpokane region:\t" << GameDataVector.at(2).getTeamOne() << endl;
    cout << "\tBridgeport region:\t" << GameDataVector.at(2).getTeamTwo() << "\n\n\n";
}

void winningTeamPath(vector<GameData>& GameDataVector) {
    // This function gets the winning team string and checks the path in order from game 1 to the championship and prints them.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    string winningTeam = GameDataVector.at(0).getWinningTeam(); // element 0 is championship so will give tournment winning team.
    int roundCount = 0;
    GameData LoopObject; // Loop object to shorten code (would have to type GameDataVector.at(i) in place of just LoopObject)
    cout << "Path to the championship:" << endl;
    for (int j = 0; j < 6; ++j) { // 6 games to check.
        for (auto & i : GameDataVector) { // Loop through all games to check path.
            if (i.getWinningTeam() == winningTeam && i.getRoundNumber() == roundCount + 1) { // Championship team winner game match (roundcount starts at 0 so +1).
                LoopObject = i;
                roundCount++;
                cout << "Round " << roundCount << ", Game " << LoopObject.getGameNumber() << ": " << LoopObject.getTeamOne() << " vs " <<
                     LoopObject.getTeamTwo() << ". Winner: " << winningTeam << endl;
                break;
            }
        }
    }
    cout << endl;
}

void finalFourCase(vector<GameData>& GameDataVector) {
    // This function is used in the regionExpectToWin function and is nearly identical except its used when checking
    // the final four round because the region for each team isn't listed, so we must loop through until the expected team
    // matches with its region.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    int highestRank = 1000; // high number to be replaced.
    string highestRankedTeam;
    string winningTeam;
    string region;
    GameData LoopObject;
    for (int i = 2; i > 0; --i) { // Loop from row 2 to row 1 (final four games).
        LoopObject = GameDataVector.at(i);
        winningTeam = LoopObject.getWinningTeam();
        if (winningTeam == LoopObject.getTeamOne() && LoopObject.getTeamOneRank() <= highestRank) { // find the highest ranked team
            highestRank = LoopObject.getTeamOneRank(); // int assignment of rank.
            highestRankedTeam = LoopObject.getTeamOne(); // string assignment of the highest ranked team.
        }
        else if (winningTeam == LoopObject.getTeamTwo() && LoopObject.getTeamTwoRank() <= highestRank) { // find the highest ranked team
            highestRank = LoopObject.getTeamTwoRank();
            highestRankedTeam = LoopObject.getTeamTwo();
        }
    }
    // After finding the highest ranked team in final four rows we now look for that team's region in the rest of the vector.
    for (int i = 3; i < GameDataVector.size(); ++i) { // Starting on index 3 for actual regions
        if (highestRankedTeam == GameDataVector.at(i).getWinningTeam()) {
            region = GameDataVector.at(i).getRegionType();
            break;
        }
    }
    cout << "The region expected to win is: " << region << "\n\n";
}

void regionExpectedToWin(vector<GameData>& GameDataVector) {
    // This function looks for the region with the best ranked teams (closest to 1) and prints the region that team is from.
    // This sums up a region's winning team's ranks and finds the highest ranked region.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    GameData LoopObject;
    string winningTeam;
    string winningRegion;
    string regionType = "";
    int highestRank = 1000; // high number to be replaced.
    int sum = 1001;
    int userRoundChoice;
    cout << "Enter a round to be evaluated: \n"
            "   Select 2 for round 2\n"
            "   Select 3 for round 3 'Sweet 16'\n"
            "   Select 4 for round 4 'Elite 8'\n"
            "   Select 5 for round 5 'Final 4'\n"
            "Your choice --> ";
    cin >> userRoundChoice;
    cout << "Analyzing round " << userRoundChoice << "..." << "\n\n";
    if (userRoundChoice == 5) { // This calls the finalFourCase function that requires more specific loop handling.
        finalFourCase(GameDataVector); // Special cases
        return;
    }
    for (auto & i : GameDataVector) {
        if (i.getRoundNumber() == userRoundChoice) { // Only check user's round choice.
            if (i.getRegionType() != regionType) { // new region found (intially regionType is "" so will enter this if block).
                regionType = i.getRegionType();
                if (sum < highestRank) { // new highest ranked region (intially sum is 1001 and highestRank is 1000 so will not enter this if block).
                    highestRank = sum; // int assignment of lowest/best ranked team.
                    winningRegion = LoopObject.getRegionType(); // string assignment of winning region string.
                }
                sum = 0; // new region so we must reset sum.
            }
            LoopObject = i;
            winningTeam = LoopObject.getWinningTeam(); // get current region's winning team of current row.
            if (winningTeam == LoopObject.getTeamOne()) { // teamOne winning team path.
                sum += LoopObject.getTeamOneRank(); // summation of winning team rank.
            }
            else { // teamTwo winning team path.
                sum += LoopObject.getTeamTwoRank(); // summation of winning team rank.
            }
        }
    }
    // Midwest check (Midwest isn't checked during the loop because we can't enter the block that checks if this region
    // is a new highest ranked team due to there not being a new region string to enter the if block on line 232)
    if (sum < highestRank) {
        winningRegion = LoopObject.getRegionType();
    }
    cout << "The region expected to win is: " << winningRegion << "\n\n";
}

void bestUnderdog(vector<GameData>& GameDataVector) {
    // This function finds the best underdog team by prompting the user to enter a round to search and this function will
    // find the team with the worst rank in the chosen round.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    GameData LoopObject;
    string underDogTeam;
    int userRoundChoice;
    int worstRank = 0; // higher rank = worse rank, so rank 0 will be replaced immediately.
    cout << "Enter a round to be evaluated: \n"
            "   Select 2 for round 2\n"
            "   Select 3 for round 3 'Sweet 16'\n"
            "   Select 4 for round 4 'Elite 8'\n"
            "   Select 5 for round 5 'Final 4'\n"
            "   Select 6 for round 6 'Championship'\n"
            "Your choice --> ";
    cin >> userRoundChoice;
    cout << "The best underdog team is ";
    for (auto & i : GameDataVector) { // loop through all rows
        if (i.getRoundNumber() == userRoundChoice) { // only check user's round choice.
            LoopObject = i; // assign loop object to current object at index i in GameDateVector.
            if (LoopObject.getTeamOneRank() > worstRank) { // Team path one:
                worstRank = LoopObject.getTeamOneRank();
                underDogTeam = LoopObject.getTeamOne();
            }
            if (LoopObject.getTeamTwoRank() > worstRank) { // Team path two:
                worstRank = LoopObject.getTeamTwoRank();
                underDogTeam = LoopObject.getTeamTwo();
            }
        }
    }
    cout << underDogTeam << " which has rank " << worstRank << ".\n\n";
}

void closenessInPoints(vector<GameData>& GameDataVector) {
    // The function prompts the user to choose a round to search and prints:
    // (1) The match with the smallest difference.
    // (2) The match with the largest difference.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    GameData LoopObject;
    GameData ShooIn; // Object from GameDataVector for printing
    GameData NailBiting; // Object from GameDataVector for printing
    int shooinIndex; // An index for checking the match in GameDataVector.
    int nailBitingIndex; // An index for checking the match in GameDataVector.
    int roundUserChoice;
    int highestDifference = 0; // Target is to find the largest value.
    int lowestDifference = 1000; // Target is to find the lowest value.
    int difference;
    cout << "Enter a round to be evaluated: \n"
            "   Select 1 for round 1\n"
            "   Select 2 for round 2\n"
            "   Select 3 for round 3 'Sweet 16'\n"
            "   Select 4 for round 4 'Elite 8'\n"
            "   Select 5 for round 5 'Final 4'\n"
            "   Select 6 for round 6 'Championship'\n"
            "   Select 7 for the overall tournament\n"
            "Your choice --> ";
    cin >> roundUserChoice;
    if (roundUserChoice != 7) { // round 7 has a different message.
        cout << "Analyzing round " << roundUserChoice << "..." << "\n\n";
    }
    else { // different message for searching entire tournament :
        cout << "Analyzing the overall tournament..." << "\n\n";
    }
    for (int i = GameDataVector.size() - 1; i >= 0 ; --i) { // Loop through vector in reverse.
        if (GameDataVector.at(i).getRoundNumber() == roundUserChoice || roundUserChoice == 7) { // Match userRoundChoice
            // and if userChoice == 7 then search entire loop.
            LoopObject = GameDataVector.at(i);
            difference = abs(LoopObject.getTeamOneScore() - LoopObject.getTeamTwoScore()); // Difference calculation.
            if (difference >= highestDifference) { // shoo-in path:
                highestDifference = difference;
                shooinIndex = i;
            }
            if (difference <= lowestDifference) { // nail-biting path:
                lowestDifference = difference;
                nailBitingIndex = i;
            }
        }
    }
    // Assign objects to their respective indices from the GameDataVector vector.
    ShooIn = GameDataVector.at(shooinIndex);
    NailBiting = GameDataVector.at(nailBitingIndex);
    // Printing the two games:
    cout << "The shoo-in game was: \n"
            "Round " << ShooIn.getRoundNumber() << ", Game " << ShooIn.getGameNumber() << ": " << ShooIn.getTeamOne() << " vs " <<
         ShooIn.getTeamTwo() << ". Winner: " << ShooIn.getWinningTeam() << "\nThe difference was " << highestDifference << " points." << "\n\n";
    cout << "The nail-biting game was: \n"
            "Round " << NailBiting.getRoundNumber() << ", Game " << NailBiting.getGameNumber() << ": " << NailBiting.getTeamOne() << " vs " <<
         NailBiting.getTeamTwo() << ". Winner: " << NailBiting.getWinningTeam() << "\nThe difference was " << lowestDifference << " points." << "\n\n\n";
}

void comparePredictions(vector<GameData>& GameDataVector) {
    // This function prompts the user to enter a csv path string and this function will search the file and create a similar
    // vector to the GameDataVector called PredictionsVector with the user enter csv file contents.
    // This function will then compare the vectors to see how many correct winning teams matched between the two vectors.
    // There is a score system where each correct prediction is 5 points and the score being above 250 is considered good predictions.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    vector<GameData> PredictionsVector;
    GameData LoopObjectActual;
    GameData LoopObjectPrediction;
    string csvChoice;
    int correctPredictionCount = 0;
    int score = 0;
    cout << "Enter the name of the file with your predicted brackets:" << endl;
    cin >> csvChoice;
    convertDataToObject(csvChoice, PredictionsVector); // conversion of user prompted csv file.
    for (int i = 0; i < GameDataVector.size(); ++i) { // Loop through GameDataVector (will compare objects at same indices between Predictions and Actual vectors).
        LoopObjectActual = GameDataVector.at(i);
        LoopObjectPrediction = PredictionsVector.at(i);
        if (LoopObjectActual.getWinningTeam() == LoopObjectPrediction.getWinningTeam()) { // The prediction was correct:
            ++correctPredictionCount;
            score += LoopObjectActual.getRoundNumber() * 5; // increment score.
        }
    }
    cout << "You correctly predicted the winner for " << correctPredictionCount << " games." << endl;
    cout << "This means that you have a score of " << score << "." << endl;
    if (score >= 250) {
        cout << "Great job! You could consider entering your predictions to win money!\n\n";
        return;
    }
    cout << "You may want to learn more about basketball to improve your predictions next year.\n\n";
}

void displayWelcomeMessage() {
    // Welcome message that is required at the start of the program.
    // Prompts the user to enter the csv file path to create an object vector for.
    cout << "Program 5: March Madness Frenzy\n"
            "CS 141, Spring 2022, UIC\n"
            "\n"
            "This program reads in data from NCAA Basketball Tournaments (aka March Madness). "
            "It provides overall information regarding the data, allows you to see the path taken to the championship, "
            "uses rankings of teams to determine which region is expected to win at a given round and to find the best underdog team, "
            "and calculates point differences within the games. You can also compare the actual brackets to your own predictions!\n\n"
            "Enter the name of the file with the data for the NCAA tournament: \n";
}

void menuOptions(vector<GameData>& GameDataVector, const string& csvFileChoice) {
    // This function loops prompted menu options that the user picks and runs the chosen function using the vector built
    // from the csv file the user supplied.
    // GameDataVector :: This parameter is a passed by reference vector that contains all objects and its data.
    // csvFileChoice :: This parameter is a passed by reference string that is the string the user entered for the file choice.
    int menuOptionChoice;
    bool exitProgram = false;
    while (!exitProgram) { // Loop enter menu option 7:
        cout << "Select a menu option: \n"
                "   1. Display overall information about the data\n"
                "   2. Display the path of the winning team to the championship\n"
                "   3. Determine which region is expected to win the championship based on a given round\n"
                "   4. Identify the best underdog within a given round\n"
                "   5. Find the shoo-in and nail-biting games within a given round, or overall\n"
                "   6. Compare the actual brackets to your predicted brackets\n"
                "   7. Exit\n"
                "Your choice --> ";
        cin >> menuOptionChoice;
        switch (menuOptionChoice) {
            // Menu options 1-7 + a default path if a value that isn't valid is entered.
            case 1:
                overallInformation(GameDataVector, csvFileChoice);
                break;
            case 2:
                winningTeamPath(GameDataVector);
                break;
            case 3:
                regionExpectedToWin(GameDataVector);
                break;
            case 4:
                bestUnderdog(GameDataVector);
                break;
            case 5:
                closenessInPoints(GameDataVector);
                break;
            case 6:
                comparePredictions(GameDataVector);
                break;
            case 7: // Only program exit path:
                exitProgram = true;
                break;
            default: // Invalid path:
                cout << "Invalid value.  Please re-enter a value from the menu options below.\n\n";
                break;
        }
    }
    cout << "Exiting program...";
}

int main() {
    // This is the main function that prompts the user to enter a string file path of a csv file to create a vector of.
    // The vector use objects of the class GameData which will be used to analyze the vector's data using function options.
    // The main function will then call the menu options function which will continue the program.
    string csvFileChoice;
    vector<GameData> GameDataVector;
    displayWelcomeMessage();
    cin >> csvFileChoice;
    convertDataToObject(csvFileChoice, GameDataVector);
    menuOptions(GameDataVector, csvFileChoice);
    return 0;
}
