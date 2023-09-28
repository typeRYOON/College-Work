/* -----------------------------------------------------------------------------------------
Program 3: Best Wordle Words

Course: CS 211, Fall 2022. Thursday 10am lab
System: Windows 10 using CLion and minGW-w64
Author: Ryan Magdaleno (rmagd2)

Description: This program is based off of the game Wordle. The point of Wordle is to
guess the correct word, but this program looks at all possible answers and looks to
find the best possible 1st and 2nd words in the official wordle answer/guess list.
Make sure to have the 4 bundled text files with the words.
----------------------------------------------------------------------------------------- */
// Preproccesor directives - IDE (CLion w/ minGW-w64) warning omissions and library imports:
#pragma clang diagnostic push
#pragma clang diagnostic push
#pragma ide diagnostic ignored "DanglingPointer"
#pragma ide diagnostic ignored "cert-err34-c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define True 1
#define False 0


struct Word {
    // Used in the data structure for storing words into an array of this type of struct.
    int score;  // Higher score = higher value word for 1st/2nd word
    int guessWord;  // 1 or 0, 1 indicates a guess word, 0 else, used for sorting answer words to back of array.
    char* word;  //  A char array for the word string.
};


void getWordCount(char answerFileName[81], int* answerCounter, char guessFileName[81], int* guessCounter) {
    /** This function takes in the answer & guess text file names and opens their respective files and counts the amount
    of words present in them.
    @param answerFileName[81]: A char array that stores the current answer text file directory.
    @param answerCounter: An int that stores the amount of words in the answer txt file.
    @param guessFileName[81]: A char array that stores the current guess text file directory.
    @param guessCounter: An int that stores the amount of words in the guess txt file.
    @return: Void
    */
    FILE* inFilePtr = fopen(answerFileName, "r");  // Open answer txt file.
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", answerFileName);
        exit(-1);
    }
    char inputString[81];  // Used for looping through both files.
    while(fscanf(inFilePtr, "%s", inputString) != EOF) {
        (*answerCounter)++;
    }
    fclose(inFilePtr);  // Close answer txt file.

    inFilePtr = fopen(guessFileName, "r");  // Open guess txt file.
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", guessFileName);
        exit(-1);
    }
    while(fscanf(inFilePtr, "%s", inputString) != EOF) {
        (*guessCounter)++;
    }
    fclose(inFilePtr);  // Close guesses txt file.
}


struct Word* mallocStruct(int totalWordCount) {
    /** This function creates a array of structs of type Word and allocates dynamic space for the structs and
    char array present in each, returns a pointer to this space. Is dynamic because of changing word amount.
    @params totalWordCount: An int that is the amount of words in the answer and guess text files.
    @return A pointer to the first element of this dynamic array of structs of type Word.
    */
    struct Word* allWords = malloc(totalWordCount * sizeof(struct Word));  // Malloc array of Word structs.
    for (int i = 0; i < totalWordCount; ++i) {  // Malloc the strings within each struct.
        allWords[i].word = malloc(sizeof(char*));
    }
    return allWords;
}


void assignStruct(char answerFileName[81], char guessFileName[81], struct Word* allWords) {
    /** This function reads the guess file first, stores them in the allWords array of structs.
    We then read the answer file and store them after the guess words in the allWords array.
    Scores are set to 0, guess words have a 1 indicator (used for sorting them to front of array
    later in program), answer words have a 0 indicator.
    @param answerFileName[81]: A char array that stores the current answer text file directory.
    @param guessFileName[81]: A char array that stores the current guess text file directory.
    @param allWords: A dynamic array of Word structs.
    @return Void
    */
    FILE* inFilePtr = fopen(guessFileName, "r");  // Open answer txt file.
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", guessFileName);
        exit(-1);
    }
    int i = 0;
    while(fscanf(inFilePtr, "%s", allWords[i].word) != EOF) {  // For each ith struct, set up like so:
        allWords[i].score = 0;
        allWords[i].guessWord = True;
        i++;
    }
    fclose(inFilePtr);  // Close guess txt file.

    inFilePtr = fopen(answerFileName, "r");  // Open answer txt file.
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", guessFileName);
        exit(-1);
    }
    while(fscanf(inFilePtr, "%s", allWords[i].word) != EOF) {  // For each ith struct, set up like so:
        allWords[i].score = 0;
        allWords[i].guessWord = False;
        i++;
    }
    fclose(inFilePtr);  // Close answer txt file.
}


void displayMenu() {
    /** This function displays the program menu.
    @return Void
    */
    printf("\n"
           "Menu Options:\n"
           "  1. Display best first words only\n"
           "  2. Display best first and best second words\n"
           "  3. Change answers and guesses filenames\n"
           "  4. Exit\n"
           "Your choice: ");
}


int scoreGetter(const char* curScoreWord, const char* curAnswerWord) {
    /** This function takes in two word strings of length 5. Compares the two words and returns a score.
    Comparison: +3 points if letter in same spot for both, +1 if letter is present in both but not in same spot.
    I made use of a table of size 26 (alphabet), this is a boolean table that indicates whether a letter has been seen
    already somewhere before in the string comparison.
    @param curScoreWord: The current word that is getting scored for, compares against curAnswerWord.
    @param curAnswerWord: The current answer word that is being compared against.
    @return An int, the score calculated based on the comparison of curScoreWord and curAnswerWord.
    */
    int score = 0, table[26] = {False};
    if (strcmp(curScoreWord, curAnswerWord) == 0)  // Same word so +15 (+3 * 5).
        return 15;
    for (int i = 0; i < 5; ++i) {  // For each letter in curScoreWord:
        for (int j = 0; j < 5; ++j) {  // For each letter in curAnswerWord:
            if (curScoreWord[i] != curAnswerWord[j] || curAnswerWord[j] == '_')  // Skip non-matching letters.
                continue;  // No letter matches.
            if (i == j) {  // +3 path.
                if (table[(int)curScoreWord[i] - 97]) {  // Letter was present already, --score.
                    score--;
                }
                table[(int)curScoreWord[i] - 97] = True;  // Set letter to true.
                score += 3;
                break;
            }
            else {  // +1 path.
                if (table[(int)curScoreWord[i] - 97]) {  // Letter was present already, skip.
                    continue;
                }
                table[(int)curScoreWord[i] - 97] = True;  // Set letter to true.
                score += 1;
            }
        }
    }
    return score;
}


int sortScores(const void* a, const void* b) {
    /** This function is for use in qsort function. Sorts in descending order based on score attribute
    of Word struct.
    @param a: The first element to be used in comparison.
    @param b: The second element to be used in comparison.
    @return Int, puts the two elements where it should go based on int value returned.
    */
    int firstScore = ((struct Word *) a)->score;
    int secondScore = ((struct Word *) b)->score;
    if (firstScore != secondScore) {
        return secondScore - firstScore;  // Return descending order sorted in place.
    }
    else {  // If equal scores, sort based on words.
        return strcmp(((struct Word *) a)->word, ((struct Word *) b)->word);
    }
}


int bestFirstWords(char answerFileName[81],
                   int answerCounter,
                   char guessFileName[81],
                   int guessCounter,
                   struct Word* allWords,
                   int printWords) {
    /** This function finds the first best word compared against answer words and displays it along with the score
    if there's a tie then it will display those extra ones aswell. Is menu option 1.
    Used in tandem with menu option 2 to find the first best words and use those to find the second best word for
    each first best word.
    @param answerFileName[81]: A char array that stores the current answer text file directory.
    @param answerCounter: An int that stores the amount of words in the answer txt file.
    @param guessFileName[81]: A char array that stores the current guess text file directory.
    @param guessCounter: An int that stores the amount of words in the guess txt file.
    @param allWords: A dynamic array of Word structs.
    @param printWords: A boolean 0 or 1 int, 1 to print last print message, 0 to not print them.
    @return int, Send topScore back, used for menu option 2 to continue in its respective function.
    */
    printf("%s has %d words\n%s has %d words\n",
           answerFileName, answerCounter, guessFileName, guessCounter);
    int totalWordCount = answerCounter + guessCounter;
    for (int i = 0; i < totalWordCount; ++i) {  // For each score word:
        for (int j = guessCounter; j < totalWordCount; ++j) {  // For each answer word:
            // Calculates score for score word (I loop) against each answer word (J loop)
            allWords[i].score += scoreGetter(allWords[i].word, allWords[j].word);
        }
    }
    // Sort scores in descending order:
    qsort(allWords, totalWordCount, sizeof(struct Word), sortScores);
    int topScore = allWords[0].score, i = 0;  // 0th element is always the highest element after qsort.
    if (printWords) {  // Menu option 1 print statements
        printf("\nWords and scores for top first words:\n");
        while (topScore == allWords[i].score) {  // Print all words matching the 0th element score.
            printf("%s %d\n", allWords[i].word, allWords[i].score);
            ++i;
        }
        printf("Done\n");
    }
    return topScore;  // Returns topScore to be used in menu option 2 if needed.
}


int blankOutAndScore(const char* curScoreWord, const char* curAnswerWord, const char* firstWord) {
    /** This function takes in two word strings of length 5. It blanks out curAnswerWord's letters with the firstWord
    letters first if they are in the same position, then if a letter is present in both but not in the same position.
    This function then uses the scoreGetter function to calculate the score of scoreWord against the newly blanked
    answer word.
    @param curScoreWord: The current word that is getting scored for, compares against curAnswerWord.
    @param curAnswerWord: The current answer word that is being compared against.
    @param firstWord: The first word (top scoring from menu option 1) that we want to blank each answer word with.
    @return An int, the score calculated based on the comparison of curScoreWord and curAnswerWord.
    */
    // Create copies of words we will be blanking (don't want original copies to be affected):
    char curAnswerWordCopy[6], firstWordCopy[6];
    strcpy(curAnswerWordCopy, curAnswerWord);
    strcpy(firstWordCopy, firstWord);

    for (int i = 0; i < 5; ++i) {  // Loop to blank out letters that are in same positions.
        if (curAnswerWord[i] == firstWordCopy[i]) {
            curAnswerWordCopy[i] = '_', firstWordCopy[i] = '_';
        }
    }
    for (int i = 0; i < 5; ++i) {  // For each answerWord's letter:
        for (int j = 0; j < 5; ++j) {  // For each firstWord's letter:
            // Blank out remaining letters that are present in both:
            if (curAnswerWordCopy[i] == firstWordCopy[j] && curAnswerWordCopy[i] != '_') {
                curAnswerWordCopy[i] = '_', firstWordCopy[j] = '_';
            }
        }
    }
    // Compare score word against this new answer word, return score:
    return scoreGetter(curScoreWord, curAnswerWordCopy);
}


int sortAnswersToFront(const void* a, const void* b) {
    /** This function is for use in qsort function. Sorts in descending order based on guessWord attribute
    of Word struct.
    GuessWord is either 1 or 0, This is so qsort will place answer words in the back of the array.
    @param a: The first element to be used in comparison.
    @param b: The second element to be used in comparison.
    @return Int, puts the two elements where it should go based on int value returned.
    */
    int first = ((struct Word *) a)->guessWord;
    int second = ((struct Word *) b)->guessWord;
    if (first != second) {  // Send guess word forward and answer word back.
        return second - first;
    }
    else {  // If both are guess words / both are answer words, sort based on word itself.
        return strcmp(((struct Word *) a)->word, ((struct Word *) b)->word);
    }
}


void bestTwoWords(char answerFileName[81], int answerCounter, char guessFileName[81], int guessCounter, struct Word* allWords) {
    /** This function finds the first best words and each of their second best words as well. Does menu option to find
    the best score which will indicate the best first words, stores those words into a auxiliary array. We now also
    blank out the letters of the first word in each of the answer words that are being compared against. This allows
    us to now simarily calculate the score like in menu option 1.
    @param answerFileName[81]: A char array that stores the current answer text file directory.
    @param answerCounter: An int that stores the amount of words in the answer txt file.
    @param guessFileName[81]: A char array that stores the current guess text file directory.
    @param guessCounter: An int that stores the amount of words in the guess txt file.
    @param allWords: A dynamic array of Word structs.
    @return Void.
    */
    // Get topScore from menu option 1:
    int topScore = bestFirstWords(answerFileName, answerCounter, guessFileName, guessCounter, allWords, False);
    int i = 0, firstWordCount = 0;
    while (allWords[i].score == topScore) {  // Get size for dynamic array
        ++firstWordCount, ++i;
    }
    struct Word* tempHold = malloc(sizeof(struct Word) * firstWordCount);  // Temp auxiliary dynamic array.
    for (i = 0; i < firstWordCount; ++i) {
        tempHold[i].word = malloc(sizeof(char*));
    }
    i = 0;
    while (allWords[i].score == topScore) {  // Store first word(s) and score(s) into temp array.
        tempHold[i].word = allWords[i].word;
        tempHold[i].score = topScore;
        ++i;
    }
    int totalWordCount = answerCounter + guessCounter;
    printf("\nWords and scores for top first words and second words:\n");
    for (i = 0; i < firstWordCount; ++i) {  // For each best first word:
        // Sort the answer words to the back so range is guessCounter to totalWordCount:
        qsort(allWords, totalWordCount, sizeof(struct Word), sortAnswersToFront);
        printf("%s %d\n", tempHold[i].word, tempHold[i].score);
        for (int j = 0; j < totalWordCount; ++j) {  // For each score word:
            allWords[j].score = 0;  // Reset past score calculations
            for (int k = guessCounter; k < totalWordCount; ++k) {  // For each answer word:
                // Score the current score word against each answer word:
                allWords[j].score += blankOutAndScore(allWords[j].word, allWords[k].word, tempHold[i].word);
            }
        }
        // Sort scores in decending order.
        qsort(allWords, totalWordCount, sizeof(struct Word), sortScores);
        topScore = allWords[0].score;  // Best score is 0th element.
        int j = 0;
        while (allWords[j].score == topScore) {  // Print all words matching the 0th element's score.
            printf("   %s %d", allWords[j].word, allWords[j].score);
            ++j;
        }
        printf("\n");
    }
    free(tempHold);  // Free auxiliary dynamic array.
    printf("Done\n");
}


int main() {
    /** This is the main function that sets up the initial dynamic array of Word structs to be used in the menu option
    functions. Main also will give the user a menu to choose from and will run their desired menu option function.
    @return int, 0 indicating a good program run.
    */
    char answerFileName[81] = "answersTiny.txt", guessFileName[81] = "guessesTiny.txt";  // Default file names.
    int answerCounter = 0, guessCounter = 0, menuOption = 0;
    getWordCount(answerFileName, &answerCounter, guessFileName, &guessCounter);  // Get word counts.
    printf("Default file names are %s and %s\n", answerFileName, guessFileName);
    // Initial dynamic array of Word structs set-up:
    int totalWordCount = answerCounter + guessCounter;
    struct Word* allWords = mallocStruct(totalWordCount);  // Create array of structs.
    assignStruct(answerFileName, guessFileName, allWords);  // Assign word values to array.
    while (menuOption != 4) {
        displayMenu();
        scanf("%d", &menuOption);
        switch (menuOption) {

            case 1:  // Find the best 1st word(s) path:
                bestFirstWords(answerFileName, answerCounter, guessFileName, guessCounter, allWords, True);
                free(allWords);  // Free remaining heap memory.
                exit(0);  // Quick exit.

            case 2:  // Find the best 1st and 2nd word(s) path:
                bestTwoWords(answerFileName, answerCounter, guessFileName, guessCounter, allWords);
                free(allWords);  // Free remaining heap memory.
                exit(0);  // Quick exit.

            case 3:  // New files path:
                printf("Enter new answers and guesses filenames: ");
                scanf("%s %s", answerFileName, guessFileName);  // Get new file names.
                answerCounter = 0, guessCounter = 0;  // Reset word counters.
                getWordCount(answerFileName, &answerCounter, guessFileName, &guessCounter);  // Get word counters.
                totalWordCount = answerCounter + guessCounter;
                free(allWords);  // Free previous dynamic array.
                allWords = mallocStruct(totalWordCount);  // Create new dynamic array.
                assignStruct(answerFileName, guessFileName, allWords);  // Assign words and scores to allWords array.
                break;

            case 4:  // Exit path:
                free(allWords);  // Free remaining heap memory.
                printf("Done\n");
                break;

            default:  // Invalid case path:
                printf("Invalid path!");
                break;
        }
    }
    return 0;
}
