
#745: ‘PRINT can't output unicode string on Windows XP
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/745>

Use the latest automated build Red binary.
On WinXP
red>> mold %目录1
== "%1"
red>> mold/all %目录1
== "%1"

While On Win8 it is fine
red>> mold %目录1
== "%目录1"
red>> mold/all %目录1
== "%目录1"



Comments:
--------------------------------------------------------------------------------

On 2014-03-30T10:05:28Z, qtxie, commented:
<https://github.com/red/red/issues/745#issuecomment-39021850>

    This is caused by XP's default msvcr.dll not support outputing unicode. From mingw's fcntl.h
    /\* NOTE: Text is the default even if the given _O_TEXT bit is not on. _/
    #define _O_TEXT 0x4000 /_ CR-LF in file becomes LF in memory. _/
    #define _O_BINARY 0x8000 /_ Input and output is not translated. */
    #define _O_RAW _O_BINARY
    
    #if (**MSVCRT_VERSION** >= 0x0800)
    #define _O_WTEXT 0x10000
    #define _O_U16TEXT 0x20000
    #define _O_U8TEXT 0x40000
    #endif

