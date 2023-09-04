riscv64-unknown-elf-gcc.exe -E -o ./main.i ./main.c

riscv64-unknown-elf-gcc.exe -S -o ./main.S ./main.c

riscv64-unknown-elf-gcc.exe -c -o ./main.o ./main.c


riscv64-unknown-elf-objdump.exe -h ./main.o


riscv64-unknown-elf-gcc.exe -nostdlib -T scratchpad.ld -o ./main.elf ./main.o