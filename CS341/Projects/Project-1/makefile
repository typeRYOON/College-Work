ifeq ($(OS),Windows_NT)
	RM = del /f
	CLS = cls
else
	RM = rm -f
	CLS = clear
endif

build: clean
	@g++ -g -std=c++20 -Wall main.cpp -o chessboard.exe

clean:
	@$(RM) chessboard.exe;

run:
	@$(CLS)
	@./chessboard.exe