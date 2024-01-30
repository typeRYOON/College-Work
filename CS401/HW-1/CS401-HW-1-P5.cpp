/* CS401-HW-1-P5.cpp */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Anastasios Sidiropoulos
 >> University of Illinois Chicago - CS 401, Spring 2024
 >> --------------------------------------------------------------------------------------
 >> File   : CS401-HW-1-P5.cpp
 >> Course : CS 401 (43262), SP24
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 w/ Mingw-w64
 - -                             - -
 >> File overview ::
 >> This C++ program implements my algorithm from CS 401 HW-1 problem five.
--------------------------------------------------------------------------------------- */
// Preprocessor directives:
#include <algorithm>
#include <iostream>
#include <vector>

struct BeachPoint { bool umbrella = false, covered = false, person = false; };
void printBeach(const std::vector<BeachPoint>& beach)
{
    std::cout << "\nU C P\n";
    for (const auto& bp : beach) {
        std::cout << bp.umbrella << ' '
                  << bp.covered  << ' '
                  << bp.person   << '\n';
    }
}

std::vector<int> ProblemFive(std::vector<int>& personIndices,
                             const int& L,
                             const int& N)
{
    // Bad value check:
    if (L < 0 || N < 0) { return {}; }

    // Sort personIndices in ascending order:
    std::sort(personIndices.begin(), personIndices.end());

    // Set up and place people on beach:
    std::vector<BeachPoint> beach(personIndices[N - 1] + L + 1);  // Ensure enough space.
    std::vector<int> umbrellaIndices;                             // Returned vector.
    for (const int& personIndex : personIndices) {
        beach[personIndex].person = true;
    }

    int covered = 0, personPos, umbrellaPos;
    while (covered < N) {
        personPos = personIndices[covered];  // Get first uncovered person's index.
        umbrellaPos = personPos + (L/2);     // Calc Umbrella position like step 2.
        umbrellaIndices.push_back(umbrellaPos);

        // Place umbrella on beach and count how many got covered:
        beach[umbrellaPos].umbrella = true;
        for (int i = personPos; i <= personPos + L; i++) {
            if (beach[i].person) { covered++; }
            beach[i].covered = true;
        }
    }
    printBeach(beach);
    return umbrellaIndices;
}


int main()
{
    std::vector<int> inputIndices = {1, 3, 5};
    const int L = 2, N = (int)inputIndices.size();  // 3 people to cover.

    std::vector<int> outputIndices = ProblemFive(inputIndices, L, N);

    // Print umbrella positions
    std::cout << "\nUmbrellas: " << outputIndices.size();
    std::cout << "\nUmbrella indices (0-based):\n";
    for (const int& umbrellaIndex : outputIndices) {
        std::cout << umbrellaIndex << ' ';
    }
    return 0;
}