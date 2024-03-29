# Build Command  ::
BUILD   = g++ -std=c++23 -O2 -Wall
EXE     = P2B.exe

# Source Files   ::
SRC-01  = P2B.cpp
SRC     = $(SRC-01)

# Header Files   ::
INC-01  = name.hpp
INC     = $(INC-01)

# Platform Check ::
ifeq ($(OS), Windows_NT)
	RM = del /f
	CLS = cls
else
	RM = rm -f
	CLS = clear
endif

# Build Target   ::
b: c
	@$(BUILD) $(SRC) -o $(EXE)

# Clean Target   ::
c:
	@$(RM) $(EXE)

# Run Target     ::
r:
	@$(CLS)
	@./$(EXE)