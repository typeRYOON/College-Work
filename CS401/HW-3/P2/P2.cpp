#include <iostream>  // Console IO
#include <vector>    // Array-like containers.

typedef unsigned long long ull;
struct Account {ull userID, count; };
typedef std::vector<Account> AVector;


// Recursive function that divides input array into small sub arrays then
// returns the majority user.
Account majorityFind(
    AVector& a,     // Container for current call's accounts.
    bool leftHalf)  // Whether we return the left halve if counts are equal.
{
    // Base case: Only one account:
    if (a.size() == 1) {
        return {a[0].userID, 1};
    }
    // Split input array a into two equal halves:
    ull mid = a.size() / 2;
    AVector left = AVector(), right = AVector();

    for (ull i = 0; i < mid; ++i)        { left.push_back(a[i]);  }
    for (ull i = mid; i < a.size(); ++i) { right.push_back(a[i]); }

    // Retrieve the majority accounts from the left and right half:
    auto leftHalve = majorityFind(left, leftHalf);
    auto rightHalve = majorityFind(right, leftHalf);

    // Both halves belong to same user, combine their counts:
    if (leftHalve.userID == rightHalve.userID) {
        return {leftHalve.userID, leftHalve.count + rightHalve.count};
    }
    // If different users, return the account with the higher count:
    if (leftHalve.count > rightHalve.count) {
        return leftHalve;
    }
    else if (leftHalve.count < rightHalve.count) {
        return rightHalve;
    }
    // If different users, same count, return halve based on "leftHalf":
    return leftHalf ? leftHalve : rightHalve;
}


// I ran out of time to make a randomAssigner but
// essentially if one userID dominates,
// then that should be the outcome of my algorithm.
void randomAssignIDs(AVector& a, ull n)
{
    for (ull i = 0; i < n/2; ++i) { a[i] = {222, 0}; }
    for (ull i = n/2; i < n; ++i) { a[i] = {i,   0}; }
}


int main()
{
    ull n = 300;
    if (n <= 0) { return 1; }
    auto Accounts = AVector(n);
    randomAssignIDs(Accounts, n);

    auto leftCheck  = majorityFind(Accounts, true);
    auto rightCheck = majorityFind(Accounts, false);

    ull leftCount = 0, rightCount = 0;
    for (ull i = 0; i < n; ++i) {
        if (Accounts[i].userID == leftCheck.userID) {
            leftCount++;
        }
        else if (Accounts[i].userID == rightCheck.userID) {
            rightCount++;
        }
    }
    Account final  = leftCount > rightCount ? leftCheck : rightCheck;
    ull finalCount = leftCount > rightCount ? leftCount : rightCount;

    std::cout << "\n n: " << n << ", ";
    std::cout << "userID: " << final.userID << ", Count: " << finalCount;
    if (finalCount > n/2) { std::cout <<  " > n/2" << '\n'; }
    else                  { std::cout << " <= n/2" << '\n'; }
    return 0;
}