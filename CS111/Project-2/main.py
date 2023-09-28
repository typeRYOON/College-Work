# Project 2 - Python frogger type game
# Created by Ryan Magdaleno on 11/6/21
# This program creates a turtle screen which displays a frogger like game
# where the goal is to get the green benefit object at the top of the screen
# by moving the arrow keys.

######################################################
# Project: <Project 2>
# UIN: <668523658>
# repl.it URL: <https://replit.com/@CS111-Fall2021/Project-2-rmagd2#main.py>
# No other students helped with my project.
######################################################
import turtle  # Used for pretty much everything
import random  # Used for random positioning of benefit object


def main():
    """
    This is the main function which does everything in this
    file except for importing modules and calling this function
    :return: None
    """
    # Window objects -----------------------------------------------------------------*
    wn = turtle.Screen()
    wn.title('Project 2 - DNSL adventure')
    wn.setup(321, 321) # 321x321 to get rid of scrollbars and weird resizing
    wn.screensize(300, 300)  # 300x300 because of project requirements
    wn.bgcolor('black')
    wn.tracer(0)

    # Turtle objects ------------------------------------------------------------------*
    # t0 is for tracking player object
    t0 = turtle.Turtle()
    t0.pencolor('black')
    t0.penup()
    t0.hideturtle()
    t0.goto(0, -125)

    # t1 is for writing the lives and level message in the bottom left. Also for start
    t1 = turtle.Turtle()
    t1.hideturtle()
    t1.penup()
    t1.pencolor('yellow')

    # t2 is for breaking out of the start screen loop.
    t2 = turtle.Turtle()
    t2.hideturtle()
    t2.penup()
    origin = t2.pos()

    # Key movement functions ---------------------------------------------------------*
    def startbreak():
        """
        This function moves a turtle up one pixel and I use that coordinate to check
        a condition and break out of the start screen loop.
        :return: None
        """
        t2.forward(1)  # Make start screen loop conditional false
        t1.clear()  # Remove start screen instructions

    def upkey():
        """
        Pressing the up arrow key moves the player object up 50 pixels or one lane up.
        :return: None
        """
        newy = t0.ycor() + 50
        t0.goto(t0.xcor(), newy)

    def downkey():
        """
        Pressing the down arrow key moves the player object down 50 pixels or one lane down.
        :return: None
        """
        newy = t0.ycor() - 50
        t0.goto(t0.xcor(), newy)

    def leftkey():
        """
        Pressing the left arrow key moves the player object left 50 pixels or one column left.
        :return: None
        """
        newx = t0.xcor() - 50
        t0.goto(newx, t0.ycor())

    def rightkey():
        """
        Pressing the right arrow key moves the player object right 50 pixels or one column right.
        :return: None
        """
        newx = t0.xcor() + 50
        t0.goto(newx, t0.ycor())


    # Start screen instructions and loop ---------------------------------------------*

    t1.fillcolor('yellow')
    t1.begin_fill()
    t1.goto(150, -150)
    t1.pendown()
    t1.goto(150, -125)
    t1.goto(125, -150)
    t1.goto(150, -150)
    t1.penup()
    t1.end_fill()
    t1.pencolor('white')
    print('Please make sure to expand the window size to the\nyellow triangle in the bottom right\n')
    t1.goto(0, 40)
    t1.write('Python frogger game', align='center')
    t1.goto(0, 20)
    t1.write('By Ryan Magdaleno', align='center')
    t1.goto(0, -20)
    t1.write('Avoid Harm objects and get green benefit object', align='center')
    t1.goto(0, -40)
    t1.write('Control player object at bottom row with arrow keys', align='center')
    t1.goto(0, 80)
    t1.write('Press space to start!', align='center')

    while t2.pos() == origin:
        wn.onkey(startbreak, 'space')
        wn.listen()
        wn.update()


    # Objects dictionary -------------------------------------------------------------*
    game_objects = [
        {'t': turtle.Turtle(), 'x': -120, 'y': -75, 'radius': 25, 'image': 'triangle.gif', 'type': 'triangle_left'},
        {'t': turtle.Turtle(), 'x': 50, 'y': 25, 'radius': 25, 'image': 'triangle.gif', 'type': 'triangle_left'},
        {'t': turtle.Turtle(), 'x': -60, 'y': 75, 'radius': 25, 'image': 'triangle.gif', 'type': 'triangle_right'},
        {'t': turtle.Turtle(), 'x': 120, 'y': -25, 'radius': 25, 'image': 'triangle.gif', 'type': 'triangle_right'},
        {'t': turtle.Turtle(), 'x': random.randint(-100, 100), 'y': 125, 'radius': 25, 'image': 'benefit.gif', 'type': 'benefit'},
        {'t': turtle.Turtle(), 'x': 0, 'y': -125, 'radius': 25, 'image': 'DNSL.gif', 'type': 'player'}]

    # Lane center y coordinates
    # 6 / 125
    # 5 / 75
    # 4 / 25
    # 3 / -25
    # 2 / -75
    # 1 / -125

    game_objects[5]['t'].penup()
    # Create the images
    wn.bgpic('giygas.gif')
    for obj in game_objects:
        wn.addshape(obj["image"])
        obj["t"].shape(obj["image"])

    # Main animation loop ------------------------------------------------------------*
    lives = 3
    level = 1
    speed = .1
    t1.goto(-120, -120)
    t1.write(f'Level {level} - {lives} lives')
    while lives != 0:  # Animation loop
        pos = t0.pos()
        # Movement conditionals ------------------------------------------------------*
        for obj in game_objects:
            if obj['type'] == 'triangle_left':  # Left moving triangle check
                obj['x'] -= speed  # Move left
                if obj['x'] <= -150 - obj['radius']:  # Left edge condition check
                    obj['x'] = 150 + obj['radius']  # Move to right edge
            if obj['type'] == 'triangle_right':  # Right moving triangle check
                obj['x'] += speed  # Move right
                if obj['x'] >= 150 + obj['radius']:  # Right edge condition check
                    obj['x'] = -150 - obj['radius']  # Move to left edge

        # Collision conditionals -----------------------------------------------------*
        # Collision with screen walls
        if t0.xcor() == -150 or t0.xcor() == 150:  # -150/150 are the L/R walls
            t0.setpos(0, -125)
            lives -= 1
            t1.clear()
            t1.write(f'Level {level} - {lives} lives')
            print('HIT WALL')
        elif t0.ycor() == -175 or t0.ycor() == 175:
            t0.setpos(0, -125)
            lives -= 1
            t1.clear()
            t1.write(f'Level {level} - {lives} lives')  # -200/200 are the up/down walls
            print('HIT WALL')

        # Collision with harm/benefit objects
        counter = 0
        for obj in game_objects:
            counter += 1
            if counter == 6:  # Don't want to check player object dictionary
                break
            if t0.ycor() == obj['y']:
                if obj['type'] == 'benefit':  # Benefit object check ******************
                    if t0.xcor() > obj['x']:
                        Distance = t0.xcor() - obj['x']
                    else:
                        Distance = obj['x'] - t0.xcor()
                    if Distance <= 50:  # HIT BENEFIT OBJECT
                        t0.setpos(0, -125)
                        level += 1
                        speed *= 1.5
                        t1.clear()
                        t1.write(f'Level {level} - {lives} lives')
                        game_objects[4]['x'] = random.randint(-100, 100)  # Random x position for benefit
                        print('GOT BENEFIT OBJECT')
                else:  # Harm object check ********************************************
                    if t0.xcor() > obj['x']:
                        Distance = t0.xcor() - obj['x']
                    else:
                        Distance = obj['x'] - t0.xcor()
                    if Distance < 40:  # HIT HARM OBJECT (radius of objects * 2 then minus 10)
                        # I chose to subtract 10 as to not make the game be super strict with collision.
                        t0.setpos(0, -125)
                        lives -= 1
                        t1.clear()
                        t1.write(f'Level {level} - {lives} lives')
                        print('HIT HARM OBJECT')

        # Clear harm objects ---------------------------------------------------------*
        for obj in game_objects:
            if obj['type'] != 'player' or obj['type'] != 'benefit':
                obj['t'].clear()

        # Render ---------------------------------------------------------------------*
        for obj in game_objects:
            obj['t'].goto(obj['x'], obj['y'])

        # Player image object goes to where turtle 0 is (the turtle w/ onkey functions)
        game_objects[5]['t'].setpos(pos)

        # Movement functions ---------------------------------------------------------*
        wn.onkey(upkey, 'Up')
        wn.onkey(downkey, 'Down')
        wn.onkey(leftkey, 'Left')
        wn.onkey(rightkey, 'Right')

        # Turtle event listener and update animation ---------------------------------*
        wn.update()
        wn.listen()

    # Clearing screen after leaving animation loop -----------------------------------*
    for obj in game_objects:
        obj['t'].goto(10000, 10000)

    # End screen ---------------------------------------------------------------------*
    t1.clear()
    t1.home()
    t1.write(f'You made it to level {level}!', align='center')
    t1.goto(0, -20)
    if level == 2:
        t1.write(f'This means you got 1 benefit object!', align='center')
    else:
        t1.write(f'This means you got {level - 1} benefit objects!', align='center')
    t1.goto(0, 20)
    t1.write('Game over!', align='center')
    t1.goto(0, -140)
    t1.write('Click on the window to exit', align='center')
    wn.bgpic('black.gif')
    wn.update()
    wn.exitonclick()


main()
