/*ourvector.h*/

//
// ourvector class --- a replacement for std::vector using the same
// dynamic array approach.  Starts with initial capacity of 4, and 
// doubles in size as needed.  Usage statistics are also collected
// and output to stderr when the last vector is destroyed.
//
// Adam T Koehler, PhD
// University of Illinois Chicago
// CS 251, Spring 2023
//
// Data Structure originally created by Joe Hummel, PhD
// University of Illinois Chicago
//

#pragma once

#include <iostream>
#include <exception>
#include <stdexcept>
#include <typeinfo>

using namespace std;


//
// ourvector<T>
//
template<typename T>
class ourvector
{
private:
  //
  // A vector is a dynamically-allocated array of elements, of type T.  
  // Since it's a low-level C-style array, we need to keep track of how 
  // many elements we have stored in the array (Size), and the total # of
  // available locations (Capacity).  When it's full, we double in size.
  //
  T*  A;         // pointer to dynamically-allocated C-style array    
  int Size;      // # of elements in the array
  int Capacity;  // total # of locations available

  //
  // Global stats on vector usage:
  //
  static int InUse;     // # of vector objects currently in use
  static int Vectors;   // # of vector objects created
  static int Inserts;   // # of elements inserted into the vector
  static int Accesses;  // # of times elements were accessed (read or written)

  //
  // Iterators are objects that allow iteration in a structure-neutral way.
  // For this vector class, we keep track of the vector object and the current
  // index into the vector.  As we iterate, we advance the index.
  //
  class iterator
  {
  private:
    ourvector* V;         // which vector are we iterating through?
    int        CurIndex;  // which element are we currently on?

  public:
    // default constructor: denotes first element
    iterator(ourvector* underlyingVector)
    {
      V = underlyingVector;
      CurIndex = 0;
    }

    // constructor: denotes ith element
    iterator(ourvector* underlyingVector, int i)
    {
      V = underlyingVector;
      CurIndex = i;
    }

    // advance:
    iterator& operator++()
    {
      CurIndex++;

      return *this;
    }

    // access current element:
    T& operator*()
    {
      V->Accesses++;
      
      return V->A[CurIndex];
    }

    // compare iterators, e.g. to stop iterating:
    bool operator!=(const iterator& rhs)
    {
      // is this iterator != to rhs iterator?
      if (V != rhs.V)  // different vectors?
        return true;
      if (CurIndex != rhs.CurIndex)  // different index?
        return true;

      // same underlying vector and index, so iterators denote same element:
      return false;
    }
  };


public:
  //
  // default constructor:
  //
  // Called automatically by C++ to create an empty vector with an 
  // initial capacity of 4.
  //
  ourvector()
  {
    A = new T[4];  // we start with a capacity of 4:
    Size = 0;
    Capacity = 4;

    InUse++;
    Vectors++;
  }

  //
  // copy constructor:
  //
  // Called automatically by C++ to create a vector that contains a copy
  // of an existing vector.  Example: this occurs when passing ourvector as
  // a parameter by value.
  //
  ourvector(const ourvector& other)
  {
    //
    // allocate this vector with same capacity as the other:
    //
    this->A = new T[other.Capacity];
    this->Size = other.Size;
    this->Capacity = other.Capacity;

    InUse++;
    Vectors++;

    //
    // now make a copy the elements from the other vector into this one:
    //
    for (int i = 0; i < other.Size; ++i)
    {
      this->A[i] = other.A[i];

      Accesses++;
      Inserts++;
    }

    //
    // done, this vector is now a copy of the other vector:
    //
  }

  //
  // move constructor:
  //
  // Called automatically by C++ to create a vector by *moving* the contents
  // of the other vector into this vector; when we're done, the other vector
  // no longer exists.  Example: this is called when a function returns a
  // vector as a result ---so the result is moved instead of copied.
  //
  ourvector(ourvector&& other)
  {
    //
    // NOTE: we can "move" the elements over by simply pointing to the 
    // array in the other vector:
    //
    this->A = other.A;

    //
    // we have the same size and capacity as the other vector:
    //
    this->Size = other.Size;
    this->Capacity = other.Capacity;

    //
    // clear the data members of the other vector since we now own the data:
    //
    other.A = nullptr;
    other.Size = 0;
    other.Capacity = 0;

    //
    // done, this vector now contains the data from the other vector, and
    // the other vector is now completely empty:
    //
  }

  //
  // destructor:
  //
  // Called automatically by C++ to free the memory associated by the vector.
  //
  virtual ~ourvector()
  {
    if (A != nullptr)  // then we have something to free:
    {
      delete[] A;  // since we new'd an array, we delete[] the same array

      InUse--;  // one fewer vector in use:
    }

    if (InUse == 0)  // last vector was just deleted, so output stats:
    {
      _stats();
    }
  }

  //
  // clear:
  //
  // Empties the vector of all elements, reseting size to 0 and capacity
  // to 4.
  //
  void clear()
  {
    //
    // to make sure elements are properly freed, let's free the array and 
    // reallocate:
    //
    delete[] A;  // since we new'd an array, we delete[] an array
    
    A = new T[4];  // reset to a new, empty vector with capacity of 4:
    Size = 0;
    Capacity = 4;
  }

  //
  // copy operator=
  //
  // Called when you assign one vector into another, i.e. this = other;
  //
  ourvector& operator=(const ourvector& other)
  {
    //
    // special case: are we assigning to ourself?
    //
    if (this == &other)
      return *this;

    // 
    // unlike a copy constructor, *this* vector exists and so we first
    // have to free the memory associated with this vector:
    //
    delete[] A;  // since we new'd an array, we delete[] an array

    //
    // allocate this array with same capacity as the other:
    //
    this->A = new T[other.Capacity];
    this->Size = other.Size;
    this->Capacity = other.Capacity;

    //
    // now make a copy the elements from the other vector into this one:
    //
    for (int i = 0; i < other.Size; ++i)
    {
      this->A[i] = other.A[i];

      Accesses++;
      Inserts++;
    }

    //
    // done, this vector is now a copy of the other vector:
    //
    return *this;  // we have to return a vector based on how = works:
  }

  //
  // move operator=
  //
  // Called when you move one vector into another, i.e. 
  // this = std::move(other);
  //
  ourvector& operator=(ourvector&& other)
  {
    //
    // special case: are we moving to ourself?
    //
    if (this == &other)
      return *this;

    // 
    // unlike a move constructor, *this* vector exists and so we first
    // have to free the memory associated with this vector:
    //
    delete[] A;  // since we new'd an array, we delete[] an array

    //
    // now move the *other* data to this vector:
    //
    this->A = other.A;
    this->Size = other.Size;
    this->Capacity = other.Capacity;

    //
    // clear the data members of the other vector since we now own the data:
    //
    other.A = nullptr;
    other.Size = 0;
    other.Capacity = 0;

    //
    // done, this vector now owns the data from the *other* vector:
    //
    return *this;  // we have to return a vector based on how = works:
  }

  //
  // size:
  //
  // Returns the # of elements currently in the array.
  //
  int size() const
  {
    return Size;
  }

  //
  // capacity:
  //
  // Returns the total # of available locations in the vector before it 
  // will need to be resized; resizing happens automatically when full.
  //
  int capacity() const
  {
    return Capacity;
  }

  //
  // push_back:
  //
  // Adds e to the end of the vector; if the vector is full, it's capacity 
  // is doubled and then e is added.
  //
  void push_back(T e)
  {
    //
    // is the vector full?  if so, we have to double in size before we can add:
    //
    if (Size == Capacity)
    {
      int newCapacity = Capacity * 2;
      T* newA = new T[newCapacity];

      // copy the elements from A to the new array:
      for (int i = 0; i < Size; ++i)
      {
        newA[i] = A[i];
      }

      // now delete A, and update private data members to point to new array
      // and reflect new capacity:
      delete[] A;
      A = newA;
      Capacity = newCapacity;
    }

    //
    // there's room, add to the end of the array:
    //
    A[Size] = e;
    Size++;

    Inserts++;
  }

  //
  // at(i):
  //
  // Returns a reference to the ith elements in the vector, which allows 
  // you to read (access) or write (modify) this element.  If i is out of
  // bounds, an exception is thrown.
  //
  T& at(int i)
  {
    if (i < 0 || i >= Size)
    {
      throw out_of_range("ourvector: i out of bounds");
    }

    Accesses++;

    return A[i];
  }

  //
  // [i]:
  //
  // Returns a reference to the ith elements in the vector, which allows 
  // you to read (access) or write (modify) this element.  If i is out of
  // bounds, an exception is thrown.  This is very convenient, since it
  // allows you to treat a vector like a built-in array:
  //
  //   cout << V[i] << endl;
  //
  T& operator[](int i)
  {
    return at(i);
  }

  //
  // front:
  // 
  // Returns a reference to the first elements in the vector, which allows 
  // you to read (access) or write (modify) this element.  If the vector is
  // empty, an exception is thrown. 
  //
  T& front()
  {
    if (Size == 0)
    {
      throw runtime_error("ourvector: empty");
    }

    Accesses++;

    return A[0];
  }

  //
  // back:
  // 
  // Returns a reference to the last elements in the vector, which allows 
  // you to read (access) or write (modify) this element.  If the vector is
  // empty, an exception is thrown. 
  //  
  T& back()
  {
    if (Size == 0)
    {
      throw runtime_error("ourvector: empty");
    }

    Accesses++;

    return A[Size-1];
  }

  //
  // begin:
  //
  // Returns an iterator (think pointer) denoting the first element
  // in the vector.  Iterators are used with the built-in C++ algorithms
  // to iterate through various data structures in an abstract way.
  //
  iterator begin()
  {
    return iterator(this);
  }

  //
  // end:
  //
  // Returns an iterator (think pointer) denoting the end of the iteration
  // space.  Iterators are used with the built-in C++ algorithms to 
  // iterate through various data structures in an abstract way.
  //
  iterator end()
  {
    return iterator(this, Size);
  }

  //
  // _output:
  //
  // Outputs the contents of the vector to stdout; for debugging purposes.
  //
  void _output()
  {
    cout << "** ourvector: ";

    for (int i = 0; i < Size; ++i)
      cout << A[i] << " ";

    cout << endl;
  }

  //
  // _stats:
  //
  // Outputs vector usage stats to stderr; for debugging purposes.
  //
  void _stats()
  {
    string name = typeid(T).name();

    //
    // if the name is complicated, strip off just the prefix:
    //
    size_t pos = name.find('<');
    if (pos != string::npos)
    {
      name = name.substr(0, pos);
    }

    cerr << "*********************************************************" << endl;
    cerr << "ourvector<" << name << "> stats:" << endl;
    cerr << " # of vectors created:   " << Vectors << endl;
    cerr << " # of elements inserted: " << Inserts << endl;
    cerr << " # of elements accessed: " << Accesses << endl;
    cerr << "*********************************************************" << endl;
  }

};

//
// For collecting stats on vector usage:
//
template<typename T>
int ourvector<T>::InUse = 0;

template<typename T>
int ourvector<T>::Vectors = 0;

template<typename T>
int ourvector<T>::Inserts = 0;

template<typename T>
int ourvector<T>::Accesses = 0;
