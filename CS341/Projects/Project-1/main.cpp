/*main.cpp*/
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : main.cpp
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 using CLion w/ Mingw-w64
 - -                                         - -
 >> File overview:
 >> This cpp file tests all the main functions made in the chessboard files. Getters and
 >> setters are not tested due to simplicity of said functions. For more details on each
 >> function's purpose, please look at the chessboard.h declarations and chessboard.cpp
 >> implementations.
--------------------------------------------------------------------------------------- */
// Preprocessor directives:
#include "chessboard.h"

/** placeTest: - -                                                                     - -
Tests the following function:
    - -                                                                                - -
    int Chessboard::place(int x, int y, Color c, Piece p)                               */
bool placeTest(Chessboard& cb)
{
    int retA, retB, retC;
    Color c;
    Piece p;

    // Illegal X coordinate:
    retA = cb.place(8, 0, White, Pawn);
    retB = cb.place(100e2, 0, White, Pawn);
    retC = cb.place(-1, 0, White, Pawn);
    if (retA != -1 || retB != -1 || retC != -1) return false;

    // Illegal Y coordinate:
    retA = cb.place(0, 8, White, Pawn);
    retB = cb.place(0, 100e2, White, Pawn);
    retC = cb.place(0, -1, White, Pawn);
    if (retA != -2 || retB != -2 || retC != -2) return false;

    // Attempt piece placement on occupied square:
    retA = cb.place(0, 0, White, Pawn);
    if (retA != -3) return false;

    // Illegal color on valid square:
    retA = cb.place(0, 2, (Color)2, Pawn);
    retB = cb.place(0, 2, (Color)3, Pawn);
    retC = cb.place(0, 2, (Color)-1, Pawn);
    if (retA != -4 || retB != -4 || retC != -4) return false;

    // Illegal piece on valid square:
    retA = cb.place(0, 2, White, (Piece)6);
    retB = cb.place(0, 2, White, (Piece)7);
    retC = cb.place(0, 2, White, (Piece)-1);
    if (retA != -5 || retB != -5 || retC != -5) return false;

    // Valid placements and check change:
    retA = cb.place(0, 2, White, Pawn);
    retB = cb.place(0, 3, White, King);
    retC = cb.place(0, 4, Black, Queen);

    cb.get(0, 2, c, p);
    if (c != White || p != Pawn)  return false;
    cb.get(0, 3, c, p);
    if (c != White || p != King)  return false;
    cb.get(0, 4, c, p);
    if (c != Black || p != Queen) return false;

    return (retA == 1 && retB == 1 && retC == 1);
}

/** getTest: - -                                                                       - -
Tests the following function:
    - -                                                                                - -
    int Chessboard::get(int x, int y, Color &c, Piece &p) const                         */
bool getTest(Chessboard& cb)
{
    int retA, retB, retC;
    Color c;
    Piece p;

    // Illegal X coordinate:
    retA = cb.get(8, 0, c, p);
    retB = cb.get(100e2, 0, c, p);
    retC = cb.get(-1, 0, c, p);
    if (retA != -1 || retB != -1 || retC != -1) return false;

    // Illegal Y coordinate:
    retA = cb.get(0, 8, c, p);
    retB = cb.get(0, 100e2, c, p);
    retC = cb.get(0, -1, c, p);
    if (retA != -2 || retB != -2 || retC != -2) return false;
    
    // Empty piece is returned:
    retA = cb.get(1, 2, c, p);
    if (retA != -3 || c != EmptyColor || p != EmptyPiece) return false;
    
    // Valid returned pieces:
    retA = cb.get(0, 0, c, p);
    if (retA != 1 || c != White || p != Rook) return false;
    retB = cb.get(7, 7, c, p);
    if (retB != 1 || c != Black || p != Rook) return false;
    retC = cb.get(3, 0, c, p);
    return (retC == 1 && c == White && p == Queen);
}

/** moveTest: - -                                                                      - -
Tests the following function:
    - -                                                                                - -
    int Chessboard::move(int fromX, int fromY, int toX, int toY)                        */
bool moveTest(Chessboard& cb)
{
    int retA, retB, retC;

    // Illegal fromX coordinate:
    retA = cb.move(-1, -1, 0, 0);
    retB = cb.move(8, 8, 0, 0);
    if (retA != -1 || retB != -1) return false;

    // Illegal fromY coordinate:
    retA = cb.move(0, -1, 0, 0);
    retB = cb.move(0, 8, 0, 0);
    if (retA != -2 || retB != -2) return false;

    // Illegal toX coordinate:
    retA = cb.move(0, 0, 8, 8);
    retB = cb.move(0, 0, -1, -1);
    if (retA != -3 || retB != -3) return false;

    // Illegal toY coordinate:
    retA = cb.move(0, 0, 0, 8);
    retB = cb.move(0, 0, 0, -1);
    if (retA != -4 || retB != -4) return false;

    // Movement from empty square:
    retA = cb.move(3, 3, 0, 0);
    retB = cb.move(4, 4, 0, 0);
    if (retA != -5 || retB != -5) return false;

    // Same color on start and dest positions:
    retA = cb.move(0, 0, 1, 1);
    retB = cb.move(0, 0, 0, 0);
    retC = cb.move(7, 7, 7, 6);
    if (retA != -6 || retB != -6 || retC != -6) return false;

    // ILLEGAL MOVES: - -                                                              - -
    Chessboard board;
    board.place(0, 0, White, Pawn);
    board.place(1, 1, White, Rook);
    board.place(2, 0, White, Knight);
    board.place(3, 2, White, Bishop);
    board.place(4, 0, White, King);
    board.place(7, 0, White, Queen);
    board.place(6, 6, White, Pawn);
    board.place(7, 7, Black, Pawn);

    // ROOK:
    // Non-horizontal movement:
    retA = board.move(1, 1, 3, 3);  // dx=2, dy=2
    retB = board.move(1, 1, 0, 2);  // dx=1, dy=1
    if (retA != -7 || retB != -7) return false;

    // Valid horizontal moves:
    retA = board.move(1, 1, 1, 2);  // dx=0, dy=1
    retB = board.move(1, 2, 2, 2);  // dx=1, dy=0
    if (retA != 1 || retB != 1) return false;

    // Valid move but piece on path:
    retA = board.move(2, 2, 4, 2); // [3, 2]: Bishop exists.
    if (retA != -7) return false;

    // KNIGHT:
    // Non-L shape movement:
    retA = board.move(2, 0, 2, 1);  // dx=0, dy=1
    retB = board.move(2, 0, 5, 0);  // dx=3, dy=0
    if (retA != -7 || retB != -7) return false;

    // Valid moves (jump over king at (4, 0)):
    retA = board.move(2, 0, 4, 1);  // dx=2, dy=1
    retB = board.move(4, 1, 3, 3);  // dx=1, dy=2
    if (retA != 1 || retB != 1) return false;

    // BISHOP:
    // Non-diagonal movement:
    retA = board.move(3, 2, 3, 1);  // dx=0, dy=1
    retB = board.move(3, 2, 5, 3);  // dx=2, dy=1
    if (retA != -7 || retB != -7) return false;

    // Valid moves but piece on path:
    board.place(5, 4, White, Pawn); // Placing on path.
    retA = board.move(3, 2, 6, 5);  // dx=3, dy=3
    if (retA != -7) return -7;

    // Valid diagonal moves:
    retA = board.move(3, 2, 2, 3);  // dx=1, dy=1
    retB = board.move(2, 3, 6, 7);  // dx=4, dy=4

    // KING:
    // Over 1 square moved:
    retA = board.move(4, 0, 4, 2);  // dx=0, dy=2
    retB = board.move(4, 0, 6, 2);  // dx=2, dy=2
    retC = board.move(4, 0, 2, 0);  // dx=2, dy=0
    if (retA != -7 || retB != -7 || retC != -7) return false;

    // Valid king movement:
    retA = board.move(4, 0, 5, 1);  // dx=1, dy=1
    retB = board.move(5, 1, 4, 1);  // dx=1, dy=0
    retC = board.move(4, 1, 3, 0);  // dx=1, dy=1
    if (retA != 1 || retB != 1 || retC != 1) return false;

    // QUEEN:
    // Because Rook and Bishop pieces work, Queen should also work because
    // queens are a combination of both said pieces.

    // WHITE PAWN:
    // Attempt moving downwards:
    retA = board.move(5, 4, 5, 3);
    retB = board.move(5, 4, 4, 3);
    retC = board.move(5, 4, 6, 3);
    if (retA != -7 || retB != -7 || retC != -7) return false;

    // Illegal diagonal move (no capture):
    retA = board.move(5, 4, 6, 5);
    retB = board.move(5, 4, 4, 5);
    if (retA != -7 || retB != -7) return false;

    // Diagonal capture: (7,7) has a black piece
    if (board.move(6, 6, 7, 7) != 1) return false;

    // Valid movement:
    retA = board.move(0, 0, 0, 1);
    retB = board.move(0, 1, 0, 2);
    if (retA != 1 || retB != 1) return false;

    // BLACK PAWN:
    // Attempt moving upwards:
    board.place(4, 5, Black, Pawn);
    retA = board.move(4, 5, 4, 6);
    retB = board.move(4, 5, 5, 6);
    retC = board.move(4, 5, 3, 6);
    return (retA == -7 && retB == -7 && retC == -7);
}

/** iteratorTests: - -                                                                 - -
Tests the following functions:
    - -                                                                                - -
    bool Chessboard::ChessboardIterator::operator!=(const ChessboardIterator& other) const
    bool Chessboard::ChessboardIterator::operator==(const ChessboardIterator& other) const
    int Chessboard::ChessboardIterator::xy(int& outX, int& outY const
    Square Chessboard::ChessboardIterator::operator*()
    void Chessboard::ChessboardIterator::operator++()
    ChessboardIterator Chessboard::begin() const
    ChessboardIterator Chessboard::end()   const                                        */
bool iteratorTests(Chessboard& cb)
{   
    int x, y, checkX = 0, checkY = 0;
    auto itA = cb.begin(), itB = cb.end();
    Color c;
    Piece p;
    
    // begin() maps to (0,0):
    itA.xy(x, y);
    if (x != 0 || y != 0) return false;
    
    // end() maps to (8,0), it.xy() should return -1:
    if (itB.xy(x, y) != -1) return false;
    
    // *operator - Retrieve the White Rook at (0,0):
    if ((*itA).getColor() != White || (*itA).getPiece() != Rook) return false;
    // Out of bounds results in empty square:
    if ((*itB).getColor() != EmptyColor) return false;
    if ((*itB).getPiece() != EmptyPiece) return false;

    // Test for each (++, !=, begin, end, xy, *):
    for (; itA != itB; ++itA) {
        // Make sure every (x,y) returned is valid:
        if (itA.xy(x, y) == -1)         return false;
        if (checkX != x || checkY != y) return false;

        // Colors and Pieces should match on board:
        cb.get(x, y, c, p);
        if ((*itA).getColor() != c || (*itA).getPiece() != p) return false;

        // Increment outer (x,y) pair to check against:
        if (++checkX == 8) {
            checkX = 0;
            checkY++;
        }
    }
    // itA and itB should now be equal in (x,y):
    return (itA == itB);
}


/** captureTest: - -                                                                   - -
Tests capturing a piece.                                                                */
bool captureTest(Chessboard& cb)
{
    Color cA, cB;
    Piece pA, pB;

    // Validate before positions:
    cb.get(0, 3, cA, pA);
    cb.get(0, 4, cB, pB);
    if (cA != White || pA != King)  return false;
    if (cB != Black || pB != Queen) return false;

    // White capturing Black:
    if (cb.move(0, 3, 0, 4) != 1)   return false; 

    // Validate after positions
    cb.get(0, 3, cA, pA);
    cb.get(0, 4, cB, pB);
    if (cA != EmptyColor || pA != EmptyPiece) return false;
    if (cB != White || pB != King)            return false;

    // Pawn diagonal capture:
    // Place a different color in diagonal of two pawns:
    cb.place(2, 2, Black, Pawn);
    cb.place(2, 5, White, Pawn);

    // White pawn on black piece:
    // Validate before positions:
    cb.get(3, 1, cA, pA);
    cb.get(2, 2, cB, pB);
    if (cA != White || pA != Pawn)  return false;
    if (cB != Black || pB != Pawn)  return false;

    // Diagonal capture:
    if (cb.move(3, 1, 2, 2) != 1) return false;

    // Validate after positions:
    cb.get(3, 1, cA, pA);
    cb.get(2, 2, cB, pB);
    if (cA != EmptyColor || pA != EmptyPiece) return false;
    if (cB != White || pB != Pawn)            return false;

    // Black pawn on white piece:
    // Validate before positions:
    cb.get(3, 6, cA, pA);
    cb.get(2, 5, cB, pB);
    if (cA != Black || pA != Pawn)  return false;
    if (cB != White || pB != Pawn)  return false;

    // Diagonal capture:
    if (cb.move(3, 6, 2, 5) != 1)   return false;

    // Validate after positions:
    cb.get(3, 6, cA, pA);
    cb.get(2, 5, cB, pB);
    if (cA != EmptyColor || pA != EmptyPiece) return false;
    if (cB != Black || pB != Pawn)            return false;

    // Attempt capture on self:
    return (cb.move(2, 5, 2, 5) == -6);
}

/** constructorTests: - -                                                              - -
Tests the following constructors:
    - -                                                                                - -
    Chessboard::ChessboardIterator(const Chessboard& board, int startX=0, int startY=0)
    Square::Square(Color c=EmptyColor, Piece p=EmptyPiece)
    Chessboard::Chessboard()                                                            */
bool constructorTests(Chessboard& cb)
{   // Iterator constructor: - -                                                       - -
    auto itA = Chessboard::ChessboardIterator(cb);       // [0, 0]: White Rook.
    auto itB = Chessboard::ChessboardIterator(cb, 5);    // [5, 0]: White Bishop.
    auto itC = Chessboard::ChessboardIterator(cb, 1, 7); // [1, 7]: Black Knight.

    if ((*itA).getColor() != White || (*itA).getPiece() != Rook)   return false;
    if ((*itB).getColor() != White || (*itB).getPiece() != Bishop) return false;
    if ((*itC).getColor() != Black || (*itC).getPiece() != Knight) return false;

    // Square constructor: - -                                                         - -
    auto sqA = Square();             // Empty, Empty
    auto sqB = Square(White);        // White, Empty
    auto sqC = Square(White, Pawn);  // White, Pawn
    
    if (sqA.getColor() != EmptyColor || sqA.getPiece() != EmptyPiece) return false;
    if (sqB.getColor() != White || sqB.getPiece() != EmptyPiece)      return false;
    if (sqC.getColor() != White || sqC.getPiece() != Pawn)            return false;

    // Chessboard constructor: - -                                                     - -
    int count = 0x0;
    auto emptyBoard = Chessboard();  // Empty Cheassboard.

    // Every element should be empty:
    for (auto it = emptyBoard.begin(); it != emptyBoard.end(); ++it, ++count) {
        if ((*it).getColor() != EmptyColor || (*it).getPiece() != EmptyPiece) {
            return false;
        }
    }
    return (count == 0x40);
}

/** printTest: - -                                                                     - -
Tests the following function:
    - -                                                                                - -
    void Chessboard::print() const                                                      */
bool printTest(Chessboard& cb)
{   // Create stringstream to redirect std::cout to:
    std::stringstream capturedOutput;

    // Redirect std::cout to capturedOutput sstream:
    std::streambuf* coutBuffer = std::cout.rdbuf();
    std::cout.rdbuf(capturedOutput.rdbuf());

    // Print to sstream and restore std::cout:
    cb.print();
    std::cout.rdbuf(coutBuffer);

    std::string expectedText = "bR bN bB bQ bK bB bN bR \n"
                               "bP bP bP  . bP bP bP bP \n"
                               " .  . bP  .  .  .  .  . \n"
                               "wK  .  .  .  .  .  .  . \n"
                               " .  .  .  .  .  .  .  . \n"
                               "wP  . wP  .  .  .  .  . \n"
                               "wP wP wP  . wP wP wP wP \n"
                               "wR wN wB wQ wK wB wN wR \n";

    return (expectedText == capturedOutput.str());
}


int main()
{   // Set up chess game starting positions:
    Chessboard cb;
    cb.starterBoard();
    cb.print();

    // Tests:
    std::cout << '-' << std::string(21, ' ') << '-';
    std::cout << "\n=---=[Start Tests]=---=";
    std::cout << "\n-" << std::string(21, ' ') << '-';
    std::cout << "\nPiece placement test: " << placeTest(cb);
    std::cout << "\nPiece movement test : " << moveTest(cb);
    std::cout << "\nPiece capture test  : " << captureTest(cb);
    std::cout << "\nPiece getter test   : " << getTest(cb);
    std::cout << "\nConstructor tests   : " << constructorTests(cb);
    std::cout << "\nIterator tests      : " << iteratorTests(cb);
    std::cout << "\nPrint test          : " << printTest(cb);
    std::cout << "\n-" << std::string(21, ' ') << '-';
    std::cout << "\n=---=[ End Tests ]=---=";
    std::cout << "\n-" << std::string(21, ' ') << '-' << std::endl;
    cb.print();

    return 0;
}   //                                                                                  */