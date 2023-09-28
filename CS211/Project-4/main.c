/* -----------------------------------------------------------------------------------------
Program 4: Guess Wordle Word

Course: CS 211, Fall 2022. Thursday 10am lab
System: Windows 10 using CLion and minGW-w64
Author: Ryan Magdaleno (rmagd2)

Description: Wordle solver using the accompanying 12k wordset.
Sorry for the lack of comments, no style points = no comments.
Used parts from my project 3, made in a rush a day before due sorry if sloppy lol.

Structure for each guess round:
1. Create original word array with all 12k words
2. Use lucky as best starting guess word
3. Compare each guess against the secret word
4. Comparison takes data into arrays on stuff like:
		- If a letter perfectly matches in position, only keep words that have that letter in that position.
		- If a letter is mismatched in position, keep words that contain that letter, but not in that position.
		- If a letter doesn't match at all, remove words containing that letter.
5. Using that data now loop and check each word and flag if they are invalid against comparison data.
6. If a word was not marked as invalid, increment a counter to get the correct size for a new malloc array.
7. Malloc a array and loop through the old array and copy over if the word is not marked as invalid.
8. Free the old array memory block.
9. Get the next guess by simply using the median word.
10. Loop until you have an array of size 1 or the program lands on the secret word by chance.

Note for TA - I ran this program for every word and the max is 15, worst words are things like bills/zills.
----------------------------------------------------------------------------------------- */
// Preproccesor directives - IDE (CLion w/ minGW-w64) warning omissions and library imports:
#pragma clang diagnostic push
#pragma ide diagnostic ignored "DanglingPointer"
#pragma ide diagnostic ignored "cppcoreguidelines-narrowing-conversions"
#pragma ide diagnostic ignored "DanglingPointer"
#pragma ide diagnostic ignored "cert-msc51-cpp"
#pragma ide diagnostic ignored "cert-msc50-cpp"
#pragma ide diagnostic ignored "cert-err34-c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#define True 1
#define False 0


struct Word {
    int invalidWord;  
    char* word;
};


void getWordCount(char wordFileName[81], int* wordCounter) {
    FILE* inFilePtr = fopen(wordFileName, "r");  // Open answer txt file.
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", wordFileName);
        exit(-1);
    }
    char inputString[81];  // Used for looping through both files.
    while(fscanf(inFilePtr, "%s", inputString) != EOF) {
        (*wordCounter)++;
    }
    fclose(inFilePtr);  // Close answer txt file.
}


struct Word* mallocStruct(int wordCounter) {
    struct Word* allWords = malloc(wordCounter * sizeof(struct Word));  // Malloc array of Word structs.
    for (int i = 0; i < wordCounter; ++i) {  // Malloc the strings within each struct.
        allWords[i].word = malloc(sizeof(char*));
    }
    return allWords;
}


void assignStruct(char wordFileName[81], struct Word* allWords) {
    FILE* inFilePtr = fopen(wordFileName, "r");  // Open word txt file.
    int i = 0;
    if (inFilePtr == NULL) {  // Error opening the file.
        printf("Error: could not open %s for reading\n", wordFileName);
        exit(-1);
    }
    while(fscanf(inFilePtr, "%s", allWords[i].word) != EOF) {  // For each ith struct, set up like so:
        allWords[i++].invalidWord = False;
    }
    fclose(inFilePtr);  // Close answer txt file.
}


int compareWords(char guessWord[6],
                 char secretWord[6],
                 int positions[199],
                 char letters[199],
                 int* posCounter,
                 char charTable[199],
                 int badPos[199],
                 int* badPosCounter,
                 char badLetters[26],
                 int* badLetCounter) {
    if (strcmp(guessWord, secretWord) == 0)
        return True;
    char astStr[] = "     ";
    char secretCopy[6];
    char guessCopy[6];
    strcpy(secretCopy, secretWord);
    for (int i = 0; i < 5; ++i) {
        if (guessWord[i] == secretCopy[i]) {
            letters[*posCounter] = guessWord[i];
            positions[*posCounter] = i;
            (*posCounter)++;
            guessWord[i] = toupper(guessWord[i]);
            secretCopy[i] = toupper(secretCopy[i]);
        }
    }
    strcpy(guessCopy, guessWord);
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            if (i == j)
                continue;
            if (guessWord[i] == secretCopy[j] && islower(guessWord[i])) {
                astStr[i] = '*';
                charTable[*badPosCounter] = guessWord[i];
                badPos[*badPosCounter] = i;
                (*badPosCounter)++;
                guessCopy[i] = toupper(guessCopy[i]);
                secretCopy[j] = toupper(secretCopy[j]);
            }
        }
    }
    for (int i = 0; i < 5; ++i) {
        int badFlag = False;
        if (isupper(guessCopy[i])) {
            continue;
        }
        for (int j = 0; j < *badLetCounter; ++j) {  // Check if in badLetters array
            if (guessCopy[i] == badLetters[j]) {
                badFlag = True;
                break;
            }
        }
        for (int j = 0; j < 5; ++j) {
            if (i == j)
                continue;
            if (guessCopy[i] == tolower(guessCopy[j]))
                badFlag = True;
        }

        if (!badFlag) { // add to badLetters array
            badLetters[*badLetCounter] = guessCopy[i];
            (*badLetCounter)++;
        }
    }
    for (int i = 0; i < 5; ++i) {
        printf("%c ", guessWord[i]);
    }
    printf("\n       ");
    for (int i = 0; i < 5; ++i) {
        printf("%c ", astStr[i]);
    }
    printf("\n");
    return False;
}


void findSecretWord(struct Word* allWords, int wordCounter, char secretWord[6]) {
    int guessCounter = 1;
    printf("Trying to find secret word: \n       ");
    for (int i = 0; i < 5; ++i) {
        printf("%c ", secretWord[i]);
    }
    printf("\n\n");
    char guessWord[6];
    if (wordCounter > 11) {
        strcpy(guessWord, allWords[6504].word);  // lucky 6504
        allWords[6504].invalidWord = True;
    }
    else {
        strcpy(guessWord, allWords[1].word);
        allWords[1].invalidWord = True;
    }
    struct Word* tempVar = NULL;
    char letters[99];
    int positions[99];
    int posCounter = 0;

    char charTable[99];
    int badPos[99];
    int badPosCounter = 0;

    char badLetters[26];
    int badLetCounter = 0;
    while (True) {
        printf("    %d. ", guessCounter);
        if (compareWords(guessWord, secretWord, positions, letters, &posCounter, charTable, badPos, &badPosCounter, badLetters, &badLetCounter)) {
            for (int i = 0; i < 5; ++i) {
                printf("%c ", toupper(guessWord[i]));
            }
            printf("\n\nGot it!\n");
            free(allWords);
            return;
        }
        // use comparison data to filter words to find valid words
        int goodWords = 0;
        for (int i = 0; i < wordCounter; ++i) {
            for (int j = 0; j < posCounter; ++j) {  // Same letter position check
                if ((allWords[i].word)[positions[j]] != letters[j]) {
                    allWords[i].invalidWord = True;
                    break;
                }
            }
            for (int j = 0; j < badPosCounter; ++j) {  // Mismatched correct letter check
                if ((allWords[i].word)[badPos[j]] == charTable[j]) {
                    allWords[i].invalidWord = True;
                    break;
                }
            }
            for (int j = 0; j < badLetCounter; ++j) {  // Known invalid letter check
                for (int k = 0; k < 5; ++k) {
                    if ((allWords[i].word)[k] == badLetters[j]) {
                        allWords[i].invalidWord = True;
                    }
                }
            }
            for (int j = 0; j < badPosCounter; ++j) {  // Known letter in known bad position check
                int goodWord = False;
                for (int k = 0; k < 5; ++k) {
                    if ((allWords[i].word)[k] == charTable[j]) {
                        goodWord = True;
                        continue;
                    }
                }
                if (!goodWord) {
                    allWords[i].invalidWord = True;
                    break;
                }
            }
            if (allWords[i].invalidWord) {  // Don't count towards new array malloc size
                continue;
            }
            goodWords++;
        }
        // create new dynamic array with new valid words
        tempVar = mallocStruct(goodWords);
        int j = 0;
        for (int i = 0; i < wordCounter; ++i) {
            if (allWords[i].invalidWord == False) {
                tempVar[j].word = allWords[i].word;
                tempVar[j++].invalidWord = False;
            }
        }
        // free old array
        free(allWords);
        wordCounter = goodWords;
        allWords = tempVar;

        // Get new guessWord
        guessCounter++;
        strcpy(guessWord, allWords[wordCounter / 2].word);  // Use median of new array
        allWords[wordCounter / 2].invalidWord = True;
    }
}


int main() {
    srand((unsigned)time(NULL));
    char wordFileName[81] = "wordsLarge.txt";  // Default file names.
    int wordCounter = 0;
    getWordCount(wordFileName, &wordCounter);
    printf("Using file %s with %d words. \n", wordFileName, wordCounter);
    struct Word* allWords = mallocStruct(wordCounter);  // Create array of structs.
    assignStruct(wordFileName, allWords);  // Assign word values to array.

    char secretWord[6], userInput[81];
    for (int i = 0; i < 3; ++i) {
        printf("-----------------------------------------------------------\n\n"
               "Enter a secret word or just r to choose one at random: ");
        scanf(" %s", userInput);

        int length = (int)strlen(userInput);
        if (userInput[length] == '\n') {
            userInput[length] = '\0';
        }
        strcpy(secretWord, "");
        strcpy(secretWord, userInput);

        if (strlen(secretWord) <= 1) {
            int randomIndex = rand() % wordCounter;
            strcpy(secretWord, allWords[randomIndex].word);
        }
        findSecretWord(allWords, wordCounter, secretWord);
        if (i < 2) {  // Recreate original array of words
            allWords = mallocStruct(wordCounter);
            assignStruct(wordFileName, allWords);
        }
    }
    printf("Done");
    return 0;
}
