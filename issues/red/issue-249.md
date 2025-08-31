
#249: Red on Syllable Desktop: Runtime Error 32
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/249>

[kaj@syllable:~/Red]./hello

**\* Runtime Error 32: segmentation fault
**\* at: 800053E6h



Comments:
--------------------------------------------------------------------------------

On 2012-09-16T09:14:14Z, dockimbel, commented:
<https://github.com/red/red/issues/249#issuecomment-8593330>

    If I print the return value of mmap call, it returns -38, I guess if I retain only the absolute value of the code, it means:
    
    ```
    #define ENOSYS      38  /* Function not implemented */
    ```

--------------------------------------------------------------------------------

On 2012-09-16T19:04:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/249#issuecomment-8597765>

    Ah, are you running 0.6.6 by any chance? I released Syllable 0.6.7 this year because we implemented mmap in there, to prepare for Red (that's also the one that includes R3).

--------------------------------------------------------------------------------

On 2012-09-16T19:25:39Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/249#issuecomment-8597985>

    I fixed it. Red now runs on Syllable Desktop! Here's the patch:
    
    ```
    --- /users/administrator/build/Red--current/red/runtime/platform/syllable.reds  2012-09-16 02:39:37.000000000 +0200
    +++ syllable.reds   2012-09-16 21:11:23.000000000 +0200
    @@ -57,10 +57,14 @@
        /local ptr flags
     ][
        assert zero? (size and 0Fh)             ;-- size is a multiple of 16
    -   flags: either exec? [MMAP_PROT_RWX][MMAP_PROT_RW]
    -   flags: flags or (MMAP_MAP_PRIVATE or MMAP_MAP_ANONYMOUS << 4)
    -   
    -   ptr: OS-mmap null size flags -1 0
    +   prot: either exec? [MMAP_PROT_RWX][MMAP_PROT_RW]
    +
    +   ptr: OS-mmap
    +       null
    +       size
    +       prot or MMAP_MAP_PRIVATE or MMAP_MAP_ANONYMOUS
    +       -1                                  ;-- portable value
    +       0
    
        if -1 = as-integer ptr [
            raise-error RED_ERR_VMEM_OUT_OF_MEMORY as-integer system/pc
    ```

--------------------------------------------------------------------------------

On 2012-09-16T19:31:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/249#issuecomment-8598049>

    Oh, I saw you already did that. :-)

--------------------------------------------------------------------------------

On 2012-09-16T20:00:16Z, dockimbel, commented:
<https://github.com/red/red/issues/249#issuecomment-8598361>

    Yes, it's 0.6.6. Do you know if 0.6.7 can run on VMware?
    
    Ok, so it's running fine on 0.6.7, can we close this ticket then?

--------------------------------------------------------------------------------

On 2012-09-16T20:12:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/249#issuecomment-8598476>

    Yes.
    
    There's no reason 0.6.7 would behave different on VMware than 0.6.6. Different VMware versions can have different gotchas, but in general, it's the emulator that Syllable supports best. We haven't made ready emulator images for 0.6.7 yet, but it's not hard to install Syllable in VMware.

