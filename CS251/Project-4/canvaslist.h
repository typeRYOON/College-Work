/*canvaslist.h*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: canvaslist.h
 >> Course: CS 251 SP23
 >> Author: Ryan Magdaleno (rmagd2)
 >> System: Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview:
 >> The CanvasList class is a data structure akin to a linked list,
 >> the data stored is a Shape object derived from the shape.h file. There
 >> are many functions to interact with the linked list itself such as push_back,
 >> clear, draw, etc. The ShapeNode class stores information such as the
 >> Shape object and the next ShapeNode address. The ShapeNode is specifically
 >> tailor-made for the Shape object class from the shape.h file.
 >>
 >> This class is supposed to mimic a Canvas where you draw different shapes at
 >> different (x,y) locations and was implemented using a linked list. More
 >> information about the shape objects used in this class are in the shape.h
 >> file included with this file.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#include "shape.h"

class ShapeNode {
public:
    Shape* value;          // Pointer to shape object.
    ShapeNode* next;       // Pointer to next ShapeNode object in current CanvasList linked list.
};

class CanvasList {
private:
    int listSize;          // Amount of ShapeNode objects in current CanvasList linked list.
    ShapeNode* listFront;  // Pointer to head ShapeNode in linked list.
    void copyCanvasListNodes(const CanvasList &otherList);

public:
    // Constructor related:
    CanvasList();
    CanvasList(const CanvasList &);
    CanvasList operator=(const CanvasList &);

    // Destructor related:
    virtual ~CanvasList();
    void clear();

    // ShapeNode insertion functions:
    void insertAfter(int, Shape *);
    void push_front(Shape *);
    void push_back(Shape *);

    // ShapeNode removal functions:
    void removeAt(int);
    Shape* pop_front();
    Shape* pop_back();

    // CanvasList utility functions:
    ShapeNode* front() const;
    bool isempty() const;
    int size() const;

    // Seeking functions:
    int find(int x, int y) const;
    Shape* shapeAt(int) const;

    // Print functions:
    void draw() const;
    void printAddresses() const;
};

// ShapeNode object deep copying from "other" CanvasList to "this" CanvasList linked list:
void CanvasList::copyCanvasListNodes(const CanvasList& otherList)
{   /**
    This function traverses "otherList" and creates a deep copy of each node with new heap memory allocated.
    This function should only be called if the "otherList" linked list is not empty.
        @param otherList : The source CanvasList object this function copies nodes from.
        @return void
    */
    // Case - Empty "otherList":
    if (otherList.isempty()) {
        return;
    }
    // Copy front node of "otherList":
    listFront = new ShapeNode {otherList.listFront->value->copy(), nullptr};
    // Set up linked list traversal nodes:
    ShapeNode* otherCur = otherList.listFront->next;
    ShapeNode* thisCur = listFront;
    // Traverse through "otherList" and deep copy each ShapeNode into "this" linked list:
    for (; otherCur != nullptr; otherCur = otherCur->next) {
        auto* newNode = new ShapeNode {otherCur->value->copy(), nullptr};
        thisCur->next = newNode;  // Create edge from current node to new node.
        thisCur = thisCur->next;  // Traverse to new node.
    }
}

// Default constructor:
CanvasList::CanvasList() : listSize(0), listFront(nullptr) {}

// Parameter constructor:
CanvasList::CanvasList(const CanvasList& otherList) : listSize(otherList.listSize), listFront(nullptr)
{   /**
    Copies the "otherList" ShapeNode objects into "this" CanvasList.
    This constructor will be called only when creating a new/empty "this" CanvasList.
        @param otherList : The source CanvasList object this function copies nodes from.
    */
    this->copyCanvasListNodes(otherList);
}

// Overloaded operator (=):
CanvasList CanvasList::operator=(const CanvasList& otherList)
{   /**
    This function makes use of the = operator and allows for "this" CanvasList to be overwritten
    with the "otherList" CanvasList. This function is only called when the "this" canvaslist has
    already been constructed, thus being overwritten/deep copied from the "otherList" values.
        @param otherList : The source CanvasList object this function copies nodes from.
        @return CanvasList : Returns "this" CanvasList object.
    */
    this->clear();                             // Empty "this" CanvasList.
    this->copyCanvasListNodes(otherList);      // Deep copy ShapeNodes from "otherList".
    listSize = otherList.listSize;
    return *this;
}

// CanvasList destructor:
CanvasList::~CanvasList()
{   /**
    Clears the ShapeNode/Shape objects inside "this" CanvasList. */
    this->clear();
}

// CanvasList linked list heap clearer:
void CanvasList::clear()
{   /**
    This function traverses through the CanvasList linked list and deletes the heap memory
    for the Shape object stored within the ShapeNode then the ShapeNode itself in that order.
        @return void
    */
    ShapeNode* nextNode;
    for (ShapeNode* cur = listFront; cur != nullptr; cur = nextNode) {
        nextNode = cur->next;           // Hold the next node's address.
        delete cur->value, delete cur;  // Delete current node heap allocations.
    }
    listFront = nullptr, listSize = 0;
}

// ShapeNode insert after function:
void CanvasList::insertAfter(int index, Shape* shape)
{   /**
    This function inserts a ShapeNode into the "this" CanvasList linked list.
    The insertion location is one after the given one, the Shape object given is used
    in the used in the newly inserted ShapeNode object.
        @param index : The index in the linked list to insertedNode the node after.
        @param shape : A Shape pointer to use in the inserted ShapeNode object.
        @return void
    */
    // Case - Index out of linked list range:
    if (index < 0 || index >= listSize) {
        return;
    }
    listSize++;
    // Set up new node to be inserted and traversal node cur:
    ShapeNode* cur = listFront;
    auto* insertedNode = new ShapeNode {shape, nullptr};
    // Traverse to node specified by index:
    for (int c = 0; c < index; c++) {
        cur = cur->next;
    }
    // Create edges at insertion node and node before:
    insertedNode->next = (index == listSize - 1) ? nullptr : cur->next;
    cur->next = insertedNode;
}

// ShapeNode push_front function:
void CanvasList::push_front(Shape* shape)
{   /**
    This function uses the passed Shape pointer and creates a new ShapeNode with it.
    The newly created ShapeNode then gets prepended to "this" CanvasList's linked list.
        @param shape : A Shape pointer to use in the prepended ShapeNode object.
        @return void
    */
    auto* prependedNode = new ShapeNode {shape, nullptr};
    listSize++;
    prependedNode->next = listFront;
    listFront = prependedNode;
}

// ShapeNode push_back function:
void CanvasList::push_back(Shape* shape)
{   /**
    This function uses the passed Shape pointer and creates a new ShapeNode with it.
    The newly created ShapeNode then gets appended to "this" CanvasList's linked list.
        @param shape : A Shape pointer to use in the appended ShapeNode object.
        @return void
    */
    auto* appendedNode = new ShapeNode {shape, nullptr};
    listSize++;
    // Case - Empty "this" CanvasList:
    if (listFront == nullptr) {
        listFront = appendedNode;
        return;
    }
    // Set up traversal node and traverse to tail node of linked list:
    ShapeNode* cur = listFront;
    while (cur->next != nullptr) {
        cur = cur->next;
    }
    // Create edge from tail node to new node:
    cur->next = appendedNode;
}

// ShapeNode specified index removal function:
void CanvasList::removeAt(int index)
{   /**
    This function uses the passed index parameter and removes the ShapeNode
    at that index.
        @param index : The index in the linked list to remove a ShapeNode.
        @return void
    */
    // Case - Index out of linked list range:
    if (index < 0 || index >= listSize) {
        return;
    }
    listSize--;
    // Set up traversal node:
    ShapeNode* cur = listFront;
    // Case - Removal of list head node:
    if (index == 0) {
        listFront = cur->next;
        delete cur->value, delete cur;
        return;
    }
    // Traverse to one node before the node to remove:
    for (int c = 0; c < index - 1; c++) {
        cur = cur->next;
    }
    // Delete specified node and edit the edge of the previous node to jump over the deleted node:
    ShapeNode* deletedNode = cur->next;
    cur->next = deletedNode->next;
    delete deletedNode->value, delete deletedNode;
}

// CanvasList head ShapeNode pop function:
Shape* CanvasList::pop_front()
{   /**
    This function deletes the front ShapeNode of the CanvasList's linked list and returns the
    stored Shape pointer to be used by the user.
        @return Shape* | Returns the shape object pointer stored in the deleted ShapeNode.
    */
    // Case - Empty CanvasList:
    if (listFront == nullptr) {
        return nullptr;
    }
    listSize--;
    // Set up pointers to objects for deletion/return:
    ShapeNode* poppedNode = listFront;
    Shape* poppedShape = poppedNode->value;

    listFront = poppedNode->next;
    delete poppedNode;
    return poppedShape;
}

// CanvasList tail ShapeNode pop function:
Shape* CanvasList::pop_back()
{   /**
    This function deletes the tail ShapeNode of the CanvasList's linked list and returns the
    stored Shape pointer to be used by the user.
        @return Shape* | Returns the shape object pointer stored in the deleted ShapeNode.
    */
    // Case - Empty linked list:
    if (listFront == nullptr) {
        return nullptr;
    }
    listSize--;
    // Set up node to be popped and one behind traversal node:
    ShapeNode* poppedNode = listFront->next;
    ShapeNode* prevNode = listFront;
    // Case - Linked list of size one (only head node):
    if (poppedNode == nullptr) {
        listFront = nullptr;
        Shape* poppedShape = prevNode->value;
        delete prevNode;
        return poppedShape;
    }
    // Traverse poppedNode to tail node and prevNode to one before tail node:
    for (;poppedNode->next != nullptr; poppedNode = poppedNode->next) {
        prevNode = prevNode->next;
    }
    // Update previous node's edge and delete tail node:
    prevNode->next = nullptr;
    Shape* poppedShape = poppedNode->value;
    delete poppedNode;
    return poppedShape;
}

// listFront getter function:
ShapeNode* CanvasList::front() const
{   /**
    Returns listFront data member (ShapeNode*). */
    return listFront;
}

// CanvasList empty checker:
bool CanvasList::isempty() const
{   /**
    This function checks if there are nodes stored
    in the linked list. */
    return (listSize == 0);
}

// listSize getter function:
int CanvasList::size() const
{   /**
    Returns listSize data member (int). */
    return listSize;
}

// Shape object x and y find function
int CanvasList::find(int x, int y) const
{   /**
    This function takes in x and y values and checks the linked list if a Shape object
    has those coordinates, if not return -1.
        @param x : The x coordinate of the shape the user is looking for.
        @param y : The y coordinate of the shape the user is looking for.
        @return int | Returns -1 if there is no matching shape, else it
        returns the index of the ShapeNode in the CanvasList linked list.
    */
    int index = 0;
    // Traverse linked list and return the index if a matching shape is found:
    for (ShapeNode* cur = listFront; cur != nullptr; cur = cur->next, index++) {
        if (cur->value->getX() == x && cur->value->getY() == y) {
            return index;
        }
    }
    // Case - No matching shapes:
    return -1;
}

// Shape object index getter function:
Shape *CanvasList::shapeAt(int index) const
{   /**
    This function returns a Shape pointer to the ShapeNode Shape at the
    specified index passed by the user.
        @param index : The ShapeNode index to return a Shape pointer from.
        @return Shape* | Returns the ShapeNode specified index's Shape pointer.
    */
    // Case - index out of linked list range:
    if (index < 0 || index >= listSize) {
        return nullptr;
    }
    // Set up traversal node and traverse the index amount:
    ShapeNode* cur = listFront;
    for (; index-- != 0; cur = cur->next);
    // The cur node should now be at the specified index within the CanvasList linked list:
    return cur->value;
}

// CanvasList linked list print function:
void CanvasList::draw() const
{   /**
    This function iterates through the CanvasList linked list and prints
    the information about the shape stored at that ShapeNode.
        @return void
    */
    for (ShapeNode* cur = listFront; cur != nullptr; cur = cur->next) {
        cur->value->printShape();
    }
}

// ShapeNode/Shape address print function:
void CanvasList::printAddresses() const
{   /**
    This function iterates through the CanvasList linked list and prints
    the ShapeNode and stored Shape pointer values.
        @return void
    */
    for (ShapeNode* cur = listFront; cur != nullptr; cur = cur->next) {
        cout << "Node address: " << cur << " Shape address: " << cur->value << endl;
    }
}
