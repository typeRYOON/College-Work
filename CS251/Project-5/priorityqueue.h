/*priorityqueue.h*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: priorityqueue.h
 >> Course:  CS 251 SP23
 >> Author:  Ryan Magdaleno (rmagd2)
 >> System:  Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> priorityqueue class overview:
 >> This class makes a data structure called a priority queue. The priority
 >> passed for a newly enqueued node will decide where to place that node in
 >> the BST. Since this queue is implemented using a BST, the search and
 >> dequeue time complexity are log(n). The nodes with a higher priority
 >> (lower int) will be dequeued before the ones with lower priority.
 >> This data structure allows for duplicate priority nodes and will append
 >> that duplicate node onto the BST node's linked list. More information
 >> about each function's functionality is in their respective docstrings.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#pragma once
#include <iostream>
#include <sstream>
using namespace std;

template<typename T>
class priorityqueue {
private:
    struct NODE {
        int priority;  // Used to build BST.
        T value;       // Stored data for the p-queue.
        bool dup;      // Marked true when there are duplicate priorities.
        NODE* parent;  // Links back to parent.
        NODE* link;    // Links to linked list of NODES with duplicate priorities.
        NODE* left;    // Links to left child.
        NODE* right;   // Links to right child.
    };
    NODE* root;        // Pointer to root node of the BST.
    NODE* curr;        // Pointer to next item in pqueue (see begin and next).
    int size;          // # of elements in the pqueue.
    void toStringPQ(NODE*, stringstream&) const;
    void recursiveClear(NODE*) const;
    bool samePQ(NODE*, NODE*) const;
    void deepCopyNodes(NODE*&, NODE*, NODE*) const;
    T dequeueDuplicateNode(NODE*);

public:
    // Default constructor:
    priorityqueue() : root(nullptr), size(0), curr(nullptr) {}

    /** operator=: - -                                                       - -
    Clears "this" tree and then makes a copy of the "other" tree.
    Sets all member variables appropriately.
    O(n), where n is total number of nodes in custom BST
        @param other : Passed priority queue to deep copy nodes from.        */
    priorityqueue& operator=(const priorityqueue& other)
    {   // Case - Same tree passed as parameter:
        if (this == &other)
            return *this;
        clear();
        deepCopyNodes(root, other.root, nullptr);
        size = other.size;
        return *this;
    }

    /** clear: - -                                                           - -
    Frees the memory associated with the priority queue but is public.
    O(n), where n is total number of nodes in custom BST.
    Calls recursive function recursiveClear                                  */
    void clear()
    {
        recursiveClear(root);
        root = nullptr, size = 0;
    }

    /** Destructor: - -                                                      - -
    Frees the memory associated with the priority queue.
    O(n), where n is total number of nodes in custom BST.                    */
    ~priorityqueue()
    {
        clear();
    }

    /** enqueue: - -                                                         - -
    Inserts the value into the custom BST in the correct
    location based on priority.
    O(log(n) + m), where n is number of unique nodes in tree and m is number
    of duplicate priorities.
        @param value    : Passed value to insert into new node.
        @param priority : Passed priority for finding position in BST.       */
    void enqueue(T value, int priority)
    {
        size++;
        // Case - Empty tree:
        if (root == nullptr) {
            root = new NODE {priority, value};
            return;
        }
        NODE* cur = root;
        while (true) {
            if (priority < cur->priority) {
                if (cur->left == nullptr) {
                    cur->left = new NODE {priority, value, false, cur};
                    break;
                }
                cur = cur->left;
            }
            else if (priority > cur->priority) {
                if (cur->right == nullptr) {
                    cur->right = new NODE {priority, value, false, cur};
                    break;
                }
                cur = cur->right;
            }
            // Case - Duplicate priority, append to that BST node's linked list:
            else {
                cur->dup = true;
                NODE* linkCur = cur;
                while (linkCur->link != nullptr) {
                    linkCur = linkCur->link;
                }
                linkCur->link = new NODE {priority, value, true, linkCur};
                break;
            }
        }
    }

    /** dequeue: - -                                                         - -
    Returns the value of the next element in the priority queue and removes
    the element from the priority queue.
    O(log(n) + m), where n is number of unique nodes in tree and m is
    number of duplicate priorities.
        @return Template T : The dequeued node's PQ type T value.            */
    T dequeue()
    {   // Case - Empty tree:
        if (root == nullptr) {
            return T{};
        }
        size--;
        // Get the highest priority node:
        T valueOut;
        NODE* cur = root;
        while (cur->left != nullptr) {
            cur = cur->left;
        }
        // Case - The lowest priority node is the root node:
        if (cur == root && !root->dup) {
            if (root->right != nullptr) {
                root = root->right;
                root->parent = nullptr;
            }
            else {
                root = nullptr;
            }
            valueOut = cur->value;
            delete cur;
            return valueOut;
        }
        // Case - Linked list on BST node found:
        if (cur->dup) {
            return dequeueDuplicateNode(cur);
        }
        // Case - Dequeued node is a leaf node:
        if (cur->right == nullptr) {
            cur->parent->left = nullptr;
        }
        // Case - Dequeued node is an internal node (right branch exists):
        else {
            cur->parent->left = cur->right;
            cur->right->parent = cur->parent;
        }
        valueOut = cur->value;
        delete cur;
        return valueOut;
    }

    /** Size: - -                                                            - -
    Returns the # of elements in the priority queue, 0 if empty. O(1).
        @return int : priorityqueue member variable size.                    */
    int Size()
    {
        return size;
    }

    /** begin: - -                                                           - -
    Resets internal state for an inorder traversal. After the call to
    begin(), the internal state denotes the first inorder node; this
    ensures that the first call to next() function returns the first
    inorder node value.
    O(log(n)), where n is number of unique nodes in tree.
    - -                                               - -
    Example usage:
        PQ.begin();
        while (PQ.next(value, priority)) {
            cout << priority << " value: " << value << endl;
        }
        cout << priority << " value: " << value << endl;                     */
    void begin()
    {   // Case - Empty tree:
        if (root == nullptr) {
            curr = nullptr;
            return;
        }
        // Get the highest priority node:
        curr = root;
        while (curr->left != nullptr) {
            curr = curr->left;
        }
    }

    /** next: - -                                                            - -
    Uses the internal state to return the next inorder priority, and
    then advances the internal state in anticipation of future
    calls. If a value/priority are in fact returned (via the reference
    parameter), true is also returned.
    - -                            - -
    False is returned when the internal state has reached null,
    meaning no more values/priorities are available. This is the end of
    the inorder traversal.

    O(log(n)), where n is the number of unique nodes in tree.
    Refer to begin() docstring for example usage.
        @param value    : curr's current value stored.
        @param priority : curr's current priority.
        @return bool    : True if more next() calls possible, else False.    */
    bool next(T& value, int& priority)
    {   // Case - No more nodes to traverse to:
        if (curr == nullptr) {
            return false;
        }
        // Pass back curr's value/priority for outside use:
        priority = curr->priority;
        value = curr->value;

        // Case - Duplicate priority nodes:
        if (curr->dup && curr->link != nullptr) {
            curr = curr->link;
            return true;
        }
        // Case - Tail node reached, return curr to BST node:
        else if (curr->dup && curr->link == nullptr) {
            // Case - Root priority duplicates:
            if (root->priority == priority) {
                curr = root;
            }
            else {
                while (curr->parent->priority == priority) {
                    curr = curr->parent;
                }
            }
        }
        // Right branch exists, next priority node exists there:
        if (curr->right != nullptr) {
            curr = curr->right;
            while (curr->left != nullptr) {
                curr = curr->left;
            }
        }
        // Walk up tree to find next priority node:
        else {
            NODE* currParent = curr->parent;
            while (currParent != nullptr && curr == currParent->right) {
                curr = currParent;
                currParent = currParent->parent;
            }
            curr = currParent;
        }
        return (curr != nullptr);
    }

    /** toString: - -                                                        - -
    Returns a string of the entire priority queue, in order.
    O(n), where n is total number of nodes in custom BST. Format:
    "1 value: Ben
     2 value: Jen
     2 value: Sven
     3 value: Gwen"
        @return string : Returned string-stream string from toStringPQ */
    string toString()
    {
        stringstream str;
        toStringPQ(root, str);
        return str.str();
    }

    /** peek: - -                                                            - -
    Returns the value of the next element in the priority queue but does
    not remove the item from the priority queue.
    O(log(n) + m), where n is number of unique nodes in tree and m is
    number of duplicate priorities.
    */
    T peek()
    {   // Case - Empty tree:
        if (root == nullptr) {
            return T{};
        }
        // Get the highest priority node:
        NODE* cur = root;
        while (cur->left != nullptr) {
            cur = cur->left;
        }
        return cur->value;
    }

    /** operator==: - -                                                      - -
    Returns true if this priority queue as the priority queue passed in as
    other.  Otherwise returns false.
    O(n), where n is total number of nodes in custom BST
        @param other : Passed priority queue to compare against.
        @return bool : True if same value/priority/structure, else False.    */
    bool operator==(const priorityqueue& other) const
    {
        return (size == other.size) && samePQ(root, other.root);
    }

    /** getRoot: - -                                                         - -
    Do not edit/change!
    Used for testing the BST. Return the root node for testing.              */
    void* getRoot()
    {
        return root;
    }
};

/** toStringPQ: - -                                                          - -
A recursive function that finds the lowest priority node and works
its way up. Sends current node's priority/value to stringstream.
O(n), where n is total number of nodes in custom BST.
    @param node   : The current node this function is reading.
    @param result : A stringstream that contains the BST string.             */
template<typename T>
void priorityqueue<T>::toStringPQ(priorityqueue::NODE* node, stringstream& result) const
{
    if (node != nullptr) {
        toStringPQ(node->left, result);
        result << node->priority << " value: " << node->value << endl;
        // Case - Linked list exists on current node:
        if (node->dup) {
            NODE* nodeLink = node->link;
            while (nodeLink != nullptr) {
                result << nodeLink->priority << " value: " << nodeLink->value << endl;
                nodeLink = nodeLink->link;
            }
        }
        toStringPQ(node->right, result);
    }
}

/** recursiveClear: - -                                                      - -
Recursively deletes the left and right branches of a node, delves to
the deepest depth and deletes the nodes in postorder.
O(n), where n is total number of nodes in custom BST.
    @param node : The node that is currently being deleted.                  */
template<typename T>
void priorityqueue<T>::recursiveClear(NODE* node) const
{
    if (node != nullptr) {
        recursiveClear(node->left);
        recursiveClear(node->right);
        // Case - Linked list exists on current node:
        if (node->dup) {
            NODE* nodeLink = node->link, *next;
            for (; nodeLink != nullptr; nodeLink = next) {
                next = nodeLink->link;
                delete nodeLink;
            }
        }
        delete node;
    }
}

/** samePQ: - -                                                              - -
Recursive function that checks the value/priority/structure of two passed
nodes. Checks linked list value/priority/structure data if there are
duplicate priority nodes. O(n), where n is total number of nodes in BST.
    @param nodeA : A node from "this" priorityqueue object.
    @param nodeB : A node from the passed "other" priorityqueue object.
    @return bool : T/F on if the priorityqueue objects are the same.         */
template<typename T>
bool priorityqueue<T>::samePQ(priorityqueue::NODE* nodeA, priorityqueue::NODE* nodeB) const
{   // Base case:
    if (nodeA == nullptr && nodeB == nullptr) {
        return true;
    }
    // Case - Structure mismatch (base failed so at least 1 node exists):
    else if (nodeA == nullptr || nodeB == nullptr) {
        return false;
    }
    // Case - Value/priority mismatch:
    else if (nodeA->priority != nodeB->priority || nodeA->value != nodeB->value) {
        return false;
    }
    // Continue branch:
    else {
        // Linked list check:
        if (nodeA->dup || nodeB->dup) {
            NODE* curA = nodeA, *curB = nodeB;
            while (curA && curB) {
                if (curA->value != curB->value || curA->priority != curB->priority) {
                    return false;
                }
                curA = curA->link;
                curB = curB->link;
            }
            // Case - Linked list structure mismatch, both should be nullptr:
            if (curA != curB) {
                return false;
            }
        }
        return samePQ(nodeA->left, nodeB->left) && samePQ(nodeA->right, nodeB->right);
    }
}

/** deepCopyNodes: - -                                                       - -
A recursive function that sets "this" priorityqueue object with the deep copy
of nodes from the passed "other" priorityqueue object.
    @param thisNode  : A node reference that will have a new node assigned to.
    @param otherNode : The "other" node in the traversal to deep copy from.
    @param prevNode  : The previous node from "this" priorityqueue.          */
template<typename T>
void priorityqueue<T>::deepCopyNodes(priorityqueue::NODE*& thisNode,
                                     priorityqueue::NODE* otherNode,
                                     priorityqueue::NODE* prevNode) const
{   // Assign nullptr to taken prevNode branch:
    if (otherNode == nullptr) {
        thisNode = nullptr;
    }
    else {
        thisNode = new NODE {otherNode->priority, otherNode->value, otherNode->dup, prevNode};
		// Copy possible linked list structure:
        if (otherNode->dup) {
            NODE* thisLink = thisNode, *otherLink = otherNode->link;
            while (otherLink != nullptr) {
                thisLink->link = new NODE {otherLink->priority, otherLink->value,
                                           otherLink->dup, thisLink};
                thisLink = thisLink->link, otherLink = otherLink->link;
            }
        }
        // Recursively assign left and right branches:
        deepCopyNodes(thisNode->left, otherNode->left, thisNode);
        deepCopyNodes(thisNode->right, otherNode->right, thisNode);
    }
}

/** dequeueDuplicateNode: - -                                                - -
A function that goes through some conditions on the passed node. The passed
node has duplicates/a linked list. Will change the edges around the node
and return the value from the dequeued node.
    @param pqNode      : A node on the priority queue that has duplicates.
    @return Template T : The dequeued pqNode's PQ type T value.              */
template<typename T>
T priorityqueue<T>::dequeueDuplicateNode(priorityqueue::NODE* pqNode)
{
    if (pqNode != root) {
        pqNode->parent->left = pqNode->link;
        pqNode->link->parent = pqNode->parent;
    }
    else {
        root = pqNode->link;
    }

    // Right branch exists:
    if (pqNode->right != nullptr) {
        pqNode->link->right = pqNode->right;
        pqNode->right->parent = pqNode->link;
    }
    // Case - Emptied LL, set dup to false.
    if (pqNode->link->link == nullptr) {
        pqNode->link->dup = false;
    }

    T returnVal = pqNode->value;
    delete pqNode;
    return returnVal;
}