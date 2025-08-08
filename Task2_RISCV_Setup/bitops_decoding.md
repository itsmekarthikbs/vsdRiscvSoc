| Instruction (objdump) | Opcode (bin) | rd | rs1 | rs2 | funct3 | funct7 | Binary (31..0) | Description |
|---|---:|---:|---:|---:|---:|---:|---|---|
| `addi	sp,sp,-32` | `0000001` | x2 (sp) | x0 (zero) | x0 (zero) | `001` | `0000000` | `00000000000000000001000100000001` | addi: x2 (sp) = x0 (zero) + imm |
| `sd	ra,24(sp)` | `0000110` | x24 (s8) | x1 (ra) | x0 (zero) | `110` | `0000000` | `00000000000000001110110000000110` | sd: store x0 (zero) into memory[x1 (ra)+imm] |
| `sd	s0,16(sp)` | `0100010` | x16 (a6) | x1 (ra) | x0 (zero) | `110` | `0000000` | `00000000000000001110100000100010` | sd: store x0 (zero) into memory[x1 (ra)+imm] |
| `addi	s0,sp,32` | `0000000` | x0 (zero) | x0 (zero) | x0 (zero) | `001` | `0000000` | `00000000000000000001000000000000` | addi: x0 (zero) = x0 (zero) + imm |
| `li	a5,10` | `0101001` | x15 (a5) | x0 (zero) | x0 (zero) | `100` | `0000000` | `00000000000000000100011110101001` | li	a5,10 |
