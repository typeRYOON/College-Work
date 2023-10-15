//
// Utility file for reading and writing PPM image
// files, in particular those in "P3" format. 
//
// Original author:
//   Prof. Joe Hummel
//   U. of Illinois, Chicago
//   CS 341, Spring 2022
//

using System;
using System.IO;
using Microsoft.FSharp.Collections;

namespace ImageMain
{
   class Utility
   {

      //
      // ReadImageFile
      //
      // Reads a P3 PPM image file and returns the width,
      // height, depth, and pixels.  The pixels are returned
      // as an F# list of list of tuples. Returns true if
      // successful, false if not.
      //
      public static bool ReadImageFile(string filename, 
         out int width,
         out int height,
         out int depth,
         out FSharpList<FSharpList<Tuple<int,int,int>>> pixels)
      {
        width = 0;
        height = 0;
        depth = 0;
        pixels = FSharpList<FSharpList<Tuple<int, int, int>>>.Empty;

        if (!System.IO.File.Exists(filename))
          return false;

        int   N = 0;
        int[] values = null;

        //
        // PPM files are text files, so we read as text:
        //
        using (StreamReader file = new StreamReader(filename))
        {
          string P3 = file.ReadLine();

          string WidthAndHeight = file.ReadLine();
          string[] words = WidthAndHeight.Split();
          width = Convert.ToInt32(words[0]);
          height = Convert.ToInt32(words[1]);

          string Depth = file.ReadLine();
          depth = Convert.ToInt32(Depth);

          // 
          // now we read the pixels: width is the # of
          // pixels per row, and height is the # of rows,
          // and there are 3 values per pixel.  So N is
          // 3 * width * height:
          //
          N      = 3 * width * height;
          values = new int[N];

          int count = 0;
          
          while (count < N) {

            string   line = file.ReadLine();
            string[] rgb  = line.Split();
            
            for (int i = 0; i < rgb.Length; i++) {
              string s = rgb[i].Trim();  // some of the values are blank:
              
              if (s.Length > 0) {
                values[count] = Convert.ToInt32(rgb[i]);
                count++;
              }
            }//for
          }//while
        }//using

        //
        // Now we turn the array of RGB values into 
        // F# list of lists of tuples. Since we build
        // the F# lists backwards for efficiency, we
        // need to go through the data backwards to
        // adjust for this:
        //
        for (int r = height-1; r >= 0; r--) {

            FSharpList<Tuple<int,int,int>> row = FSharpList<Tuple<int,int,int>>.Empty;
          
            for (int c = 3*(width-1); c >= 0; c -= 3) {
              
              int i = r*3*width + c;
              int R = values[i];
              int G = values[i+1];
              int B = values[i+2];

              Tuple<int,int,int> T = Tuple.Create(R, G, B);
              row = new FSharpList<Tuple<int, int, int>>(T, row);
            }

            pixels = new FSharpList<FSharpList<Tuple<int, int, int>>>(row, pixels);
          }

        // success!
        return true;
      }

      //
      // WriteImageFile
      //
      // Writes a P3 PPM image file that has been input by
      // ReadImageFile. Note that width and height are 
      // not passed as parameters, but instead are computed
      // from the pixel data. For now, always returns true.
      //
      public static bool WriteImageFile(string filename, 
         int depth,
         ref FSharpList<FSharpList<Tuple<int,int,int>>> pixels)
      {
        using (StreamWriter file = new StreamWriter(filename))
        {
          //
          // let's compute the width and height based
          // on the pixel data:
          //   width = # tuples in a row
          //   height = # of rows
          //
          int width = 0;
          int height = 0;
          
          foreach (FSharpList<Tuple<int, int, int>> row in pixels)
          {
            height++;

            if (width == 0) { // not yet computed, so compute it:
              foreach (Tuple<int, int, int> T in row)
                width++;
            }
          }//foreach
          
          //
          // first write the image header info:
          //
          file.WriteLine("P3");
          
          file.Write(width);
          file.Write(" ");
          file.WriteLine(height);

          file.WriteLine(depth);

          //
          // Finally, write the pixels, row by row:
          //
          foreach (FSharpList<Tuple<int, int, int>> row in pixels)
          {
            foreach (Tuple<int, int, int> T in row)
            {
              file.Write(T.Item1);
              file.Write(" ");
              file.Write(T.Item2);
              file.Write(" ");
              file.Write(T.Item3);
              file.Write(" ");
            }

            file.WriteLine();
          }//foreach
        }

        // success!
        return true;
      }

   }//class
}//namespace
