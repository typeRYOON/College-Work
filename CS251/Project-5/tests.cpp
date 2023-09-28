/*tests.cpp*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: tests.cpp
 >> Course:  CS 251 SP23
 >> Author:  Ryan Magdaleno (rmagd2)
 >> System:  Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> Overview: This file uses the Catch2 framework to test the priorityqueue
 >> class from priorityqueue.h. This file tests every public function from
 >> the priorityqueue class. This file simply tests behavior from said
 >> public functions. For more information about the way the class works,
 >> please refer to the priorityqueue header comment and each function's 
 >> respective docstrings. Valgrind states no memory leaks for this file.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#define CATCH_CONFIG_MAIN
#include "priorityqueue.h"
#include "catch.hpp"
#include <vector>
#include <map>

TEST_CASE("Default constructor: getRoot, Size, toString")
{
    priorityqueue<int> test;
    REQUIRE(test.Size() == 0);
    REQUIRE(test.getRoot() == nullptr);
    REQUIRE(test.toString().empty());
}

TEST_CASE("operator=")
{
    priorityqueue<int> testA, testB;
    vector<int> priority = {3, 3, 3, 4, 5, 5, 6, 7, 8, 9};
    int oldSize;
    stringstream prediction;

    // Two empty queues:
    testA = testB;
    REQUIRE(testA == testB);
    REQUIRE(testA.getRoot() == nullptr);

    SECTION("Empty overwritten with one node")
    {
        for (int i = 0; i < 1; ++i) {
            testB.enqueue(i, priority.at(i));
            prediction << priority.at(i) << " value: " << i << endl;
        }
        testA = testB;
        REQUIRE(testA == testB);
        REQUIRE(testA.Size() == 1);
        REQUIRE(testA.toString() == prediction.str());
    }
    SECTION("Empty overwritten with root and two branches")
    {
        for (int i = 2; i < 5; ++i) {
            testB.enqueue(i, priority.at(i));
            prediction << priority.at(i) << " value: " << i << endl;
        }
        testA = testB;
        REQUIRE(testA == testB);
        REQUIRE(testA.Size() == 3);
        REQUIRE(testA.toString() == prediction.str());
    }
    SECTION("Empty overwritten by root and duplicate roots")
    {
        for (int i = 0; i < 3; ++i) {
            testB.enqueue(0, priority.at(i));
            prediction << priority.at(i) << " value: " << 0 << endl;
        }
        testA = testB;
        REQUIRE(testA == testB);
        REQUIRE(testA.Size() == 3);
        REQUIRE(testA.toString() == prediction.str());

        // Attempt to overwrite queue with itself:
        oldSize = testB.Size();
        testB = testB;
        REQUIRE(testB.Size() == oldSize);
        REQUIRE(testB.toString() == prediction.str());
    }

    SECTION("Overwrite nodes w/ multiple duplicates on most nodes (including root)")
    {
        for (int i = 6; i < priority.size(); ++i) {
            testA.enqueue(0, priority.at(i));
        }
        for (int i = 0; i < priority.size(); ++i) {
            testB.enqueue(i, priority.at(i));
            prediction << priority.at(i) << " value: " << i << endl;
        }
        oldSize = testA.Size();

        testA = testB;
        REQUIRE(testA == testB);
        REQUIRE_FALSE(testA.Size() == oldSize);
        REQUIRE(testA.toString() == prediction.str());
    }
    SECTION("Many nodes overwritten w/ multiple duplicates on each node")
    {
        for (int i = 1; i < priority.size(); ++i) {
            testA.enqueue(i, priority.at(i));
        }
        for (int& i : priority) {
            for (int j = 0; j < 3; ++j) {
                testB.enqueue(j, i);
                prediction << i << " value: " << j << endl;
            }
        }
        oldSize = testA.Size();

        testA = testB;
        REQUIRE(testA == testB);
        REQUIRE_FALSE(testA.Size() == oldSize);
        REQUIRE(testA.toString() == prediction.str());
    }
    SECTION("Overwrite a large queue with an empty one")
    {
        for (int& i : priority) {
            for (int j = 0; j < 3; ++j) {
                testA.enqueue(j, i);
                prediction << i << " value: " << j << endl;
            }
        }
        testA = testB;
        REQUIRE(testA.getRoot() == nullptr);
        REQUIRE(testA.Size() == 0);
        REQUIRE(testA == testB);
    }
}

template<typename T>
void checkEmptyQueue(priorityqueue<T>& test)
{   // Checks for empty priorityqueue values:
    REQUIRE(test.getRoot() == nullptr);
    REQUIRE(test.toString().empty());
    REQUIRE(test.Size() == 0);
}

TEST_CASE("Destructor / clear function")
{  // NOTE: Destructor only uses clear function to delete tree.
    priorityqueue<int> testA, testB;
    vector<int> priorities = {0, 1, -1, 2, 2, 2, 0, 0 ,0, 5, 7, 6, -3, -2, -2};
    // Empty BST clear on default queue:
    testA.clear();
    checkEmptyQueue(testA);

    // Only root node:
    testA.enqueue(0, 0);
    testA.clear();
    checkEmptyQueue(testA);

    // Root and two branches:
    for (int i = 0; i < 3; ++i) {
        testA.enqueue(0, priorities.at(i));
    }
    REQUIRE_FALSE(testA.Size() == 0);
    testA.clear();
    checkEmptyQueue(testA);

    // Duplicates on a node should be cleared:
    for (int i = 0; i < 5; ++i) {
        testA.enqueue(0, priorities.at(i));
    }
    testA.clear();
    checkEmptyQueue(testA);

    // Duplicates on root node should be cleared:
    for (int i = 0; i < 9; ++i) {
        testA.enqueue(0, priorities.at(i));
    }
    testA.clear();
    checkEmptyQueue(testA);

    // Only nodes are root and root duplicates:
    for (int i = 6; i < 9; ++i) {
        testA.enqueue(0, priorities.at(i));
    }
    testA.clear();
    checkEmptyQueue(testA);

    // Enqueue multiple duplicates on many nodes:
    for (int& i : priorities) {
        testA.enqueue(0, i);
    }
    testA.clear();
    checkEmptyQueue(testA);

    // Every node has multiple duplicates:
    for (int i = 0; i < 4; ++i) {
        for (int& j : priorities) {
            testA.enqueue(0, j);
            testB.enqueue(0, j * 10); // For next test.
        }
    }
    testA.clear();
    checkEmptyQueue(testA);

    // Overwrite a list, then clear it (operator= uses clear also):
    testA.enqueue(1, 3);
    testA = testB;
    // testB should be unaltered.
    REQUIRE_FALSE(testB.Size() == 0);
    REQUIRE_FALSE(testB.getRoot() == nullptr);
    REQUIRE_FALSE(testB.toString().empty());

    testA.clear();
    checkEmptyQueue(testA);
    testB.clear();
    checkEmptyQueue(testB);
    // NOTE: Since these tests have no memory leaks, can assert that nodes were freed.
}

TEST_CASE("enqueue function")
{
    vector<int> v1, priorities = {3, 1, 2, 3, 3, 4, 4 -1, -2, 3, 7, 9, -3, -2, -1, -7, -6, 5};
    priorityqueue<int> test;
    map<int, vector<int>> m1;
    stringstream prediction;
    int j = 0;

    SECTION("Enqueue one node")
    {
        prediction << 0 << " value: " << j << endl;
        test.enqueue(j, 0);
        REQUIRE(test.toString() == prediction.str());
    }
    SECTION("Root + L/R branches enqueued")
    {
        for (int i = 0; i < 3; ++i) {
            m1[priorities.at(i)].push_back(j);
            test.enqueue(j++, priorities.at(i));
        }
        // Create queue string:
        for (auto& [priority, vec] : m1) {
            for (auto& val : vec) {
                prediction << priority << " value: " << val << endl;
            }
        }
        REQUIRE(test.toString() == prediction.str());
        REQUIRE(test.Size() == 3);
    }
    SECTION("Root duplicates w/ the lowest priority duplicates")
    {
        for (int i = 0; i < 7; ++i) {
            m1[priorities.at(i)].push_back(j);
            test.enqueue(j++, priorities.at(i));
        }
        // Create queue string:
        for (auto& [priority, vec] : m1) {
            for (auto& val : vec) {
                prediction << priority << " value: " << val << endl;
            }
        }
        REQUIRE(test.toString() == prediction.str());
        REQUIRE(test.Size() == 7);
    }
    SECTION("Multiple duplicates on nodes (FULL PRIORITY VECTOR)")
    {
        for (int& i : priorities) {
            m1[i].push_back(j);
            test.enqueue(j++, i);
        }
        // Create queue string:
        for (auto& [priority, vec] : m1) {
            for (auto& val : vec) {
                prediction << priority << " value: " << val << endl;
            }
        }
        REQUIRE(test.toString() == prediction.str());
        REQUIRE(test.Size() == 17);
    }
    SECTION("Duplicates on every node (FULL PRIORITY VECTOR * 10)")
    {
        for (int k = 0; k < 10; ++k) {
            for (int& i : priorities) {
                m1[i].push_back(j);
                test.enqueue(j++, i);
            }
        }
        // Create queue string:
        for (auto& [priority, vec] : m1) {
            for (auto& val : vec) {
                prediction << priority << " value: " << val << endl;
            }
        }
        REQUIRE(test.toString() == prediction.str());
        REQUIRE(test.Size() == 170);
    }
}

TEST_CASE("dequeue function")
{
    vector<int> v1, priorities = {3, 1, 2, 3, 3, 4, 4 -1, -2, 3, 7, 9, -3, -2, -1, -7, -6, 5};
    priorityqueue<int> test;
    map<int, int> m1;
    int last = -10e6, j = 0, dequeuedInt, testSize;

    SECTION("Empty queue dequeue")
    {
        REQUIRE(test.dequeue() == int{});
        REQUIRE(test.Size() == 0);
        REQUIRE(test.getRoot() == nullptr);
    }
    SECTION("Dequeue one node")
    {
        test.enqueue(1, 2);
        REQUIRE(test.dequeue() == 1);
        REQUIRE(test.Size() == 0);
    }
    SECTION("Dequeue a queue w/ L/R branches")
    {
        testSize = 3;
        for (int i = 0; i < testSize; ++i) {
            m1[j] = priorities.at(i);
            test.enqueue(j++, priorities.at(i));
        }
        while (test.getRoot() != nullptr) {
            dequeuedInt = test.dequeue();
            // Make sure priority associated with value is ascending:
            REQUIRE(last <= m1[dequeuedInt]);
            REQUIRE(test.Size() == --testSize);
            last = m1[dequeuedInt];
        }
        REQUIRE(test.Size() == 0);
    }
    SECTION("Dequeue root and lowest priority duplicates")
    {
        testSize = 7;
        for (int i = 0; i < testSize; ++i) {
            m1[j] = priorities.at(i);
            test.enqueue(j++, priorities.at(i));
        }
        while (test.getRoot() != nullptr) {
            dequeuedInt = test.dequeue();
            // Make sure priority associated with value is ascending:
            REQUIRE(last <= m1[dequeuedInt]);
            REQUIRE(test.Size() == --testSize);
            last = m1[dequeuedInt];
        }
        REQUIRE(test.Size() == 0);
    }
    SECTION("Multiple duplicates on nodes (FULL PRIORITY VECTOR)")
    {
        for (int& i : priorities) {
            m1[j] = i;
            test.enqueue(j++, i);
        }
        testSize = (int)priorities.size();
        while (test.getRoot() != nullptr) {
            dequeuedInt = test.dequeue();
            // Make sure priority associated with value is ascending:
            REQUIRE(last <= m1[dequeuedInt]);
            REQUIRE(test.Size() == --testSize);
            last = m1[dequeuedInt];
        }
        REQUIRE(test.Size() == 0);
    }
    SECTION("Duplicates on every node (FULL PRIORITY VECTOR * 10)")
    {
        for (int k = 0; k < 10; ++k) {
            for (int& i : priorities) {
                m1[j] = i;
                test.enqueue(j++, i);
            }
        }
        testSize = (int)priorities.size() * 10;
        while (test.getRoot() != nullptr) {
            dequeuedInt = test.dequeue();
            // Make sure priority associated with value is ascending:
            REQUIRE(last <= m1[dequeuedInt]);
            REQUIRE(test.Size() == --testSize);
            last = m1[dequeuedInt];
        }
        REQUIRE(test.Size() == 0);
    }
}

TEST_CASE("Size function")
{
    priorityqueue<int> test;
    int count = 0;
    for (int i = 1; i < 111; ++i) {
        test.enqueue(0, i);
        REQUIRE(test.Size() == ++count);
    }
    // Root priority is 1, test duplicates on root:
    for (int i = 0; i < 10; ++i) {
        test.enqueue(0, 1);
        REQUIRE(test.Size() == ++count);
    }
    // Add two duplicates on each node:
    for (int i = 1; i < 111; ++i) {
        test.enqueue(0, i);
        REQUIRE(test.Size() == ++count);
        test.enqueue(0, i);
        REQUIRE(test.Size() == ++count);
    }
    // Dequeue entire tree (Root is currently the lowest priority):
    while (test.getRoot() != nullptr) {
        test.dequeue();
        REQUIRE(test.Size() == --count);
    }
    REQUIRE(test.Size() == 0);
}

TEST_CASE("begin / next functions")
{
    map<int, vector<int>> m1;
    priorityqueue<int> test;
    vector<int> v1, priorities = {3, 1, 2, 3, 3, 4, 4 -1, -2, 3, 7, 9, -3, -2, -1, -7, -6, 5};
    int value, priority, j = 0;
    int last = -10e6;

    SECTION("Empty queue")
    {
        test.begin();
        while (test.next(value, priority)) {
            j++;
        }
        // No loop iterations should have occurred:
        REQUIRE(j == 0);
    }
    SECTION("Only a root")
    {
        for (int i = 0; i < 1; ++i) {
            m1[i].push_back(j);
            test.enqueue(j++, i);
        }
        test.begin();
        while (test.next(value, priority)) {
            REQUIRE(m1[priority].at(0) == value);     // Check for matching value for priority.
            m1[priority].erase(m1[priority].begin());  // Remove current element in map vector.
        }
    }
    SECTION("Root and L/R branch")
    {
        for (int i = 0; i < 3; ++i) {
            m1[i].push_back(j);
            test.enqueue(j++, i);
        }
        test.begin();
        while (test.next(value, priority)) {
            REQUIRE(m1[priority].at(0) == value);     // Check for matching value for priority.
            m1[priority].erase(m1[priority].begin());  // Remove current element in map vector.
            v1.push_back(priority);                    // Store current priority in vector.
        }
        for (int& i : v1) {
            REQUIRE(last <= i);
            last = i;
        }
    }
    SECTION("Root duplicates and lowest priority duplicates")
    {
        for (int i = 0; i < 7; ++i) {
            m1[i].push_back(j);
            test.enqueue(j++, i);
        }
        test.begin();
        while (test.next(value, priority)) {
            REQUIRE(m1[priority].at(0) == value);     // Check for matching value for priority.
            m1[priority].erase(m1[priority].begin());  // Remove current element in map vector.
            v1.push_back(priority);                    // Store current priority in vector.
        }
        for (int& i : v1) {
            REQUIRE(last <= i);
            last = i;
        }

    }
    SECTION("Multiple duplicates on nodes (ENTIRE PRIORITY VECTOR)")
    {
        for (int& i : priorities) {
            m1[i].push_back(j);
            test.enqueue(j++, i);
        }
        test.begin();
        while (test.next(value, priority)) {
            REQUIRE(m1[priority].at(0) == value);     // Check for matching value for priority.
            m1[priority].erase(m1[priority].begin());  // Remove current element in map vector.
            v1.push_back(priority);                    // Store current priority in vector.
        }
        // Make sure priorities were in ascending order:
        for (int& i : v1) {
            REQUIRE(last <= i);
            last = i;
        }
    }
    SECTION("Every node has multiple duplicates (ENTIRE PRIORITY VECTOR * 10)")
    {
        for (int k = 0; k < 10; ++k) {  // 17 priorities, each w/ 10 duplicates, for total 170 nodes.
            for (int& i : priorities) {
                m1[i].push_back(j);
                test.enqueue(j++, i);
            }
        }
        test.begin();
        while (test.next(value, priority)) {
            REQUIRE(m1[priority].at(0) == value);     // Check for matching value for priority.
            m1[priority].erase(m1[priority].begin());  // Remove current element in map vector.
            v1.push_back(priority);                    // Store current priority in vector.
        }
        // Make sure priorities were in ascending order:
        for (int& i : v1) {
            REQUIRE(last <= i);
            last = i;
        }
    }
}

TEST_CASE("toString function")
{
    priorityqueue<int> test;
    stringstream prediction;

    REQUIRE(test.toString() == prediction.str());
    SECTION("Only a root node")
    {
        test.enqueue(0, 0);
        prediction << 0 << " value: " << 0 << endl;
        REQUIRE(test.toString() == prediction.str());
    }
    SECTION("Only root node duplicates")
    {
        for (int i = 0; i < 3; ++i) {
            prediction << 0 << " value: " << i << endl;
            test.enqueue(i, 0);
        }
        REQUIRE(test.toString() == prediction.str());
    }
    SECTION("Root + right branch")
    {
        for (int i = 0; i < 3; ++i) {
            prediction << 0 << " value: " << i << endl;
            test.enqueue(i, 0);
        }
        for (int i = 3; i < 20; ++i) {
            prediction << i << " value: " << i << endl;
            test.enqueue(i, i);
        }
        REQUIRE(test.toString() == prediction.str());
    }
    SECTION("Root duplicates + right branch duplicates")
    {
        for (int i = 0; i < 3; ++i) {
            prediction << 0 << " value: " << i << endl;
            test.enqueue(i, 0);
        }
        for (int i = 3; i < 20; ++i) {
            for (int j = 0; j < 3; ++j) {
                prediction << i << " value: " << i << endl;
                test.enqueue(i, i);
            }
        }
        REQUIRE(test.toString() == prediction.str());
    }
    SECTION("Right and left branches + root")
    {
        test.enqueue(420, 0); // ROOT
        vector<int> priorities = {0, 0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 7, -1, -2, -3};
        // Get last three in correct enqueue order:
        for (size_t i = priorities.size() - 1; i >= priorities.size() - 3; --i) {
            prediction << priorities.at(i) << " value: " << i << endl;
            test.enqueue((int)i, priorities.at(i));

        }
        prediction << 0 << " value: " << 420 << endl; // ROOT in str-stream.
        for (int i = 0; i < priorities.size() - 3; ++i) {
            prediction << priorities.at(i) << " value: " << i << endl;
            test.enqueue(i, priorities.at(i));
        }
        REQUIRE(test.toString() == prediction.str());
    }
}

TEST_CASE("peek function")
{
    priorityqueue<int> test;
    // Root and right branch check w/ duplicates:
    vector<int> priority = {-3, -3, -2, -1, -1, 0, 0, 0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    // Empty test (int default is 0):
    REQUIRE(test.peek() == 0);
    int i;
    for (i = 0; i < priority.size(); ++i) {
        test.enqueue(i, priority.at(i));
    }
    // Value should match i we enqueued with:
    i = 0;
    while (test.getRoot() != nullptr) {
        REQUIRE(test.peek() == i++);
        test.dequeue();
    }
    // Empty test on dequeued tree:
    REQUIRE(test.peek() == 0);
    // Reconstruct tree with both right and left branches:
    priority.push_back(-4); // 21 value
    priority.push_back(-5); // 22 value
    priority.push_back(-6); // 23 value
    for (i = 0; i < priority.size(); ++i) {
        test.enqueue(i, priority.at(i));
    }
    // First four nodes should be -6, -5, -4, then root -3, with values 23, 22, 21, 0 respectively:
    for (i = 23; i > 20; --i) {
        REQUIRE(test.peek() == i);
        test.dequeue();
    }
    // Continue from the root up to the right branch tip (the lowest priority):
    i = 0;
    while (test.getRoot() != nullptr) {
        REQUIRE(test.peek() == i++);
        test.dequeue();
    }
}

TEST_CASE("operator==")
{
    priorityqueue<int> testA, testB;
    vector<int> priority = {3, 4, 5, 5, 6, 7, 8, 9, -3, -4, -5, -1, -4, -4, -9, -9 ,-9, 12, 432, 333334, 2, 1, 2, 0, 0};

    // Empty list check:
    REQUIRE(testA == testB);

    // One node added on A:
    testA.enqueue(0, 0);
    REQUIRE_FALSE(testA == testB);

    // Same root node test:
    testB.enqueue(0, 0);
    REQUIRE(testA == testB);

    // Mismatch value BST:
    testA.enqueue(10, -1);
    testB.enqueue(0, -1);
    REQUIRE_FALSE(testA == testB);
    // Fix mismatch:
    testB.dequeue();
    testB.enqueue(10, -1);
    REQUIRE(testA == testB);

    // Mismatch priority:
    testA.enqueue(1, -2);
    testB.enqueue(1, -22);
    REQUIRE_FALSE(testA == testB);
    // Fix mismatch:
    testB.dequeue();
    testB.enqueue(1, -2);
    REQUIRE(testA == testB);

    // Structure mismatches:
    testA.enqueue(3, -3);
    REQUIRE_FALSE(testA == testB);
    testB.enqueue(3, -3);
    REQUIRE(testA == testB);
    testA.enqueue(4, 1);
    REQUIRE_FALSE(testA == testB);
    testB.enqueue(4, 1);
    REQUIRE(testA == testB);

    // Duplicate nodes mismatch value:
    testA.enqueue(5, -3);
    testB.enqueue(6, -3);
    REQUIRE_FALSE(testA == testB);
    // Fix:
    testB.dequeue();
    testB.dequeue();
    testB.enqueue(3, -3);
    testB.enqueue(5, -3);
    REQUIRE(testA == testB);

    // Linked list structure mismatch:
    testA.enqueue(6, -3);
    REQUIRE_FALSE(testA == testB);
    testB.enqueue(6, -3);
    REQUIRE(testA == testB);

    // Duplicates on root:
    testA.enqueue(0, 0);
    testA.enqueue(0, 0);
    REQUIRE_FALSE(testA == testB);
    testB.enqueue(0, 0);
    testB.enqueue(0, 0);

    // Right branch structure mismatch:
    testA.enqueue(100, 100);
    testA.enqueue(102, 102);
    testA.enqueue(101, 101);
    REQUIRE_FALSE(testA == testB);
    testB.enqueue(100, 100);
    testB.enqueue(102, 102);
    testB.enqueue(101, 101);
    REQUIRE(testA == testB);

    // Enqueue a large amount of nodes with many cases:
    for (int i = 0; i < 3; ++i) {
        for (int& j : priority) {
            // Enqueue a mismatch node:
            testA.enqueue(i, j);
            REQUIRE_FALSE(testA == testB);
            // Check fix:
            testB.enqueue(i, j);
            REQUIRE(testA == testB);
        }
    }
    REQUIRE(testA.Size() == testB.Size());
}

TEST_CASE("getRoot function")
{
    priorityqueue<int> test;
    // Empty queue:
    REQUIRE(test.getRoot() == nullptr);
    test.enqueue(1, 1);
    void* savedRoot = test.getRoot();
    REQUIRE(savedRoot != nullptr);
    for (int i = 0; i < 21; ++i) {
        test.enqueue(i, i);
    }
    // Root address should still be the same:
    REQUIRE(test.getRoot() == savedRoot);
    // Tree currently has: 0, R:1, 1, 2, 3, 4...20
    test.dequeue(); test.dequeue();
    // Root should have been dequeued:
    REQUIRE_FALSE(test.getRoot() == savedRoot);
    // BST: R:1, 2, 3, 4...20
    // Check root changes each iteration:
    while (test.getRoot() != nullptr) {
        savedRoot = test.getRoot();
        test.dequeue();
        REQUIRE_FALSE(test.getRoot() == savedRoot);
    }
}

TEST_CASE("Different types of priority queues")
{
    priorityqueue<vector<int>> testIntVector;
    priorityqueue<void*> testPointer;
    priorityqueue<string> testString;
    priorityqueue<char> testChar;
    priorityqueue<bool> testBool;
    priorityqueue<double> testDouble;

    vector<int> v1, v2, x1, x2;
    int num = 0;
    string text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                  "sed do eiusmod tempor incididunt ut labore et dolore magna "
                  "aliqua. Ut enim ad minim veniam, quis nostrud exercitation "
                  "ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                  "Duis aute irure dolor in reprehenderit in voluptate velit "
                  "esse cillum dolore eu fugiat nulla pariatur. Excepteur sint "
                  "occaecat cupidatat non proident, sunt in culpa qui officia "
                  "deserunt mollit anim id est laborum.", splitStr;
    stringstream ss(text), prediction;

    SECTION("Type default values")
    {
        REQUIRE(testIntVector.dequeue().empty());
        REQUIRE(testPointer.dequeue() == nullptr);
        REQUIRE(testString.dequeue().empty());
        REQUIRE(testChar.dequeue() == '\0');
        REQUIRE(testBool.dequeue() == 0);
        REQUIRE(testDouble.dequeue() == 0.0);
    }
    SECTION("Vector tests")
    {   // v1: 0-49, v2: 50-99
        for (; num < 50; ++num) {
            v1.push_back(num);
        }
        for (; num < 100; ++num) {
            v2.push_back(num);
        }
        testIntVector.enqueue(v1, 2);
        testIntVector.enqueue(v2, 3);

        REQUIRE(testIntVector.Size() == 2);

        x1 = testIntVector.dequeue();
        x2 = testIntVector.dequeue();

        num = 0;
        for (int& i : x1) {
            REQUIRE(i == num++);
        }
        for (int& i : x2) {
            REQUIRE(i == num++);
        }
    }
    SECTION("Pointer tests")
    {
        void *tempP1 = &x1, *tempP2 = &x2;
        testPointer.enqueue(tempP1, 2);
        testPointer.enqueue(tempP2, 3);

        REQUIRE(testPointer.Size() == 2);
        REQUIRE(testPointer.dequeue() == &x1);
        REQUIRE(testPointer.dequeue() == &x2);

    }
    SECTION("String tests: ")
    {   // Split text and enqueue into queue / prediction str-stream:
        while (getline(ss, splitStr, ' ')) {
            prediction << num << " value: " << splitStr << endl;
            testString.enqueue(splitStr, num++);
        }
        REQUIRE(testString.Size() == 69);  // Amount of words in text. (NICE)
        REQUIRE(testString.toString() == prediction.str());
        // Reset ss error flags and set text again:
        ss.clear();
        ss.str(text);
        num = testString.Size();
        while (getline(ss, splitStr, ' ')) {
            REQUIRE(testString.dequeue() == splitStr);
            REQUIRE(testString.Size() == --num);
        }
        REQUIRE(testString.Size() == 0);
    }
    SECTION("Char tests: ")
    {   // Enqueue each char into testChar / prediction str-stream:
        for (char& c : text) {
            prediction << num << " value: " << c << endl;
            testChar.enqueue(c, num++);
        }
        REQUIRE(testChar.Size() == 445);  // Amount of chars in text.
        REQUIRE(testChar.toString() == prediction.str());
        for (char& c : text) {
            REQUIRE(testChar.dequeue() == c);
        }
        REQUIRE(testChar.Size() == 0);
    }
    SECTION("Bool tests: ")
    {   // Flip true and false:
        for (; num < 50; ++num) {
            prediction << num << " value: " << ((num & 0x1) == 0) << endl;
            testBool.enqueue(((num & 0x1) == 0), num);
        }
        REQUIRE(testBool.toString() == prediction.str());
        REQUIRE(testBool.Size() == 50);
        for (num = 0; num < 50; ++num) {
            REQUIRE(testBool.dequeue() == ((num & 0x1) == 0));
        }
    }
    SECTION("Double tests: ")
    {
        double numD = 0.0;
        while (numD < 5.0) {
            prediction << num << " value: " << numD << endl;
            testDouble.enqueue(numD, num++);
            numD += 0.1;
        }
        numD = 0.0;
        REQUIRE(testDouble.Size() == 51);
        REQUIRE(testDouble.toString() == prediction.str());
        while (numD < 5.0) {
            REQUIRE(testDouble.dequeue() == numD);
            numD += 0.1;
        }
    }
}