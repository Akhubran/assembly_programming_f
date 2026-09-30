# Addition

The programs were assembled and run as 32-bit Linux executables. Both exited with status `0`.

## `add1.asm`

- Operation: `120 + 10 = 130` (`0x82` in `AL`).
- `CF=0`: the unsigned result fits in 8 bits; there was no carry out of bit 7.
- `OF=1`: two positive signed 8-bit operands produced a negative signed result (`130` is `-126` as `0x82`).
- `SF=1`: the result's most-significant bit is set.
- `ZF=0`: the result is not zero.
- `AF=1`: adding the low nibbles (`0x8 + 0xA`) produced a carry from bit 3 to bit 4.
- `PF=1`: `0x82` contains two set bits, so its low byte has even parity.

## `add2.asm`

- Operation: `32000 + 500 = 32500` (`0x7EF4` in `AX`).
- `CF=0`: the unsigned result fits in 16 bits.
- `OF=0`: the signed result fits in the 16-bit signed range (`-32768` to `32767`).
- `SF=0`: bit 15 of `0x7EF4` is clear.
- `ZF=0`: the result is not zero.
- `AF=0`: the low nibbles (`0x0 + 0x4`) produce no auxiliary carry.
- `PF=0`: the low byte `0xF4` has odd parity.