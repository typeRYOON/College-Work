/*shape.h*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: shape.h
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview:
 >> The Shape class is the main class which stores data about a shape in an
 >> object. There are many functions for setting, getting, copying, and printing
 >> the shape's member attributes. Polymorphism is used with the main Shape class,
 >> the Circle, Rectangle, and RightTriangle classes inherit the Shape class's
 >> public/protected attributes, functions, constructors, etc.
 >> This class is to be used in the CanvasList class found in canvaslist.h, where
 >> the shape objects are the data stored in the CanvasList linked list ShapeNodes.
 >> The inheritance that occurs allows for different types of shapes to be used
 >> in the linked list ShapeNodes.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#pragma once
#include <iostream>
using namespace std;

class Shape {
protected:  // The coordinates will get inherited by the shape subclasses.
    int x;  // X cartesian coordinate on Canvas.
    int y;  // Y cartesian coordinate on Canvas.

public:
    // Constructors:
    Shape();
    Shape(int x, int y);

    // Destructor / Copy:
    virtual ~Shape();
    virtual Shape* copy();

    // Getter and setters:
    int getX() const;
    int getY() const;
    void setX(int);
    void setY(int);

    // Print function:
    virtual void printShape() const;
};

// Default constructor:
Shape::Shape() : x(0), y(0) {}

// Coordinate parameter constructor:
Shape::Shape(int x, int y) : x(x), y(y) {}

// Shape destructor:
Shape::~Shape() = default;

// Shape object deep copy function:
Shape* Shape::copy()
{   /**
    This function creates a deep copy of "this" Shape object and
    returns the newly heap allocated Shape object with the same
    values as "this" Shape.
        @return Shape pointer | Address of newly allocated Shape deep copy.
    */
    return new Shape(x, y);
}

// X coordinate getter function:
int Shape::getX() const
{   /**
    Returns x coordinate of "this" Shape (int). */
    return x;
}

// Y coordinate getter function:
int Shape::getY() const
{   /**
    Returns y coordinate of "this" Shape (int). */
    return y;
}

// X coordinate setter function:
void Shape::setX(int newX)
{   /**
    Sets x coordinate of "this" Shape (void). */
    x = newX;
}

// Y coordinate setter function:
void Shape::setY(int newY)
{   /**
    Sets y coordinate of "this" Shape (void). */
    y = newY;
}

// Shape info print function:
void Shape::printShape() const
{   /**
    This function prints the (x,y) coordinates and the type
    of shape object it is (type Shape). */
    cout << "It's a Shape at x: " << x << ", y: " << y << endl;
}

// Circle Shape Class: (inherits public Shape class functions/protected attributes/constructors)
class Circle : public Shape {
private:
    int radius;  // The radius of the circle on the Canvas.

public:
    // Constructors:
    Circle();
    Circle(int r);
    Circle(int x, int y, int r);

    // Destructor / Copy:
    virtual ~Circle();
    virtual Circle* copy();

    // Getter and setters:
    int getRadius() const;
    void setRadius(int);

    // Print function:
    virtual void printShape() const;
};

// Default constructor:
Circle::Circle() : radius(0) {}

// Radius parameter constructor:
Circle::Circle(int r) : radius(r) {}

// Full Circle attribute parameter constructor:
Circle::Circle(int x, int y, int r) : radius(r)
{   /**
    Constructs Circle object to have (x,y) and radius
    attributes to be set to passed parameter values. */
    this->x = x, this->y = y;
}

// Circle destructor:
Circle::~Circle() = default;

// Circle object deep copy function:
Circle* Circle::copy()
{   /**
    This function creates a deep copy of "this" Circle object and
    returns the newly heap allocated Circle object with the same
    values as "this" Circle.
        @return Circle pointer | Address of newly allocated Circle deep copy. */
    return new Circle(x, y, radius);
}

// Radius getter function:
int Circle::getRadius() const
{   /**
    Returns radius of "this" Circle (int). */
    return radius;
}

// Radius setter function:
void Circle::setRadius(int r)
{   /**
    Sets radius of "this" Circle (void). */
    radius = r;
}

// Circle info print function:
void Circle::printShape() const
{   /**
    This function prints the (x,y) coordinates, radius,
    and the type of shape object it is (type Circle). */
    cout << "It's a Circle at x: " << x << ", y: " << y << ", radius: " << radius << endl;
}

// Rectangle Shape Class: (inherits public Shape class functions/protected attributes/constructors)
class Rectangle : public Shape {
private:
    int width;   // Width length of rectangle drawn on canvas.
    int height;  // Height length of rectangle triangle drawn on canvas.

public:
    // Constructors:
    Rectangle();
    Rectangle(int w, int h);
    Rectangle(int x, int y, int w, int h);

    // Destructor / Copy:
    virtual ~Rectangle();
    virtual Rectangle* copy();

    // Getter and setters:
    int getWidth() const;
    int getHeight() const;
    void setWidth(int);
    void setHeight(int);

    // Print function:
    virtual void printShape() const;
};

// Default constructor:
Rectangle::Rectangle() : width(0), height(0) {}

// Width/height parameter constructor:
Rectangle::Rectangle(int w, int h) : width(w), height(h) {}

// Full Rectangle attribute parameter constructor:
Rectangle::Rectangle(int x, int y, int w, int h) : width(w), height(h)
{   /**
    Constructs Rectangle object to have (x,y) coordinates, width,
    and height attributes to be set to passed parameter values. */
    this->x = x, this->y = y;
}

// Rectangle destructor:
Rectangle::~Rectangle() = default;

// Rectangle object deep copy function:
Rectangle* Rectangle::copy()
{   /**
    This function creates a deep copy of "this" Rectangle object and
    returns the newly heap allocated Rectangle object with the same
    values as "this" Rectangle.
        @return Rectangle pointer | Address of newly allocated Rectangle deep copy. */
    return new Rectangle(x, y,width, height);
}

// Width getter function:
int Rectangle::getWidth() const
{   /**
    Returns width of "this" Rectangle (int). */
    return width;
}

// Height getter function:
int Rectangle::getHeight() const
{   /**
    Returns height of "this" Rectangle (int). */
    return height;
}

// Width setter function:
void Rectangle::setWidth(int w)
{   /**
    Sets width of "this" Rectangle (void). */
    width = w;
}

// Height setter function:
void Rectangle::setHeight(int h)
{   /**
    Sets height of "this" Rectangle (void). */
    height = h;
}

// Rectangle info print function:
void Rectangle::printShape() const
{   /**
    This function prints the (x,y) coordinates, width, height,
    and the type of shape object it is (type Rectangle). */
    cout << "It's a Rectangle at x: " << x << ", y: " << y;
    cout << " with width: " << width << " and height: " << height << endl;
}

// RightTriangle Shape Class: (inherits public Shape class functions/protected attributes/constructors)
class RightTriangle : public Shape {
private:
    int base;    // Base length of right triangle drawn on canvas.
    int height;  // Height length of right triangle drawn on canvas.

public:
    // Constructors:
    RightTriangle();
    RightTriangle(int b, int h);
    RightTriangle(int x, int y, int b, int h);

    // Destructor / Copy:
    virtual ~RightTriangle();
    virtual RightTriangle* copy();

    // Getter and setters:
    int getBase() const;
    int getHeight() const;
    void setBase(int);
    void setHeight(int);

    // Print function:
    virtual void printShape() const;
};

// Default constructor:
RightTriangle::RightTriangle() : base(0), height(0) {}

// Base/height parameter constructor:
RightTriangle::RightTriangle(int b, int h) : base(b), height(h) {}

// Full RightTriangle attribute parameter constructor:
RightTriangle::RightTriangle(int x, int y, int b, int h) : base(b), height(h)
{   /**
    Constructs RightTriangle object to have (x,y) coordinates, base,
    and height attributes to be set to passed parameter values. */
    this->x = x, this->y = y;
}

// RightTriangle destructor
RightTriangle::~RightTriangle() = default;

// RightTriangle object deep copy function:
RightTriangle* RightTriangle::copy()
{   /**
    This function creates a deep copy of "this" RightTriangle object and
    returns the newly heap allocated RightTriangle object with the same
    values as "this" RightTriangle.
        @return RightTriangle pointer | Address of newly allocated RightTriangle deep copy. */
    return new RightTriangle(x, y, base, height);
}

// Base getter function:
int RightTriangle::getBase() const
{   /**
    Returns base of "this" RightTriangle (int). */
    return base;
}

// Height getter function:
int RightTriangle::getHeight() const
{   /**
    Returns height of "this" RightTriangle (int). */
    return height;
}

// Base setter function:
void RightTriangle::setBase(int b)
{   /**
    Sets base of "this" RightTriangle (void). */
    base = b;
}

// Height setter function:
void RightTriangle::setHeight(int h)
{   /**
    Sets height of "this" RightTriangle (void). */
    height = h;
}

// RightTriangle info print function:
void RightTriangle::printShape() const
{   /**
    This function prints the (x,y) coordinates, base, height,
    and the type of shape object it is (type RightTriangle). */
    cout << "It's a Right Triangle at x: " << x << ", y: " << y;
    cout << " with base: " << base << " and height: " << height << endl;
}