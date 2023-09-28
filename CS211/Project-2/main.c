/* ---------------------------------------------
Program 2: Wumpus (dynamic array version)

Course: CS 211, Fall 2022. Thursday 10am lab
System: Windows 10 using CLion and minGW-w64
Author: Ryan Magdaleno (rmagd2)

Program description:
This program is based on the 1972 Hunt the Wumpus text-game. The point of this program is to mimic
the original. There are three hazards in this program: two pits and wumpus which will be randomly placed at the start
of the program. The player will move around and try to find where the wumpus is while avoiding the three hazards. The
goal of the game is to correctly guess where the wumpus is. More detailed instructions can be found if the user enters
'D' when the program starts. This version also includes superbats which will send the player to a random room. This
version also includes an arrow to shoot the Wumpus with. (All arrays are dynamic in this version and no normal arrays allowed).
--------------------------------------------- */
// Preproccesor directives - IDE (CLion w/ minGW-w64) warning omissions and library imports:
#pragma ide diagnostic ignored "cppcoreguidelines-narrowing-conversions"
#pragma ide diagnostic ignored "misc-no-recursion"
#pragma ide diagnostic ignored "cert-msc51-cpp"
#pragma ide diagnostic ignored "cert-msc50-cpp"
#pragma ide diagnostic ignored "cert-err34-c"
#pragma clang diagnostic push
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>


void initializeEdges(int **edges, int *curLocations) {
    /** This function takes in a int dynamic array of size 21 x 3 to store all the adjacent rooms into each
    room's 2nd dimension array of size 3 (each room has 3 edges). The edges are all ordered ascending for each room.
    curLocations will store the generated numbers (1-20) as each piece's room number, checks for duplicates.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return Void
    */
    edges[0][0] = 0,   edges[0][1] = 0,   edges[0][2] = 0,    // Room 0 (Skip idx 0, so we can have idx match room num)
    edges[1][0] = 2,   edges[1][1] = 5,   edges[1][2] = 8,    // Room 1
    edges[2][0] = 1,   edges[2][1] = 3,   edges[2][2] = 10,   // Room 2
    edges[3][0] = 2,   edges[3][1] = 4,   edges[3][2] = 12,   // Room 3
    edges[4][0] = 3,   edges[4][1] = 5,   edges[4][2] = 14,   // Room 4
    edges[5][0] = 1,   edges[5][1] = 4,   edges[5][2] = 6,    // Room 5
    edges[6][0] = 5,   edges[6][1] = 7,   edges[6][2] = 15,   // Room 6
    edges[7][0] = 6,   edges[7][1] = 8,   edges[7][2] = 17,   // Room 7
    edges[8][0] = 1,   edges[8][1] = 7,   edges[8][2] = 9,    // Room 8
    edges[9][0] = 8,   edges[9][1] = 10,  edges[9][2] = 18,   // Room 9
    edges[10][0] = 2,  edges[10][1] = 9,  edges[10][2] = 11,  // Room 10
    edges[11][0] = 10, edges[11][1] = 12, edges[11][2] = 19,  // Room 11
    edges[12][0] = 3,  edges[12][1] = 11, edges[12][2] = 13,  // Room 12
    edges[13][0] = 12, edges[13][1] = 14, edges[13][2] = 20,  // Room 13
    edges[14][0] = 4,  edges[14][1] = 13, edges[14][2] = 15,  // Room 14
    edges[15][0] = 6,  edges[15][1] = 14, edges[15][2] = 16,  // Room 15
    edges[16][0] = 15, edges[16][1] = 17, edges[16][2] = 20,  // Room 16
    edges[17][0] = 7,  edges[17][1] = 16, edges[17][2] = 18,  // Room 17
    edges[18][0] = 9,  edges[18][1] = 17, edges[18][2] = 19,  // Room 18
    edges[19][0] = 11, edges[19][1] = 18, edges[19][2] = 20,  // Room 19
    edges[20][0] = 13, edges[20][1] = 16, edges[20][2] = 19;  // Room 20
    // Index positions in curLocations[7]: person = 0, wumpus = 1, pit1 = 2, pit2 = 3, bats1 = 4, bats2 = 5, arrows = 6
    for (int i = 0; i < 7; ++i) {  // Create unique random room numbers for each piece
        int randomNum = rand() % 20 + 1;  // Initial random number
        for (int j = 0; j < 7; ++j) {  // Check every piece room for duplicates
            if (curLocations[j] == randomNum) {  // Duplicate number found
                while (randomNum == curLocations[j]) {  // Generate new random numbers until no match
                    randomNum = rand() % 20 + 1;
                }
                j = 0;  // Reset loop to check if this new number matches any of the room numbers.
            }
        }
        curLocations[i] = randomNum;  // Assign generated unique number to current [i] piece's position.
    }
}


void resetLocations(int *curLocations) {
    /** This function reads user input and changes the room positions of the hazards + player.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return Void
    */
    printf("Enter the room locations (1..20) for player, wumpus, pit1, pit2, bats1, bats2, and arrow: \n");
    scanf(" %d %d %d %d %d %d %d",
          &curLocations[0], &curLocations[1], &curLocations[2], &curLocations[3],
          &curLocations[4], &curLocations[5], &curLocations[6]);
    printf("\n");
}


void cheatingOption(const int *curLocations) {
    /** This function reads the curLocations array and prints the current positions of hazards + player.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return Void
    */
    printf("Cheating! Game elements are in the following rooms: \n"
           "Player Wumpus Pit1 Pit2 Bats1 Bats2 Arrow  \n"
           "%4d %5d %6d %5d %5d %5d %5d \n\n",
           curLocations[0], curLocations[1], curLocations[2], curLocations[3],
           curLocations[4], curLocations[5], curLocations[6]);
}


void mazeRoom() {
    /** This function prints the maze diagram.
    @return Void
    */
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
    @return Void
    */
    mazeRoom();
    printf("Hunt the Wumpus:                                             \n"
           "The Wumpus lives in a completely dark cave of 20 rooms. Each \n"
           "room has 3 tunnels leading to other rooms.                   \n"
           "                                                             \n"
           "Hazards:                                                     \n"
           "1. Two rooms have bottomless pits in them.  If you go there you fall and die.   \n"
           "2. Two other rooms have super-bats.  If you go there, the bats grab you and     \n"
           "   fly you to some random room, which could be troublesome.  Then those bats go \n"
           "   to a new room different from where they came from and from the other bats.   \n"
           "3. The Wumpus is not bothered by the pits or bats, as he has sucker feet and    \n"
           "   is too heavy for bats to lift.  Usually he is asleep.  Two things wake       \n"
           "   him up: Anytime you shoot an arrow, or you entering his room.  The Wumpus   \n"
           "   will move into the lowest-numbered adjacent room anytime you shoot an arrow.\n"
           "   When you move into the Wumpus' room, then he wakes and moves if he is in an \n"
           "   odd-numbered room, but stays still otherwise.  After that, if he is in your \n"
           "   room, he snaps your neck and you die!                                        \n"
           "                                                                                \n"
           "Moves:                                                                          \n"
           "On each move you can do the following, where input can be upper or lower-case:  \n"
           "1. Move into an adjacent room.  To move enter 'M' followed by a space and       \n"
           "   then a room number.                                                          \n"
           "2. Shoot your guided arrow through a list of up to three adjacent rooms, which  \n"
           "   you specify.  Your arrow ends up in the final room.                          \n"
           "   To shoot enter 'S' followed by the number of rooms (1..3), and then the      \n"
           "   list of the desired number (up to 3) of adjacent room numbers, separated     \n"
           "   by spaces. If an arrow can't go a direction because there is no connecting   \n"
           "   tunnel, it ricochets and moves to the lowest-numbered adjacent room and      \n"
           "   continues doing this until it has traveled the designated number of rooms.   \n"
           "   If the arrow hits the Wumpus, you win! If the arrow hits you, you lose. You  \n"
           "   automatically pick up the arrow if you go through a room with the arrow in   \n"
           "   it.                                                                          \n"
           "3. Enter 'R' to reset the person and hazard locations, useful for testing.      \n"
           "4. Enter 'C' to cheat and display current board positions.                      \n"
           "5. Enter 'D' to display this set of instructions.                               \n"
           "6. Enter 'P' to print the maze room layout.                                     \n"
           "7. Enter 'X' to exit the game.                                                  \n"
           "                                                                                \n"
           "Good luck!                                                                      \n\n\n");
}


void wumpusGuess(const int *curLocations) {
    /** This function takes user input to guess which room wumpus is in, you either win or lose if entering here.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return Void
    */
    int userGuess;
    printf("Enter room (1..20) you think Wumpus is in: ");
    scanf(" %d", &userGuess);
    if (userGuess == curLocations[1]) {
        printf("You won!\n");
    }
    else {
        printf("You lost.\n");
    }
}


void adjacentHazardCheck(int **edges, const int *curLocations) {
    /** This function prints the player's current room number. This checks if the player's current room is adjacent
    to any hazards, it checks for pits then wumpus then bats. This prints a message if the player is adjacent to those
    hazards.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return Void
    */
    printf("You are in room %d. ", curLocations[0]);
    int wumpus = 0, pits = 0, bats = 0;  // Set to False
    for (int i = 0; i < 3; ++i) {  // Adjacent room check for hazards.
        if (edges[curLocations[0]][i] == curLocations[1]) {  // Wumpus
            wumpus = 1;
        }
        if (edges[curLocations[0]][i] == curLocations[2] || edges[curLocations[0]][i] == curLocations[3]) {  // Pits
            pits = 1;
        }
        if (edges[curLocations[0]][i] == curLocations[4] || edges[curLocations[0]][i] == curLocations[5]) {  // Bats
            bats = 1;
        }
    }
    if (wumpus) {
        printf("You smell a stench. ");
    }
    if (pits) {
        printf("You feel a draft. ");
    }
    if (bats) {
        printf("You hear rustling of bat wings. ");
    }
}


int validMoveCheck(int **edges, int curPlayerRoom, int playerDest) {
    /** This function checks to see if the entered destination is connected to the player's room.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curPlayerRoom The player's current room number.
    @param playerDest The player's chosen room number they want to move to.
    @return int 0 or 1, a boolean return to check if the start->dest move is valid.
    */
    for (int i = 0; i < 3; ++i) {
        if (edges[curPlayerRoom][i] == playerDest) {  // If player's room's adjacent rooms have playerDest.
            return 1;
        }
    }
    return 0;  // Looped all three adjacent rooms and no match.
}


int batsRandomNumber(const int *curLocations) {
    /** This function generates a random number between 1-20 for a random room assignment for player/bats. We also
    check for if the random number generated is a duplicate of a current piece's room (only check player/bats).
    The bats/player can have the same room as pits/wumpus/arrows.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @return int randomNum, the random room number generated for player/bats
    */
    int randomNum = rand() % 20 + 1;  // Initial random number
    for (int i = 0; i < 6; ++i) {  // Check idx 0, 4, 5 for duplicates (player, bats1/2 idx)
        if (curLocations[i] == randomNum) {  // If duplicate number in player/bats idx generate new number.
            while (randomNum == curLocations[i]) {  // Generate new numbers until they no longer match
                randomNum = rand() % 20 + 1;
            }
        }
        if (i == 0) {  // From 0 go to idx 4, then 5 (only check values bats/player should not match ever)
            i += 3;
        }
    }
    return randomNum;
}


int hazardCheck(int **edges, int *curLocations, int playerDest, int *arrowPickedUp) {
    /** This function checks if the player moved into a hazard room, We check in order pits->wumpus->arrows->bats.
    If we moved into a wumpus room then if even room number kill player, else move wumpus to lowest adjacent room.
    If we moved into a arrow room then pick it up and set its room value to -1.
    If we moved into a bats room then the player and bat are moved to random locations.
    To account for the room the bat drops the player, we recursively run this function until either death or no death.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @param playerDest The user chosen room they want to move to.
    @param arrowPickedUp A int boolean value that stores if the arrow has been picked up.
    @return int, 1 indicating death, 0 no death.
    */
    if (curLocations[1] == playerDest) {  // Wumpus check
        if (playerDest % 2 == 0) {  // Even wumpus room
            printf("You briefly feel a slimy tentacled arm as your neck is snapped. \nIt is over.\n");
            return 1;
        }
        else {  // Odd wumpus room
            printf("You hear a slithering sound, as the Wumpus slips away. \nWhew, that was close!\n");
            curLocations[1] = edges[playerDest][0];  // Move wumpus to the lowest adjacent room.
        }
    }
    else if ((playerDest == curLocations[2]) || (playerDest == curLocations[3])) {  // Pit 1 & 2 check
        printf("Aaaaaaaaahhhhhh....   \n    You fall into a pit and die. \n");
        return 1;
    }
    if (playerDest == curLocations[6]) {  // Arrows check
        (*arrowPickedUp) = 1;  // Set to true
        curLocations[6] = -1;  // Indicates arrows are picked up when printing all room numbers
        printf("Congratulations, you found the arrow and can once again shoot.\n");
    }
    if (playerDest == curLocations[4] || playerDest == curLocations[5]) {  // Bats check
        curLocations[0] = batsRandomNumber(curLocations);  // Move player to random room except player/bat's rooms.
        printf("Woah... you're flying!\n"
               "You've just been transported by bats to room %d.\n", curLocations[0]);
        if (playerDest == curLocations[4]) {  // Move bat1 if we landed on that specific bat
            curLocations[4] = batsRandomNumber(curLocations);
        }
        else {  // Move bat2 if we landed on that specific bat
            curLocations[5] = batsRandomNumber(curLocations);
        }
        // Recursive chain to check if the player landed on another hazard.
        return hazardCheck(edges, curLocations, curLocations[0], arrowPickedUp);
    }
    return 0;  // No death from hazards
}


int movePlayer(int **edges, int *curLocations, int *arrowPickedUp, int *moveCounter) {
    /** This function moves the player to the entered room, first check if valid connection, then check for hazards
    in the destination room, if lethal hazards then kill the player and end game. If no lethal hazards move player.
    Also if the bats move the player, then don't move to the entered room.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @param arrowPickedUp A int boolean value that stores if the arrow has been picked up.
    @param moveCounter A int the stores the valid amount of moves made in program so far.
    @return int, 1 is death, 0 is no death
    */
    int destinationRoom;
    scanf(" %d", &destinationRoom);
    if (validMoveCheck(edges, curLocations[0], destinationRoom)) {  // Valid edge
        int playerPositionAtStart = curLocations[0];  // Store current player position to compare if bats move player later.
        if (hazardCheck(edges, curLocations, destinationRoom, arrowPickedUp)) {  // Lethal hazard
            return 1;  // Death
        }
        else {  // No lethal hazard, move player to dest.
            (*moveCounter)++;
            if (playerPositionAtStart != curLocations[0]) {  // If bats moved player, then don't move to entered room.
                return 0;
            }
            curLocations[0] = destinationRoom;  // Move player
        }
    }
    else {  // Not valid edge
        printf("Invalid move.  Please retry.\n");
    }
    return 0;  // No death
}


int shootArrow(int **edges, int *curLocations, int *arrowPickedUp) {
    /** This function allows the player to shoot a arrow if they have it. You can shoot in the direction of 1-3 rooms.
    If the rooms are not all adjacent, then the arrow will ricochet and go to the lowest adjacent room.
    The arrow can kill the player and wumpus.
    @param edges The int dynamic 2D 21 x 3 array which holds all valid adjacent rooms.
    @param curLocations The int dynamic array which holds current piece room positions. (player, wumpus, ...)
    @param arrowPickedUp A int boolean value that stores if the arrow has been picked up.
    @return int, 1 is player/wumpus death, 0 is no death
    */
    int *userChoices = malloc(3 * sizeof(int));  // Create max size array for amount of rooms to shoot arrow.
    int roomAmount;
    printf("Enter the number of rooms (1..3) into which you want to shoot, followed by the rooms themselves: ");
    scanf(" %d", &roomAmount);
    for (int i = 0; i < roomAmount; ++i) {  // Store desired amount of rooms to shoot in dynamic array.
        scanf(" %d", &(userChoices[i]));
    }
    int curArrowRoom = curLocations[0];  // Initial arrow room is player room.
    int ricochet = 0;    // Set to false.
    *arrowPickedUp = 0;  // Set to false.
    for (int i = 0; i < roomAmount; ++i) {  // For each three rooms
        int validRoomCheck = 0;  // Set to false
        for (int j = 0; j < 3; ++j) {  // Check curArrowRoom's adjacent rooms
            if (userChoices[i] == edges[curArrowRoom][j]) {  // Valid user-entered room for position
                curArrowRoom = userChoices[i];  // Move curArrowRoom up to next room.
                validRoomCheck = 1;
                break;
            }
        }
        if (!validRoomCheck) {  // No matching adjacent rooms, so arrow ricochets.
            printf("Room %d is not adjacent.  Arrow ricochets...\n", userChoices[i]);
            ricochet = 1;  // Set to true
            curArrowRoom = edges[curArrowRoom][0];  // Ricochet makes arrow go to lowest adjact room.
        }
        if (curArrowRoom == curLocations[0]) {  // Arrow killed player
            if (!ricochet)
                printf("You just shot yourself.\nMaybe Darwin was right. You're dead.\n");
            else
                printf("You just shot yourself, and are dying.\nIt didn't take long, you're dead.\n");
            free(userChoices);  // Remove dynamic memory allocated in function
            return 1;  // Player death
        }
        else if (curArrowRoom == curLocations[1]) {  // Arrow killed wumpus
            if (!ricochet) {
                printf("Wumpus has just been pierced by your deadly arrow!\n"
                       "Congratulations on your victory, you awesome hunter you.\n");
            }
            else {
                printf("Your arrow ricochet killed the Wumpus, you lucky dog!\n"
                       "Accidental victory, but still you win!\n");
            }
            free(userChoices);  // Remove dynamic memory allocated in function
            return 1;  // Wumpus death
        }
    }
    curLocations[1] = edges[curLocations[1]][0]; // If neither player/wumpus died, move wumpus to its lowest adjacent room.
    curLocations[6] = curArrowRoom;  // Set new room for arrows
    free(userChoices);  // Remove dynamic memory allocated in function
    return 0;  // No deaths, so continue overall program.
}


int main() {
    /** Main() is the driver function behind the program. We have a while loop indicating 1 iteration = 1 player choice.
    We also initialize the seed for srand() and the edges / curLocations array which store the stucture of the maze.
    We prompt the user to enter a letter and that will takes us to their respective function/choice.
    @return int 0 indicating good program execution
    */
    int **edges = malloc(21 * sizeof(int*));  // Create size 21 2D array that stores arrays/int*.
    for (int i = 0; i < 21; ++i) {
        edges[i] = malloc(3 * sizeof(int));  // Allocate space for each [i] room's 3 edges.
    }
    int *curLocations = calloc(7, sizeof(int));  // Allocate space for the 7 piece locations.
    srand(1);  // For program test cases to match
    initializeEdges(edges, curLocations);  // Create maze edges and random room generations.
    int moveCounter = 1;
    int arrowPickedUp = 0;  // Set to false
    char userChoice = ' ';
    while (userChoice != 'X') {
        adjacentHazardCheck(edges, curLocations);  // Print room # and check for adjacent hazards.
        printf("\n\n%d. Enter your move (or 'D' for directions): ", moveCounter);
        scanf(" %c", &userChoice);
        userChoice = toupper(userChoice);
        switch (userChoice) {
            case 'M':  // Move player
                if (movePlayer(edges, curLocations, &arrowPickedUp, &moveCounter))
                    userChoice = 'X';  // Player died.
                break;
            case 'S':  // Shoot arrow
                moveCounter++;
                if (!arrowPickedUp) {
                    printf("Sorry, you can't shoot an arrow you don't have.  Go find it.\n");
                    break;
                }
                if (shootArrow(edges, curLocations, &arrowPickedUp))
                    userChoice = 'X';  // Either wumpus/player died.
                break;
            case 'R':  // Change hazard/player positions
                resetLocations(curLocations);
                if (curLocations[6] == -1)  // Arrow room of -1 indicates the player has the arrow.
                    arrowPickedUp = 1;
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
    free(edges), free(curLocations);  // Remove remaining dynamic memory
    printf("\nExiting Program ...\n");
    return 0;
}
