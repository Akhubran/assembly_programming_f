# Stack flow: 05

Source: [05.asm](../../05.asm)

This 64-bit Linux program pushes two different-sized values using 8-byte stack slots. Let `S` be `RSP` at `_start`.

1. `mov` initializes `RAX` to `0x1122334455667788` and `RBX` to `0x1234`; neither instruction touches the stack.
2. `push rax` subtracts 8 from `RSP` and stores the 64-bit value at `[S - 8]`.
3. `push rbx` subtracts another 8 and stores `0x1234` at `[S - 16]`. This is now the top item.
4. `pop rbx` restores `0x1234` from the top and adds 8 to `RSP`, returning it to `S - 8`.
5. `pop rax` restores `0x1122334455667788` and adds 8 again, returning `RSP` to `S`.
6. The stack is balanced. The exit setup replaces `RAX` with the syscall number and terminates the process.

The values are popped into their original registers because the pops reverse the pushes. The `nop` does not affect the stack, and the program prints nothing.

## Run observation

Built as ELF64 with NASM and `ld`, the program produced no terminal output and exited with status 0.

```sh
nasm -f elf64 07_stack/05.asm -o /tmp/05.o
ld /tmp/05.o -o /tmp/05
/tmp/05
```