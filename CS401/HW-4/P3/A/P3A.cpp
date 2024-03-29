#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>

bool ProblemThreeA(
    std::unordered_map<char, std::vector<char>>& G,
    std::unordered_set<char>& visited,
    std::unordered_set<char>& path,
    const char s,
    const char t)
{   // Insert new vertex into containers:
    visited.insert(s);  
    path.insert(s);
    bool cycleFound = false;

    // Check if vertex s is in G:
    if (G.find(s) != G.end())
    {
        // Retrieve vertex s's neighbors:
        for (const char& neighbor : G[s])
        {
            if (path.find(neighbor) != path.end()    ||    // Cycle detected.
            (visited.find(neighbor) == visited.end() &&    // Not visted, so...
            ProblemThreeA(G, visited, path, neighbor, t))) // Delve deeper.
            {
                cycleFound = true;
            }
        }
    }
    // Backtrack current path and check if there was a cycle AND t has been found:
    path.erase(s);
    return (cycleFound && visited.find(t) != visited.end());
}

int main()
{
    std::unordered_map<char, std::vector<char>> G = {
        {'s', {'a'}},
        {'a', {'y', 'b'}},
        {'b', {'x', 's'}},
        {'t', {'z'}}  // Cycle, but no path to t: False.
    };
    std::unordered_set<char> visited, path;
    const char s = 's', t = 't';
    std::cout << ProblemThreeA(G, visited, path, s, t) << '\n';
    return 0;
}