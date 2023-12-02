/* draw.go */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : draw.go :: Project-3
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : Go 1.21 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> Project overview:
 >> This program is an image generating shape program. This makes use of Go interfaces.
 >> This file implements the drawing functions, main.go has the testing code.
--------------------------------------------------------------------------------------- */
package main

import (
    "errors"
    "fmt"
    "math"
    "os"
)

// Geometry interface:                                                                 - -
type Geometry interface {
    draw(display *Display) (err error)
    shape() (s string)
}

// Screen interface:                                                                   - -
type Screen interface {
    initialize(x, y int)
    getMaxXY() (maxX, maxY int)
    drawPixel(x, y int, c Color) (err error)
    getPixel(x, y int) (c Color, err error)
    clearScreen()
    screenShot(f string)
}

// Display struct:                                                                     - -
type Display struct {
    cmap       map[string]Color
    matrix     [][]Color
    maxX, maxY int
}

// Color struct:                                                                       - -
type Color struct {
    R, G, B int
}

// Point struct:                                                                       - -
type Point struct {
    x, y int
}

// Rectangle struct:                                                                   - -
type Rectangle struct {
    ll, ur Point
    c      Color
}

// Rectangle draw:                                                                     - -
func (rect Rectangle) draw(display *Display) (err error) {
    llx, lly := rect.ll.x, rect.ll.y
    urx, ury := rect.ur.x, rect.ur.y
    err = display.checkColor(rect.c)

    // Check if rectangle has valid points:                                            - -
    if llx > urx || lly > ury {
        return errors.New("invalid rectangle points")
    } else if err != nil {
        return err
    }
    err = checkBound(rect.ur, display)
    if err != nil {
        return err
    }
    err = checkBound(rect.ll, display)
    if err != nil {
        return nil
    }
    // Construct rectangle shape:                                                      - -
    for i := llx; i < urx; i++ {
        for j := lly; j < ury; j++ {
            display.matrix[i][j] = rect.c
        }
    }
    return err
}

// Rectangle print:                                                                    - -
func (rectangle Rectangle) shape() (s string) {
    return "Rectangle"
}

// Circle struct:                                                                      - -
type Circle struct {
    cp Point
    r  int
    c  Color
}

// 
// Circle draw: https://stackoverflow.com/a/1201227                                    - -
func (circ Circle) draw(display *Display) (err error) {
    xc, yc, r := circ.cp.x, circ.cp.y, circ.r

    // Create an array of the tip points of our circle:                                - -
    for _, offset := range []struct{ x, y int }{
        {r - 1, 0}, // {999 500}, cp = {500, 500}, r=500
        {-r, 0},    // {0 500}
        {0, r - 1}, // {500 999}
        {0, -r},    // {500 0}
    } {
        err = checkBound(Point{xc + offset.x, yc + offset.y}, display)
        if err != nil {
            return err
        }
    }
    // Using a rasterization approach, create a cirlce:                                - -
    for x := -r; x <= r; x++ {
        h := int(math.Sqrt(float64(r*r - x*x)))
        for y := -h; y < h; y++ {
            display.matrix[xc+x][yc+y] = circ.c
        }
    }
    return nil
}

// Circle print:                                                                       - -
func (circle Circle) shape() (s string) {
    return "Circle"
}

// Triangle struct:                                                                    - -
type Triangle struct {
    pt0, pt1, pt2 Point
    c             Color
}

// Draws a triangle:                                                                   - -
func (tri Triangle) draw(display *Display) (err error) {
    // Check the three points are within the screen:
    for _, point := range []struct{ pt Point }{
        {tri.pt0},
        {tri.pt1},
        {tri.pt2},
    } {
        err = checkBound(point.pt, display)
        if err != nil {
            return err
        }
    }
    // Check if color is valid:                                                        - -
    err = display.checkColor(tri.c)
    if err != nil {
        return err
    }

    y0 := tri.pt0.y
    y1 := tri.pt1.y
    y2 := tri.pt2.y

    // Sort the points so that y0 <= y1 <= y2:                                         - -
    if y1 < y0 {
        tri.pt1, tri.pt0 = tri.pt0, tri.pt1
    }
    if y2 < y0 {
        tri.pt2, tri.pt0 = tri.pt0, tri.pt2
    }
    if y2 < y1 {
        tri.pt2, tri.pt1 = tri.pt1, tri.pt2
    }

    x0, y0 := tri.pt0.x, tri.pt0.y
    x1, y1 := tri.pt1.x, tri.pt1.y
    x2, y2 := tri.pt2.x, tri.pt2.y

    x01 := interpolate(y0, x0, y1, x1)
    x12 := interpolate(y1, x1, y2, x2)
    x02 := interpolate(y0, x0, y2, x2)

    // Concatenate the short sides:                                                    - -
    x012 := append(x01[:len(x01)-1], x12...)

    // Determine which is left and which is right:                                     - -
    var x_left, x_right []int
    m := len(x012) / 2
    if x02[m] < x012[m] {
        x_left = x02
        x_right = x012
    } else {
        x_left = x012
        x_right = x02
    }

    // Draw the horizontal segments:                                                   - -
    for y := y0; y <= y2; y++ {
        for x := x_left[y-y0]; x <= x_right[y-y0]; x++ {
            display.drawPixel(x, y, tri.c)
        }
    }
    return nil
}

// Shape print:                                                                        - -
func (triangle Triangle) shape() (s string) {
    return "Triangle"
}

// Checks color if known or not:                                                       - -
func (display *Display) checkColor(c Color) (err error) {
    for _, value := range display.cmap {
        if value == c {
            return nil
        }
    }
    return errors.New("color unknown")
}

// Checks if the point is within the image bound:                                      - -
func checkBound(pt Point, display *Display) (err error) {
    if pt.x < 0 || pt.y < 0 || pt.x >= display.maxX || pt.y >= display.maxY {
        return errors.New("geometry out of bounds")
    }
    return nil
}

// interpolate for triangle draw:                                                      - -
func interpolate(l0, d0, l1, d1 int) (values []int) {
    a := float64(d1-d0) / float64(l1-l0)
    d := float64(d0)

    for count := l1 - l0 + 1; count > 0; count-- {
        values = append(values, int(d))
        d = d + a
    }
    return values
}

// Create the cmap and create the image matrix:                                        - -
func (display *Display) initialize(maxX, maxY int) {
    display.maxX, display.maxY = maxX, maxY

    display.cmap = map[string]Color{
        "Red":    {255, 0, 0},
        "Green":  {0, 255, 0},
        "Blue":   {0, 0, 255},
        "Yellow": {255, 255, 0},
        "Orange": {255, 164, 0},
        "Purple": {128, 0, 128},
        "Brown":  {165, 42, 42},
        "Black":  {0, 0, 0},
        "White":  {255, 255, 255},
    }

    display.matrix = make([][]Color, maxY)
    for i := 0; i < maxY; i++ {
        display.matrix[i] = make([]Color, maxX)

        for j := 0; j < maxX; j++ {
            display.matrix[i][j] = display.cmap["White"]
        }
    }
}

// Gets the image width/height:                                                        - -
func (display *Display) getMaxXY() (maxX, maxY int) {
    return display.maxX, display.maxY
}

// Draws a pixel of a specific color at a specfic point:                               - -
func (display *Display) drawPixel(x, y int, c Color) (err error) {
    err = display.checkColor(c)
    if err != nil {
        return err
    }
    display.matrix[x][y] = c
    return err
}

// Gets pixel at specific point:                                                       - -
func (display *Display) getPixel(x, y int) (c Color, err error) {
    err = checkBound(Point{x, y}, display)
    if err != nil {
        return Color{}, err
    }
    return display.matrix[x][y], err
}

// Sets all pixels to white:                                                           - -
func (display *Display) clearScreen() {
    for i := 0; i < display.maxY; i++ {
        for j := 0; j < display.maxX; j++ {
            display.matrix[i][j] = display.cmap["White"]
        }
    }
}

/* Display func screenShot:                                                           - -
Dumps the contents of the Display struct matrix into a PPM file of P3 format.
http://users.csc.calpoly.edu/~akeen/courses/csc101/handouts/assignments/ppmformat.html
    - -                                                                               - -
    @param f: A string representing the file name, should include file extension.
    - -                                                                                */
func (display *Display) screenShot(f string) {
    file, _ := os.Create(f)
    defer file.Close()

    // PPM header:
    fmt.Fprintf(
        file,
        "P3\n%d %d\n255\n",
        display.maxX,
        display.maxY,
    )
    // Dump matrix, new lines for each row:
    for _, row := range display.matrix {
        for _, pixel := range row {
            fmt.Fprintf(
                file,
                "%d %d %d ",
                pixel.R,
                pixel.G,
                pixel.B,
            )
        }
        fmt.Fprintln(file)
    }
}