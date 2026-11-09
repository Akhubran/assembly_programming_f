# Stack flow: 02

Source: [02.asm](../../02.asm)

This is a 64-bit Linux program that uses a stack frame for two local values. Let `S` be `RSP` at `_start`.

1. `call work` pushes the address of the instruction after the call (the return address) onto the stack. `RSP` becomes `S - 8`, then execution jumps to `work`.
2. `push rbp` saves the caller's frame pointer, moving `RSP` to `S - 16`. `mov rbp, rsp` establishes the new frame base at `S - 16`.
3. `sub rsp, 16` reserves 16 bytes for locals, so `RSP` is `S - 32`. The qword at `[rbp - 8]` is set to 100 and the qword at `[rbp - 16]` to 200.
4. The loads copy those locals into `RAX` and `RBX`. They do not change either stack pointer.
5. `mov rsp, rbp` releases the 16 local bytes by restoring `RSP` to `S - 16`. `pop rbp` restores the saved frame pointer and moves `RSP` to `S - 8`.
6. `ret` pops the saved return address into the instruction pointer and restores `RSP` to `S`, resuming after `call work`.
7. `_start` then invokes the exit syscall. No stack data is printed.

The function's local storage is discarded in one step by resetting `RSP` to `RBP`; the saved frame pointer and return address are then removed in order.

## Run observation

Built as ELF64 with NASM and `ld`, the program produced no terminal output and exited with status 0.

```sh
nasm -f elf64 07_stack/02.asm -o /tmp/02.o
ld /tmp/02.o -o /tmp/02
/tmp/02
```