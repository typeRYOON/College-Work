/* ---------------------------------------------
Program 1: Wumpus (fixed size array)

Course: CS 211, Fall 2022. Thursday 10am lab
System: Windows 10 using CLion and minGW-w64
Author: Ryan Magdaleno (rmagd2)

Program description: 
This program is based on the 1972 Hunt the Wumpus text-game. The point of this program is to mimic
the original. There are three hazards in this program: two pits and wumpus which will be randomly placed at the start
of the program. The player will move around and try to find where the wumpus is while avoiding the three hazards. The
goal of the game is to correctly guess where the wumpus is. More detailed instructions can be found if the user enters
'D' when the program starts.
--------------------------------------------- */
// Preproccesor directives - IDE (CLion w/ minGW-w64) warning omissions and library imports:
#pragma ide diagnostic ignored "cppcoreguidelines-narrowing-conversions"
#pragma ide diagnostic ignored "cert-msc51-cpp"
#pragma ide diagnostic ignored "cert-msc50-cpp"
#pragma ide diagnostic ignored "cert-err34-c"
#pragma clang diagnostic push
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>


void initializeEdges(int edges[21][3], int curLocations[4]) {
    /** This function takes in a int array of size 21 x 3 to store all the adjacent rooms into each
    room's 2nd dimension array of size 3 (each room has 3 edges).
    curLocations stores the current positions within the maze.
    @param edges The int 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @return Void */
    int edgeCounter = 3, randomRoomNum;
    int edgesAlpha[] = {0, 0, 0,  // Skipping index 0 to get index 6 = room 6 for example.
                        2, 5, 8,  // 1
                        1, 3, 10,  // 2
                        2, 4, 12,  // 3
                        3, 5, 14,  // 4
                        1, 4, 6,  // 5
                        5, 7, 15,  // 6
                        6, 8, 17,  // 7
                        1, 7, 9,  // 8
                        8, 10, 18,  // 9
                        2, 9, 11,  // 10
                        10, 12, 19,  // 11
                        3, 11, 13,  // 12
                        12, 14, 20,  // 13
                        4, 13, 15,  // 14
                        6, 14, 16,  // 15
                        15, 17, 20,  // 16
                        7, 16, 18,  // 17
                        9, 17, 19,  // 18
                        11, 18, 20,  // 19
                        13, 16, 19};  // 20
    // Add edges to edges[i][0,1,2] for each room i.
    for (int i = 1; i < 21; ++i) {
        for (int j = 0; j < 3; ++j, ++edgeCounter)
            edges[i][j] = edgesAlpha[edgeCounter];  // edgeCounter -> (Room1: 3, 4, 5 -> Room2: 6, 7, 8 -> ...)
    }
    // Index positions in curLocations[4]: pit1 = 0, pit2 = 1, wumpus = 2, player = 3
    for (int i = 0; i < 4; ++i) {
        randomRoomNum = rand() % 20 + 1;
        curLocations[i] = randomRoomNum;
    }
}


void resetLocations(int curLocations[4]) {
    /** This function reads user input and changes the room positions of the hazards + player.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @return Void */
    printf("Enter the room locations (1..20) for player, wumpus, pit1, and pit2: \n");
    scanf(" %d %d %d %d", &curLocations[3], &curLocations[2], &curLocations[0], &curLocations[1]);
    printf("\n");
}


void cheatingOption(int curLocations[4]) {
    /** This function reads the curLocatons array and prints the current positions of hazards + player.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @return Void */
    printf("Cheating! Game elements are in the following rooms: \n"
           "Player Wumpus Pit1 Pit2  \n"
           "%4d %7d %5d %5d \n\n", curLocations[3], curLocations[2], curLocations[0], curLocations[1]);
}


void mazeRoom() {
    /** This function prints the maze diagram.
    @return Void */
    printf("\n"
           "       ______18______             \n"
           "      /      |       \\           \n"
           "     /      _9__      \\          \n"
           "    /      /    \\      \\        \n"
           "   /      /      \\      \\       \n"
           "  17     8        10     19       \n"
           "  | \\   / \\      /  \\   / |    \n"
           "  |  \\ /   \\    /    \\ /  |    \n"
           "  |   7     1---2     11  |       \n"
           "  |   |    /     \\    |   |      \n"
           "  |   6----5     3---12   |       \n"
           "  |   |     \\   /     |   |      \n"
           "  |   \\       4      /    |      \n"
           "  |    \\      |     /     |      \n"
           "  \\     15---14---13     /       \n"
           "   \\   /            \\   /       \n"
           "    \\ /              \\ /        \n"
           "    16---------------20           \n\n");
}


void directions() {
    /** This function prints the maze and instructions on how to play this game.
    @return Void */
    mazeRoom();
    printf("Hunt the Wumpus:                                             \n"
           "The Wumpus lives in a completely dark cave of 20 rooms. Each \n"
           "room has 3 tunnels leading to other rooms.                   \n"
           "                                                             \n"
           "Hazards:                                                     \n"
           "1. Two rooms have bottomless pits in them.  If you go there you fall and die.   \n"
           "2. The Wumpus is not bothered by the pits, as he has sucker feet. Usually he is \n"
           "   asleep. He will wake up if you enter his room. When you move into the Wumpus'\n"
           "   room, then he wakes and moves if he is in an odd-numbered room, but stays    \n"
           "   still otherwise.  After that, if he is in your room, he snaps your neck and  \n"
           "   you die!                                                                     \n"
           "                                                                                \n"
           "Moves:                                                                          \n"
           "On each move you can do the following, where input can be upper or lower-case:  \n"
           "1. Move into an adjacent room.  To move enter 'M' followed by a space and       \n"
           "   then a room number.                                                          \n"
           "2. Enter 'R' to reset the person and hazard locations, useful for testing.      \n"
           "3. Enter 'C' to cheat and display current board positions.                      \n"
           "4. Enter 'D' to display this set of instructions.                               \n"
           "5. Enter 'P' to print the maze room layout.                                     \n"
           "6. Enter 'G' to guess which room Wumpus is in, to win or lose the game!         \n"
           "7. Enter 'X' to exit the game.                                                  \n"
           "                                                                                \n"
           "Good luck!                                                                      \n\n\n");
}


void wumpusGuess(const int curLocations[4]) {
    /** This function takes user input to guess which room wumpus is in, you either win or lose if entering here.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @return Void */
    int userChoice;
    printf("Enter room (1..20) you think Wumpus is in: ");
    scanf(" %d", &userChoice);
    if (userChoice == curLocations[2])
        printf("You won!\n");
    else
        printf("You lost.\n");
}


void conditionCheck(int edges[21][3], int curLocations[4]) {
    /** This function prints the player's current room number. This checks if the player's current room is adjacent to any
    hazards, it checks for pits then wumpus. This prints a message if the player is near those hazards.
    @param edges The int 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @return Void */
    printf("You are in room %d. ", curLocations[3]);
    int wumpus = 0, pits = 0;  // Set to False
    for (int i = 0; i < 3; ++i) {  // Adjacent room check for hazards.
        if (edges[curLocations[3]][i] == curLocations[2])  // Wumpus
            wumpus = 1;
        else if (edges[curLocations[3]][i] == curLocations[0] || edges[curLocations[3]][i] == curLocations[1])  // Pits
            pits = 1;
    }
    if (wumpus)
        printf("You smell a stench. ");
    if (pits)
        printf("You feel a draft. ");
}


int validMoveCheck(int edges[21][3], int userStart, int userDest) {
    /** This function checks to see if the entered destination is connected to the player's room.
    @param edges The int 2D 21 x 3 array which holds all valid adjacent rooms.
    @param userStart The player's current room.
    @param userDest The user chosen room they want to move to.
    @return int 0 or 1, a boolean return to check if the start->dest move is valid. */
    for (int i = 0; i < 3; ++i) {
        if (edges[userStart][i] == userDest)  // If player's current room's adjacent rooms are userDest
            return 1;
    }
    return 0;  // Looped all three adjacent rooms and no match.
}


int checkHazards(int curLocations[4], int edges[21][3], int userDest) {
    /** This function checks if the player moved into a hazard room, first we check pits 1/2 then wumpus.
    If we moved into a wumpus room then if even room number kill player, else move wumpus to lowest adjacent free room.
    @param edges The int 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @param userDest The user chosen room they want to move to.
    @return int, 1 indicating death, 0 no death. */
    if ((userDest == curLocations[0]) || (userDest == curLocations[1])) {  // Pit 1 & 2 check
        printf("Aaaaaaaaahhhhhh....   \n    You fall into a pit and die. \n");
        return 1;
    }
    else if (curLocations[2] == userDest) {  // Wumpus check
        // Even wumpus room
        if (userDest % 2 == 0) {
            printf("You briefly feel a slimy tentacled arm as your neck is snapped. \nIt is over.\n");
            return 1;
        }
        // Odd wumpus room
        int i = 0, validRoom = 1, currentEdge, j;
        while (userDest == curLocations[2]) {  // Stop loop once wumpus moves
            printf("You hear a slithering sound, as the Wumpus slips away. \nWhew, that was close!\n");
            currentEdge = edges[userDest][i];  // Wumpus adjacent room i (0,1,2)
            for (j = 0; j < 2; ++j) {  // Check to see if the room is occupied by looping curLocations 0-1 for that room.
                if (curLocations[j] == currentEdge)
                    validRoom = 0;
            }
            if (validRoom)  // Room had no pits
                curLocations[2] = currentEdge;
            validRoom = 1;  // Reset boolean
            ++i;  // Increment i currentEdge to next adjacent room for next loop.
        }
    }
    return 0;  // No death
}


int movePlayer(int edges[21][3], int curLocations[4], int* moveCounter) {
    /** This function moves the player to the entered room, first check if valid connection, then check for hazards
    in the destination room, if lethal hazards then kill the player and end game. If no lethal hazards move player.
    @param edges The int 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int array which holds current pit1, pit2, wumpus, and player room positions in the order.
    @param moveCounter A int pointer that keeps track of valid moves.
    @return int, 1 is death, 0 is no death */
    int destinationRoom;
    scanf(" %d", &destinationRoom);
    if (validMoveCheck(edges, curLocations[3], destinationRoom)) {  // Valid edge
        if (checkHazards(curLocations, edges, destinationRoom))  // Lethal hazard
            return 1;  // Death
        curLocations[3] = destinationRoom;  // No lethal hazard, so move player to dest.
        ++(*moveCounter);
    }
    else {  // Not valid edge
        printf("Invalid move.  Please retry.\n");
    }
    return 0;  // No death
}


int main() {
    /** Main() is the driver function behind the program. We have a while loop indicating 1 iteration = 1 player choice
    We also initialize the seed for srand() and the edges / curLocations array which store the stucture of the maze.
    We prompt the user to enter a letter and that will takes us to their respective function/choice.
    @return int 0 indicating good program execution */
    int edges[21][3] = {0};
    int curLocations[4] = {0};
    int moveCounter = 1;
    char userChoice = ' ';
    srand(1);
    initializeEdges(edges, curLocations);

    while (userChoice != 'X') {
        conditionCheck(edges, curLocations);  // Print room # and check for adjacent hazards.

        printf("\n\n%d. Enter your move (or 'D' for directions): ", moveCounter);
        scanf(" %c", &userChoice);
        userChoice = toupper(userChoice);

        switch (userChoice) {
            case 'M':  // Move player
                if (movePlayer(edges, curLocations, &moveCounter))
                    userChoice = 'X';
                break;

            case 'R':  // Change hazard/player positions
                resetLocations(curLocations);
                break;

            case 'C':  // See current hazard/player positions
                cheatingOption(curLocations);
                break;

            case 'D':  // Print maze + directions
                directions();
                break;

            case 'P':  // Print maze
                mazeRoom();
                break;

            case 'G':  // Guess wumpus room
                wumpusGuess(curLocations);
                userChoice = 'X';
                break;

            case 'X':  // Exit program
                break;

            default:  // Non-valid letter.
                printf("Invalid move.  Please retry. \n");
        }
    }
    printf("\nExiting Program ...\n");
    return 0;
}
