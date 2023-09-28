ifeq ($(OS),Windows_NT)
	RM = del
else
	RM = rm -f
endif

build:
	@g++ -g -std=c++20 -Wall main.cpp -o Homework1.exe

clean:
	@$(RM) Homework1.exe

run:
	@./Homework1.exe