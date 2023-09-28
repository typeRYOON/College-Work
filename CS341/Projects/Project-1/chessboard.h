/*chessboard.h*/
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : chessboard.h
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 using CLion w/ Mingw-w64
 - -                                         - -
 >> File overview:
 >> This file contains all the Chessboard, Square, and ChessboardIterator class
 >> declarations that will be implemented within chessboard.cpp.
--------------------------------------------------------------------------------------- */
// Preprocessor directives:
#ifndef CHESSBOARD_H
#define CHESSBOARD_H
#include <iostream>
#include <sstream>

// Public enums for use by classes and users:
enum Color { White, Black, EmptyColor };
enum Piece { Rook, Knight, Bishop, King, Queen, Pawn, EmptyPiece };

class Square {  // Square class: - -                                                   - -
private:
    Color color;                                            // Color::color.
    Piece piece;                                            // Piece::piece.

public:
    // Constructor:
    Square(Color c = EmptyColor, Piece p = EmptyPiece)
          : color(c), piece(p) {}

    // Color/Piece getters:
    Color getColor() const { return color; }                // Color getter.
    Piece getPiece() const { return piece; }                // Piece getter.
};  // - -                                                                              */

class Chessboard {  // Chessboard class: - -                                           - -
private:
    Square board[8][8];                                     // 8x8 Chessboard.
    bool pawnMove(int fromX, int fromY, int toX, int toY);  // Pawn movement.
    int legalMove(int fromX, int fromY, int toX, int toY);  // Chess legality.

public:
    // Constructor:
    Chessboard() = default;

    // Member function declarations:
    void starterBoard();                                    // Standard starter board.
    void remove(int x, int y);                              // Chesspiece removal.
    int place(int x, int y, Color c, Piece p);              // Chesspiece placement.
    int get(int x, int y, Color &c, Piece &p) const;        // Chesspiece getter.
    int move(int fromX, int fromY, int toX, int toY);       // Chesspiece movement.
    void print() const;                                     // Printing of board.

    // Nested ChessboardIterator class: - -                                            - -
    class ChessboardIterator {
    private:
        const Chessboard& chessboard;  // Board reference for Iterator.
        int x, y;                      // Iterator's current position in board.

    public:
        // ChessboardIterator Constructor:
        ChessboardIterator(const Chessboard& board, int startX = 0, int startY = 0)
                          : chessboard(board), x(startX), y(startY) {}

        // Member function declarations:
        bool operator!=(const ChessboardIterator& other) const;
        bool operator==(const ChessboardIterator& other) const;
        ChessboardIterator& operator++();
        Square operator*();
        int xy(int& outX, int& outY) const;
    };  //                                                                              */

    // ChessboardIterator getter functions:
    ChessboardIterator begin() const { return ChessboardIterator(*this, 0, 0); }
    ChessboardIterator end()   const { return ChessboardIterator(*this, 0, 8); }
};  //                                                                                  */
#endif