/*mymatrix.h*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: mymatrix.h
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview:
 >> The mymatrix class provides a matrix (2D array) abstraction.
 >> The size can grow dynamically in both directions (rows and
 >> cols).  Also, rows can be "jagged" --- i.e. rows can have
 >> different column sizes, and thus the matrix is not necessarily
 >> rectangular.  All elements are initialized to the default value
 >> for the given type T.
 >> Example:
 >>   mymatrix<int>  M;  // 4x4 matrix, initialized to 0
 >> 
 >>      M(0, 0) = 123;
 >>      M(1, 1) = 456;
 >>      M(2, 2) = 789;
 >>      M(3, 3) = -99;
 >>
 >>   M.growcols(1, 8);  // increase # of cols in row 1 to 8
 >>   M._output();
 >>
 >>      Output:
 >>      123 0 0 0
 >>      0 456 0 0 0 0 0 0
 >>      0 0 789 0
 >>      0 0 0 -99
---------------------------------------------------------------------------- */
// Preprocessor directives:
#pragma once
#include <iostream>
#include <exception>
#include <stdexcept>
using namespace std;

template<typename T>
class mymatrix {
private:
    struct ROW {
        T*  Cols;     // Dynamic array of column elements
        int NumCols;  // Total # of columns (0..NumCols-1)
    };
    ROW* Rows;        // Dynamic array of ROWs.
    int  NumRows;     // Total # of rows (0..NumRows-1).
    int matrixIteration(const mymatrix<T>& other, int& i, int& j) {
        /** Matrix multiplication iteration helper function - - - <<
        Iterate this matrix's columns in row i, iterate other matrix's vertical row j, (k).
            @param other : Another mymatrix object that is needed to access for matrix multiplication.
            @param i : This matrix row i.
            @param j : Other matrix column j.
            @return int | A sum that adds up all the results from the matrix multiplication.
        */
        int sum = 0;
        for (int k = 0; k < Rows[i].NumCols; k++) {
            sum += this->Rows[i].Cols[k] * other.at(k, j);
        }
        return sum;
    }

public:
    mymatrix() {
        /** Default constructor: - - - <<
        Called automatically by C++ to construct a 4x4 matrix.  All
        elements are initialized to the default value of T.
        */
        Rows = new ROW[4];                   // An array with 4 ROW structs:
        NumRows = 4;
        for (int r = 0; r < NumRows; ++r) {  // Initialize each row to have 4 columns:
            Rows[r].Cols = new T[4];         // An array with 4 elements of type T:
            Rows[r].NumCols = 4;
            // Initialize the elements to their default value:
            for (int c = 0; c < Rows[r].NumCols; ++c) {
                Rows[r].Cols[c] = T{};       // Default value for type T:
            }
        }
    }

    mymatrix(int R, int C) {
        /** Parameterized constructor: - - - <<
        Called automatically by C++ to construct a matrix with R rows,
        where each row has C columns. All elements are initialized to
        the default value of T.
            @param R : A integer value that makes this matrix's row count be of size R
            @param C : A integer value that makes this matrix's column count be of size C
        */
        if (R < 1)                      // Case: row size 0 given.
            throw invalid_argument("mymatrix::constructor: # of rows");
        if (C < 1)                      // Case: column size 0 given.
            throw invalid_argument("mymatrix::constructor: # of cols");
        Rows = new ROW[R];              // An array with R ROW structs.
        NumRows = R;
        for (int r = 0; r < R; ++r) {   // Initialize each row to have R columns:
            Rows[r].Cols = new T[C];    // An array with C elements of type T:
            Rows[r].NumCols = C;
            // Initialize the elements to their default value:
            for (int c = 0; c < Rows[r].NumCols; ++c) {
                Rows[r].Cols[c] = T{};  // Default value for type T:
            }
        }
    }

    mymatrix(const mymatrix<T>& other) {
		/** Copy constructor: - - - <<
		Called automatically by C++ to construct a matrix that contains a
        copy of an existing matrix.  Example: this occurs when passing
        mymatrix as a parameter by value
            void some_function(mymatrix<int> M2)  <--- M2 is a copy:
            { ... }
		    @param other : A matrix to be copied into a new matrix, creates new dynamic memory and copies.
		*/
        NumRows = other.NumRows;
        Rows = new ROW[NumRows];                          // An array with other's ROW structs amount:
        for (int r = 0; r < NumRows; ++r) {
            this->Rows[r].Cols = new T[other.Rows[r].NumCols];  // Initialize each row to have other's columns count:
            this->Rows[r].NumCols = other.Rows[r].NumCols;      // An array with other's column count.
            // Initialize the elements to other's values:
            for (int c = 0; c < Rows[r].NumCols; ++c) {
                this->Rows[r].Cols[c] = other.Rows[r].Cols[c];  // Other's value assigned:
            }
        }
    }

    int numrows() const {
        /** mymatrix # of rows accessor: - - - <<
        Returns the # of rows in the matrix.  The indices for these rows
        are 0..NumRows-1.
            @return int | A integer indicating the number of rows in the matrix, ex: 4x3 returns 4
        */
        return NumRows;
    }

    int numcols(int r) const {
        /** mymatrix # of columns accessor: - - - <<
        Returns the # of columns in row r.  The indices for these columns
        are 0..NumCols-1.  Note that the # of columns can be different
        row-by-row since "jagged" rows are supported --- matrices are not
        necessarily rectangular.
            @param r : A index indicating the row to return the # of columns.
            @return int | A integer indicating the number of columns in row r.
        */
        if (r < 0 || r >= NumRows)  // Case: out of index range.
            throw invalid_argument("mymatrix::numcols: row");
        return Rows[r].NumCols;
    }

    void growcols(int r, int C) {
        /** myMatrix row size expansion function: - - - <<
        Grows the # of columns in row r to at least C.  If row r contains
        fewer than C columns, then columns are added; the existing elements
        are retained and new locations are initialized to the default value
        for T.  If row r has C or more columns, then all existing columns
        are retained -- we never reduce the # of columns.

        Jagged rows are supported, i.e. different rows may have different
        column capacities -- matrices are not necessarily rectangular.
            @param r : An integer indicating the row to access and grow.
            @param C : An integer indicating how big to grow row r.
            @return void
        */
        if (r < 0 || r >= NumRows)         // Case: out of index range.
            throw invalid_argument("mymatrix::growcols: row");
        if (C < 1)                         // Case: column size 0 given.
            throw invalid_argument("mymatrix::growcols: columns");
        if (Rows[r].NumCols >= C)          // Case: row r's size is already >= size of C
            return;

        T* newCols = new T[C];             // A temp dynamic array of size C.
        for (int i = 0; i < Rows[r].NumCols; ++i) {
            newCols[i] = Rows[r].Cols[i];  // Copy row r's contents into temp array.
        }
        for (int i = Rows[r].NumCols; i < C; ++i) {
            newCols[i] = T{};              // Initialize newly grown space to default of type.
        }
        Rows[r].Cols = newCols;
        Rows[r].NumCols = C;
    }

    void grow(int R, int C) {
        /** myMatrix column and row size expansion function: - - - <<
        Grows the size of the matrix so that it contains at least R rows,
        and every row contains at least C columns.

        If the matrix contains fewer than R rows, then rows are added
        to the matrix; each new row will have C columns initialized to
        the default value of T.  If R <= numrows(), then all existing
        rows are retained -- we never reduce the # of rows.

        If any row contains fewer than C columns, then columns are added
        to increase the # of columns to C; existing values are retained
        and additional columns are initialized to the default value of T.
        If C <= numcols(r) for any row r, then all existing columns are
        retained -- we never reduce the # of columns.
            @param R : An integer indicating how big to grow total row size.
            @param C : An integer indicating how big to grow each row's column size.
            @return void
        */
        if (R < 1)                        // Case: row size 0 given.
            throw invalid_argument("mymatrix::grow: # of rows");
        if (C < 1)                        // Case: column size 0 given.
            throw invalid_argument("mymatrix::grow: # of cols");
        R = (R < NumRows) ? NumRows : R;  // Change row size only if R >= NumRows.
        ROW* newRows = new ROW[R];        // A dynamic array with R ROW structs:
        for (int r = 0; r < NumRows; ++r) {
            if (Rows[r].NumCols < C) {    // Copy old row contents into new matrix branch:
                newRows[r].Cols = new T[C];
                newRows[r].NumCols = C;
                // Assign default value for newly grown matrix columns.
                for (int c = Rows[r].NumCols; c < C; ++c) {
                    newRows[r].Cols[c] = T{};
                }
            }
            else {  // A row with columns # > C should retain olf size:
                newRows[r].Cols = new T[Rows[r].NumCols];
                newRows[r].NumCols = this->Rows[r].NumCols;
            }
            // Copy old row contents into new matrix columns up to old column size index.
            for (int c = 0; c < Rows[r].NumCols; ++c) {
                newRows[r].Cols[c] = Rows[r].Cols[c];
            }
        }
        // Create new rows and their columns:
        for (int r = NumRows; r < R; ++r) {
            newRows[r].Cols = new T[C];  // An array with C elements of type T:
            newRows[r].NumCols = C;
            // Initialize the elements to their default value:
            for (int c = 0; c < newRows[r].NumCols; ++c) {
                newRows[r].Cols[c] = T{};
            }
        }
        // Assign new dynamic memory and row size:
        this->Rows = newRows;
        this->NumRows = R;
    }

    int size() const {
        /** myMatrix size function: - - - <<
        Returns the total # of elements in the matrix.
            @return void
        */
        int size = 0;
        // Adding column counts will account for jagged rows.
        for (int r = 0; r < NumRows; ++r) {
            size += Rows[r].NumCols;
        }
        return size;
    }

    T& at(int r, int c) const {
        /** At operator: - - - <<
        Returns a reference to the element at location (r, c); this
        allows you to access the element or change it:
            @param r : The row index to access.
            @param c : The column index to access.
            @return T& | A reference of type T, that allows access/change.
        */
        if (r < 0 || r >= NumRows)         // Case: out of row range:
            throw invalid_argument("mymatrix::at: row");
        if (c < 0 || c >= Rows[r].NumCols) // Case: out of column range:
            throw invalid_argument("mymatrix::at: col");
        return Rows[r].Cols[c];
    }

    T& operator()(int r, int c) const {
        /** () operator overload: - - - <<
        Returns a reference to the element at location (r, c); this
        allows you to access the element or change it:
            @param r : The row index to access.
            @param c : The column index to access.
            @return T& | A reference of type T, that allows access/change.
        */
        if (r < 0 || r >= NumRows)          // Case: out of row range:
            throw invalid_argument("mymatrix::(): row");
        if (c < 0 || c >= Rows[r].NumCols)  // Case: out of column range:
            throw invalid_argument("mymatrix::(): col");
        return Rows[r].Cols[c];
    }

    mymatrix<T> operator*(T scalar) {
        /** myMatrix scalar multiplication operator overload: - - - <<
        Multiplies every element of this matrix by the given scalar value,
        producing a new matrix that is returned. "This" matrix is not
        changed.
            @param scalar : A type T value to multiply each this matrix's elements with.
            @return mymatrix<T> | A new matrix that is a copy of this * scalar.
        */
        mymatrix<T> result(NumRows, 1);  // Create a result matrix of size Rx1 (jagged rows are unknown).
        int C;
        for (int r = 0; r < NumRows; ++r) {
            C = Rows[r].NumCols;
            result.Rows[r].Cols = new T[C];  // An array with C elements of type T:
            result.Rows[r].NumCols = C;
            // Initialize the elements to this->matrix's elements * scalar:
            for (int c = 0; c < C; ++c) {
                result.Rows[r].Cols[c] = this->Rows[r].Cols[c] * scalar;
            }
        }
        return result;
    }

    mymatrix<T> operator*(const mymatrix<T>& other) {
        /** myMatrix multiplication operator overload: - - - <<
        Performs matrix multiplication M1 * M2, where M1 is "this" matrix and
        M2 is the "other" matrix.  This produces a new matrix, which is returned.
        "This" matrix is not changed, and neither is the "other" matrix.
        NOTE: M1 and M2 must be rectangular, if not an exception is thrown.  In
        addition, the sizes of M1 and M2 must be compatible in the following sense:
        M1 must be of size RxN and M2 must be of size NxC.  In this case, matrix
        multiplication can be performed, and the resulting matrix is of size RxC.
            @param other : Another mymatrix object that is needed to access for matrix multiplication.
            @return myMatrix<T> | The result matrix of size RxC, multiplied between this and other.
        */
        bool rectangular = true;
        int columnCheck = Rows[0].NumCols;         // 0th row's column count should match all rows.
        // Check "this" matrix rectangle condition.
        for (int r = 1; r < NumRows; ++r) {
            if (Rows[r].NumCols != columnCheck) {  // A jagged row is found, thus not a rectangular matrix.
                rectangular = false;
                break;
            }
        }
        if (!rectangular)  // Case: Jagged "this" matrix found.
            throw runtime_error("mymatrix::*: this not rectangular");
        // Check "other" matrix rectangle condition.
        rectangular = true;
        columnCheck = other.Rows[0].NumCols;
        for (int r = 1; r < other.NumRows; ++r) {
            if (other.Rows[r].NumCols != columnCheck) {
                rectangular = false;
                break;
            }
        }
        if (!rectangular)                                      // Case: Jagged "other" matrix found.
            throw runtime_error("mymatrix::*: other not rectangular");
        if (Rows[0].NumCols != other.NumRows)                  // Case: RxN * NxC, N mismatch.
            throw runtime_error("mymatrix::*: size mismatch");
        mymatrix<T> result(NumRows, other.Rows[0].NumCols);    // Result matrix of size RxC.
        for (int i = 0; i < NumRows; i++) {                    // This matrix row iteration (i).
            for (int j = 0; j < other.Rows[0].NumCols; j++) {  // Other matrix column iteration (j).
                // Iterate this matrix's columns in row i, iterate other matrix's vertical row j, (k).
                result.at(i, j) = matrixIteration(other, i, j);
            }
        }
        return result;
    }

    void _output() {
        /** myMatrix print function - - - <<
        Outputs the contents of the matrix; for debugging purposes.
            @return void
        */
        for (int r = 0; r < this->NumRows; ++r) {
            for (int c = 0; c < this->Rows[r].NumCols; ++c) {
                cout << this->Rows[r].Cols[c] << " ";
            }
            cout << endl;
        }
    }
};
