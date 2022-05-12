out/asmfuck: out/main.o
	ld out/main.o -o out/asmfuck

out/main.o: src/main.asm
	nasm src/main.asm -o out/main.o -f elf64 -g
