# Division

The programs were assembled and run as 32-bit Linux executables. Both exited with status `0`.

`DIV` does not define any arithmetic status flags. Therefore `CF`, `OF`, `SF`, `ZF`, `AF`, and `PF` are all **undefined** after each division. Any bit pattern observed in `EFLAGS` is leftover state and is not a meaningful indication of the division result.

## `div1.asm`

- Operation: `100 / 7` gives quotient `14` in `AL` and remainder `2` in `AH`.
- Flags: `CF`, `OF`, `SF`, `ZF`, `AF`, and `PF` are undefined because x86 `DIV` leaves them undefined.

## `div2.asm`

- Operation: `50000 / 300` gives quotient `166` in `AX` and remainder `200` in `DX`.
- Flags: `CF`, `OF`, `SF`, `ZF`, `AF`, and `PF` are undefined because x86 `DIV` leaves them undefined.