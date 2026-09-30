# Multiplication

The programs were assembled and run as 32-bit Linux executables. Both exited with status `0`.

For `MUL`, only `CF` and `OF` have defined results. `SF`, `ZF`, `AF`, and `PF` are undefined after the instruction and must not be interpreted as reliably set or cleared.

## `mul1.asm`

- Operation: `25 * 10 = 250` (`DX:AX = 0x0000:0x00FA`).
- `CF=0` and `OF=0`: the upper half of the product is zero, so the product fits in the lower half (`AX`).
- `SF`, `ZF`, `AF`, and `PF`: undefined because `MUL` does not define them.

## `mul2.asm`

- Operation: `3000 * 200 = 600000` (`DX:AX = 0x0009:0x27C0`).
- `CF=1` and `OF=1`: the upper half of the product is nonzero (`DX=0x0009`), so the product does not fit in `AX` alone.
- `SF`, `ZF`, `AF`, and `PF`: undefined because `MUL` does not define them.