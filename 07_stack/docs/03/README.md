# Stack flow: 03

Source: [03.asm](../../03.asm)

This 64-bit example demonstrates the return address that `call` and `ret` manage implicitly. Let `S` be `RSP` at `_start`.

1. `mov rax, 10` initializes the input value. It does not use the stack.
2. `call calculate` pushes the address labelled `after_call` onto the stack, decreasing `RSP` from `S` to `S - 8`, and transfers control to `calculate`.
3. `add rax, 5` changes the register value from 10 to 15. It does not change `RSP`; there are no explicit pushes or local variables in this function.
4. `ret` pops the return address into the instruction pointer, increasing `RSP` back to `S`. Execution resumes at `after_call`, with 15 still in `RAX`.
5. The `nop` leaves the result unchanged. The following instructions replace `RAX` with the exit syscall number and terminate with status 0.

The result 15 is only present in `RAX` after the call; this program does not print it, and the exit setup overwrites it.

## Run observation

Built as ELF64 with NASM and `ld`, the program produced no terminal output and exited with status 0.

```sh
nasm -f elf64 07_stack/03.asm -o /tmp/03.o
ld /tmp/03.o -o /tmp/03
/tmp/03
```