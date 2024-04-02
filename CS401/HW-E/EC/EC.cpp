// g++ -std=c++23 -O2 -Wall EC.cpp -o EC.exe
#include <algorithm>
#include <iostream>
#include <cstdint>
#include <vector>

std::vector<std::pair<uint32_t, uint32_t>> ECProblem
    (const std::vector<std::vector<uint32_t>>& A)
{
    int32_t n = A.size();
    std::vector<std::vector<uint32_t>> DP(n, std::vector<uint32_t>(n, 0));

    // Create gradients based on each coin:
    for (int32_t i = n - 1; i >= 0; --i)
    {
        for (int32_t j = n - 1; j >= 0; --j)
        {   // Case - BR Position:
            if (i == n - 1 && j == n - 1) {
                DP[i][j] = A[i][j];
                continue;
            } // Case - I Row:
            if (i == n - 1) {
                DP[i][j] = A[i][j] + DP[i][j + 1];
                continue;
            } // Case - J Row:
            if (j == n - 1) {
                DP[i][j] = A[i][j] + DP[i + 1][j];
                continue;
            } // Take the coin value + the max adjacent axis:
            DP[i][j] = A[i][j] + std::max(DP[i + 1][j], DP[i][j + 1]);
        }
    }

    for (int32_t i = 0; i < n; ++i) {
        for (int32_t j = 0; j < n; ++j) {
            std::cout << DP[i][j] << ' ';
        }
        std::cout << '\n';
    }

    std::vector<std::pair<uint32_t, uint32_t>> path;
    int32_t i = 0, j = 0;
    // Construct path based off DP, gradient descent:
    while (i < n && j < n)
    {
        path.push_back(std::make_pair(j, i));  // Array ordering swap.
        if      (i == n-1)                    { j++; }
        else if (j == n-1)                    { i++; }
        else if (DP[i][j + 1] > DP[i + 1][j]) { j++; }
        else                                  { i++; }
    };
    return path;
}

int main()
{
    std::vector<std::vector<uint32_t>> A = {
        {0, 0, 0, 0, 0, 0},
        {0, 0, 1, 0, 0, 0},
        {0, 0, 0, 0, 0, 0},
        {0, 1, 0, 0, 1, 0},
        {0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0}
    };

    //std::cout << "Maximal Path:";
    uint32_t c = 0;
    for (const auto& [i, j] : ECProblem(A))
    {
        std::cout << "\n (" << i << ", " << j << ')';
        if (A[j][i]) {
            c++;
            std::cout << " Coin.";
        }
    }
    std::cout << "\nCount: " << c;
    return 0;
}