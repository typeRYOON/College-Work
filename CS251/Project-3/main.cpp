/*main.cpp*/
/* ----------------------------------------------------------------------------
 >> Program: mymatrix.h
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview: This file tests the mymatrix class using various objects
 >> throughout the tests. The included mymatrix header file has more
 >> information on the mymatrix class itself. This file is only tests.
 >> Dynamic memory was instructed to not be deleted for this project.
 >> Each test function has a header file detailing what is being tested.
 >> All the functions return a boolean value where true indicates the
 >> test passed and false if it failed the test.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#include "mymatrix.h"

bool defaultSizeTest() {  /**
        Test default matrix 4x4 size.
        4x4 default should return 16.  */
    mymatrix<int> M1;
    return M1.size() == 16;
}

bool jaggedSizeTest() {  /**
        Test jagged size matrix.
        Grow 4x4 row 0 to be jagged size of 8.  */
    mymatrix<int> M1;
    M1.growcols(0, 8);       // add 4 columns to row 0 in default 4x4 (16 + 4)
    return M1.size() == 20;
}

bool grownSizeTest() {  /**
        Tests the grow() function, shrinks are
        tested in another test later.  */
    mymatrix<int> M1;
                             // Given row is < matrix row, but columns is greater.
    M1.grow(2, 6);           // Should add 2 columns to all 4 rows. (4x6 M) (16 + 4*2)
    if (M1.size() != 24) return false;

    M1.grow(6, 2);           // Should add 2 rows at bottom with only 2 columns each, 4 new elements. (4x6 + 4)
    if (M1.size() != 28) return false;

    M1.growcols(2, 10);      // Create jagged edge that should add 4 elements to row 2. 4x6 + 8
    M1.grow(7, 9);           // Add 1 new row, grow to a 7x9 matrix with row 2 having 1 element sticking out.
    return M1.size() == 64;  // (7x9 + 1)
}

bool parameterMatrixSize() {  /**
        Tests the parameter constructor and resulting size
        Initialized a 2x8 matrix using constructor of parameter size 2x8:  */
    mymatrix<int> small(2, 4);
    return small.size() == 8;
}

bool copiedMatrixSize() {  /**
        Tests the copy constructor and the size of the resulting matrix.  */
    mymatrix<int> M1, temp;  // Size of temp should be default 4x4.
    M1.grow(6, 6);           // Grow M1 to different size (6x6).
    temp = M1;               // Copy constructor should change size of temp to match M1.
    return temp.size() == 36;
}

bool matrixMultiplicationSize() {  /**
        Tests matrix multiplication and does some operations to change the resulting matrix size.  */
    mymatrix<int> M1, M2;
    mymatrix<int> result = M1 * M2; // 4x4 * 4x4 should result in a 4x4 or 16 element matrix.
    if (result.size() != 16) return false;

    M2.grow(4, 10); // New matrix multiplication will be 4x4 * 4x10 to result in a 4x10 matrix.
    result = M1 * M2;
    if (result.size() != 40) return false;

    M1.grow(10, 4); // New matrix multiplication will be 10x4 * 4x10 to result in a 10x10 matrix.
    result = M1 * M2;
    return result.size() == 100;
}

bool scalarMultiplicationSize() {  /**
        Tests scalar multiplication on a grown/jagged matrix.  */
    mymatrix<int> M1(4, 8);     // 4x8
    M1.growcols(0, 11);         // 4x8 + 3
    M1.growcols(1, 9);          // 4x8 + 3 + 1
    // Make sure row and column sizes have grown:
    if (M1.numrows() != 4 && M1.numcols(0) != 11 && M1.numcols(1) != 9) return false;
    mymatrix<int> M2 = M1 * 2;  // Scalar multiplication size should still be 4x8 + 3 + 1.
    return (M2.size() == 36);
}

bool atFunctionCheck() {  /**
        Tests the at(x, y) function.  */
    mymatrix<int> M1;
    // Check if default value was set.
    if (M1.at(0, 0) != 0) return false;
    M1.at(0, 0) = 111;       // 111 0 0 0
    M1.at(1, 1) = 222;       // 0 222 0 0
    M1.at(2, 2) = 333;       // 0 0 333 0
    M1.at(3, 3) = 444;       // 0 0 0 444
    // Summed values should equal the contents in the matrix.
    int sum = M1.at(0, 0) + M1.at(1, 1) + M1.at(2, 2) + M1.at(3, 3);
    // M1.at(3, 0) and M1.at(0, 3) should be zero.
    return sum == 111 + 222 + 333 + 444 + M1.at(3, 0) + M1.at(0, 3);
}

bool parenthesisOperator() {  /**
        Tests the (x, y) operator  */
    mymatrix<int> M1;
    M1(0, 0) = 111;       // 111 0 0 0
    M1(1, 1) = 222;       // 0 222 0 0
    M1(2, 2) = 333;       // 0 0 333 0
    M1(3, 3) = 444;       // 0 0 0 444
    // Summed values should equal the contents in the matrix.
    int sum = M1(0, 0) + M1(1, 1) + M1(2, 2) + M1(3, 3);
    // M1.at(3, 0) and M1.at(0, 3) should be zero.
    return sum == 111 + 222 + 333 + 444 + M1(3, 0) + M1(0, 3);
}

bool numRowsColumnsTest() {  /**
        Tests the row/column size functions.  */
    mymatrix<int> M1;
    // Testing row sizes:
    if (M1.numrows() != 4) return false;
    M1.grow(10, 4); // Become 10x4
    if (M1.numrows() != 10) return false;

    // Testing column sizes:
    M1.growcols(9, 10); // Make row 9 jagged size of 10 columns.
                             // Row 0 should still be of size 4.
    if (M1.numcols(0) != 4)  return false;
                             // Testing grown row 10:
    if (M1.numcols(9) != 10) return false;
                             // Number of rows and columns should still be same:
    return (M1.numrows() == 10 && M1.numcols(9) == 10 && M1.numcols(0) == 4);
}

bool matrixMultiplicationRC_Test() {  /**
        Tests matrix multiplication and tests the size of the rows/columns. */
    mymatrix<int> M1, M2, M3;
    M3 = M1 * M2;            // 4x4 * 4x4 = 4x4
    if (M3.numrows() != 4 || M3.numcols(3) != 4) return false;
    M2.grow(4, 10);
    M3 = M1 * M2;            // 4x4 * 4x10 = 4x10
    if (M3.numrows() != 4 || M3.numcols(3) != 10) return false;
    M1.grow(10, 4);
    M3 = M1 * M2;            // 10x4 * 4x10 = 10x10
    if (M3.numrows() != 10 || M3.numcols(9) != 10) return false;
    M3.grow(20, 25);         // M3 = 20x25
    return (M3.numrows() == 20 && M3.numcols(19) == 25);
}

bool copyConstructorTestRC_Test() {  /**
        Tests the row/column size of a copy constructed matrix.  */
    mymatrix<int> M1;
    M1.grow(6, 6);       // M1 = 6x6
    M1.growcols(5, 11);  // M1 row 5 grown to size 11.
    if (M1.numrows() != 6 && M1.numcols(5) != 11) return false;
    mymatrix<int> M2 = M1;
    return (M2.numrows() == 6 && M2.numcols(5) == 11);
}

bool underSizeGrowTest() {  /**
        Tests how the grow/growcols functions handle shrinking.  */
    mymatrix<int> M1(6, 6);
    if (M1.numrows() != 6 && M1.numcols(5) != 11) return false;
    // Now to test growing the rows under the size (ex: grow 6x6 to size 3x3, should be 6x6 still)
    M1.grow(3, 3);
    M1.growcols(5, 11);  // Grow row 5 to 11 columns.
    // Size should still be overall 6x6 except row 5 having 11 columns.
    if (M1.numrows() != 6 && M1.numcols(0) != 6 && M1.numcols(5) != 11) return false;
    // Attempt to shrink row 0 to size 2, should still be 6 columns.
    M1.growcols(0, 2);
    if (M1.numcols(0) != 6) return false;
    // Grow from overall size 6x6 to 6x8 except row 5 should still have 11 elements because 8 < 11.
    M1.grow(6, 8);
    return (M1.numrows() == 6 && M1.numcols(0) == 8 && M1.numcols(5) == 11);
}

bool matrixMultiplicationValueTest(mymatrix<int>& M1, mymatrix<int>& M2) {  /**
        Changes M1 and M2 for future tests, tests the resulting values of
        multiplication.
            @param M1 : A int mymatrix object that is used in matrix multiplication here.
            @param M2 : A int mymatrix object that is used in matrix multiplication here.
        */
    // Changing values for future tests:
    M1.at(0, 0) = 1;
    M1.at(1, 1) = 2;
    M1.at(2, 2) = 3;
    M1.at(3, 3) = 4;
    M1.at(3, 2) = 2;

    M2.at(0, 0) = 5;
    M2.at(1, 1) = 6;
    M2.at(2, 2) = 7;
    M2.at(3, 3) = 8;
    M2.at(3, 2) = 2;
    /**
    1 0 0 0       5 0 0 0       5 0 0 0
    0 2 0 0       0 6 0 0       0 12 0 0
    0 0 3 0   x   0 0 7 0   =   0 0 21 0
    0 0 2 4       0 0 2 8       0 0 22 32   */
    mymatrix<int> M3 = M1 * M2;
    // (0, 0) = 1 * 5 = 5
    // (1, 1) = 2 * 6 = 12
    // (2, 2) = 3 * 7 = 21
    // (3, 3) = 4 * 8 = 32
    // (3, 2) = 2 * 7 + 4 * 2 = 22
    // Check if values in result matrix match what the values should be.
    if (M3.at(0, 0) != 5 && M3.at(1, 1) != 12) return false;
    if (M3.at(2, 2) != 21 && M3.at(3, 3) != 32) return false;
    // Putting a zero into one of the matrices should zero out result position.
    M1.at(2, 2) = 0;
    M3 = M1 * M2;
    // (2, 2) should now zero out
    if (M3.at(2, 2) != 0) return false;

    // Attempt matrix multiplication with M1 and result matrix M3 itself:
    M3 = M1 * M3;
    // Check if values match matrix:
    if (M3.at(0, 0) != 5 || M3.at(1, 1) != 24 || M3.at(2, 2) != 0) return false;
    return (M3.at(3, 2) == 88 && M3.at(3, 3) == 128);
} 

bool scalarMultiplicationValueTest(mymatrix<int>& M1) {  /**
        Tests scalar multiplication on the M1 matrix.
            @param M1 : A int mymatrix object that is used in scalar multiplication here.
        */
    /**  M1
    1 0 0 0
    0 2 0 0
    0 0 0 0
    0 0 2 4   */
    mymatrix<int> M2 = M1 * 3;
    /**  M2
    3 0 0 0
    0 6 0 0
    0 0 0 0
    0 0 6 12   */

    // Check some values that should not have changed / be zero:
    if (M2.at(0, 3) != 0 || M2.at(3, 0) != 0) return false;

    // Check if values have been multiplied by 3:
    if (M2.at(0, 0) != 3 || M2.at(1, 1) != 6 || M2.at(2, 2) != 0) return false;
    if (M2.at(3, 2) != 6 || M2.at(3, 3) != 12) return false;

    // Attempt sign change on itself:
    M2 = M2 * -1;
    if (M2.at(0, 0) != -3 || M2.at(1, 1) != -6 || M2.at(2, 2) != 0) return false;
    if (M2.at(3, 2) != -6 || M2.at(3, 3) != -12) return false;

    // Multiply by 0 on itself:
    M2 = M2 * 0;
    if (M2.at(0, 0) != 0 || M2.at(1, 1) != 0 || M2.at(2, 2) != 0) return false;
    if (M2.at(3, 2) != 0 || M2.at(3, 3) != 0) return false;
    return true;
}

bool paramConstructor() {  /**
        Does exception handling tests on the parameter constructor.  */
    try {
        mymatrix<int> M1(0, 1);      // Row size 0 given should throw exception here.
        return false;
    }
    catch (exception& e) {}
    try {
        mymatrix<int> M1(1, 0);      // Column size 0 given should throw exception here.
        return false;
    }
    catch (exception& e) {}
    try {
        mymatrix<int> M1(0, 0);      // Column/row size 0 given should throw exception here.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool outOfRangeTest() {  /**
        Does exception handling tests on the numCols function.  */
    mymatrix<int> M1(4, 4);          // Indices go from 0..3 for rows/columns.
    int temp;
    try {
        temp = M1.numcols(5);        // Row 5 is out of range 0..3.
        return false;
    }
    catch (exception& e) {}
    try {
        temp = M1.numcols(-1);       // Row -1 is out of range 0..3.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool growcolsExceptions() {  /**
        Does exception handling tests on growcols() function.  */
    mymatrix<int> M1(4, 4);
    try {
        M1.growcols(-1, 5);          // Row -1 is out of range 0..3.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.growcols(5, 5);           // Row 5 is out of range 0..3.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.growcols(3, 0);           // Column size 0 is too small.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool growExceptions() {  /**
        Does exception handling tests on grow() function.  */
    mymatrix<int> M1(4, 4);
    try {
        M1.grow(0, 5);               // Row size of 0 is too small.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.grow(5, 0);               // Column size of 0 is too small.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.grow(0, 0);               // Row/column size of 0 is too small.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool referenceOperatorExceptions() {  /**
        Does exception handling tests on .at(x, y) function
        and the () operator.  */
    mymatrix<int> M1(4, 4);
    // .at operator exception tests: - - - <<
    try {
        M1.at(-1, 0) = 1;            // Negative row access.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.at(0, -1) = 1;            // Negative column access.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.at(5, 0) = 1;             // Out of range matrix access, 5 not in 0..3.
        return false;
    }
    catch (exception& e) {}
    try {
        M1.at(0, 5) = 1;             // Out of range matrix access, 5 not in 0..3.
        return false;
    }
    catch (exception& e) {}
    // () operator exception tests: - - - <<
    try {
        M1(-1, 0) = 1;               // Negative row access.
        return false;
    }
    catch (exception& e) {}
    try {
        M1(0, -1) = 1;               // Negative column access.
        return false;
    }
    catch (exception& e) {}
    try {
        M1(5, 0) = 1;                // Out of range matrix access, 5 not in 0..3.
        return false;
    }
    catch (exception& e) {}
    try {
        M1(0, 5) = 1;                // Out of range matrix access, 5 not in 0..3.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool matrixMultiplicationExceptions() {  /**
        Does exception handling tests on illegal matrix multiplication operations.  */
    mymatrix<int> M1(4, 4), M2(4, 8);
    M2.growcols(2, 9);               // Jagged column in row 2 to size of 9.
    try {
        mymatrix<int> M3 = M1 * M2;  // 4x4 * 4x8 (BUT M2 row 2 is jagged thus not rectangular).
        return false;
    }
    catch (exception& e) {
        M2.grow(4, 9);               // Make M2 rectangular 4x9.
        M1.growcols(2, 6);           // Jagged column for later test.
    }
    try {
        mymatrix<int> M3 = M1 * M2;  // 4x4 * 4x9 (BUT M1 row 2 is jagged this not rectangular).
        return false;
    }
    catch (exception& e) {
        M1.grow(5, 6);               // Make M1 rectangular 5x6.
    }
    try {
        mymatrix<int> M3 = M1 * M2;  // 5x6 * 4x9, N mismatch RxN * NxC, 6 != 4.
        return false;
    }
    catch (exception& e) {
        return true;
    }
}

bool defaultValueTest() {  /**
        Tests the default values of various data types for the
        mymatrix class.  */
    // String: "" empty string - - - - <<
    mymatrix<string> M1(1, 1);
    if (!M1.at(0, 0).empty()) return false;
    // Char: '\0' Null character - - - <<
    mymatrix<char> M2(1, 1);
    if (M2.at(0, 0) != '\0') return false;
    // Float: 0 or 0.0 - - - - - - - - <<
    mymatrix<float> M3(1, 1);
    if (M3.at(0, 0) != 0.0) return false;
    // Bool: False - - - - - - - - - - <<
    mymatrix<bool> M4(1, 1);
    if (M4.at(0, 0)) return false;
    // Void pointer: nullptr - - - - - <<
    mymatrix<void*> M5(1, 1);
    return (M5.at(0, 0) == NULL);
}

bool diffT_ScalarMultiplication() {  /**
        Tests scalar multiplication with a data type different from integer.  */
    mymatrix<double> M1(1, 1);
    M1.at(0, 0) = 1.6;
    M1 = M1 * 2.0;                   // Multiply by different scalar type than integer.
    return (M1.at(0, 0) == 3.2);
}

int main() {  /**
		This is the main() function that keeps track of what
		functions pass/fail the tests. The functions are
		called within a ternary operator.  */
    mymatrix<int> M1, M2;
    int passed = 0, failed = 0;
    // Size tests: - - - - - - - - - - - - - - - - - - - - - - - - <<
    (defaultSizeTest()) ? ++passed : ++failed;
    (grownSizeTest()) ? ++passed : ++failed;
    (parameterMatrixSize()) ? ++passed : ++failed;
    (jaggedSizeTest()) ? ++passed : ++failed;
    (copiedMatrixSize()) ? ++passed : ++failed;
    (matrixMultiplicationSize()) ? ++passed : ++failed;
    (scalarMultiplicationSize()) ? ++passed : ++failed;
    cout << "\nSize tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;
    passed = 0, failed = 0;

    // Reference operator tests: - - - - - - - - - - - - - - - - - <<
    (atFunctionCheck()) ? ++passed : ++failed;
    (parenthesisOperator()) ? ++passed : ++failed;
    cout << "\nReference operator tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;
    passed = 0, failed = 0;

    // Number of rows/columns tests: - - - - - - - - - - - - - - - <<
    (numRowsColumnsTest()) ? ++passed : ++failed;
    (matrixMultiplicationRC_Test()) ? ++passed : ++failed;
    (copyConstructorTestRC_Test()) ? ++passed : ++failed;
    (underSizeGrowTest()) ? ++passed : ++failed;
    cout << "\nNumber of rows/columns tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;
    passed = 0, failed = 0;

    // Multiplication operator-overloaded tests: - - - - - - - - - <<
    (matrixMultiplicationValueTest(M1, M2)) ? ++passed : ++failed;
    (scalarMultiplicationValueTest(M1)) ? ++passed : ++failed;
    cout << "\nNumber of rows/columns tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;
    passed = 0, failed = 0;

    // Exception tests: - - - - - - - - - - - - - - - - - - - - -  <<
    (paramConstructor()) ? ++passed : ++failed;
    (outOfRangeTest()) ? ++passed : ++failed;
    (growcolsExceptions()) ? ++passed : ++failed;
    (growExceptions()) ? ++passed : ++failed;
    (referenceOperatorExceptions()) ? ++passed : ++failed;
    (matrixMultiplicationExceptions()) ? ++passed : ++failed;
    cout << "\nException tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;
    passed = 0, failed = 0;

    // Different data type tests: - - - - - - - - - - - - - - - -  <<
    (defaultValueTest()) ? ++passed : ++failed;
    (diffT_ScalarMultiplication()) ? ++passed : ++failed;
    cout << "\nDifferent data type tests:" << endl;
    cout << "PASS: " << passed << ", FAIL: " << failed << endl;

    return 0;
}
