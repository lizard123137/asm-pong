PROJECT := pong_asm

SRC := src
OBJ := obj

SRCS = $(wildcard $(SRC)/*.asm)
OBJS = $(wildcard $(OBJ)/*.o)

$(PROJECT): $(OBJS)
	ld $^ -o $@

$(OBJS): $(OBJ)/%.o: $(SRC)/%.asm
	nasm -f elf64 -o $@ $<
	
clean:
	rm $(PROJECT)