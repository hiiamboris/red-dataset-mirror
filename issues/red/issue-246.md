
#246: Red hello out of memory on Syllable Server (Linux)
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 28 comment(s).
[status.built]
<https://github.com/red/red/issues/246>

bash-4.0# hello

**\* Runtime Error 97: out of memory
**\* at: 0804C892h



Comments:
--------------------------------------------------------------------------------

On 2012-09-15T14:26:09Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8585147>

    `red-system/runtime/syllable.reds` is missing some syscall definitions, these are the ones used for `linux.reds`, can you confirm me these are defined for Syllable too with same values?
    
    ```
    #define SYSCALL_MMAP2   192
    #define SYSCALL_MUNMAP  91
    ```
    
    Have you cross-compiled the executable?

--------------------------------------------------------------------------------

On 2012-09-15T14:42:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8585307>

    No, it's not about Syllable, but Linux, but in particular, Syllable Server. mmap on Syllable Desktop is a separate issue, which I'm going to look into (the syscalls are not the same as on Linux). It is however likely that this problem on Linux is with mmap.

--------------------------------------------------------------------------------

On 2012-09-15T16:41:21Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8586320>

    Can you verify that the following definitions are valid for your Linux version? 
    
    ```
        #define MMAP_PROT_RW    03h             ;-- PROT_READ | PROT_WRITE
        #define MMAP_PROT_RWX   07h             ;-- PROT_READ | PROT_WRITE | PROT_EXEC
    
        #define MMAP_MAP_SHARED     01h
        #define MMAP_MAP_PRIVATE    02h
        #define MMAP_MAP_ANONYMOUS  20h
    ```

--------------------------------------------------------------------------------

On 2012-09-15T20:24:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8588487>

    They're valid - they're unlikely to change for Linux.

--------------------------------------------------------------------------------

On 2012-09-15T21:29:38Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8589083>

    On Syllable Desktop:
    MAP_SHARED is 10h
    MAP_PRIVATE is 20h
    MAP_ANONYMOUS is 80h
    
    It turns out that the POSIX functions are implemented as syscalls:
    mmap is 222
    munmap is 223
    
    However, POSIX mmap has one too many arguments for the syscall interface, so the protection and flags parameters are multiplexed into one flags argument. The protection flags are the same as on Linux and are in the lowest four bits. The map flags are in the next nibble, hence why they're shifted up four bits.

--------------------------------------------------------------------------------

On 2012-09-15T21:42:27Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8589179>

    Thanks!

--------------------------------------------------------------------------------

On 2012-09-15T22:20:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8589746>

    By the way, a standards compliant wrapper for mmap is implemented in Syllable's GLibC, but the other POSIX functions are just syscalls, and the only thing the wrapper does is OR the two flags values together.

--------------------------------------------------------------------------------

On 2012-09-15T23:06:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8590466>

    That fix doesn't adapt the mmap syscall.

--------------------------------------------------------------------------------

On 2012-09-15T23:20:27Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8590574>

    Sorry, I thought you were talking about the C mmap() in above message. I've mixed up the information.

--------------------------------------------------------------------------------

On 2012-09-15T23:22:12Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8590590>

    Can you give me the value of `_SC_PAGESIZE` or `_SC_PAGE_SIZE` sysconf argument option on your system?

--------------------------------------------------------------------------------

On 2012-09-15T23:23:41Z, earl, commented:
<https://github.com/red/red/issues/246#issuecomment-8590603>

    ```
    $ getconf PAGESIZE
    4096
    ```

--------------------------------------------------------------------------------

On 2012-09-15T23:27:40Z, dockimbel, commented:
<https://github.com/red/red/issues/246#issuecomment-8590640>

    No, I need the define value of the name to pass as argument to `sysconf()` on Syllable.
    
    ```
    #define _SC_PAGESIZE    ?
    ```
    
    (I got them for Linux and OS X)

--------------------------------------------------------------------------------

On 2012-09-15T23:29:24Z, earl, commented:
<https://github.com/red/red/issues/246#issuecomment-8590650>

    `30`

--------------------------------------------------------------------------------

On 2012-09-16T00:06:54Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/246#issuecomment-8590889>

    _SC_PAGESIZE doesn't seem to be overridden in GLibC for Syllable Desktop, so it must be the same as on Linux.

