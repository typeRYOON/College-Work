// g++ -std=c++23 -O2 -Wall P2B.cpp -o P2B.exe
#include <algorithm>
#include <iostream>
#include <cstdint>
#include <vector>

std::vector<int32_t> ProblemTwoB(const std::vector<int32_t>& G)
{
    int32_t n = G.size();
    std::vector<int32_t> include(n, 0), exclude(n, 0);
    std::vector<int32_t> independentSet;

    // Base case: 
    include[0] = G[0];
    exclude[0] = 0;

    // Preprocess index 1:
    if (n > 1) {
        include[1] = G[1];
        exclude[1] = std::max(G[0], 0);
    }

    // Calculate total weights if we include/exclude each node:
    for (int32_t i = 2; i < n; ++i) {
        include[i] = G[i] + std::max(exclude[i-1], exclude[i-2]);
        exclude[i] = std::max(include[i-1], exclude[i-1]);
    }

    int32_t i = n - 1;
    while (i >= 0)
    {
        if (include[i] >= exclude[i]) {
            independentSet.push_back(i);
            i -= 2;
        } else { i--; }
        
    }
    return independentSet;
}

int main()
{
    std::vector<int32_t> G = {
        1, 3, 5, 20, 7, 190, 2000, 1800, -100, -2036, 1
    };
    if (G.empty()) { return -1; }
    std::vector<int32_t> maxIndependentSet = ProblemTwoB(G);

    // Print the index in G and the corresponding weight:
    std::cout << "Maximal independent set: ";
    int32_t count = 0;
    for (int32_t i = maxIndependentSet.size() - 1; i >= 0; --i)
    {
        std::cout << '\n' << maxIndependentSet[i] << ": " << G[maxIndependentSet[i]];
        count += G[maxIndependentSet[i]];
    }
    std::cout << "\nTotal weight: " << count << std::endl;
    return 0;
}