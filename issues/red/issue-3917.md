
#3917: Integer Division is wrong on RPi Target with cpu-version 5
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3917>

**To reproduce**
Compile and run the following code on ARM Linux with cpu-version 5:
```
Red/System []

y: -753
n: (y / 4) - (y / 100) + (y / 400)

print n
```
This will print 195.

**Expected behavior**
print -182

**Platform version (please complete the following information)**
```
Linux on ARM.
$ cat /proc/cpuinfo
processor       : 0
model name      : ARMv6-compatible processor rev 7 (v6l)
BogoMIPS        : 826.98
Features        : half thumb fastmult vfp edsp java tls
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xb76
CPU revision    : 7

Hardware        : ARM-Versatile (Device Tree Support)
Revision        : 0000
Serial          : 0000000000000000
```



