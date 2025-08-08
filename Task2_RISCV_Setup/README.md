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

<img width="955" alt="Spike Output" src="https://raw.githubusercontent.com/itsmekarthikbs/vsdRiscvSoc/refs/heads/main/FINAL%20OUTPUT.png" />

<img width="1272" alt="GCC Version" src="https://raw.githubusercontent.com/itsmekarthikbs/vsdRiscvSoc/refs/heads/main/Screenshot%202025-08-02%20234957.png" />

<img width="1210" alt="Sanity Check" src="https://raw.githubusercontent.com/itsmekarthikbs/vsdRiscvSoc/refs/heads/main/Screenshot%202025-08-02%20235024.png" />




## 👨‍💻 Author

**Karthik B S**  
ECE Student, MITS  
📧 kkbs24224@gmail.com

