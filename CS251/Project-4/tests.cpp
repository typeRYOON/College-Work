/*tests.cpp*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: canvaslist.h
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 >> Testing framework: Catch2
 - -                                        - -
 >> Overview:
 >> This is the test file that tests all the functions used in the canvaslist.h
 >> and shape.h files. The destructors are not tested because the valgrind check
 >> returns that all memory is freed on exit. The testing framework is catch2.
 >> More details on Shape, ShapeNode, and CanvasList objects in their respective
 >> header file class definitions.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#define CATCH_CONFIG_MAIN
#include "canvaslist.h"
#include "catch.hpp"
using namespace std;

TEST_CASE("Default CanvasList attributes.")
{   /**
    Tests the default CanvasList constructor attributes and
    some basic utility functions (size, front, and isempty). */
    CanvasList myCanvas;

    // Default size test:
    REQUIRE(myCanvas.size() == 0);

    // Default listFront pointer:
    REQUIRE(myCanvas.front() == nullptr);

    // isEmpty should return true:
    REQUIRE(myCanvas.isempty());
}

TEST_CASE("Node insertion functions.")
{   /**
    Testing how a CanvasList handles insertion of nodes,
    tests getX, getY, front(), push_front(), push_back(),
    insertAfter, and how listFront and listSize change. */
    CanvasList myCanvas;
    auto* newShapeOne = new Shape(1, 2);
    myCanvas.push_back(newShapeOne);

    // listFront should now point to a shape: -> {1}
    REQUIRE(myCanvas.front() != nullptr);

    // listFront value/newShapeOne should be pointing to the same address:
    REQUIRE(myCanvas.front()->value == newShapeOne);

    // Check to see if x and y values match what was passed:
    REQUIRE(myCanvas.front()->value->getX() == 1);  // X value.
    REQUIRE(myCanvas.front()->value->getY() == 2);  // Y value.

    // Push front a new shape: -> {2, 1}
    auto* newShapeTwo = new Shape(3, 4);
    myCanvas.push_front(newShapeTwo);

    // listFront should now point to newShapeTwo:
    REQUIRE(myCanvas.front()->value == newShapeTwo);

    // Size of list should have grown to 2 because of the push_front():
    REQUIRE(myCanvas.size() == 2);

    // Index one shape should be newShapeOne
    REQUIRE(myCanvas.front()->next->value == newShapeOne);

    // Check to see if x and y values match what was passed:
    REQUIRE(myCanvas.front()->value->getX() == 3);
    REQUIRE(myCanvas.front()->value->getY() == 4);

    // Adding two more nodes: -> {2, 1, X, X}
    myCanvas.push_back(new Shape(0, 0));
    myCanvas.push_back(new Shape(1, 1));

    // Should now be size 4:
    REQUIRE(myCanvas.size() == 4);

    // isEmpty should return false:
    REQUIRE(myCanvas.isempty() == false);

    // Insert new node into index 1: -> {2, 3, 1, X, X}
    auto* newShapeThree = new Shape(5, 6);
    myCanvas.insertAfter(0, newShapeThree);

    // Size check:
    REQUIRE(myCanvas.size() == 5);

    // Check index if index one is newShapeThree:
    REQUIRE(myCanvas.front()->next->value == newShapeThree);

    // Make sure listFront is still newShapeTwo:
    REQUIRE(myCanvas.front()->value == newShapeTwo);

    // Attempt out of range insertion (negative):
    auto* newShapeFour = new Shape(0, 0);
    myCanvas.insertAfter(-1, newShapeFour);

    // Size should still be 5:
    REQUIRE(myCanvas.size() == 5);

    // Attempt out of range insertion (> list Size)
    myCanvas.insertAfter(40, newShapeFour);

    // Size should still be 5:
    REQUIRE(myCanvas.size() == 5);

    // Insert into tail node case: -> {2, 3, 1, X, X, 4}
    myCanvas.insertAfter(4, newShapeFour);

    // Traverse to tail node (newShapeFour):
    ShapeNode* traverseNode = myCanvas.front();
    for (; traverseNode->next != nullptr; traverseNode = traverseNode->next);

    // The tail node value pointer should be newShapeFour's pointer:
    REQUIRE(traverseNode->value == newShapeFour);

    // The tail node should point to null:
    REQUIRE(traverseNode->next == nullptr);

    // List should look like: -> {2, 3, 1, X, X, 4}
    ShapeNode* nodeCheck = myCanvas.front();
    REQUIRE(nodeCheck->value == newShapeTwo);
    REQUIRE(nodeCheck->next->value == newShapeThree);
    REQUIRE(nodeCheck->next->next->value == newShapeOne);
    // Already checked tail therefore linked list has good insertion functions.
}

TEST_CASE("Node removal functions.")
{   /**
    Test how pop_back/front, removeAt will remove nodes
    from CanvasList linked list, assumes insertions work as intended.
    (Should be fine if insertion test cases passed). */
    auto* shapeOne = new Shape();
    auto* shapeTwo = new Shape();
    auto* shapeThree = new Shape();
    CanvasList myCanvas;

    // Push back nodes: -> {1, 2, 3}
    myCanvas.push_back(shapeOne);
    myCanvas.push_back(shapeTwo);
    myCanvas.push_back(shapeThree);

    // Test removeAt function, out of range (negative/out of range):
    myCanvas.removeAt(-1);
    myCanvas.removeAt(40);

    // Size should not of changed:
    REQUIRE(myCanvas.size() == 3);

    // Remove the listFront node (1): -> {2, 3}
    myCanvas.removeAt(0);

    // Size should have gone down:
    REQUIRE(myCanvas.size() == 2);

    // listFront should now be shapeTwo:
    REQUIRE(myCanvas.front()->value == shapeTwo);

    // I'm not sure how to check if memory is deallocated using catch2.
    // Add shapeOne back : -> {1, 2, 3}
    shapeOne = new Shape();
    myCanvas.push_front(shapeOne);

    // Remove middle node: -> {1, 3}
    myCanvas.removeAt(1);

    // Check if shapeOne points to ShapeThree now:
    REQUIRE(myCanvas.front()->next->value == shapeThree);

    // Pop shape three from list and check shape: {1}
    REQUIRE(myCanvas.pop_back() == shapeThree);
    REQUIRE(myCanvas.size() == 1);

    // Pop shape one from front of list: {}
    REQUIRE(myCanvas.pop_front() == shapeOne);

    // List should now be empty:
    REQUIRE(myCanvas.front() == nullptr);
    REQUIRE(myCanvas.size() == 0);

    // Pop functions should now only return nullptr:
    REQUIRE(myCanvas.pop_front() == nullptr);
    REQUIRE(myCanvas.pop_back() == nullptr);
    delete shapeOne, delete shapeThree;
}

TEST_CASE("Destructor / Clear function.")
{   /**
    Test clear() function, should make listFront nullptr
    and listSize goes to zero, CanvasList destructor uses this as well. */
    CanvasList myCanvas;
    auto* shapeOne = new Shape();
    auto* shapeTwo = new Shape();
    auto* shapeThree = new Shape();

    // Push back nodes: -> {1, 2, 3}
    myCanvas.push_back(shapeOne);
    myCanvas.push_back(shapeTwo);
    myCanvas.push_back(shapeThree);

    // Make sure linked list has changed based on insertions:
    REQUIRE(myCanvas.size() == 3);
    REQUIRE(myCanvas.front()->value == shapeOne);

    // Make sure linked list has been cleared:
    myCanvas.clear();
    REQUIRE(myCanvas.front() == nullptr);
    REQUIRE(myCanvas.size() == 0);

    // Attempt clear on empty CanvasList:
    myCanvas.clear();
    REQUIRE(myCanvas.front() == nullptr);
    REQUIRE(myCanvas.size() == 0);
    // Since there are no memory leaks, the nodes/shapes should be deallocated.
    // Destructor for myCanvas utilizes this so that should also work for CanvasList objects.
}

TEST_CASE("Seeking shape functions.")
{   /**
    Tests the find() and shapeAt() function
    for the CanvasList class.*/
    CanvasList myCanvas;

    // Push back some shapes with distinct coordinates: <- {1, 2, 3}
    auto* shapeOne = new Shape(1, 2);
    auto* shapeTwo = new Circle(3, 4, 10);
    auto* shapeThree = new RightTriangle(5, 6, 1, 2);
    myCanvas.push_back(shapeOne);
    myCanvas.push_back(shapeTwo);
    myCanvas.push_back(shapeThree);

    // Test a shape coordinate that doesn't exist:
    int loc = myCanvas.find(1, 3);
    REQUIRE(loc == -1);

    // Test a real shape at (5, 6):
    loc = myCanvas.find(5, 6);
    REQUIRE(loc == 2);  // Index two is indeed the index of RightTriangle object (shapeThree).

    // Using indices, check to make sure the shape is the same as each respective shape on list.
    Shape* returnedShape = myCanvas.shapeAt(0);
    REQUIRE(returnedShape == shapeOne);
    returnedShape = myCanvas.shapeAt(1);
    REQUIRE(returnedShape == shapeTwo);
    returnedShape = myCanvas.shapeAt(loc);
    REQUIRE(returnedShape == shapeThree);

    // Check to see invalid index returns nullptr:
    returnedShape = myCanvas.shapeAt(-1);
    REQUIRE(returnedShape == nullptr);
    returnedShape = myCanvas.shapeAt(3);
    REQUIRE(returnedShape == nullptr);

    // Make sure no nodes were removed from list:
    REQUIRE(myCanvas.size() == 3);
}

TEST_CASE("Parameter constructor tests.")
{   /**
    Tests the parameter constructor which is used whenever
    passing a existing list as a parameter into a new CanvasList definition. */
    CanvasList canvasSource;

    // Insert two shapes into a source canvas list: <- {1, 2}
    auto* shapeOne = new Shape(1, 2);
    auto* shapeTwo = new Shape(3, 4);
    canvasSource.push_back(shapeOne);
    canvasSource.push_back(shapeTwo);

    SECTION("Two nodes on a source list.") {
        CanvasList myCanvas(canvasSource);
        ShapeNode* myCanvasFront = myCanvas.front();
        ShapeNode* canvasSourceFront = canvasSource.front();

        // ShapeNode addresses of myCanvas and canvasSource should be different:
        REQUIRE(myCanvasFront != canvasSourceFront);

        // Shape addresses of myCanvas and canvasSource should be different:
        REQUIRE(myCanvasFront->value != canvasSourceFront->value);

        // Sizes should be the same:
        REQUIRE(myCanvas.size() == canvasSource.size());
        REQUIRE(myCanvas.size() == 2);

        // The data stored in each shape should be the same:
        REQUIRE(myCanvasFront->value->getX() == canvasSourceFront->value->getX());
        REQUIRE(myCanvasFront->value->getY() == canvasSourceFront->value->getY());
    }
    SECTION("Empty source list") {
        canvasSource.clear();
        CanvasList myCanvas(canvasSource);

        // Front of both lists should be nullptr:
        REQUIRE(myCanvas.front() == nullptr);
        REQUIRE(canvasSource.front() == nullptr);

        // Size of myCanvas should be zero:
        REQUIRE(myCanvas.size() == 0);
    }
}

TEST_CASE("Operator= CanvasList overwriting.")
{   /**
    Tests the operator = for overwriting a existing
    canvas list with a source list. */
    CanvasList myCanvas, sourceCanvas;

    // Push back two nodes to overwrite: <- {1, X}
    auto* shapeOne = new Shape(1, 2);
    myCanvas.push_back(shapeOne);
    myCanvas.push_back(new Shape());

    // Push back singular node to overwrite myCanvas with:
    auto* shapeOneSource = new Shape(3, 4);
    sourceCanvas.push_back(shapeOneSource);

    // Tests may fail due to sections reallocating to shapeOne/shapeOneSource address (unlucky coincidence).
    SECTION(">0 Nodes overwritten with >0 nodes.") {
        myCanvas = sourceCanvas;

        // myCanvas size should now be equal to sourceCanvas's size (1) and not 2.
        REQUIRE(myCanvas.size() == sourceCanvas.size());
        REQUIRE(myCanvas.size() == 1);

        // listFronts addresses should be different:
        REQUIRE(myCanvas.front() != sourceCanvas.front());
        REQUIRE(myCanvas.front()->value != shapeOneSource);

        // myCanvas listFront should not be old listFront:
        REQUIRE(myCanvas.front()->value != shapeOne);

        // Data in listFronts should be same:
        REQUIRE(myCanvas.front()->value->getX() == sourceCanvas.front()->value->getX());
        REQUIRE(myCanvas.front()->value->getY() == sourceCanvas.front()->value->getY());
        REQUIRE(myCanvas.front()->value->getX() == 3);
        REQUIRE(myCanvas.front()->value->getY() == 4);

        // myCanvas listFront should point to nullptr (same as sourceCanvas):
        REQUIRE(myCanvas.front()->next == sourceCanvas.front()->next);
        REQUIRE(myCanvas.front()->next == nullptr);
    }
    SECTION(">0 Nodes overwritten with empty list.") {
        sourceCanvas.clear();
        myCanvas = sourceCanvas;

        // Sizes should both be zero.
        REQUIRE(myCanvas.size() == sourceCanvas.size());
        REQUIRE(myCanvas.size() == 0);

        // listFronts should both be nullptr, thus the lists are both empty:
        REQUIRE(myCanvas.front() == nullptr);
        REQUIRE(sourceCanvas.front() == nullptr);
    }
    SECTION("Empty list overwritten with >0 nodes.") {
        myCanvas.clear();
        myCanvas = sourceCanvas;

        // myCanvas size should be size one:
        REQUIRE(myCanvas.size() == sourceCanvas.size());
        REQUIRE(myCanvas.size() == 1);

        // myCanvas listFront should be different form old listFront Shape:
        REQUIRE(myCanvas.front()->value != shapeOne);

        // The front node of source and dest lists should be different:
        REQUIRE(myCanvas.front() != sourceCanvas.front());
        REQUIRE(myCanvas.front()->value != sourceCanvas.front()->value);

        // Data in front nodes should be the same:
        REQUIRE(myCanvas.front()->value->getX() == sourceCanvas.front()->value->getX());
        REQUIRE(myCanvas.front()->value->getY() == sourceCanvas.front()->value->getY());
        REQUIRE(myCanvas.front()->value->getX() == 3);
        REQUIRE(myCanvas.front()->value->getY() == 4);

        // myCanvas listFront should point to nullptr (same as sourceCanvas):
        REQUIRE(myCanvas.front()->next == sourceCanvas.front()->next);
        REQUIRE(myCanvas.front()->next == nullptr);
    }
    SECTION("Empty list overwritten with empty list.") {
        myCanvas.clear();
        sourceCanvas.clear();
        myCanvas = sourceCanvas;

        // Sizes should both be zero:
        REQUIRE(myCanvas.size() == sourceCanvas.size());
        REQUIRE(myCanvas.size() == 0);

        // listFronts should now be nullptr:
        REQUIRE(myCanvas.front() == nullptr);
        REQUIRE(sourceCanvas.front() == nullptr);
    }
}  // Since there are no memory leaks, the overwritten nodes/shapes are assumed to be successfully deallocated.

TEST_CASE("Shape object attributes:")
{   /**
    Tests the different shape attributes, shape getter/setters,
    and constructors */
    auto* newTriangle = new RightTriangle(1, 2, 3, 4);
    REQUIRE(newTriangle->getX() == 1);
    REQUIRE(newTriangle->getY() == 2);
    REQUIRE(newTriangle->getBase() == 3);
    REQUIRE(newTriangle->getHeight() == 4);

    auto* newRectangle = new class Rectangle(5, 6, 7, 8);
    REQUIRE(newRectangle->getX() == 5);
    REQUIRE(newRectangle->getY() == 6);
    REQUIRE(newRectangle->getWidth() == 7);
    REQUIRE(newRectangle->getHeight());

    auto* newCircle = new Circle(9, 10, 11);
    REQUIRE(newCircle->getX() == 9);
    REQUIRE(newCircle->getY() == 10);
    REQUIRE(newCircle->getRadius() == 11);

    auto* newShape = new Shape(12, 13);
    REQUIRE(newShape->getX() == 12);
    REQUIRE(newShape->getY() == 13);

    // Test partial parameter constructor (x an y should be zeros):
    auto* newCircleTwo = new Circle(5);
    REQUIRE(newCircleTwo->getX() == 0);
    REQUIRE(newCircleTwo->getY() == 0);
    REQUIRE(newCircleTwo->getRadius() == 5);

    auto* newRectangleTwo = new class Rectangle(10, 20);
    REQUIRE(newRectangleTwo->getX() == 0);
    REQUIRE(newRectangleTwo->getY() == 0);
    REQUIRE(newRectangleTwo->getWidth() == 10);
    REQUIRE(newRectangleTwo->getHeight() == 20);

    auto* newTriangleTwo = new RightTriangle(30, 40);
    REQUIRE(newTriangleTwo->getX() == 0);
    REQUIRE(newTriangleTwo->getY() == 0);
    REQUIRE(newTriangleTwo->getBase() == 30);
    REQUIRE(newTriangleTwo->getHeight() == 40);
    delete newShape, delete newCircle, delete newRectangle, delete newTriangle;
    delete newCircleTwo, delete newRectangleTwo, delete newTriangleTwo;
}

TEST_CASE("Shape object copy function.")
{   /**
    Tests the copy function to deep copy varying shapes. */
    // Shape object copy test:
    auto* newShapeS = new Shape(1, 2);
    Shape* copyS = newShapeS->copy();
    REQUIRE(copyS->getX() == 1);
    REQUIRE(copyS->getY() == 2);
    REQUIRE(newShapeS != copyS);  // <- copyS should be a new heap allocation.


    // Circle object copy test:
    auto* newShapeC = new Circle(3, 4, 5);
    Circle* copyC = newShapeC->copy();
    REQUIRE(copyC->getX() == 3);
    REQUIRE(copyC->getY() == 4);
    REQUIRE(copyC->getRadius() == 5);
    REQUIRE(newShapeC != copyC);

    // Rectangle object copy test:
    auto* newShapeR = new class Rectangle(6, 7, 8, 9);
    class Rectangle* copyR = newShapeR->copy();
    REQUIRE(copyR->getX() == 6);
    REQUIRE(copyR->getY() == 7);
    REQUIRE(copyR->getWidth() == 8);
    REQUIRE(copyR->getHeight() == 9);
    REQUIRE(newShapeR != copyR);

    // RightTriangle object copy test:
    auto* newShapeT = new RightTriangle(10, 11, 12, 13);
    RightTriangle* copyT = newShapeT->copy();
    REQUIRE(copyT->getX() == 10);
    REQUIRE(copyT->getY() == 11);
    REQUIRE(copyT->getBase() == 12);
    REQUIRE(copyT->getHeight() == 13);
    REQUIRE(newShapeT != copyT);
    delete copyS, delete copyC, delete copyR, delete copyT;

    // Test setters correctly changed attributes:
    // Shape x and y sets:
    newShapeS->setX(-1);
    newShapeS->setY(-2);
    REQUIRE(newShapeS->getX() == -1);
    REQUIRE(newShapeS->getY() == -2);

    // Circle radius set:
    newShapeC->setRadius(-5);
    REQUIRE(newShapeC->getRadius() == -5);

    // Rectangle width and height sets:
    newShapeR->setWidth(-8);
    newShapeR->setHeight(-9);
    REQUIRE(newShapeR->getWidth() == -8);
    REQUIRE(newShapeR->getHeight() == -9);

    // RightTriangle base and height sets:
    newShapeT->setBase(-12);
    newShapeT->setHeight(-13);
    REQUIRE(newShapeT->getBase() == -12);
    REQUIRE(newShapeT->getHeight() == -13);
    delete newShapeS, delete newShapeC, delete newShapeR, delete newShapeT;
}