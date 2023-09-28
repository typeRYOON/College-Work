/*graph.h*/
/* ----------------------------------------------------------------------------
 >> Assignment details and provided code are created and
 >> owned by Adam T Koehler, PhD - Copyright 2023.
 >> University of Illinois Chicago - CS 251 Spring 2023
 >> ---------------------------------------------------------------------------
 >> Program: graph.h
 >> Course:  CS 251 SP23
 >> Author:  Ryan Magdaleno (rmagd2)
 >> System:  Windows 10 using CLion w/ Mingw-w64
 - -                                        - -
 >> graph class overview:
 >> The graph class is used to represent a directed/undirected graph using an
 >> adjacency list. The underlying adjacency list is a map that takes the graph
 >> key, returns a list of edges (of type pair<>) for that key. This class allows
 >> for quick retrieval at TC of log(N) + M where N is the number of vertices
 >> and M is the number of edges on that specific vertex list. Each edge has
 >> a weight of type WeightT. For more information on public functions, please
 >> view their respective function docstring.
---------------------------------------------------------------------------- */
// Preprocessor directives:
#pragma once
#include <iostream>
#include <vector>
#include <list>
#include <set>
#include <map>
using namespace std;

template<typename VertexT, typename WeightT>
class graph {
private:
    map<VertexT, list<pair<VertexT, WeightT>>> adjacencyList;
    vector<VertexT> verticesVector;
    int edgeCount;

public:
    // Constructor: - -                                                     - -
    graph() : edgeCount(0) {};

    /** NumVertices: - -                                                    - -
    Returns the # of vertices currently in the graph.
        @return int : Returns # of vertices in graph.                       */
    int NumVertices() const
    {
        return adjacencyList.size();
    }

    /** NumEdges: - -                                                       - -
    Returns the # of edges currently in the graph.
        @return int : Returns # of edges in graph.                          */
    int NumEdges() const
    {
        return edgeCount;
    }

    /** addVertex: - -                                                      - -
    Adds vertex v to the graph if it doesn't exist, and if so returns true.
    If the vertex already exists in the graph then false is returned.
        @param v     : The key to add to the adjacency list.
        @return bool : T/F based on if vertex exists already.               */
    bool addVertex(VertexT v)
    {   // Case - Vertex already exists:
        if (adjacencyList.find(v) != adjacencyList.end()) {
            return false;
        }
        adjacencyList.emplace(v, list<pair<VertexT, WeightT>>());
        verticesVector.push_back(v);
        return true;
    }

    /** addEdge: - -                                                        - -
    Adds the edge (from, to, weight) to the graph, and returns true. If the
    vertex does not exist on the adjacency list false is returned.
    NOTE: if the edge already exists, the existing edge weight is
    overwritten with the new edge weight.
        @param from   : The key to retrieve the edges from.
        @param to     : The key to create an edge to from "from" key.
        @param weight : The weight of the new edge from: "from" -> "to".
        @return bool  : T/F based on if a edge was created/overwritten.     */
    bool addEdge(VertexT from, VertexT to, WeightT weight)
    {   // Case - Vertex doesn't exist in adjacency list.
        if (adjacencyList.find(from) == adjacencyList.end() ||
            adjacencyList.find(to) == adjacencyList.end())
        {
            return false;
        }
        // Traverse adjacency list for "from" key to check if edge exists:
        for (auto& edge : adjacencyList[from]) {
            // Case - Vertex already exists:
            if (edge.first == to) {
                edge.second = weight;
                return true;
            }
        }
        // New edge created:
        adjacencyList[from].push_back(make_pair(to, weight));
        edgeCount += 1;
        return true;
    }

    /** getWeight: - -                                                      - -
    Returns the weight associated with a given edge. If the edge exists,
    the weight is returned via the reference parameter and true is returned.
    If the edge does not exist, the weight parameter is unchanged and false
    is returned.
        @param from   : The key to retrieve the edges from.
        @param to     : The key to retrieve edge weight from.
        @param weight : Reference to change and return value.
        @return bool  : T/F based on if vertex/edge exists.                 */
    bool getWeight(VertexT from, VertexT to, WeightT& weight) const
    {   // Case - Vertex "from" or "to" doesn't exist.
        if (adjacencyList.find(from) == adjacencyList.end() ||
            adjacencyList.find(to) == adjacencyList.end())
        {
            return false;
        }
        for (const auto& edge : adjacencyList.at(from)) {
            if (edge.first == to) {
                weight = edge.second;
                return true;
            }
        }
        return false;
    }

    /** neighbors: - -                                                      - -
    Returns a set containing the neighbors of v, i.e. all vertices that can
    be reached from v along one edge. Since a set is returned, the neighbors
    are returned in sorted order.
        @param v             : Key to retrieve all edges it's connected to.
        @return set<VertexT> : Set of graph type containing v's neighbors.  */
    set<VertexT> neighbors(VertexT v) const {
        set<VertexT> s;
        if (adjacencyList.find(v) != adjacencyList.end()) {
            for (const auto& edge : adjacencyList.at(v)) {
                s.insert(edge.first);
            }
        }
        return s;
    }

    /** getVertices: - -                                                    - -
    Returns a vector containing all the vertices currently in the graph.
        @return vector<VertexT> : Vector containing all vertices.           */
    vector<VertexT> getVertices() const
    {
        return verticesVector;
    }

    /** dump: - -                                                           - -
    Dumps the internal state of the graph for debugging purposes.
    >> Example:
    graph<string, int> G;
    ...
    G.dump(cout);  // dump to console
        @param output : Reference to an output stream, for printing output. */
    void dump(ostream& output) const
    {
        for (const auto& vertex : adjacencyList) {
            output << vertex.first << ": ";
            for (const auto& edge : vertex.second) {
                output << "(" << vertex.first << "," << edge.first;
                output << "," << edge.second << ") ";
            }
            output << endl;
        }
    }
};  // - -                            END                                   - -