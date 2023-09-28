/*osm.h*/

//
// Adam T Koehler, PhD
// University of Illinois Chicago
// CS 251, Fall 2022
//
// Project Original Variartion By:
// Joe Hummel, PhD
// University of Illinois at Chicago
// 

#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <map>

#include "tinyxml2.h"

using namespace std;
using namespace tinyxml2;


//
// Coordinates:
//
// the triple (ID, lat, lon)
//
struct Coordinates
{
  long long ID;
  double Lat;
  double Lon;

  Coordinates()
  {
    ID = 0;
    Lat = 0.0;
    Lon = 0.0;
  }

  Coordinates(long long id, double lat, double lon)
  {
    ID = id;
    Lat = lat;
    Lon = lon;
  }
};


//
// FootwayInfo
//
// Stores info about one footway in the map.  The ID uniquely identifies
// the footway.  The vector defines points (Nodes) along the footway; the
// vector always contains at least two points.
//
// Example: think of a footway as a sidewalk, with points n1, n2, ..., 
// nx, ny.  n1 and ny denote the endpoints of the sidewalk, and the points
// n2, ..., nx are intermediate points along the sidewalk.
//
struct FootwayInfo
{
  long long ID;
  vector<long long> Nodes;
  FootwayInfo()
  {
    ID = 0;
  }

  FootwayInfo(long long id)
  {
    ID = id;
  }
};


//
// BuildingInfo
//
// Defines a campus building with a fullname, an abbreviation (e.g. SEO),
// and the coordinates of the building (id, lat, lon).
//
struct BuildingInfo
{
  string Fullname;
  string Abbrev;
  Coordinates Coords;

  BuildingInfo()
  {
    Fullname = "";
    Abbrev = "";
    Coords = Coordinates();
  }

  BuildingInfo(string fullname, string abbrev, long long id, double lat, double lon)
  {
    Fullname = fullname;
    Abbrev = abbrev;
    Coords = Coordinates(id, lat, lon);
  }
};


//
// Functions:
//
bool LoadOpenStreetMap(string filename, XMLDocument& xmldoc);
int  ReadMapNodes(XMLDocument& xmldoc, map<long long, Coordinates>& Nodes);
int  ReadFootways(XMLDocument& xmldoc, vector<FootwayInfo>& Footways);
int  ReadUniversityBuildings(XMLDocument& xmldoc,
       map<long long, Coordinates>& Nodes,
       vector<BuildingInfo>& Buildings);
