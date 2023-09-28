/*dist.cpp*/

//
// Adam T Koehler, PhD
// University of Illinois Chicago
// CS 251, Fall 2022
//
// Project Original Variartion By:
// Joe Hummel, PhD
// University of Illinois at Chicago
// 

#include <iostream>
#include <cmath>

#include "dist.h"
#include "osm.h"

using namespace std;


//
// DistBetween2Points
//
// Returns the distance in miles between 2 points (lat1, long1) and 
// (lat2, long2).  Latitudes are positive above the equator and 
// negative below; longitudes are positive heading east of Greenwich 
// and negative heading west.  Example: Chicago is (41.88, -87.63).
//
// NOTE: you may get slightly different results depending on which 
// (lat, long) pair is passed as the first parameter.
// 
double distBetween2Points(double lat1, double long1, double lat2, double long2)
{
  //
  // Reference: http://www8.nau.edu/cvm/latlon_formula.html
  //
  double PI = 3.14159265;
  double earth_rad = 3963.1;  // statue miles:

  double lat1_rad = lat1 * PI / 180.0;
  double long1_rad = long1 * PI / 180.0;
  double lat2_rad = lat2 * PI / 180.0;
  double long2_rad = long2 * PI / 180.0;

  double dist = earth_rad * acos(
    (cos(lat1_rad) * cos(long1_rad) * cos(lat2_rad) * cos(long2_rad))
    +
    (cos(lat1_rad) * sin(long1_rad) * cos(lat2_rad) * sin(long2_rad))
    +
    (sin(lat1_rad) * sin(lat2_rad))
  );

  return dist;
}

//
// CenterBetween2Points
//
// Returns the center Coordinate between (lat1, lon1) and (lat2, lon2)
// Reference: http://www.movable-type.co.uk/scripts/latlong.html
//

Coordinates centerBetween2Points(double lat1, double long1, double lat2, double long2)
{
  double PI = 3.14159265;

  // convert to radians
  double lat1_rad = lat1 * PI / 180.0;
  double long1_rad = long1 * PI / 180.0;
  double lat2_rad = lat2 * PI / 180.0;
  double long2_rad = long2 * PI / 180.0;
  
  double long_diff = long2_rad - long1_rad;
  double Bx = cos(lat2_rad) * cos(long_diff);
  double By = cos(lat2_rad) * sin(long_diff);
  
  double lat_ret = atan2(sin(lat1_rad) + sin(lat2_rad), sqrt((cos(lat1_rad) + Bx) * (cos(lat1_rad) + Bx) + By*By));
  double long_ret = long1_rad + atan2(By, cos(lat1_rad) + Bx);
  
  // convert to degrees
  lat_ret = lat_ret * 180.0 / PI;
  long_ret = long_ret * 180.0 / PI;
  
  return Coordinates(-1, lat_ret, long_ret);
    
}
