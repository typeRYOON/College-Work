/*osm.cpp*/

//
// Adam T Koehler, PhD
// University of Illinois Chicago
// CS 251, Fall 2022
//
// Project Original Variartion By:
// Joe Hummel, PhD
// University of Illinois at Chicago
// 
// References:
// TinyXML: https://github.com/leethomason/tinyxml2
// OpenStreetMap: https://www.openstreetmap.org
// OpenStreetMap docs:  
//   https://wiki.openstreetmap.org/wiki/Main_Page
//   https://wiki.openstreetmap.org/wiki/Map_Features
//   https://wiki.openstreetmap.org/wiki/Node
//   https://wiki.openstreetmap.org/wiki/Way
//   https://wiki.openstreetmap.org/wiki/Relation
//

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <cstdlib>
#include <cstring>
#include <cassert>

#include "tinyxml2.h"
#include "osm.h"

using namespace std;
using namespace tinyxml2;


//
// LoadOpenStreetMap
//
bool LoadOpenStreetMap(string filename, XMLDocument& xmldoc)
{
  //
  // load the XML document:
  //
  xmldoc.LoadFile(filename.c_str());

  if (xmldoc.ErrorID() != 0)  // failed:
  {
    cout << "**ERROR: unable to open map file '" << filename << "'." << endl;
    return false;
  }

  //
  // top-level element should be "osm" if the file is a valid open 
  // street map:
  //
  XMLElement* osm = xmldoc.FirstChildElement("osm");

  if (osm == nullptr)
  {
    cout << "**ERROR: unable to find top-level 'osm' XML element." << endl;
    return false;
  }

  //
  // success:
  //
  return true;
}



//
// ReadMapNodes
//
int ReadMapNodes(XMLDocument& xmldoc, map<long long, Coordinates>& Nodes)
{
  XMLElement* osm = xmldoc.FirstChildElement("osm");
  assert(osm != nullptr);

  //
  // Parse the XML document node by node: 
  //
  int nodeCount = 0;

  XMLElement* node = osm->FirstChildElement("node");

  while (node != nullptr)
  {
    const XMLAttribute* attrId = node->FindAttribute("id");
    const XMLAttribute* attrLat = node->FindAttribute("lat");
    const XMLAttribute* attrLon = node->FindAttribute("lon");

    assert(attrId != nullptr);
    assert(attrLat != nullptr);
    assert(attrLon != nullptr);

    long long id = attrId->Int64Value();
    double latitude = attrLat->DoubleValue();
    double longitude = attrLon->DoubleValue();

    nodeCount++;

    //
    // store node in the map:
    //
    Nodes[id] = Coordinates(id, latitude, longitude);

    //
    // next node element in the XML doc:
    //
    node = node->NextSiblingElement("node");
  }

  //
  // done:
  //
  return nodeCount;
}


//
// ReadFootways
//
int ReadFootways(XMLDocument& xmldoc, vector<FootwayInfo>& Footways)
{
  XMLElement* osm = xmldoc.FirstChildElement("osm");
  assert(osm != nullptr);

  //
  // Parse the XML document way by way, looking for footways:
  //
  int footwayCount = 0;

  XMLElement* way = osm->FirstChildElement("way");

  while (way != nullptr)
  {
    const XMLAttribute* attr = way->FindAttribute("id");
    assert(attr != nullptr);

    long long id = attr->Int64Value();

    //
    // we have to loop through all the tag attributes and
    // see if this is a footway:
    //
    bool isFootway = false;

    XMLElement* tag = way->FirstChildElement("tag");
    while (tag != nullptr)
    {
      const XMLAttribute* attrk = tag->FindAttribute("k");
      const XMLAttribute* attrv = tag->FindAttribute("v");

      if (attrk != nullptr && attrv != nullptr)
      {
        const char* k_value = attrk->Value();
        const char* v_value = attrv->Value();

        if ((strcmp(k_value, "highway") == 0) && (strcmp(v_value, "footway") == 0))
        {
          footwayCount++;
          isFootway = true;
          break;
        }
      }

      tag = tag->NextSiblingElement("tag");
    }

    // 
    // if this is a footway, collect the node ids and store another
    // footway object in the vector:
    //
    if (isFootway)
    {
      FootwayInfo footway(id);

      XMLElement* nd = way->FirstChildElement("nd");

      while (nd != nullptr)
      {
        const XMLAttribute* ndref = nd->FindAttribute("ref");
        assert(ndref != nullptr);

        long long id = ndref->Int64Value();

        footway.Nodes.push_back(id);

        // advance to next node ref:
        nd = nd->NextSiblingElement("nd");
      }

      Footways.push_back(footway);
    }//if

    way = way->NextSiblingElement("way");
  }//while

  //
  // done:
  //
  return footwayCount;
}


//
// ReadUniversityBuildings
//
int ReadUniversityBuildings(XMLDocument& xmldoc,
  map<long long, Coordinates>& Nodes,
  vector<BuildingInfo>& Buildings)
{
  XMLElement* osm = xmldoc.FirstChildElement("osm");
  assert(osm != nullptr);

  //
  // Parse the XML document way by way, looking for university buildings:
  //
  int buildingCount = 0;

  XMLElement* way = osm->FirstChildElement("way");

  while (way != nullptr)
  {
    const XMLAttribute* attr = way->FindAttribute("id");
    assert(attr != nullptr);

    long long id = attr->Int64Value();

    bool isBuilding = false;

    const char* buildingName = nullptr;

    XMLElement* tag = way->FirstChildElement("tag");
    while (tag != nullptr)
    {
      const XMLAttribute* attrk = tag->FindAttribute("k");
      const XMLAttribute* attrv = tag->FindAttribute("v");

      if (attrk != nullptr && attrv != nullptr)
      {
        const char* k_value = attrk->Value();
        const char* v_value = attrv->Value();

        if ((strcmp(k_value, "building") == 0) && (strcmp(v_value, "university") == 0))
        {
          isBuilding = true;
        }

        if (strcmp(k_value, "name") == 0)
        {
          buildingName = v_value;
        }
      }

      tag = tag->NextSiblingElement("tag");
    }

    //
    // if this is a building, store info into vector:
    //
    if (isBuilding && buildingName != nullptr)
    {
      XMLElement* nd = way->FirstChildElement("nd");
      buildingCount++;
      //
      // we need to compute a (lat, lon) for the building, so we compute
      // the average based on the nodes that define the perimiter to the
      // building.  We would be better if the XML defined the position
      // of the door(s)?
      //
      double totalLat = 0.0;
      double totalLon = 0.0;
      int    numNodes = 0;

      while (nd != nullptr)
      {
        const XMLAttribute* ndref = nd->FindAttribute("ref");
        assert(ndref != nullptr);

        long long id = ndref->Int64Value();
        assert(Nodes.find(id) != Nodes.end());

        totalLat += Nodes[id].Lat;
        totalLon += Nodes[id].Lon;
        numNodes++;

        // advance to next node ref:
        nd = nd->NextSiblingElement("nd");
      }//while

      //
      // compute average to get a rough position of building, and store
      // building info into vector:
      //
      double lat = totalLat / numNodes;
      double lon = totalLon / numNodes;

      string  fullname(buildingName);

      //
      // do we have an abbreviation?  Appears as "... (SEO)" in the string:
      //
      string abbrev = "?";

      size_t left = fullname.find('(');
      size_t right = fullname.find(')');

      if (left != string::npos && right != string::npos && left < right)
      {
        abbrev = fullname.substr(left + 1, right - left - 1);
      }

      Buildings.push_back(BuildingInfo(fullname, abbrev, id, lat, lon));
    }//if

    way = way->NextSiblingElement("way");
  }//while

  //
  // done:
  //
  return buildingCount;
}
