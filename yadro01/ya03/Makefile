all: build run

build:
	nasm kernel.s
	nasm real_kernel.s
	cat kernel real_kernel > disk.bin
run:
	qemu-system-i386 disk.bin
