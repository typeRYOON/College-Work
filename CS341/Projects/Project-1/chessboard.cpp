/*chessboard.cpp*/
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : chessboard.cpp
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 using CLion w/ Mingw-w64
 - -                                         - -
 >> Overview:
 >> This program implements a chessboard container and internal iterator. Some special
 >> moves are not present as noted in the requirements pdf. main.cpp tests each function.
 >> This file implements the functions declared within chessboard.h. The Square, nested
 >> iterator, and Chessboard class functions are located within the file, more info
 >> about each function's purpose can be found within their respective doc strings.
--------------------------------------------------------------------------------------- */
// Preprocessor directives:
#include "chessboard.h"
using ChessboardIterator = Chessboard::ChessboardIterator;

/** Chessboard::pawnMove: - -                                                          - -
Pawn legality check for Black/White pawns. Checks to make sure pawns cannot move
backwards as well. Only diagonal captures.
    - -                                                                                - -
    @param fromX: Starting X coordinate.
    @param fromY: Starting Y coordinate.
    @param toX  : Destination X coordinate.
    @param toY  : Destination Y coordinate.
    @return bool: T/F based on if the pawn move is valid.                               */
bool Chessboard::pawnMove(int fromX, int fromY, int toX, int toY)
{
    // 0 0 -> 0 1 dx=0 dy=1
    Color fromC = board[fromX][fromY].getColor();
    int dx = abs(fromX-toX);
    int dy = (fromC == White) ? toY-fromY : fromY-toY;

    if (!dx && dy == 1) {           // Forward move:
        if (board[toX][toY].getColor() != EmptyColor)      return false;
        return true;
    }
    else if (dx == 1 && dy == 1) {  // Diagonal move:
        if (board[toX][toY].getPiece() != EmptyPiece) return true;
    }
    return false;
}

/** Chessboard::legalMove: - -                                                         - -
Based on the piece type find out whether a move is valid using the starting/destination
coordinates. The function also determines if a piece is obstructing the desired path,
which would be considered an illegal move.
    - -                                                                                - -
    @param fromX: Starting X coordinate.
    @param fromY: Starting Y coordinate.
    @param toX  : Destination X coordinate.
    @param toY  : Destination Y coordinate.
    @return int : T/F based on if Chesspiece move is valid.                             */
int Chessboard::legalMove(int fromX, int fromY, int toX, int toY)
{
    int dx = abs(fromX-toX), dy = abs(fromY-toY), x, y;
    int dirX = (toX > fromX) ? 1 : -1, dirY = (toY > fromY) ? 1 : -1;

    switch (board[fromX][fromY].getPiece())
    {
        case Rook:
            if (!dx && dy) {                        // Vertical Case:
                for (int i = std::min(fromY, toY) + 1; i < std::max(fromY, toY);)
                    if (board[fromX][i++].getPiece() != EmptyPiece) return 0;
            }
            else if (dx && !dy) {                   // Horizontal Case:
                for (int i = std::min(fromX, toX) + 1; i < std::max(fromX, toX);)
                    if (board[i++][fromY].getPiece() != EmptyPiece) return 0;
            }
            else return 0;
            return 1;

        case Knight:
            if (dx == 2 && dy == 1)      return 1;  // Horizontal L Case.
            else if (dx == 1 && dy == 2) return 1;  // Vertical L Case.
            break;

        case Bishop:
            if (dx != dy) return 0;
            for (int i = 1; i < dx; i++) {
                x = fromX + i * dirX;
                y = fromY + i * dirY;
                if (board[x][y].getPiece() != EmptyPiece) return 0; 
            }
            return 1;

        case Queen:
            if (!dx && dy) {                        // Vertical Rook Case:
                for (int i = std::min(fromY, toY) + 1; i < std::max(fromY, toY);)
                    if (board[fromX][i++].getPiece() != EmptyPiece) return 0;
            }
            else if (dx && !dy) {                   // Horizontal Rook Case:
                for (int i = std::min(fromX, toX) + 1; i < std::max(fromX, toX);)
                    if (board[i++][fromY].getPiece() != EmptyPiece) return 0;
            }
            else if (dx == dy) {                    // Bishop movement:
                for (int i = 1; i < dx; i++) {
                    x = fromX + i * dirX;
                    y = fromY + i * dirY;
                    if (board[x][y].getPiece() != EmptyPiece) return 0; 
                }
            }
            else return 0;
            return 1;

        case King:
            if (dx <= 1 && dy <= 1) return 1;       // Move one space only.
            break;

        case Pawn:
            return pawnMove(fromX, fromY, toX, toY);

        default:
            return 0;
    }
    return 0;
}

/** Chessboard::starterBoard: - -                                                     - -
Starter chess board to be used in matches. Completely optional to use for class user.  */
void Chessboard::starterBoard()
{   // Initial pieces for White:
    board[0][0] = Square(White, Rook);
    board[1][0] = Square(White, Knight);
    board[2][0] = Square(White, Bishop);
    board[3][0] = Square(White, Queen);
    board[4][0] = Square(White, King);
    board[5][0] = Square(White, Bishop);
    board[6][0] = Square(White, Knight);
    board[7][0] = Square(White, Rook);

    // Initial pieces for Black:
    board[0][7] = Square(Black, Rook);
    board[1][7] = Square(Black, Knight);
    board[2][7] = Square(Black, Bishop);
    board[3][7] = Square(Black, Queen);
    board[4][7] = Square(Black, King);
    board[5][7] = Square(Black, Bishop);
    board[6][7] = Square(Black, Knight);
    board[7][7] = Square(Black, Rook);

    // Initial Pawn pieces:
    for (int i = 0; i < 8; i++) {
        board[i][1] = Square(White, Pawn);
        board[i][6] = Square(Black, Pawn);
    }
}

/** Chessboard::remove: - -                                                            - -
Remove Chesspiece from board leaving an empty Square in its place.
    - -                                                                                - -
    @param x: Desired X coordinate.
    @param y: Desired Y coordinate.                                                     */
void Chessboard::remove(int x, int y)
{
    if (x < 0 || x > 7 || y < 0 || y > 7)     return;
    if (board[x][y].getPiece() == EmptyPiece) return;
    board[x][y] = Square();
}

/** Chessboard::place: - -                                                             - -
Place a chesspiece on the board and pick the (x, y) coordinate / Color&Piece type.
    - -                                                                                - -
    @param x   : Desired X coordinate.
    @param y   : Desired Y coordinate.
    @param c   : Desired Color type.
    @param p   : Desired Piece type.
    @return int: 1 = good run, else error.                                              */
int Chessboard::place(int x, int y, Color c, Piece p)
{
    if (x < 0 || x > 7)                       return -1;  // Illegal X.
    if (y < 0 || y > 7)                       return -2;  // Illegal Y.
    if (board[x][y].getPiece() != EmptyPiece) return -3;  // Placement on occupied.
    if (c != White && c != Black)             return -4;  // Illegal Color passed.
    if (p < 0 || p > 5)                       return -5;  // Illegal Piece passed.

    board[x][y] = Square(c, p);
    return 1;
}

/** Chessboard::get: - -                                                               - -
Retrieve a Chesspiece's Color/Piece type at a desired (x, y) coordinate. Retrieve the
Color and Piece types via the passed by reference variables.
    - -                                                                                - -
    @param x   : Desired X coordinate.
    @param y   : Desired Y coordinate.
    @param c   : Color type that gets returned via reference.
    @param p   : Piece type that gets returned via reference.
    @return int: 1 = good run, else error.                                              */
int Chessboard::get(int x, int y, Color &c, Piece &p) const
{
    if (x < 0 || x > 7) return -1;  // Illegal X.
    if (y < 0 || y > 7) return -2;  // Illegal Y.

    c = board[x][y].getColor();
    p = board[x][y].getPiece();
    return (p == EmptyPiece) ? -3 : 1;  // -3 = Empty square retrieved.
}

/** Chessboard::move: - -                                                              - -
Check whether the movement from the starting and destination (x, y) coordinates is valid.
If valid then the destination get replaced with the moved Chesspiece. Allows for
capturing different colors.
    - -                                                                                - -
    @param fromX: Starting X coordinate.
    @param fromY: Starting Y coordinate.
    @param toX  : Destination X coordinate.
    @param toY  : Destination Y coordinate.
    @return int : 1 = good run, else error.                                             */
int Chessboard::move(int fromX, int fromY, int toX, int toY)
{   // Retrieve Color and piece types:
    Color fromC, toC;
    Piece fromP, toP;
    int fromRet = get(fromX, fromY, fromC, fromP);
    int toRet = get(toX, toY, toC, toP);

    // Check for valid coordinates, color, and piece type:
    if (fromRet == -1 || fromRet == -2)  return fromRet;    // Illegal from X/Y.
    else if (toRet == -1 ||toRet == -2)  return toRet - 2;  // Illegal to X/Y.
    else if (fromRet == -3)              return -5;         // Movement from empty.
    else if (toRet == 1 && toC == fromC) return -6;         // Same color capture.

    // Check if legal movement / any piece obstructions:
    if (!legalMove(fromX, fromY, toX, toY)) return -7;

    board[fromX][fromY] = Square();
    board[toX][toY] = Square(fromC, fromP);
    return 1;
}

/** Chessboard::print: - -                                                             - -
Using the Chessboard::ChessboardIterator print the chessboard in a top down view with
the color and piece type shown, ex: White Pawn = wP                                     */
void Chessboard::print() const
{
    std::string pStrs[7] = {"R ", "N ", "B ", "K ", "Q ", "P ", ". "};
    std::ostringstream boardLayout[8];
    char cChars[3] = {'w', 'b', ' '};
    int x, y;
    Color c;
    Piece p;

    for (auto it = begin(); it != end(); ++it) {
        it.xy(x, y);
        get(x, y, c, p);

        // Insert correct string into row element:
        boardLayout[y] << cChars[c] << pStrs[p];
    }
    for (int row = 7; row >= 0;)
        std::cout << boardLayout[row--].str() << std::endl;
}

/** Chessboard::ChessboardIterator::operator!=: - -                                    - -
Check whether two iterators are not at the same position within the chessboard.
    - -                                                                                - -
    @param other: Another ChessboardIterator to compare against.
    @return bool: T/F based on if the x/y are not equivalent.                           */
bool ChessboardIterator::operator!=(const ChessboardIterator& other) const
{
    return x != other.x || y != other.y;
}

/** Chessboard::ChessboardIterator::operator==: - -                                    - -
Check whether two iterators are at the same position within the chessboard.
    - -                                                                                - -
    @param other: Another ChessboardIterator to compare against.
    @return bool: T/F based on if the x/y are equivalent.                               */
bool ChessboardIterator::operator==(const ChessboardIterator& other) const
{
    return x == other.x && y == other.y;
}

/** Chessboard::ChessboardIterator::operator++: - -                                    - -
Increment iterator's internal (x, y) coordinates, go row by row incrementing forward.
    - -                                                                                - -
    @return ChessboardIterator&: returns the current iterator.                          */
ChessboardIterator& ChessboardIterator::operator++()
{
    if (++x == 8) {
        x = 0;
        y++;
    }
    return *this;
}

/** Chessboard::ChessboardIterator::operator*: - -                                     - -
Retrieve internal Chessboard Square from where the iterator is currently positioned.
    - -                                                                                - -
    @return Square: Current Chesspiece based on iterator (x, y) position.               */
Square ChessboardIterator::operator*()
{
    return (x < 0 || x > 7 || y < 0 || y > 7) ? Square() : chessboard.board[x][y];
}

/** Chessboard::ChessboardIterator::xy: - -                                            - -
Retrieve current iterator's (x, y) coordinate via the outX and outY variables.
    - -                                                                                - -
    @param outX: X coordinate that gets returned via reference.
    @param outY: Y coordinate that gets returned via reference.
    @return int: 1 = good run, -1 = invalid iterator (x, y) coordinate.                 */
int ChessboardIterator::xy(int& outX, int& outY) const
{
    if (x < 0 || x > 7 || y < 0 || y > 7) return -1;
    outX = x, outY = y;
    return 1;
}   //                                                                                  */