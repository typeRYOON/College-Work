/*showcase.cpp*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: showcase.cpp
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview: This file is not required but rather shows what the CanvasList
 >> and Shape Classes can do, and how they interact with each other. No memory
 >> leaks are possible within the functions of the classes. Please run only
 >> this file (showcase.cpp) OR tests.cpp (for testing) and not both.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#include "canvaslist.h"

int main()
{   /**
    Main function I used for debugging while creating
    the CanvasList, ShapeNode, and Shape classes.
        @return int | 0 indicating a good program execution.
    */
    CanvasList myCanvas;
    cout << "List size: " << myCanvas.size() << endl;
    cout << "Front: " << myCanvas.front() << endl;

    cout << endl << endl << "Adding Shape to the front" << endl;
    auto *s = new Shape(1, 3);
    myCanvas.push_front(s);
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Adding Circle to the front" << endl;
    s = new Circle(2, 4, 3);
    myCanvas.push_front(s);
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Adding Rectangle to the back" << endl;
    s = new Rectangle(0, 10);
    myCanvas.push_back(s);
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Adding Right Triangle to the front" << endl;
    s = new RightTriangle(1, 2, 3, 4);
    myCanvas.push_front(s);
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Deleting last element" << endl;
    delete myCanvas.pop_back();
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Deleting first element" << endl;
    delete myCanvas.pop_front();
    cout << "List size: " << myCanvas.size() << endl;
    myCanvas.draw();

    cout << endl << endl << "Finding the shape at 2, 4" << endl;
    myCanvas.draw();
    int loc = myCanvas.find(2,4);
    cout << "Found location: " << loc << endl;
    s = myCanvas.shapeAt(loc);
    s->printShape();
    cout << "List size: " << myCanvas.size() << endl;

    cout << endl << endl << "Inserting Rectangle after index 1" << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    myCanvas.insertAfter(1, new Rectangle(3,4,5,5));
    cout << "Updated Original:" << endl;
    myCanvas.draw();


    cout << endl << endl << "Removing index 0" << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    myCanvas.removeAt(0);
    cout << "Updated Original:" << endl;
    myCanvas.draw();


    cout << endl << endl << "Removing index 45" << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    myCanvas.removeAt(45);
    cout << "Updated Original:" << endl;
    myCanvas.draw();


    cout << endl << endl << "Creating a copy of the canvas list" << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    CanvasList second = myCanvas;
    cout << "Copy:" << endl;
    second.draw();
    cout << "Original:" << endl;
    myCanvas.printAddresses();
    cout << "Copy:" << endl;
    second.printAddresses();


    cout << endl << endl << "Clearing all elements and internal shapes" << endl;
    myCanvas.clear();
    cout << "List size: " << myCanvas.size() << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    cout << "Copy:" << endl;
    second.draw();


    cout << endl << endl << "Using the assignment operator to overwrite copy." << endl;
    s = new Shape(4, 2);
    myCanvas.push_front(s);
    cout << "List size: " << myCanvas.size() << endl;
    cout << "Original:" << endl;
    myCanvas.draw();
    cout << "Copy:" << endl;
    second.draw();
    cout << "Original:" << endl;
    myCanvas.printAddresses();
    cout << "Copy:" << endl;
    second.printAddresses();
    second = myCanvas;
    cout << "Original:" << endl;
    myCanvas.draw();
    cout << "Copy:" << endl;
    second.draw();
    cout << "Original:" << endl;
    myCanvas.printAddresses();
    cout << "Copy:" << endl;
    second.printAddresses();
    return 0;
}