(* Library.fs *)
(* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : Library.fs :: Project-2
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : .NET 7.0 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> Project overview:
 >> This file/project is a small library of functions that will do manipulations on
 >> images stored in the PPM format. Operations include grayscaling, set threshold
 >> manipulation, horizontal flip, and edge detections w/ the right and bottom pixels.
 >> More information on each function's implementation in their respective doc strings.
--------------------------------------------------------------------------------------- *)
namespace ImageLibrary

module Operations =
    (* Func :: greyification: - -                                                      - -
    This function takes a tuple representing a pixel and returns the pixel grayscaled.
        - -                                                                            - -
        [ O(1) ]
        @param tuple : A tuple of ints representing a pixel's 3 rgb values.
        @return tuple: The modified tuple that has been grayscaled.                     *)
    let greyification (r: int, g: int, b: int) =

        let color = int (float r * 0.299 + float g * 0.587 + float b * 0.114)
        (color, color, color)


    (* Func :: Grayscale: - -                                                          - -
    Converts the image into grayscale and returns the resulting image as a list of
    lists. Pixels in grayscale have the same value f_or each of the Red, Green and Blue
    values in the RGB value. Conversion to grayscale is done by using a avg calculation.
    See the greyification function f_or how each pixel tuple is converted.
        - -                                                                            - -
        [ O(N * M), N = width, M = height ]
        @param width : An int representing the width of the PPM image.
        @param height: An int representing the height of the PPM image.
        @param depth : Unused here, f_or signature use.
        @param image : A list of lists of tuple representing the PPM image.
        @return List : The modifed image list of lists of tuples.                       *)
    let rec Grayscale (width :int)
                      (height:int)
                      (depth :int)
                      (image :(int*int*int) list list) =

        image |> List.map (fun rowList ->
            List.map greyification rowList)


    (* Func :: Threshold: - -                                                          - -
    Thresholding increases image separation --- dark values become darker and light
    values become lighter. Given a threshold value in the range 0 < threshold < color
    depth, each RGB value is compared to see if it's > threshold. If so, that RGB value
    is replaced by the color depth; if not, that RGB value is replaced with 0.
        - -                                                                            - -
        [ O(N * M), N = width, M = height ]
        @param width    : An int representing the width of the PPM image.
        @param height   : An int representing the height of the PPM image.
        @param depth    : The depth to shift a color value to if > than threshold.
        @param image    : A list of lists of tuple representing the PPM image.
        @param threshold: The threshold f_or a pixel color value.
        @return List    : The modifed image list of lists of tuples.                    *)
    let rec Threshold (width :int)
                      (height:int)
                      (depth :int)
                      (image :(int*int*int) list list)
                      (threshold:int) =

        // Depth shift function, f_or a color value:
        let depthShift (colorVal: int) =
            if colorVal > threshold then depth
            else 0

        // Create new image that changes each pixel's color values:
        image |> List.map (fun rowList ->  // ROW.
            List.map (fun (r, g, b) ->     // PIXEL TUPLE.
                (depthShift r, depthShift g, depthShift b)) rowList)


    (* Func :: FlipHorizontal: - -                                                     - -
    Flips an image so that what’s on the left is now on the right, and what’s on the
    right is now on the left.
        - -                                                                            - -
        [ O(N), N = height ]
        @param width : An int representing the width of the PPM image.
        @param height: An int representing the height of the PPM image.
        @param depth : The depth to shift a color value to if > than threshold.
        @param image : A list of lists of tuple representing the PPM image.
        @return List : The modifed image list of lists of tuples.                       *)
    let rec FlipHorizontal (width :int)
                           (height:int)
                           (depth :int)
                           (image :(int*int*int) list list) =

        image |> List.map (fun rowList -> List.rev rowList)


    (* Func :: EdgeDetect: - -                                                         - -
    Edge Detection replaces each pixel in the original image with a black pixel,
    if the original pixel contains an "edge" in the original image. If the original
    pixel does not contain an edge, the pixel is replaced with a white pixel. We use
    the right and bottom pixels to detect edges using the 3-dimensional extension to
    the Pythagorean Theorem.
        - -                                                                            - -
        [ O(N * M), N = width, M = height ]
        @param width    : An int representing the width of the PPM image.
        @param height   : An int representing the height of the PPM image.
        @param depth    : The depth to shift a color value to if > than threshold.
        @param image    : A list of lists of tuple representing the PPM image.
        @param threshold: The threshold f_or a pixel color value.
        @return List    : The modifed image list of lists of tuples.                    *)
    let pythagoras ((r1, g1, b1), (r2, g2, b2)) =
        let rDist = float (r1 - r2)
        let gDist = float (g1 - g2)
        let bDist = float (b1 - b2)
        sqrt (rDist * rDist + gDist * gDist + bDist * bDist)
        // sqrt( (r1-r2)^2 + (g1-g2)^2 + (b1-b2)^2 )

    let rec EdgeDetect (width:int)
                       (height:int)
                       (depth:int)
                       (image:(int*int*int) list list)
                       (threshold:int) =

        // Width and Height are offset:
        let width = width - 1
        let height = height - 1

        // Start to construct a new list of lists of tuples, with edge detections:
        List.init (height) (fun x ->
            List.init (width) (fun y ->
                // image.[x].[y] is the pixel we are doing the calculation on.
                // Check the right and down pixels' distances:
                let rDistance = pythagoras (image.[x].[y], image.[x].[y + 1])
                let dDistance = pythagoras (image.[x].[y], image.[x + 1].[y])
                if rDistance > threshold || dDistance > threshold then
                    (0, 0, 0)         // Black: Edge detected.
                else (255, 255, 255)  // White: Not an edge.
            )
        )


    (* Func :: RotateRight90: - -                                                      - -
    Rotates the image to the right 90 degrees.
        - -                                                                            - -
        [ O(N * M), N = width, M = height ]
        @param width : An int representing the width of the PPM image.
        @param height: An int representing the height of the PPM image.
        @param depth : The depth to shift a color value to if > than threshold.
        @param image : A list of lists of tuple representing the PPM image.
        @return List : The modifed image list of lists of tuples.                       *)
    let rec RotateRight90 (width : int)
                          (height: int)
                          (depth : int)
                          (image :(int*int*int) list list) =

        List.init width (fun x ->
            List.init height (fun y ->
                image.[height - 1 - y].[x]  // On new image, swap x and y, (y offset).
            )
        )