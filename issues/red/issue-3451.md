
#3451: Red/System does not load dynamic libraries under ARMhf
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/3451>

### Expected behavior
Dynamic libraries can be loaded and accessed.
### Actual behavior
An error is raised 
"error while loading shared libraries: test.so: cannot open shared object file: No such file or directory"
### Steps to reproduce the problem
Compile and run the following code.

Program:
```Text
Red/System []

#import [
	"./test.so" cdecl [
    	negf: "negf" [
        	f       		[float!]
        	return: 		[float!]
        ]
    ]
]

print [negf -1.0 lf]
```

Library:
```text
Red/System []

negf: func [
	f				[float!]
	return:			[float!]
][
	f: f * -1.0
	f
]

#export [negf]
```

Both struct-test and dylib-test fail with a similar error in the Red/System tests. They previously ran. This indicates that the problem is not .so generation as struct-test calls a lib compiled from C.

I was not able to glean anything from GDB.

`readelf` raised an error about the .so file format but was able to identify the exported function:

```text
$ readelf -Ws test.so
readelf: Error: the PHDR segment must occur before any LOAD segment

Symbol table '.dynsym' contains 10 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 00000000     0 FUNC    GLOBAL DEFAULT  UND strlen
     2: 00000000     0 FUNC    GLOBAL DEFAULT  UND exit
     3: 00000000     0 FUNC    GLOBAL DEFAULT  UND fflush
     4: 00000000     0 FUNC    GLOBAL DEFAULT  UND putchar
     5: 00000000     0 FUNC    GLOBAL DEFAULT  UND printf
     6: 00000000     0 FUNC    GLOBAL DEFAULT  UND sprintf
     7: 00000000     0 FUNC    GLOBAL DEFAULT  UND sigaction
     8: 00000000     0 FUNC    GLOBAL DEFAULT  UND floor
     9: 00003af4   132 FUNC    GLOBAL DEFAULT    6 negf
```

### Red and platform version
commit 330af8539bd0aec5b326876fa42a951bfb44b5f5 (HEAD -> master, upstream/master)
Source: MacOS 10.12.16
Target: _NAME="Raspbian GNU/Linux 9 (stretch)"


Comments:
--------------------------------------------------------------------------------

On 2018-06-30T10:27:48Z, endo64, commented:
<https://github.com/red/red/issues/3451#issuecomment-401532374>

    @PeterWAWood Might it try to load from a wrong path? Is it possible for you to follow the execution process with Process Explorer kinda software and see which path it tries to load `test.so`?

--------------------------------------------------------------------------------

On 2018-06-30T11:45:00Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3451#issuecomment-401535927>

    The same code runs as expected on Linux on an Intel processor. I doubt it is a path problem.

--------------------------------------------------------------------------------

On 2018-06-30T11:56:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3451#issuecomment-401536463>

    I supplied the full absolute path of the .so file and still got the same error.

--------------------------------------------------------------------------------

On 2019-08-20T19:49:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3451#issuecomment-523167777>

    Those issues were fixed about a couple of months ago, with the big improvements on ARM backend. 
    
    Also, remember to eventually set the `LD_LIBRARY_PATH` env variable on Linux/ARM systems when loading dynamic libraries.

