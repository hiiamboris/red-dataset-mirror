
#3204: error when launching console (linux 32bits)
================================================================================
Issue is closed, was reported by gregit and has 12 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/3204>

### Expected behavior
Once the console is compiled it should not crash when run.

### Actual behavior
Issue 3196 is same except 3196 was happening from a downloaded version while this one is a compilation from source.
Note: 3196 still doesn't work with January 19th build.

### Steps to reproduce the problem
```
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> do/args %red.r "-r %environment/console/console.red"

-=== Red Compiler 0.6.3 ===- 

Compiling red-master/environment/console/console.red ...
Compiling compression library...
...compilation time : 5149 ms

Target: Linux 

Compiling to native code...
...compilation time : 140962 ms
...linking time     : 1429 ms
...output file size : 666004 bytes
...output file      : red-master/console 


== none
>> quit
$ ls
boot.red  BSD-3-License.txt  build               compiler.r  CONTRIBUTING.md  docs         lexer.r  modules     README.md  run-all.r  system  usage.txt  version.r
bridges   BSL-License.txt    CODE_OF_CONDUCT.md  console     crush.so         environment  libRed   quick-test  red.r      runtime    tests   utils
$ ./console 

*** Runtime Error 23: illegal operand
*** at: 080624C9h

```

### Red version and build date, operating system with version.
Red code downloaded today (January 19th)
```
cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 2
model name	: Intel(R) Pentium(R) 4 CPU 2.40GHz
stepping	: 7
microcode	: 0x37
cpu MHz		: 2392.354
cache size	: 512 KB
physical id	: 0
siblings	: 1
core id		: 0
cpu cores	: 1
apicid		: 0
initial apicid	: 0
fdiv_bug	: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pebs bts eagerfpu cid xtpr
bugs		:
bogomips	: 4784.70
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 32 bits virtual
```


Comments:
--------------------------------------------------------------------------------

On 2018-02-02T15:22:55Z, dockimbel, commented:
<https://github.com/red/red/issues/3204#issuecomment-362615946>

    The `red.r` front-end script pre-compiling the console should use the `Linux-old` for old CPU without SSE3 support. A pull-request is pending for detecting if SSE3 is available on Linux.
    
    I think this ticket could be a duplicate, as I remember seeing similqr reports in the past?

--------------------------------------------------------------------------------

On 2018-02-03T22:45:42Z, gregit, commented:
<https://github.com/red/red/issues/3204#issuecomment-362861648>

    Yes I opened similar ticket few weeks ago that was closed by corrector but I am unable to reopen it; hence this duplicate. Thanks.

--------------------------------------------------------------------------------

On 2018-03-14T12:33:16Z, dockimbel, commented:
<https://github.com/red/red/issues/3204#issuecomment-373004765>

    The SSE3 detection code is present now, can you confirm that the issue is solved?

--------------------------------------------------------------------------------

On 2018-03-19T21:02:55Z, gregit, commented:
<https://github.com/red/red/issues/3204#issuecomment-374375881>

    Just downloaded red-19mar18-160e3fee and executed it. Issue is still there:
    
    ```
    Compiling compression library...
    Compiling Red console...
    
    *** Runtime Error 23: illegal operand
    *** at: 080625C9h
    
    ```

--------------------------------------------------------------------------------

On 2018-03-20T05:15:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3204#issuecomment-374478820>

    Give it another try now.

--------------------------------------------------------------------------------

On 2018-03-20T18:42:28Z, gregit, commented:
<https://github.com/red/red/issues/3204#issuecomment-374712164>

    Great !
    
    ```
    /red-20mar18-8ea6e923 
    Compiling compression library...
    Compiling Red console...
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >>
    ```
    

