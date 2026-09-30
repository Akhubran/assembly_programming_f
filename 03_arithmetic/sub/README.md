# Subtraction

The programs were assembled and run as 32-bit Linux executables. Both exited with status `0`.

## `sub1.asm`

- Operation: `50 - 80 = -30` (`0xE2` in `AL`).
- `CF=1`: subtracting the larger unsigned operand required a borrow.
- `OF=0`: the signed result, `-30`, fits in the signed 8-bit range.
- `SF=1`: the result's most-significant bit is set.
- `ZF=0`: the result is not zero.
- `AF=0`: the low nibble subtraction (`0x2 - 0x0`) required no borrow from bit 4.
- `PF=1`: `0xE2` contains four set bits, so its low byte has even parity.

## `sub2.asm`

- Operation: `1000 - 2000 = -1000` (`0xFC18` in `AX`).
- `CF=1`: subtracting the larger unsigned operand required a borrow.
- `OF=0`: the signed result, `-1000`, fits in the signed 16-bit range.
- `SF=1`: bit 15 of `0xFC18` is set.
- `ZF=0`: the result is not zero.
- `AF=0`: the low nibble subtraction (`0x8 - 0x0`) required no borrow from bit 4.
- `PF=1`: the low byte `0x18` has two set bits, so it has even parity.