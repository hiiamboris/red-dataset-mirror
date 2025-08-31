
#3594: Can't compile nor cross-compile to FreeBSD
================================================================================
Issue is closed, was reported by lpvm and has 10 comment(s).
<https://github.com/red/red/issues/3594>

Please consider this script:

```
RED [
]
print "hello"
```
It doesn't compile in FreeBSD.
More important yet, maybe we can begin with this, cannot cross-compile from Linux to FreeBSD.

My Linux version:
` 4.18.17_1 #1 SMP PREEMPT x86_64 GNU/Linux `

**To Reproduce**
1. Save the above lines as a filename, example  `r.red`
2.
``` 
$ /usr/local/bin/red-19nov18-2293d3e3 -t FreeBSD -c -r pf_log.red

-=== Red Compiler 0.6.3 ===- 

Compiling /home/lupe/prog/rebol_red/freebsd/r.red ...
...compilation time : 1360 ms

Target: FreeBSD 

Compiling to native code...
*** Loading Error: file access error: %platform/freebsd.reds 
*** in file: %/home/lupe/prog/rebol_red/freebsd/tools.reds 
*** at line: 20
```
3. Without the `-r` flag, the error is the same.

**Expected behavior**
Expected the program to be compiled for the FreeBSD platform.

**Platform version(please complete the following information):**
```
>> about
Red 0.6.3 for Linux built 19-Nov-2018/1:20:36 commit #2293d3e
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-20T08:44:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3594#issuecomment-440189964>

    The Red Linux executable will not run on FreeBSD. The temporarybootstrap Red compiler is written in Rebol which is included in the Red executable. It is possible to run the red compiler from it's source by installing a FreeBSD version of Red.
    
    It is also possible to cross-compile Red programs to run on FreeBSD.
    
    I compiled this program -
    ```text
    Red[]
    
    print "Hello FreeBSD"
    ```
    on macOS using this command -
    ```text
    $ rebol -qws red.r -t FreeBSD ../../Code/Red/test.red
    ```
    and ran it on FreeBSD - 
    
    
    <img width="338" alt="hello freebsd" src="https://user-images.githubusercontent.com/697434/48761374-6faadc80-ece3-11e8-9936-27c96b83d83b.png">
    

--------------------------------------------------------------------------------

On 2018-11-20T09:02:23Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3594#issuecomment-440195437>

    The program was also happily cross-complied from Linux (Ubuntu32) to FreeBSD:
    ```text
    $ rebol -qws red.r -t FreeBSD ../../Code/Red/test.red
    
    -=== Red Compiler 0.6.3 ===- 
    
    Compiling /media/sf_VMShare/Code/Red/test.red ...
    ...compilation time : 1222 ms
    
    Target: FreeBSD 
    
    Compiling to native code...
    ...compilation time : 35532 ms
    ...linking time     : 335 ms
    ...output file size : 613636 bytes
    ...output file      : /media/sf_VMShare/Red/red/test 
    
    ```

--------------------------------------------------------------------------------

On 2018-11-20T09:26:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3594#issuecomment-440203056>

    @lpvm Please note that there is an issue with the compiler on FreeBSD at the moment - #3598

--------------------------------------------------------------------------------

On 2018-11-20T09:56:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3594#issuecomment-440212964>

    @lpvm This issue and #3598 have been resolved. Please could you check with the automated build for Nov-21 once it appears.

--------------------------------------------------------------------------------

On 2018-11-29T12:57:07Z, lpvm, commented:
<https://github.com/red/red/issues/3594#issuecomment-442824051>

    Thank you, @PeterWAWood 
    
    It works.  I tried to run the executable in a 64 bit machine but could not due to some compatibility layer problem.
    Maybe it's just a simple thing like, for example, this one for a fpc compile: https://forums.freebsd.org/threads/run-a-32-bit-application-in-a-64-bit-multi-arch-system.57520/

