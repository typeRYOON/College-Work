/* main.go */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : main.go :: Project-3
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : Go 1.21 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> Project overview:
 >> This program is an image generating shape program. This makes use of Go interfaces.
 >> This file is for testing and running actual functions, draw.go has the actual
 >> function implementations.
--------------------------------------------------------------------------------------- */
package main
import "fmt"

func main() {
    display := &Display{}
    display.initialize(1024, 1024)

    // Screen interface check:
    ScreenCheck := make([]Screen, 1)
    ScreenCheck[0] = &Display{} // Error -> Unimplemented Screen interface.

    // Geometry interface check:
    GeometryCheck := make([]Geometry, 3)
    GeometryCheck[0] = Rectangle{Point{0, 0}, Point{1, 1}, display.cmap["Red"]}
    GeometryCheck[1] = Circle{Point{0, 0}, 10, display.cmap["Red"]}
    GeometryCheck[2] = Triangle{
        Point{0, 0},
        Point{1, 1},
        Point{2, 2},
        display.cmap["Red"],
    }

    rect := Rectangle{
        Point{100, 300},
        Point{600, 900},
        display.cmap["Red"],
    }

    rect2 := Rectangle{Point{0, 0}, Point{100, 1024}, Color{1, 2, 3}}
    err := rect2.draw(display)
    if err != nil {
        fmt.Println("rect2 : ", err)
    }

    rect3 := Rectangle{Point{0, 0}, Point{100, 1025}, display.cmap["Green"]}
    err = rect3.draw(display)
    if err != nil {
        fmt.Println("rect3 : ", err)
    }

    circ := Circle{
        Point{500, 500},
        200,
        display.cmap["Green"],
    }
    rect.draw(display)
    circ.draw(display)

    tri1 := Triangle{
        Point{100, 100},
        Point{600, 300},
        Point{859, 850},
        display.cmap["Yellow"],
    }
    tri1.draw(display)
    display.drawPixel(500, 200, display.cmap["Blue"])

    pix, err := display.getPixel(537, 538)
    if err != nil {
        fmt.Println("Error :: ", err)
    } else {
        fmt.Println("Pixel at (537, 538): ", pix)
    }

    display.screenShot("output.ppm")
}
