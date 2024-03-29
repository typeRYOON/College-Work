// g++ -std=c++23 -O2 -Wall
#include <iostream>
#include <cstdint>
#include <vector>

struct BeachPoint { bool covered = false, person = false; };
void printBeach(const std::vector<BeachPoint>& beach)
{
    std::cout << "\nC P\n";
    for (const auto& bp : beach) {
        std::cout << bp.covered  << ' '
                  << bp.person   << '\n';
    }
}

void printDP(std::vector<int32_t>& DP)
{
    std::cout << "\n\nDP:\n";
    for (int32_t i = 1; i < (signed)DP.size(); ++i) {
        std::cout << i << ' ' << DP[i] << '\n';
    }
}

std::vector<std::pair<int32_t, int32_t>> ProblemOne(
    const std::vector<int32_t>& xIndices,
    const int32_t L,
    const int32_t n,
    int32_t k)
{   // 1 :: Set up and place people on beach:
    std::vector<std::pair<int32_t, int32_t>> intervals;
    std::vector<BeachPoint> beach(n + L);  // Ensure enough space.
    std::vector<int32_t> DP(n);
    for (const int32_t& i : xIndices) {
        beach[i].person = true;
    }
    // 2 ::
    for (int32_t i = 1; i < n; ++i)
    {
        int32_t ithCount = 0;
        for (int32_t j = i; j < i+L+1; ++j) {
            if (beach[j].person) { ithCount++; }
        }
        DP[i] = ithCount;
    }
    // 3 ::
    while (k--)
    {   // Find max element's index:
        int32_t maxCount = INT32_MIN, m = -1;
        for (int32_t i = 1; i < n; ++i) {
            if (DP[i] > maxCount) {
                maxCount = DP[i];
                m = i;
            }
        }
        std::cout << m << ' ' << maxCount << '\n';
        intervals.push_back(std::make_pair(m, m+L));
        for (int32_t i = m; i <= m+L; ++i) {
            // Don't decrement [i, i-L] if empty:
            if (!beach[i].person || beach[i].covered) { continue; }
            beach[i].covered = true;
            for (int32_t j = i; j && j >= i-L; --j) {
                DP[j]--;
            }
        }
    }
    return intervals;
}

int main()
{
    const std::vector<int32_t> inputIndices = {1, 2, 4, 6, 9, 10, 11, 12, 15, 17};
    if (inputIndices.empty()) {
        std::__throw_invalid_argument("There must be at least one person.");
    }
    const int32_t L = 3, k = 3, xn = inputIndices[inputIndices.size() - 1];
    const auto outputIntervals = ProblemOne(inputIndices, L, xn+1, k); // +1: 0 index.
    for (const auto& interval : outputIntervals) {
        std::cout << '[' << interval.first << ", " << interval.second << "]\n";
    }
    return 0;
}