/* HW-1-P4.cpp */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Anastasios Sidiropoulos
 >> University of Illinois Chicago - CS 401, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : HW-1-P4.cpp
 >> Course : CS 401 (43262), SP24
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 - -                             - -
 >> File overview ::
 >> This C++ program implements my algorithm from CS 401 HW-1 problem four.
--------------------------------------------------------------------------------------- */
// Preprocessor directives:
#include <algorithm>
#include <iostream>
#include <vector>

struct Item { int size, index; };
bool compareItems(Item i1, Item i2) { return (i1.size < i2.size); }

std::vector<int> ProblemFour(std::vector<Item> items,
                             const int& B,
                             const int& n)
{
    std::vector<int> I;
    int itemSizeSum = 0;

    // 1) Sort items in ascending order:
    sort(items.begin(), items.end(), compareItems);

    // 2) Collect front items until > B:
    for (const Item& i : items) {
        itemSizeSum += i.size;
        if (itemSizeSum > B) { break; }
        I.push_back(i.index);
    }
    return I;
}


int main()
{
    std::vector<int> numsToAdd = {4, 10, 32, 2, 44, 132, 60, 23, 1};
    int n = (int)numsToAdd.size();
    int B = 100;

    std::vector<Item> items(n);
    Item temp;

    for (int i = 0; i < n; ++i) {
        temp.size = numsToAdd[i];
        temp.index = i;
        items[i] = temp;
    }
    std::vector<int> I = ProblemFour(items, B, n);
    std::cout << "\nSet of n items: ";
    for (const int& size : numsToAdd) {
        std::cout << size << ' ';
    }

    std::cout << "\nReturned I set: ";
    for (const int& index : I) {
        std::cout << index << ' ';
    }
    return 0;
}