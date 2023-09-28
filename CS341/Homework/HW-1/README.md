## Program.

The program prompts the user for input, enter the file name you would like to
read from.   
The program then prints to output the file contents 1-to-1.

## Building.   

Make sure you have main.cpp and the makefile within the same directory and use   
the command `make` or `make build` to compile main.cpp with `g++`.

Alternatively run the compile command if make doesn't work:
* `g++ -g -std=c++20 -Wall main.cpp -o Homework1.exe`

## Execution.

Once compiled, you can use the program by running the executable alone like so:   
* `./Homework1.exe` 
* `make run`
* `make build run`   
* `make build run < filename.ext`

You may also supply a input file that contains the file name to read from:
* `./Homework1.exe < filename.ext`
* `make run < filename.ext`

Within a input file it should look something like this:
* `Line 1: filename.ext`

## Cleaning.

You can remove a past executable of the same name by running this command:
* `make clean`

Alternatively if make doesn't work:
* `rm -f Homework1.exe` on UNIX based systems
* `del Homework1.exe` &nbsp;&nbsp;&nbsp;on Windows CMD
