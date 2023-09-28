build:
	rm -f program.exe 
	g++ -g -std=c++20 -Wall main.cpp -o program.exe
	
run:
	./program.exe

valgrind:
	valgrind --tool=memcheck --leak-check=yes ./program.exe
