/* ----------------------------------------------------------------------------
 >> Program: Music Library
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview: This project aims to replicate a music library. There are input
 >> files that contain albums, artists, and songs in the format specified by
 >> the bundled text files. The first thing to do would be to load in a music
 >> text file. The project allows for printing of stats, exporting, and
 >> searching for specific terms with + and - modifiers.
 >> More information in each function's docstring.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#include "helpers.cpp"
#include <sstream>
#include <map>
#include <set>
using namespace std;


void exportFile(map<string, map<string, set<string>>>& albumLibrary, string& exportFileName) {
    /** This function takes in the album library and a string that contains the user's preferred text file
    destination. The next step would be to run through the entire album library and write to the text file
    in alphabetical order. The resulting file should be able to become a input file for the load function.
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective album map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param exportFileName : A filename string the user enters after the export command.
        @return : void
    */
    exportFileName =  (exportFileName.empty()) ? "musicdatabase.txt" : exportFileName;
    fstream fileStream;
    fileStream.open(exportFileName, fstream::in | fstream::out | fstream::trunc);
    for (auto& albumMap : albumLibrary) {                           // Loop through album names.
        fileStream << albumMap.first << endl;
        for (auto const& artistName : albumMap.second["artist"]) {  // Loop through artist names.
            fileStream << artistName << endl;
        }
        for (auto const& songTitle : albumMap.second["song"]) {     // Loop through song names.
            fileStream << songTitle << endl;
        }
        fileStream << albumMap.first << endl;                       // Ending token for album block.
    }
    fileStream.close();
}


void load(map<string, map<string, set<string>>>& albumLibrary,
          set<string>& textFileNames,
          set<string>& totalArtists,
          string& inputFileName,
          int& totalSongCount) {
    /** This function takes in the command load followed by a inputFileName that will read the contents of that text
    file into the albumName library data structure. This function will also get a total song count and keep track of
    the unique artist names via a set.
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective albumName map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param textFileNames : A set that tracks the currently loaded text files, used to avoid duplicate loads.
        @param totalArtists : A set that stores all the artist names, the count is used in the stats function.
        @param inputFileName : A filename string to read.
        @param totalSongCount : A count that keeps tracks of the amount of songs, counts duplicates.
        @return : void
    */
    inputFileName = (inputFileName.empty()) ? "musicdatabase.txt" : inputFileName;
    fstream fileStream(inputFileName);
    string lineContents, albumName;
    bool artistReadMode = true;
    int fileSongCount = 0;
    if (!fileStream.is_open()) {
        cout << "Error: Could not open music library file - " << inputFileName << endl;
        return;
    }
    while (!fileStream.eof()) {
        getline(fileStream, lineContents);
        if (lineContents.empty()) {                                  // Case: Empty line read.
            break;
        }
        if (albumName.empty()) {                                     // New album block found.
            albumName = lineContents;
            continue;
        }
        else if (albumName == lineContents) {                        // End of album block found.
            artistReadMode = true;
            albumName.clear();
            continue;
        }
        if (artistReadMode && lineContents.substr(0, 3) == "01 ") {  // Song block found.
            artistReadMode = false;
        }
        if (artistReadMode) {                                        // Artist name set emplacement:
            albumLibrary[albumName]["artist"].emplace(lineContents);
            totalArtists.emplace(lineContents);
        }
        else {                                                       // Song name set emplacement:
            albumLibrary[albumName]["song"].emplace(lineContents);
            ++fileSongCount;
        }
    }
    if (textFileNames.count(inputFileName) == 0)                     // Add song count to total if new input file.
        totalSongCount += fileSongCount;
    textFileNames.emplace(inputFileName);
    fileStream.close();
}


void stats(map<string, map<string, set<string>>>& albumLibrary,
           const unsigned long long int& artistCount,
           const string& modifier,
           const int& songCount) {
    /** This function prints the stats of the currently loaded in music library. Stats include total album,
    unique artist, and song counts. If the modifier -d is present then it will print the entire music library
    in alphabetical order.
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective albumName map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param artistCount : A integer that has the total amount of unique artist names loaded.
        @param modifier : A string that may contain the mod -d which will allow printing of album.
        @param songCount : A integer that has the total amount of songs loaded in, duplicates allowed.
        @return : void
    */
    cout << "Overall Music Library Stats\n===========================" << endl;
    cout << "Total Records: " << albumLibrary.size() << endl;
    cout << "Total Unique Artists: " << artistCount << endl;
    cout << "Total Songs: " << songCount << endl << endl;
    if (modifier != "-d")
        return;
    cout << "Your Current Music Library Includes\n===================================" << endl;
    for (auto& albumMap : albumLibrary) {                           // Loop through albums:
        cout << albumMap.first << endl;
        for (const auto& artistName : albumMap.second["artist"]) {  // Loop through artist names:
            cout << " " << artistName << endl;
        }
        for (const auto& songTitle : albumMap.second["song"]) {     // Loop through song names:
            cout << "   " << songTitle << endl;
        }
    }
    cout << endl;
}


void strCopyAndLower(string& des, const string& src) {
    /** This function takes in a destination and source string.
    The function resizes the des string to the size of src.
    Then copies src into des, also lower cases des string function.
        @param des : A string that will get resized to the size of src, and copies src + lowers des.
        @param src : A string that will be copied into the des string.
        @return : void
    */
    int i = 0;
    des.resize(src.size());
    for (auto const& c : src) des[i++] = c;
    tolower(des);
}


set<string> albumSearch(const map<string, map<string, set<string>>>& albumLibrary, const set<string>& generalTerms) {
    /** This function searches the music library's album names and checks if any of the general terms are within it.
    The function will return a set that contains the albums that have the general terms.
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective albumName map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param generalTerms : A set that contains the non modifier terms.
        @return : set<string> | A set that contains the album results based on terms and modifiers.
    */
    string lowerCaseAlbumName;
    set<string> results;
    for (auto const& albumMap : albumLibrary) {                      // Loop through album names:
        strCopyAndLower(lowerCaseAlbumName, albumMap.first);
        for (auto const& genTerm : generalTerms) {                   // Loop through general terms:
            if (lowerCaseAlbumName.find(genTerm) != string::npos) {  // General term found in albumMap name.
                results.emplace(albumMap.first);
            }
        }
    }
    return results;
}


void generalAndMinusTermFilter(const set<string>& generalTerms,
                               const set<string>& minus,
                               const string& albumName,
                               set<string>& badAlbums,
                               set<string>& results,
                               string& title) {
    /** This function occurs while it is looping through the entire library. This function will check if the current
    song/artist has a general/minus term within it and will filter down the results set.
    If a general term is not present then that song should be removed, if a minus term is present then add to the
    badAlbums set to later remove all songs/artists with that album name.
        @param generalTerms : A set that contains the non modifier terms.
        @param minus : A set that contains the - modifier terms.
        @param albumName : A string that contains the album name on the curtain outer function loop iteration.
        @param badAlbums : A set that contains albums that have a song with a minus term in them.
        @param results : A set that contains the album results based on terms and modifiers.
        @param title : A string of either a artist / song, depends on search mode.
        @return : void
    */
    tolower(title);
    for (auto const& generalTerm : generalTerms) {
        if (title.find(generalTerm) != string::npos)       // General term found in song/artist title.
            results.emplace(albumName + "+-+-+" + title);  // Insert special token to split later.
    }
    for (auto const& minusTerm : minus) {
        if (title.find(minusTerm) != string::npos)         // Minus term found in song/artist title.
            badAlbums.emplace(albumName);
    }
}


set<string> songOrArtistSearch(map<string, map<string, set<string>>>& albumLibrary,
                        set<string>& generalTerms,
                        const set<string>& plus,
                        const set<string>& minus,
                        const string& searchMode) {
    /** This function will search the entire library and filter down into the results library based on the
    general/plus/minus terms specified in the modifiers. General/plus terms must be found in the song/artist, if a
    minus term is found then the whole album gets filtered out. Will eventually return a set containing the albums that
    should be printed or none. I swapped the filtered results between the results and generalTerms sets because the
    erase function would cause a segfault only on zyBooks (not on my local computer for some reason).
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective albumName map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param generalTerms : A set that contains the non modifier terms.
        @param plus : A set that contains the + modifier terms.
        @param minus : A set that contains the - modifier terms.
        @param searchMode : A string that contains the search type, can only be "artist" or "song".
        @return set<string> | A set that contains the album results based on terms and modifiers.
    */
    bool trim = searchMode == "song", notFiltered;  // Used to trim the first 3 chars if searchMode is song.
    set<string> badAlbums, results;
    string titleCopy;
    size_t i;
    for (auto& albumMap : albumLibrary) {
        for (auto const& title : albumMap.second[searchMode]) {
            titleCopy = (trim) ? title.substr(3, title.size() - 3) : title;
            generalAndMinusTermFilter(generalTerms, minus, albumMap.first, badAlbums, results, titleCopy);
        }
    }
    generalTerms.clear();                    // Reuse generalTerms set now that it's not needed.
    for (auto const& resultant : results) {  // # of loops depends on # of plus+minus mods/size of results.
        i = resultant.find("+-+-+");         // Find position to split string.
        titleCopy = resultant.substr(i + 5, resultant.size() - i - 5);
        strCopyAndLower(titleCopy, titleCopy);
        notFiltered = true;
        for (auto const& plusTerm : plus) {
            if (titleCopy.find(plusTerm) == string::npos) {    // + Term not found.
                notFiltered = false;
            }
        }
        if (notFiltered) generalTerms.emplace(resultant);
    }
    results.clear();                                           // Push result strings back into the results set.
    for (auto const& resultants : generalTerms) {
        notFiltered = true;
        for (auto const& albumName : badAlbums) {
            if (resultants.find(albumName) != string::npos) {  // Remove song/artist if a minus term album is found.
                notFiltered = false;
            }
        }
        if (notFiltered) results.emplace(resultants);
    }
    generalTerms.clear();             // Empty generalTerms for the final return.
    for (auto const& resultant : results) {
        i = resultant.find("+-+-+");  // Retrieve the album name from the final strings (ex: albumName+-+-+Title)
        generalTerms.emplace(resultant.substr(0, i));
    }
    return generalTerms;
}


void search(map<string, map<string, set<string>>>& albumLibrary, string& searchTerms) {
    /** This function allocates space for the plus, minus, generalTerms, and result sets that will be used
    in further functions. Will branch into different functions depending on if the search mode is for albums or
    for songs/artists. Will also lowercase all search terms.
        @param albumLibrary : A double nested map that contains two sets for storing artists/songs in their
                              respective albumName map. (ex: albumLibrary["ALBUM_NAME"]["song"].emplace(songString))
        @param searchTerms : A string that has the search mode and modifiers (ex: album taylor -swift)
        @return : void
    */
    if (searchTerms.empty()) {
        cout << "Error: Search terms cannot be empty.\nNo results found.\n" << endl;
        return;
    }
    set<string> generalTerms, plus, minus, results;
    stringstream strStream(trimWhiteSpace(searchTerms));
    string searchMode, res;
    getline(strStream, searchMode, ' ');              // First term is search type (ex: album, song, artist)
    while (getline(strStream, res, ' ')) {            // Loop to add search terms to respective sets:
        tolower(res);
        if (res[0] == '+')
            plus.emplace(res.substr(1, res.size() - 1));
        else if (res[0] == '-')
            minus.emplace(res.substr(1, res.size() - 1));
        else
            generalTerms.emplace(res);
    }
    if (searchMode == "album") {
        results = albumSearch(albumLibrary, generalTerms);
    }
    else if (searchMode == "song" || searchMode == "artist") {
        results = songOrArtistSearch(albumLibrary, generalTerms, plus, minus, searchMode);
    }
    else return;
    if (results.empty()) {
        cout << "No matching results." << endl;
        return;
    }
    cout << "Your search results exist in the following albums: " << endl;
    for (auto const& albumName : results)
        cout << albumName << endl;
    cout << endl;
}


int main() {
    /** This is the main function that sets up the starting containers to be used in further functions.
    There is also a menu printed that will lead to the entered function.
        @return : int | 0 indicates a good execution.
    */
    cout << "Welcome to the Music Library App\n--------------------------------" << endl;
    map<string, map<string, set<string>>> musicLibrary;
    string userEntry, command, remains;
    set<string> artistSet, textFiles;
    int songCount = 0;
    do {
        cout << "\nEnter a command (help for help): " << endl;
        getline(cin, userEntry);
        splitFirstWord(userEntry, command, remains);
        tolower(command);
        cout << endl;

        if (command == "help") {
            helpCommand();
        }
        else if (command == "clear") {
            musicLibrary.clear();
            artistSet.clear();
            songCount = 0;
        }
        else if (command == "export") {
            exportFile(musicLibrary, remains);
        }
        else if (command == "load") {
            load(musicLibrary, textFiles, artistSet ,remains, songCount);
        }
        else if (command == "stats") {
            stats(musicLibrary, artistSet.size(), remains, songCount);
        }
        else if (command == "search") {
            search(musicLibrary, remains);
        }
    } while (command != "exit");
    cout << "Thank you for using the Music Library App" << endl;
    return 0;
}