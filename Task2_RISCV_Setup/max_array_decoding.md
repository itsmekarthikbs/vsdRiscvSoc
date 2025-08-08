| Instruction (objdump) | Opcode (bin) | rd | rs1 | rs2 | funct3 | funct7 | Binary (31..0) | Description |
|---|---:|---:|---:|---:|---:|---:|---|---|
| `addi	sp,sp,-64` | `0111001` | x2 (sp) | x0 (zero) | x0 (zero) | `111` | `0000000` | `00000000000000000111000100111001` | addi: x2 (sp) = x0 (zero) + imm |
| `sd	ra,56(sp)` | `0000110` | x24 (s8) | x1 (ra) | x0 (zero) | `111` | `0000000` | `00000000000000001111110000000110` | sd: store x0 (zero) into memory[x1 (ra)+imm] |
| `sd	s0,48(sp)` | `0100010` | x16 (a6) | x1 (ra) | x0 (zero) | `111` | `0000000` | `00000000000000001111100000100010` | sd: store x0 (zero) into memory[x1 (ra)+imm] |
| `addi	s0,sp,64` | `0000000` | x1 (ra) | x0 (zero) | x0 (zero) | `000` | `0000000` | `00000000000000000000000010000000` | addi: x1 (ra) = x0 (zero) + imm |
| `lui	a5,0x0` | `0110111` | x15 (a5) | x0 (zero) | x0 (zero) | `000` | `0000000` | `00000000000000000000011110110111` | lui	a5,0x0 |
