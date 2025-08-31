
#995: Shared library can't work on ARM-hf
================================================================================
Issue is closed, was reported by qtxie and has 10 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/995>

As the title, the libtest-dll1.so can't work on ARM-hf system.

```
>> do/args %red.r "-dlib -t RPi %system\tests\source\units\libtest-dll1.reds"
```

```
user@debian-armhf:~$ ldd libtest-dll1.so
        not a dynamic executable
user@debian-armhf:~$
```



Comments:
--------------------------------------------------------------------------------

On 2014-11-26T12:56:43Z, dockimbel, commented:
<https://github.com/red/red/issues/995#issuecomment-64600281>

    @qtxie @earl Have you checked if it's not a matter of setting the right flag(s) in the ELF header to support it?

--------------------------------------------------------------------------------

On 2014-11-27T00:29:37Z, qtxie, commented:
<https://github.com/red/red/issues/995#issuecomment-64730185>

    I have modified the ELF header, but still can't work.
    
    ```
    user@debian-armhf:~$ readelf -h /lib/arm-linux-gnueabihf/libm.so.6
    ELF Header:
      Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
      Class:                             ELF32
      Data:                              2's complement, little endian
      Version:                           1 (current)
      OS/ABI:                            UNIX - System V
      ABI Version:                       0
      Type:                              DYN (Shared object file)
      Machine:                           ARM
      Version:                           0x1
      Entry point address:               0x31d8
      Start of program headers:          52 (bytes into file)
      Start of section headers:          401896 (bytes into file)
      Flags:                             0x5000002, has entry point, Version5 EABI
      Size of this header:               52 (bytes)
      Size of program headers:           32 (bytes)
      Number of program headers:         8
      Size of section headers:           40 (bytes)
      Number of section headers:         29
      Section header string table index: 28
    ```
    
    ```
    user@debian-armhf:~$ readelf -h ./libtest-dll1.so
    ELF Header:
      Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
      Class:                             ELF32
      Data:                              2's complement, little endian
      Version:                           1 (current)
      OS/ABI:                            UNIX - System V
      ABI Version:                       0
      Type:                              DYN (Shared object file)
      Machine:                           ARM
      Version:                           0x1
      Entry point address:               0x1cc
      Start of program headers:          52 (bytes into file)
      Start of section headers:          7636 (bytes into file)
      Flags:                             0x5000002, has entry point, Version5 EABI
      Size of this header:               52 (bytes)
      Size of program headers:           32 (bytes)
      Number of program headers:         4
      Size of section headers:           40 (bytes)
      Number of section headers:         10
      Section header string table index: 9
    ```

--------------------------------------------------------------------------------

On 2015-01-30T11:54:44Z, dockimbel, commented:
<https://github.com/red/red/issues/995#issuecomment-72190529>

    Looks like the lack of a proper ELF attributes section is the cause:
    
    ```
    pi@raspberrypi:~$ readelf -A libtest-dll1.so 
    pi@raspberrypi:~$ readelf -A /bin/ls
    Attribute Section: aeabi
    File Attributes
      Tag_CPU_name: "6"
      Tag_CPU_arch: v6
      Tag_ARM_ISA_use: Yes
      Tag_THUMB_ISA_use: Thumb-1
      Tag_FP_arch: VFPv2
      Tag_ABI_PCS_wchar_t: 4
      Tag_ABI_FP_denormal: Needed
      Tag_ABI_FP_exceptions: Needed
      Tag_ABI_FP_number_model: IEEE 754
      Tag_ABI_align_needed: 8-byte
      Tag_ABI_align_preserved: 8-byte, except leaf SP
      Tag_ABI_enum_size: int
      Tag_ABI_HardFP_use: SP and DP
      Tag_ABI_VFP_args: VFP registers
      Tag_DIV_use: Not allowed
    ```
    
    @earl What do you think? 
    Qtxie will give it a try this weekend.
    
    EDIT: according to the comments [here](http://unix.stackexchange.com/questions/180099/chromium-compiled-for-arm-libattr-so-1-not-found), it's only `Tag_ABI_VFP_args` that specifies if it's processed as armel or armhf.

--------------------------------------------------------------------------------

On 2015-01-31T07:06:31Z, qtxie, commented:
<https://github.com/red/red/issues/995#issuecomment-72307768>

    @dockimbel @earl You're right. The shared library works when added the ARM attributes section.

--------------------------------------------------------------------------------

On 2015-01-31T16:04:23Z, earl, commented:
<https://github.com/red/red/issues/995#issuecomment-72323497>

    :+1: Looks perfect!

