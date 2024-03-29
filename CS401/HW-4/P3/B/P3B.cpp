#include <unordered_map>
#include <unordered_set>
#include <iostream>
#include <cstdint>
#include <vector>

uint32_t ProblemThreeB(
    std::unordered_map<char, std::vector<char>>& G,
    const char s,
    const char t)
{
    std::unordered_map<char, uint32_t> DP;
    // Base case - t, increment scale factor:
    DP[t] = 1;

    // Iterate over vertices in topological order:
    for (const auto& [v, neighbor] : G)
    {   // Initialization:
        if (v != t) { DP[v] = 0; }
        for (const char& w : neighbor)
        {   // Update dp[v] by adding paths from w to t
            DP[v] += DP[w]; 
        }
    }
    // Return the number of paths from s to t
    return DP[s];
}

int main()
{
    std::unordered_map<char, std::vector<char>> G = {
        {'s', {'a', 'b'}},
        {'a', {'t'}},
        {'b', {'t'}},
        {'t', {}}
    };
    std::cout << "Number of paths from s to t: " << ProblemThreeB(G, 's', 't') << '\n';
    return 0;
}