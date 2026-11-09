# Stack flow: 01

Source: [01.asm](../../01.asm)

This is a 64-bit Linux program. Let `S` be the value of `RSP` when `_start` begins. The kernel supplies the initial stack; the register setup itself does not change it.

1. `mov rax, 100` and `mov rbx, 200` put the values in registers. No stack operation has happened yet.
2. `push rax` subtracts 8 from `RSP` and stores 100 at `[S - 8]`.
3. `push rbx` subtracts another 8 and stores 200 at `[S - 16]`. The newest value is now at the top of the stack.
4. `pop rcx` loads 200 into `RCX` and adds 8 to `RSP`, returning it to `S - 8`.
5. `pop rdx` loads 100 into `RDX` and adds 8 again, restoring `RSP` to `S`.
6. The `nop` instructions do not affect the stack. The exit syscall ends the process; there is no `ret` because `_start` was not called as a function.

The two pops reverse the push order (last in, first out). The stack is balanced before exit, and the values are moved into registers rather than printed.

## Run observation

Built as ELF64 with NASM and `ld`, the program produced no terminal output and exited with status 0.

```sh
nasm -f elf64 07_stack/01.asm -o /tmp/01.o
ld /tmp/01.o -o /tmp/01
/tmp/01
```