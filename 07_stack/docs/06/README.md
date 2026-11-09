# Stack flow: 06

Source: [06.asm](../../06.asm)

This is the 32-bit counterpart to example 05. It uses `ESP` and 4-byte stack slots. Let `S` be `ESP` at `_start`.

1. `mov` initializes `EAX` to `0x11223344` and `EBX` to `0x1234`. The stack pointer is unchanged.
2. `push eax` subtracts 4 from `ESP` and stores `0x11223344` at `[S - 4]`.
3. `push ebx` subtracts another 4 and stores `0x1234` at `[S - 8]`, making that the top item.
4. `pop ebx` restores `0x1234` and increments `ESP` by 4, to `S - 4`.
5. `pop eax` restores `0x11223344` and increments `ESP` by 4, back to `S`.
6. After the stack is balanced, the code sets the i386 exit syscall number and status, then terminates with `int 0x80`.

The values return to their original registers in last-in, first-out order. Nothing is printed; the values are only visible during execution in registers.

## Run observation

Built as ELF32 with NASM and `ld -m elf_i386`, the program produced no terminal output and exited with status 0.

```sh
nasm -f elf32 07_stack/06.asm -o /tmp/06.o
ld -m elf_i386 /tmp/06.o -o /tmp/06
/tmp/06
```