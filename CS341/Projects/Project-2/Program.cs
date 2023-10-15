//
// Main program for image processing functions. This 
// program inputs the PPM image file, calls the appropriate
// F# image function, and writes the resulting PPM file.
// To view the resulting PPM files, you'll need some sort
// of image viewing program, e.g. ppmReader.html
//
// Original author:
//   Prof. Joe Hummel
//   U. of Illinois, Chicago
//   CS 341, Spring 2022
// Modified: Pat Troy, UIC, Fall 2022
//


// No reason to edit anything here!
using System;
using System.IO;
using Microsoft.FSharp.Collections;

namespace ImageMain
{
   class Program
   {

      static void Main(string[] args)
      {
        int width, height, depth;
        FSharpList<FSharpList<Tuple<int,int,int>>> pixels;

        //
        // Input a PPM image file:
        //
        Console.Write("Image filename> ");
        string filename = Console.ReadLine();
        
        bool success = Utility.ReadImageFile(filename, 
          out width, out height, out depth, out pixels);

        if (!success) {
          Console.WriteLine("**Error: unable to open '{0}'", filename);
          return;
        }

        //
        // What operation does the user want to perform?
        //
        Console.WriteLine();
        Console.WriteLine("Operation?");
        Console.WriteLine("  1 => grayscale");
        Console.WriteLine("  2 => threshold");
        Console.WriteLine("  3 => flip horizontal");
        Console.WriteLine("  4 => edge detect");
        Console.WriteLine("  5 => right-rotate 90");
        Console.Write("> ");
        int cmd = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine();

        //
        // Operations:
        //
        if (cmd == 1) {
          Console.WriteLine("Converting to grayscale...");
          FSharpList<FSharpList<Tuple<int, int, int>>> newPixels;
          newPixels = ImageLibrary.Operations.Grayscale(width, height, depth, pixels);

          string outfile = System.IO.Path.GetFileNameWithoutExtension(filename);
          outfile = outfile + "-grayscale.ppm";
          Console.WriteLine("Writing '{0}'...", outfile);
          Utility.WriteImageFile(outfile, depth, ref newPixels);
        }
        else if (cmd == 2) {
          Console.Write("Threshold value (0 <= value <= 255)? ");
          int threshold = Convert.ToInt32(Console.ReadLine());

          Console.WriteLine("Performing threshold operation...");
          FSharpList<FSharpList<Tuple<int, int, int>>> newPixels;
          newPixels = ImageLibrary.Operations.Threshold(width, height, depth, pixels, threshold);

          string outfile = System.IO.Path.GetFileNameWithoutExtension(filename);
          outfile = outfile + "-threshold.ppm";
          Console.WriteLine("Writing '{0}'...", outfile);
          Utility.WriteImageFile(outfile, depth, ref newPixels);
        }
        else if (cmd == 3) {
          Console.WriteLine("flipping horizontally...");
          FSharpList<FSharpList<Tuple<int, int, int>>> newPixels;
          newPixels = ImageLibrary.Operations.FlipHorizontal(width, height, depth, pixels);

          string outfile = System.IO.Path.GetFileNameWithoutExtension(filename);
          outfile = outfile + "-flip-horz.ppm";
          Console.WriteLine("Writing '{0}'...", outfile);
          Utility.WriteImageFile(outfile, depth, ref newPixels);
        }
        else if (cmd == 4) {
          Console.Write("Edge threshold value (0 < value < 255)? ");
          int factor = Convert.ToInt32(Console.ReadLine());

          Console.WriteLine("Running edge detection...");
          FSharpList<FSharpList<Tuple<int, int, int>>> newPixels;
          newPixels = ImageLibrary.Operations.EdgeDetect(width, height, depth, pixels, factor);

          string outfile = System.IO.Path.GetFileNameWithoutExtension(filename);
          outfile = outfile + "-edge.ppm";
          Console.WriteLine("Writing '{0}'...", outfile);
          Utility.WriteImageFile(outfile, depth, ref newPixels);
        }
        else if (cmd == 5) {
          Console.WriteLine("rotating image right 90 degrees...");
          FSharpList<FSharpList<Tuple<int, int, int>>> newPixels;
          newPixels = ImageLibrary.Operations.RotateRight90(width, height, depth, pixels);

          string outfile = System.IO.Path.GetFileNameWithoutExtension(filename);
          outfile = outfile + "-rotated.ppm";
          Console.WriteLine("Writing '{0}'...", outfile);
          Utility.WriteImageFile(outfile, depth, ref newPixels);
        }
        else {
          Console.WriteLine("**Error, unknown command, please run again...");
        }

        Console.WriteLine();
        Console.WriteLine("Done");
      }//Main

   }//class
}//namespace
