
#5041: [Compiler] Crashes on use of `<<<` word
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.wontfix] [type.compiler]
<https://github.com/red/red/issues/5041>

**Describe the bug**

Script:
```
Red []
<<<: :<<
probe :<<<
probe 1 <<< 2
```
Interpreted:
```
make op! func ["Shift bits to the left" data [integer!] bits [integer!]][natives/shift* no 1 -1]
4
```
Compiling `-c`:
```
*** Red Compiler Internal Error: Syntax Error : Invalid word -- <<<*
*** Where: none
*** Near:  {^V^@^@^@V}
```

A little differently:
```
Red []
context [
	<<<: :<<
	probe :<<<
	probe 1 <<< 2
]
```
Interpreted works. Compiling `-c` succeeds. Compiled affected by #5040 (does not complain, just strikes in the back):
```
make op! func ["Shift bits to the left" data [integer!] bits [integer!]][natives/shift* no 1 -1]
1
```
Expected `4`,` <<<` is not evaluated

**Expected behavior**

Compiles. Outputs `4`.

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-22T13:05:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5041#issuecomment-1019252532>

    This is tied to limitation in Rebol2 where such a symbol like `<<<` is illegal. The compiler tries hard to work around such limitations, but in this case, I have not found a simple way to support it, it would require some deep changes in the current compiler that I won't do, as we'll move to a new toolchain during the work on 64-bit.

--------------------------------------------------------------------------------

On 2022-01-22T14:03:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/5041#issuecomment-1019275740>

    How come `>>>` compiles just fine?
    It doesn't get redefined though:
    ```
    Red []
    >>>: :<<
    probe 1 >>> 2
    ```
    Outputs compiled `0`, interpreted `4`.

--------------------------------------------------------------------------------

On 2022-01-22T16:09:29Z, greggirwin, commented:
<https://github.com/red/red/issues/5041#issuecomment-1019299653>

    > This is tied to limitation in Rebol2 where such a symbol like `<<<` is illegal. The compiler tries hard to work around such limitations, but in this case, I have not found a simple way to support it, it would require some deep changes in the current compiler that I won't do, as we'll move to a new toolchain during the work on 64-bit.
    
    @dockimbel can we list the known symbols that can't be used, and that there may be more, even if we're going to address it in the future?

