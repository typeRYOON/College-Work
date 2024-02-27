/* P1.cpp */
#include <map>       // Use unordered_map for faster operations if you'd like.
#include <iostream>  // Console IO
#include <vector>    // Array-like containers.
#include <algorithm> // for std::shuffle
#include <random>    // for std::default_random_engine and std::uniform_int_distribution
#include <ctime>     // for std::time

typedef unsigned long long ull;
typedef std::map<ull, ull> Connections;
struct Wire   { ull wireID, switchID;    };
struct Switch { ull switchID; bool isOn; };
ull nlogn = 0, nsquared = 0;  // Operation counters.


void makeConnections(
    Connections& c,          // Resultant map from Wire IDs to correct switch IDs.
    std::vector<Wire>& w,    // Container for current call's wires.
    std::vector<Switch>& s,  // Container for all switches.
    ull start,               // Start index for range.
    ull end)                 // End index for range.
{
    // Base case: only one switch, n step: add connection to resultant container.
    if (start == end) {
        for (const Wire& wire : w) {
            c[wire.wireID] = start;
            nlogn++;
        }
        return;
    }
    std::vector<Wire> onGroup, offGroup;
    ull mid = (start + end) / 2;

    // n/c step: Turn on front half of switches in current step.
    // c is current division step constant, depth 1 = 2, depth 2 = 4, ...
    for (ull i = start; i <= mid; ++i) {
        s[i].isOn = true; // Redundant, but this is part of the algorithm.
        nlogn++;
    }

    // n step: Check each wire if bulb turns on.
    for (const Wire& wire : w) {
        // This is how I'm checking if a bulb is on, in the real
        // diagram it's simply a black box bulb check, after turning the switches on.
        // Simply check if each wire's "solution" was in the range of bulbs that were on.
        nlogn++;
        if (wire.switchID >= start && wire.switchID <= mid) {
            onGroup.push_back(wire);
        } else {
            offGroup.push_back(wire);
        }
    }
    // n/c step: Turn off front half of switches in current step.
    // c is current division step, depth 1 = 2, depth 2 = 4, ...
    for (ull i = start; i <= mid; ++i) {
        s[i].isOn = false; // Redundant, but this is part of the algorithm.
        nlogn++;
    }

    // Divide range in half for onGroup wires:
    makeConnections(c, onGroup, s, start, mid);
    // Divide range in half for offGroup wires:
    makeConnections(c, offGroup, s, mid + 1, end);
}


// Randomly assign wires to switches (0/1 to 1, many wires to 1)
void randomAssign(std::vector<Wire>& w, std::vector<Switch>& s, ull n)
{
    std::uniform_int_distribution<ull> distribution(0, s.size() - 1);
    std::default_random_engine generator(std::time(0));
    for (ull i = 0; i < n; ++i)
    {
        w[i] = {i, distribution(generator)};  // wireID, switchID
        s[i] = {i, false};                    // switchID, isOn
    }

    for (const auto& wire : w) {
        std::cout <<
           "Wire " << wire.wireID << " connected to switch " << wire.switchID << '\n';
    }
}


int main()
{
    ull n = 100;
    if (n <= 0) { return 0; }
    auto wires       = std::vector<Wire>(n);
    auto switches    = std::vector<Switch>(n);
    auto connections = Connections();
    randomAssign(wires, switches, n);
    makeConnections(connections, wires, switches, 0, n - 1);

    // Validate:
    std::cout << std::endl;
    for (const auto& [wireID, switchID] : connections) {
        std::cout <<
            "Wire " << wireID << " connected to switch " << switchID << '\n';
        if (wires[wireID].switchID != switchID) {
            std::cerr << "Mismatch: " << wires[wireID].switchID << ' ' << switchID;
            return 1;
        }
    }
    // Naive n^2 operations approach:
    for (ull i = 0; i < n; ++i) {
        for (ull j = 0; j < n; ++j) {
            nsquared++;
            if (wires[i].switchID == switches[j].switchID) { break; }
        }
    }
    std::cout << "All good!" << "\n\n";
    std::cout << "Operation count:" << '\n';
    std::cout << "nlogn: "    << nlogn    << '\n';
    std::cout << "nsquared: " << nsquared << '\n';
    return 0;
}