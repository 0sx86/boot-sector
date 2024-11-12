CC = nasm
FILES := bootsector.bin

bootsector.bin: bootsector.asm
	$(CC) $^ -f bin -o $@ 

clean:
	rm -f $(FILES)
