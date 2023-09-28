# Created by Ryan Magdaleno on 9/30/21

######################################################
# Project: Project 1
# Student Name:  <your name: Magdaleno, Ryan>
# UIN: <668523658>
# URL: < https://replit.com/join/gvmabdclwo-rmagd2 >
# either list the students who provided help or remove the comment lines below
# No one helped me on this project.
######################################################
import turtle
import random

wn = turtle.Screen()
turtle.tracer(0, 0)
wn.setup(500, 500)
wn = wn.screensize(500, 500)
turtle.bgcolor('black')
t1 = turtle.Turtle()
t2 = turtle.Turtle()


def draw_rectangle(t, x, y, heading, pensize, pen_color, length, width, fill_color):
    """
    This function is used to draw a rectangle.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param length: Change the length of the reqtangle (horizonal lines)
    :param width: Change the length of the reqtangle (vertical lines)
    :param fill_color: Change fill color
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
        for i in range(2):
            t.forward(length)
            t.left(90)
            t.forward(width)
            t.left(90)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_triangle(t, x, y, heading, pensize, pen_color, fill_color, side_length):
    """
    This function is used to draw a triangle.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :param side_length: Change the triangle's side length
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    for i in range(3):
        t.forward(side_length)
        t.left(120)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_circle(t, x, y, heading, pensize, pen_color, fill_color, radius, extent=360, steps=100):
    """
    This function is used to draw a circle.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :param radius: Changes the radius of the circle
    :param extent: Changes how of much of the circle is drawn, default is full / 360
    :param steps: Is used to change how many sides the shape has, default is 100 (100 is pretty much a circle)
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    t.circle(radius, extent, steps)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_firework_shape(t, x, y, heading, pensize, pen_color, fill_color, radius):
    """
    This function is used to draw a firework.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :param radius: Change radius size of firework
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    for i in range(30):
        t.forward(radius)
        t.goto(x, y)
        t.left(12)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_object_buildings(t, x, y, heading, pensize, pen_color, fill_color):
    """
    This function creates the bottom buildings in the final drawing.
    This function is called in the draw_object function which is then called by the main function.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    # The next many lines of code are the turtle turns to make the building outline.
    t.left(90)
    t.forward(50)
    t.right(90)
    t.forward(20)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(10)
    t.left(90)
    t.forward(5)
    t.right(90)
    t.forward(5)
    t.right(90)
    t.forward(5)
    t.left(90)
    t.forward(15)
    t.right(90)
    t.forward(15)
    t.left(90)
    t.forward(15)
    t.left(90)
    t.forward(30)
    t.right(90)
    t.forward(10)
    t.right(90)
    t.forward(15)
    t.left(90)
    t.forward(10)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(20)
    t.left(90)
    t.forward(20)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(20)
    t.right(90)
    t.forward(10)
    t.right(90)
    t.forward(30)
    t.left(90)
    t.forward(30)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(30)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(10)
    t.left(90)
    t.forward(40)
    t.right(90)
    t.forward(30)
    t.left(90)
    t.forward(10)
    t.right(90)
    t.forward(30)
    t.right(90)
    t.forward(20)
    t.left(90)
    t.forward(10)
    t.right(90)
    t.forward(15)
    t.left(90)
    t.forward(30)
    t.left(90)
    t.forward(25)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(25)
    t.right(90)
    t.forward(15)
    t.right(90)
    t.forward(20)
    t.left(90)
    t.forward(25)
    t.right(90)
    t.forward(20)
    t.left(90)
    t.forward(25)
    t.right(90)
    t.forward(25)
    t.left(90)
    t.forward(10)
    t.left(90)
    t.forward(10)
    t.right(90)
    t.forward(30)
    t.left(90)
    t.forward(25)
    t.right(90)
    t.forward(10)
    t.left(90)
    t.forward(20)
    t.right(90)
    t.forward(30)
    t.right(90)
    t.forward(35)
    t.left(90)
    t.forward(50)
    t.right(90)
    t.forward(40)
    t.right(90)
    t.forward(500)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_object(t, x, y, heading, pensize, pen_color, fill_color):
    """
    This object creates the foreground in front of the pyramids and also creates the pyramids
    This function calls many shape functions to draw the foreground and pyramids.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    # The next many lines of code are for drawing the foreground landscape.
    t.right(3)
    t.forward(60)
    for i in range(5):
        t.left(3)
        t.forward(25)
    t.right(12)
    t.forward(50)
    t.right(90)
    t.forward(20)
    t.left(90)
    t.forward(20)
    t.left(45)
    t.forward(80)
    t.right(90)
    t.forward(70)
    t.left(45)
    t.left(90)

    for i in range(90):  # Draws a half oval in landscape
        if 30 <= i <= 60:
            t.forward(1)
        t.right(2)
        t.forward(1)

    t.left(90)
    t.forward(53.24)
    t.right(90)
    t.forward(145.96)
    t.right(90)
    t.forward(500)
    t.goto(-250, -100)
    if fill_color != 'none':
        t.end_fill()
    t.penup()

    draw_rectangle(t2, -250, -250, 0, 2, 'black', 500, 50, 'black')
    draw_object_buildings(t2, -250, -200, 0, 2, 'black', 'black')
    # Draws the yellow windows in the buildings
    draw_rectangle(t1, -15, -140, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, -130, -150, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, 20, -175, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, -100, -180, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, -230, -210, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, 175, -140, 0, 1, 'yellow', 2, 4, 'yellow')
    draw_rectangle(t1, 0, -200, 0, 1, 'yellow', 2, 4, 'yellow')


def draw_background(t, x, y, heading, pensize, pen_color, fill_color):
    """
    This function draws some stars and fireworks.
    This function calls the draw_firework_shape function many times to simulate a fireworks show.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :return: None
    """
    t.penup()
    t.goto(x, y)
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)

    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    for i in range(75):
        x_pos = random.randrange(-250, 250)
        y_pos = random.randrange(-50, 250)
        t.goto(x_pos, y_pos)
        t.pendown()
        t.dot(2)
        t.penup()
    firework_colors = ['#9ff747', '#9bf1fa', '#fafa9b', '#ed9bfa', '#fabf9b', '#a49bfa', '#fa9bc3']
    for i in range(7):
        # Random x and y position (-250 <= x <= 250), (-100 <= y <= 250) for fireworks, may look strange if clustered up in one spot
        length = random.randrange(50, 100)
        x_pos = random.randrange(-250, 250)
        y_pos = random.randrange(-100, 250)
        draw_firework_shape(t1, x_pos, y_pos, 0, 2, firework_colors[i], 'none', length)
        draw_firework_shape(t1, x_pos, y_pos, 0, 2, 'white', 'none', length / 3)

    if fill_color != 'none':
        t.end_fill()
    t.penup()


def shadow_triangle(t, x, y, heading, pensize, pen_color, fill_color, point_cool_x, point_cool_y,
                    point_b_x, point_b_y):
    """
    This function draws the pyramids shadow side which is a triangle itself.

    :param t: Turtle (t1 or t2)
    :param x: Chosen turtle goes to this x value
    :param y: Chosen turtle goes to this y value
    :param heading: Change angle to right if positive
    :param pensize: Change pensize, any positive integer
    :param pen_color: Change pen color
    :param fill_color: Change fill color
    :param point_cool_x: x value for point away from main triangle
    :param point_cool_y: y value for point away from main triangle
    :param point_b_x: x value for bottom left point of triangle
    :param point_b_y: y value for bottom left point of triangle
    :return: None
    """
    t.penup()
    t.goto(x, y)  # Go to top point of the main pyramid
    t.setheading(heading)
    t.pensize(pensize)
    t.pencolor(pen_color)
    t.pendown()
    if fill_color != 'none':
        t.fillcolor(fill_color)
        t.begin_fill()
    t.goto(point_cool_x, point_cool_y)  # Go to point away from main triangle
    t.goto(point_b_x, point_b_y)  # Go to bottom point on the main triangle
    t.goto(x, y)
    if fill_color != 'none':
        t.end_fill()
    t.penup()


def draw_2d_pyramids():
    """
    This function draws the 3 2D pyramids.
    This function calls the draw_triangle function 3 times to make 3 triangles
    This function then after each draw_triangle function calls the shadow_triangle function to draw a slanted triangle
    to simulate the shaded part of a pyramid.

    :return: None
    """
    draw_triangle(t1, -250, -115, -3, 2, 'black', '#8b7a1b', 120)
    shadow_triangle(t2, -184.64, -14.36, 0, 2, 'black', '#423d00', -110, -100, -130.16, -121.28)
    draw_triangle(t1, -100, -115, -3, 2, 'black', '#8b7a1b', 170)
    shadow_triangle(t2, -7.41, 27.57, 0, 2, 'black', '#423d00', 100, -105, 69.77, -123.90)
    draw_triangle(t1, 60, -115, -3, 2, 'black', '#8b7a1b', 210)
    shadow_triangle(t2, 174.37, 61.12, 0, 2, 'black', '#423d00', 300, -105, 269.71, -125.99)


def main():
    """
    This function calls all other functions that were previously defined to draw a image.

    :return: None
    """
    draw_background(t1, 0, 0, 0, 2, 'white', 'none')
    # Draws the white stars in the bg, makes the fireworks (random x and y position so it may look weird sometimes)
    draw_2d_pyramids()
    # Draws three 2d pyramids like in the image
    draw_object(t1, -250, -104, 0, 2, '#111111', '#111111')
    # Draws the foreground in front of the pyramids (buildings and landscape between pyramids and buildings)
    t1.goto(-190, -230)
    t1.write("Pyramid fireworks", True, align="center")
    print('Note for scorer:\nThe fireworks may be clustered up due to random x and y values.\n\nName: Ryan Magdaleno\nUIN: 668523658')


main()

# information for scorers

# on what line number is the required for loop?
# <line 391>

# on what line number is the required use of a random number?
# <line 393>

# on what line number is the required use of a conditional statement?
# <line 380>

# on what line number is the required use of a list?
# <line 390>

turtle.exitonclick()
turtle.update()
