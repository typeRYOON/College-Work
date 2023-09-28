/*application.cpp*/
/* --------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> -------------------------------------------------------------------------------------
 >> Program: application.cpp
 >> Course : CS 251 SP23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> References   :
 >> TinyXML      : https://github.com/leethomason/tinyxml2
 >> OpenStreetMap: https://www.openstreetmap.org
 - -                                        - -
 >> Overview:
 >> This program prompts the user for a .osm file (OpenStreetMap XML file type). TinyXML
 >> is then used to read the nodes and ways into containers. A graph is constructed based
 >> on the given .osm file. The user is then prompted for 2 starting points, and this
 >> program will find the nearest building at their center and find the path from startA
 >> to dest and startB to dest. This program can handle if there is no possible path
 >> between the starting nodes and the destination. Outputs the path taken and distance
 >> in miles. This program uses many compiled source files and header files, the supplied
 >> makefile will show how this program should be built. The graph.h file is used to
 >> create the graph object and holds all vertices/edges. Can handle any osm file as long
 >> as exported correctly from openstreetmap.com. More information about graph.h and each
 >> function's functionality is in their respective docstrings/header file.
-------------------------------------------------------------------------------------- */
// Preprocessor directives:
#include <unordered_map>
#include <cassert>
#include <iomanip>
#include "tinyxml2.h"
#include "graph.h"
#include "dist.h"
#include "osm.h"
using namespace tinyxml2;

/** printBuilding: - -                                                                - -
This function prints the info associated with the person1/2 and destination BuildingInfo
objects. Will return true if person1/2 building was not found, else return false.
This function will find the nearest building to the midpoint between building A and B.
    - -                                                                               - -
    @param Buildings : A vector containing every building in current graph.
    @param buildDest : A building object representing the destination building.
    @param buildA    : A building object representing start building A.
    @param buildB    : A building object representing start building B.
    @return bool     : T/F on if both buildings were found.                           */
bool printBuilding(vector<BuildingInfo>& Buildings,
                   BuildingInfo& buildDest,
                   BuildingInfo& buildA,
                   BuildingInfo& buildB)
{   // Case - Buildings not found:
    if (buildA.Abbrev == "-1") {
        cout << "Person 1's building not found" << endl;
        return true;
    }
    else if (buildB.Abbrev == "-1") {
        cout << "Person 2's building not found" << endl;
        return true;
    }
    // Printing both building names/coordinates:
    cout << "Person 1's point:" << endl;
    cout << " " << buildA.Fullname << endl;
    cout << " (" << buildA.Coords.Lat << ", ";
    cout << buildA.Coords.Lon << ")" << endl;

    cout << "Person 2's point:" << endl;
    cout << " " << buildB.Fullname << endl;
    cout << " (" << buildB.Coords.Lat << ", ";
    cout << buildB.Coords.Lon << ")" << endl;

    double minDist = numeric_limits<double>::max(), buildDist;
    Coordinates center = centerBetween2Points(buildA.Coords.Lat, buildA.Coords.Lon,
                                              buildB.Coords.Lat, buildB.Coords.Lon);
    // Find building closest to center:
    for (auto& building : Buildings) {
        buildDist = distBetween2Points(center.Lat, center.Lon,
                                       building.Coords.Lat, building.Coords.Lon);
        if (buildDist < minDist) {
            minDist = buildDist;
            buildDest = building;
        }
    }
    cout << "Destination Building:" << endl;
    cout << " " << buildDest.Fullname << endl;
    cout << " (" << buildDest.Coords.Lat << ", " << buildDest.Coords.Lon << ")" << endl;
    return false;
}

/** findNearestNode: - -                                                              - -
This function uses the passed building object to find a node on one of the pathways
that is closest to said building. The nearestNode object will be changed for later
use in dijkstraSearch().
    - -                                                                               - -
    @param Nodes       : A map that contains the coordinates for each vertex in the graph.
    @param Footways    : A vector containing every footway vector.
    @param nearestNode : A vertex representing the nearest node to building.
    @param building    : A building obj to find nearest node next to.                 */
void findNearestNode(map<long long, Coordinates>& Nodes,
                     vector<FootwayInfo>& Footways,
                     Coordinates& nearestNode,
                     BuildingInfo& building)
{
    double minDest = numeric_limits<double>::max(), nodeDist;
    Coordinates nodeCoords;
    // Find node on one of the pathways that is closest to building.
    for (auto& footpath : Footways) {
        for (auto& nodeID : footpath.Nodes) {
            nodeCoords = Nodes[nodeID];
            nodeDist = distBetween2Points(building.Coords.Lat, building.Coords.Lon,
                                          nodeCoords.Lat, nodeCoords.Lon);
            if (nodeDist < minDest) {
                minDest = nodeDist;
                nearestNode = nodeCoords;
            }
        }
    }
}

/** printNearestNode: - -                                                             - -
This function prints a node's ID and coordinates, used for printing after finding
a node closest to a building.
    - -                                                                               - -
    @param node : The node to print info about.
    @param type : A string that could be "destination" or "P1"/"P2".                  */
void printNearestNode(Coordinates& node, const string& type)
{
    cout << "\nNearest " << type << " node:" << endl;
    cout << " " << node.ID << endl;
    cout << " (" << node.Lat << ", " << node.Lon << ")";
}


/** dijkstraSearch: - -                                                               - -
Uses Dijkstra's algorithm to find the shortest path from startNodeID to destination
node, the distances and predecessors maps store the information for finding out the
weights/nodes on the path.
    - -                                                                               - -
    @param predecessors : A map that returns the last node traversed on path.
    @param distances    : A map that returns the distance up to passed node on path.
    @param G            : A graph object that holds all vertices/edges.
    @param startNodeID  : The starting node ID.                                          */
void dijkstraSearch(unordered_map<long long, long long>& predecessors,
                    unordered_map<long long, double>& distances,
                    graph<long long, double>& G,
                    long long startNodeID)
{
    double INF = numeric_limits<double>::max(), edgeWeight, altPathDist;
    set<pair<double, long long>> unvisited;
    long long currentV;
    // Set container defaults:
    for (auto& vertex : G.getVertices()) {
        distances[vertex] = INF;
        predecessors[vertex] = 0;
        unvisited.insert(make_pair(INF, vertex));
    }
    // Mark start vertex:
    distances[startNodeID] = 0;
    unvisited.insert(make_pair(0, startNodeID));

    while (!unvisited.empty()) {
        auto next = unvisited.begin(); // Get "top" of set.
        currentV = next->second;       // next->second is "top" vertex ID.
        unvisited.erase(next);         // Remove pair from set.

        // Break condition:
        if (distances[currentV] == INF) {
            break;
        }
        // For each currentV edge, check for next best vertices:
        for (const auto& edge : G.neighbors(currentV)) {
            G.getWeight(currentV, edge, edgeWeight);
            altPathDist = distances[currentV] + edgeWeight;
            if (altPathDist < distances[edge]) {
                distances[edge] = altPathDist;
                predecessors[edge] = currentV;
                unvisited.insert(make_pair(altPathDist, edge));
            }
        }
    }
}

/** getOutputPath: - -                                                                - -
After dijkstraSearch() We use the predecessors map to get the path traversed up to
the destNode. We also use the distances map to get the distance up to that node.
Using a stringstream we can push the output into it for later use but not now. We may
have the second dijkstraSearch() fail to find a path thus not printing the path until
after both have found a path is ideal for using a stringstream.
    - -                                                                               - -
    @param predecessors : A map that returns the last node traversed on path.
    @param distances    : A map that returns the distance up to passed node on path.
    @param G            : A graph object that holds all vertices/edges.
    @param destID       : A Node ID used to back track thorough predecessors.
    @param nodeNum      : A int representing which person's path we're printing.
    @param output       : A stringstream that may get output to cout.                 */
void getOutputPath(unordered_map<long long, long long>& predecessors,
                   unordered_map<long long, double>& distances,
                   graph<long long, double>& G,
                   long long destID,
                   int nodeNum,
                   stringstream& output)
{
    vector<long long> path;
    int vSize;
    output << "Person " << nodeNum << "'s distance to dest: ";
    output << distances[destID] << " miles" << endl << "Path: ";
    // Insert node path in-order into path vector:
    path.insert(path.begin(), destID);
    while (predecessors[destID]) {
        destID = predecessors[destID];
        path.insert(path.begin(), destID);
    }
    // Send path to output stringstream:
    vSize = (int)path.size();
    for (int i = 0; i < vSize - 1; ++i) {
        output << path.at(i) << "->";
    }   output << path.at(vSize - 1) << endl;
}

/** nextBestBuilding: - -                                                             - -
This function is called if dijkstraSearch() failed on the current building. Will use
the two starting nodes to find the next best building according to their midpoint.
Saves all the buildings that failed to the badBuildings set.
    - -                                                                               - -
    @param Buildings     : A vector containing every building in current graph.
    @param badBuildings  : A set containing all the buildings dijkstraSearch failed on.
    @param nodeA         : A node representing person1 starting node.
    @param nodeB         : A node representing person2 starting node.
    @return BuildingInfo : The returned next best building object.                    */
BuildingInfo nextBestBuilding(vector<BuildingInfo>& Buildings,
                              set<long long>& badBuildings,
                              Coordinates& nodeA,
                              Coordinates& nodeB)
{
    double minDist = numeric_limits<double>::max(), buildDist;
    BuildingInfo buildDest;
    Coordinates center = centerBetween2Points(nodeA.Lat, nodeA.Lon,
                                              nodeB.Lat, nodeB.Lon);
    for (auto& building : Buildings) {
        // Case - current building did not result in a path from previous dijkstraSearch():
        if (badBuildings.count(building.Coords.ID)) {
            continue;
        }
        buildDist = distBetween2Points(center.Lat, center.Lon,
                                       building.Coords.Lat, building.Coords.Lon);
        if (buildDist < minDist) {
            minDist = buildDist;
            buildDest = building;
        }
    }
    cout << "\nNew destination building:" << endl;
    cout << " " << buildDest.Fullname << endl;
    cout << " (" << buildDest.Coords.Lat << ", " << buildDest.Coords.Lon << ")";
    return buildDest;
}

/** repeatOperation: - -                                                              - -
This function prompts the user for person1's building and resets any changed prior values
to their defaults.
    - -                                                                               - -
    @param badBuildings    : A set containing all the buildings dijkstraSearch failed on.
    @param person1Building : A string that stores the user's person1 building choice.
    @param repeatBuilding  : A boolean to be reset to a true state.                   */
void repeatOperation(set<long long>& badBuildings,
                     string& person1Building,
                     bool& repeatBuilding)
{
    repeatBuilding = true;
    badBuildings.clear();
    cout << endl;
    cout << "Enter person 1's building (partial name or abbreviation), or #> ";
    getline(cin, person1Building);
}

/** destNotReached: - -                                                               - -
This function checks if the destination destNode was reached after dijkstraSearch().
    - -                                                                               - -
    @param distances    : A map that returns the distance up to passed destNode on path.
    @param destNode     : The destination destNode.
    @return bool        : T/F, true if destination was not reached, else false.       */
bool destNotReached(unordered_map<long long, double>& distances,
                    Coordinates& destNode)
{   // Case - Starting destNode did not reach destination destNode:
    if (distances[destNode.ID] >= numeric_limits<double>::max()) {
        cout << "At least one person was unable to reach the destination building. "
                "Finding next closest building..." << endl;
        return true;
    }
    return false;
}

/** getBuildings: - -                                                                 - -
This function uses the user inputted strings to find a building that matches their
inputs. Checks for abbreviation then for full name partial matches.
    - -                                                                               - -
    @param Buildings       : A vector containing every building in current graph.
    @param buildingA       : A building object representing start building A.
    @param buildingB       : A building object representing start building B.
    @param person1Building : A string that stores person1's user input.
    @param person2Building : A string that stores person2's user input.               */
void getBuildings(vector<BuildingInfo>& Buildings,
                  BuildingInfo& buildingA,
                  BuildingInfo& buildingB,
                  string& person1Building,
                  string& person2Building)
{
    buildingA.Abbrev = "-1", buildingB.Abbrev = "-1";
    // Abbreviation check:
    for (auto& building : Buildings) {
        if (building.Abbrev == person1Building) {
            buildingA = building;
        }
        if (building.Abbrev == person2Building) {
            buildingB = building;
        }
    }
    // Full name partial match check:
    for (auto& building : Buildings) {
        if (buildingA.Abbrev == "-1" && building.Fullname.find(person1Building) != string::npos) {
            buildingA = building;
        }
        if (buildingB.Abbrev == "-1" && building.Fullname.find(person2Building) != string::npos) {
            buildingB = building;
        }
    }
}


/** application: - -                                                                  - -
This function sets up the main program loop. The goal is to get user input to find
two starting nodes, and then to find the shortest path between them to a building's
node. Prints information about each traversal and handles dijkstraSearch() failing.
    - -                                                                               - -
    @param Nodes     : A map that contains the coordinates for each vertex in the graph.
    @param Buildings : A vector containing every building in current graph.
    @param Footways  : A vector containing every footway vector.
    @param G         : A graph object that holds all vertices/edges.                  */
void application(map<long long, Coordinates>& Nodes,
                 vector<BuildingInfo>& Buildings,
                 vector<FootwayInfo>& Footways,
                 graph<long long, double>& G)
{
    unordered_map<long long, long long> predecessors;
    unordered_map<long long, double> distances;
    set<long long> badBuildings;

    BuildingInfo buildingA, buildingB, destBuilding;
    double INF = numeric_limits<double>::max();
    bool badBuilding, repeatBuilding = true;
    string person1Building, person2Building;
    Coordinates nodeA, nodeB, destNode;
    stringstream output;
    output.precision(8);

    repeatOperation(badBuildings, person1Building, repeatBuilding);
    while (person1Building != "#") {
        cout << "Enter person 2's building (partial name or abbreviation)> ";
        getline(cin, person2Building);
        // Get the nearest building according to user input:
        getBuildings(Buildings, buildingA, buildingB, person1Building, person2Building);

        // Print building info, if no buildings were found then repeat:
        if (printBuilding(Buildings, destBuilding, buildingA, buildingB)) {
            repeatOperation(badBuildings, person1Building, repeatBuilding);
            continue;
        }
        // Find the nearest nodes according to their buildings, then print their info:
        findNearestNode(Nodes, Footways, nodeA, buildingA);
        findNearestNode(Nodes, Footways, nodeB, buildingB);
        findNearestNode(Nodes, Footways, destNode, destBuilding);
        printNearestNode(nodeA, "P1");
        printNearestNode(nodeB, "P2");
        printNearestNode(destNode, "destination");

        // Check if nodeA is connected to nodeB:
        dijkstraSearch(predecessors, distances, G, nodeA.ID);
        if (distances[nodeB.ID] >= INF) {
            cout << "\n\nSorry, destination unreachable." << endl;
            repeatOperation(badBuildings, person1Building, repeatBuilding);
            continue;
        }
        // Check towards destination node:
        while (repeatBuilding) {
            badBuilding = false;
            cout << endl << endl;
            output.str("");

            // NODE A: - -
            dijkstraSearch(predecessors, distances, G, nodeA.ID);
            badBuilding = max(badBuilding, destNotReached(distances, destNode));
            if (!badBuilding) {
                getOutputPath(predecessors, distances, G, destNode.ID, 1, output);

                // NODE B: - -
                dijkstraSearch(predecessors, distances, G, nodeB.ID);
                badBuilding = max(badBuilding, destNotReached(distances, destNode));
                if (!badBuilding) {
                    getOutputPath(predecessors, distances, G, destNode.ID, 2, output);
                }
            }
            // Case - building not reached for either nodeA or nodeB:
            if (badBuilding) {
                badBuildings.insert(destBuilding.Coords.ID);
                destBuilding = nextBestBuilding(Buildings, badBuildings, nodeA, nodeB);
                findNearestNode(Nodes, Footways, destNode, destBuilding);
                printNearestNode(destNode, "destination");
                continue;
            }
            // Print stringstream contents from getOutputPath() function calls:
            cout << output.str();
            repeatBuilding = false;
        }
        repeatOperation(badBuildings, person1Building, repeatBuilding);
    }
}

/** main: - -                                                                         - -
This function is used for setting the graph to be used in the application function.
The OSM file is read here, and fills the containers with the necessary data.
    - -                                                                               - -
    @return int : 0 indicating a good program execution.                              */
int main() {
    graph<long long, double> G;
    // Maps a Node ID to its coordinates (lat, lon)
    map<long long, Coordinates> Nodes;
    // Info about each footway, in no particular order
    vector<FootwayInfo>         Footways;
    // Info about each building, in no particular order
    vector<BuildingInfo>        Buildings;
    XMLDocument                 xmldoc;

    cout << "** Navigating UIC open street map **" << endl;
    cout << endl;
    cout << std::setprecision(8);

    string def_filename = "map.osm";
    string filename;
    long long nodeA_ID, nodeB_ID, footPathSize;
    double nodeDist;

    cout << "Enter map filename> ";
    getline(cin, filename);

    if (filename.empty()) {
        filename = def_filename;
    }

    // Load XML-based map file:
    if (!LoadOpenStreetMap(filename, xmldoc)) {
        cout << "**Error: unable to load open street map." << endl;
        cout << endl;
        return 0;
    }

    // Read the nodes, which are the various known positions on the map:
    int nodeCount = ReadMapNodes(xmldoc, Nodes);

    // Read the footways, which are the walking paths:
    int footwayCount = ReadFootways(xmldoc, Footways);

    // Read the university buildings:
    int buildingCount = ReadUniversityBuildings(xmldoc, Nodes, Buildings);

    // Stats:
    assert(nodeCount == (int)Nodes.size());
    assert(footwayCount == (int)Footways.size());
    assert(buildingCount == (int)Buildings.size());

    cout << endl;
    cout << "# of nodes: " << Nodes.size() << endl;
    cout << "# of footways: " << Footways.size() << endl;
    cout << "# of buildings: " << Buildings.size() << endl;

    // Add every vertex to the graph:
    for (const auto& node : Nodes) {
        G.addVertex(node.first);
    }
    // Add every edge to the graph:
    for (const auto& footpath : Footways) {
        footPathSize = (long long)footpath.Nodes.size();
        for (int i = 0; i < footPathSize - 1; ++i) {
            nodeA_ID = footpath.Nodes.at(i), nodeB_ID = footpath.Nodes.at(i + 1);
            nodeDist = distBetween2Points(Nodes[nodeA_ID].Lat, Nodes[nodeA_ID].Lon,
                                          Nodes[nodeB_ID].Lat, Nodes[nodeB_ID].Lon);
            G.addEdge(nodeA_ID, nodeB_ID, nodeDist);
            G.addEdge(nodeB_ID, nodeA_ID, nodeDist);
        }
    }
    cout << "# of vertices: " << G.NumVertices() << endl;
    cout << "# of edges: " << G.NumEdges() << endl;
 
    // Execute Application:
    application(Nodes, Buildings, Footways, G);
    cout << "** Done **" << endl;
    return 0;
}
