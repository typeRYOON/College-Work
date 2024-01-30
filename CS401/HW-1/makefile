NAME1 = CS401-HW-1-P4
NAME2 = CS401-HW-1-P5

ifeq ($(OS),Windows_NT)
	RM = del /f
	CLS = cls
else
	RM = rm -f
	CLS = clear
endif

b: c
	@g++ -std=c++23 -O2 -Wall $(NAME1).cpp -o $(NAME1).exe
	@g++ -std=c++23 -O2 -Wall $(NAME2).cpp -o $(NAME2).exe

c:
	@$(RM) $(NAME1).exe;
	@$(RM) $(NAME2).exe;

r1:
	@$(CLS)
	@./$(NAME1).exe

r2:
	@$(CLS)
	@./$(NAME2).exe