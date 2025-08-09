# 🏗️ RISC-V Toolchain Setup & Uniqueness Test — Karthik B S

---

## 🎯 Objective

To set up a RISC-V development environment on Ubuntu, compile the Spike simulator and Proxy Kernel, and execute a unique C test program based on your system identity.

---

## 🛠️ Environment & Tools

- **OS**: Ubuntu 22.04 (VirtualBox)
- **Toolchain**: Prebuilt `riscv64-unknown-elf-gcc`
- **Simulator**: Spike
- **Runtime**: Proxy Kernel (pk)
- **Extras**: Icarus Verilog, GTKWave (optional)

---

## 🔧 Task Summary

### ✅ Task 1 – Install Base Tools

```bash
sudo apt-get update
sudo apt-get install -y git vim autoconf automake autotools-dev curl \
libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex \
texinfo gperf libtool patchutils bc zlib1g-dev libexpat1-dev gtkwave
```

### ✅ Task 2 – Create Workspace

```bash
cd
pwd=$PWD
mkdir -p riscv_toolchain
cd riscv_toolchain
```

### ✅ Task 3 – Download Prebuilt Toolchain

```bash
wget "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz"
tar -xvzf riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz
```

### ✅ Task 4 – Add Toolchain to PATH

```bash
echo 'export PATH=$HOME/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### ✅ Task 5 – Install DTC

```bash
sudo apt-get install -y device-tree-compiler
```

### ✅ Task 6 – Build and Install Spike

```bash
cd $pwd/riscv_toolchain
git clone https://github.com/riscv/riscv-isa-sim.git
cd riscv-isa-sim
mkdir -p build && cd build
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14
make -j$(nproc)
sudo make install
```

### ✅ Task 7 – Build and Install Proxy Kernel

```bash
cd $pwd/riscv_toolchain
git clone https://github.com/riscv/riscv-pk.git
cd riscv-pk
git checkout v1.0.0
mkdir -p build && cd build
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14 --host=riscv64-unknown-elf
make -j$(nproc)
sudo make install
```

### ✅ Task 8 – Add Nested Bin to PATH

```bash
echo 'export PATH=$HOME/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### ✅ Task 9 – Optional: Install Icarus Verilog

```bash
cd $pwd/riscv_toolchain
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
git checkout --track -b v10-branch origin/v10-branch
chmod +x autoconf.sh
./autoconf.sh
./configure
make -j$(nproc)
sudo make install
```

### ✅ Task 10 – Sanity Checks

```bash
which riscv64-unknown-elf-gcc
which spike
which pk
```

---

## 🧪 Final Deliverable: Unique Test Program

### 📝 Source: `unique_test.c`

```c
#include <stdint.h>
#include <stdio.h>

#ifndef USERNAME
#define USERNAME "unknown_user"
#endif
#ifndef HOSTNAME
#define HOSTNAME "unknown_host"
#endif

// 64-bit FNV-1a hash
static uint64_t fnv1a64(const char *s) {
    const uint64_t FNV_OFFSET = 1469598103934665603ULL;
    const uint64_t FNV_PRIME  = 1099511628211ULL;
    uint64_t h = FNV_OFFSET;
    for (const unsigned char *p = (const unsigned char*)s; *p; ++p) {
        h ^= (uint64_t)(*p);
        h *= FNV_PRIME;
    }
    return h;
}

int main(void) {
    const char *user = USERNAME;
    const char *host = HOSTNAME;

    char buf[256];
    int n = snprintf(buf, sizeof(buf), "%s@%s", user, host);
    if (n <= 0) return 1;

    uint64_t uid = fnv1a64(buf);

    printf("RISC-V Uniqueness Check\n");
    printf("User: %s\n", user);
    printf("Host: %s\n", host);
    printf("UniqueID: 0x%016llx\n", (unsigned long long)uid);

#ifdef __VERSION__
    unsigned long long vlen = (unsigned long long)sizeof(__VERSION__) - 1;
    printf("GCC_VLEN: %llu\n", vlen);
#endif

    return 0;
}
```


### ⚙️ Compile Command Used

```bash
riscv64-unknown-elf-gcc -O2 -Wall -march=rv64imac -mabi=lp64 \
-DUSERNAME='"'"$(id -un)"'"' -DHOSTNAME='"'"$(hostname -s)"'"' \
unique_test.c -o unique_test
```

### ▶️ Run with Spike

```bash
spike pk ./unique_test
```

### 🖥️ Output

```
bbl loader
RISC-V Uniqueness Check
User: karthikbs
Host: UBUNTU
UniqueID: 0x68ccd154460305cb
GCC_VLEN: 5
```

---

## 📁 Files Included

- `unique_test.c` — Final source file
- `compile_command.txt` — Exact build command
- `spike_output.txt` — Output from `spike pk ./unique_test`
- `screenshots/`

---

---

## 📸 Implementation Output

<img width="848" height="750" alt="FINAL OUTPUT" src="https://github.com/user-attachments/assets/7aaf8cab-fc02-4f88-a0dd-17bcaa8043d1" />

<img width="946" height="776" alt="Screenshot 2025-08-02 234957" src="https://github.com/user-attachments/assets/5d0c91d7-810d-4622-8b7f-036b78c1e8d4" />

<img width="920" height="729" alt="Screenshot 2025-08-02 235024" src="https://github.com/user-attachments/assets/c211862d-6bb6-4ddd-a038-8639771c4a1c" />


# Task 2: Local RISC-V Verification

## Programs Implemented
1. **factorial.c** – Recursive factorial calculation
2. **max_array.c** – Array maximum value finder
3. **bitops.c** – Bitwise operations demonstration
4. **bubble_sort.c** – Bubble sort implementation

---

## Assembly Generation Examples

<img width="881" height="474" alt="factorial_main_objdump txt" src="https://github.com/user-attachments/assets/a8ab8df6-6287-451b-b7f6-1bec2c477dad" />

*Disassembled main function from factorial.c showing RISC-V instructions*

<img width="776" height="865" alt="max_array_main_objdump txt" src="https://github.com/user-attachments/assets/a03c074c-f6e5-46b4-88eb-7b40fa560dc7" />

*Disassembled main function from max_array.c*

<img width="855" height="865" alt="bitops_main_objdump txt" src="https://github.com/user-attachments/assets/e585e8c4-c65c-4b79-ab0f-09e02257f71b" />

*Disassembled main function from bitops.c*

<img width="812" height="856" alt="bubble_sort_main_objdump txt" src="https://github.com/user-attachments/assets/9972f4cb-499e-4ed7-aaa0-e6d5cc0db643" />

*Disassembled main function from bubble_sort.c*

---

## Program Outputs

<img width="620" height="251" alt="factorial output" src="https://github.com/user-attachments/assets/bd5b5bca-b05b-4d8e-87f2-999c3c54417d" />

*Factorial program output*

<img width="659" height="231" alt="maxarray output" src="https://github.com/user-attachments/assets/1657204c-e88b-4e86-83db-98fc2083050c" />

*Max array program output*

<img width="854" height="323" alt="bitops output" src="https://github.com/user-attachments/assets/eef92082-09a1-4484-885e-bba3925e07ab" />

*Bitwise operations program output*

<img width="681" height="250" alt="bubblesort output" src="https://github.com/user-attachments/assets/19de36e0-44b1-4ee1-971b-5cac40aaaf58" />

*Bubble sort program output*

---

## Instruction Decoding

### RISC-V Instruction Decoding Table

<img width="1053" height="276" alt="factorial_decoding md" src="https://github.com/user-attachments/assets/fbe660bc-f9a8-4e14-9960-0b47d707d3c8" />


---

## Toolchain Information

```bash
$ spike --version
Spike RISC-V ISA Simulator 1.1.0-dev

$ riscv64-unknown-elf-gcc -v
gcc version 8.3.0 (riscv64-unknown-elf)



## 👨‍💻 Author

**Karthik B S**  
ECE Student, MITS  
📧 kkbs24224@gmail.com

