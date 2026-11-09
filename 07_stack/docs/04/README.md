# Stack flow: 04

Source: [04.asm](../../04.asm)

This is a 32-bit Linux program, so its stack operations use `ESP` and 4-byte values. Let `S` be `ESP` at `_start`.

1. `call work` pushes the 4-byte return address, changing `ESP` to `S - 4`, then enters `work`.
2. `push ebp` saves the old frame pointer at the top of the stack and changes `ESP` to `S - 8`. `mov ebp, esp` sets the frame base to `S - 8`.
3. `sub esp, 8` reserves 8 bytes, so `ESP` becomes `S - 16`. The dword at `[ebp - 4]` is set to 100; `[ebp - 8]` is set to 200.
4. The loads copy those values into `EAX` and `EBX`. These memory/register operations do not change `ESP`.
5. `mov esp, ebp` discards both local dwords by restoring `ESP` to `S - 8`. `pop ebp` restores the saved frame pointer and moves `ESP` to `S - 4`.
6. `ret` removes the return address and returns to `_start`, restoring `ESP` to `S`. The exit syscall then ends the process.

## Run observation

The source was assembled as ELF32 and linked with `ld -m elf_i386`; it produced no terminal output and exited with status 0. The pre-existing `07_stack/04` executable was ELF64 despite this source's `BITS 32` and i386 syscall. That mismatched build segfaulted (status 139); building in the source's intended 32-bit mode ran successfully.

```sh
nasm -f elf32 07_stack/04.asm -o /tmp/04.o
ld -m elf_i386 /tmp/04.o -o /tmp/04
/tmp/04
```