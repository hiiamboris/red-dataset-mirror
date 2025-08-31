
#5090: Compiler's development mode misses imported symbols
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.review] [type.compiler]
<https://github.com/red/red/issues/5090>

**Describe the bug**

Simple script:
```
Red []

#system [
	o: declare red-object!
	object/make-at o 1
	probe object/get-words o

	p: [1 2 3]
	zero-fill p p + 3
	probe [p/1 p/2 p/3]
]
```
Trying to compile (clean directory, `1.red` is the only file):
```
> red -c 1.red
...
Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: red/object/make-at
*** in file: %/D/devel/red/red-src/red/system/utils/1/1.red
*** at line: 363
*** near: [
    object/make-at o 1 print-line object/get-words o
    p: [1 2 3]
]

> red -c -u 1.red
...
Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: zero-fill
*** in file: %/D/devel/red/red-src/red/system/utils/1/1.red
*** at line: 1
*** near: [
    zero-fill p p + 3 print-line [p/1 p/2 p/3]
    #script
]
```
Could be two different bugs since reported symbols are different, and also `-c` first compiles the dll (successfully), then fails on `1.red`, while `-c -u` fails faster but *does not* leave a DLL after a failure.

`-v 3` output for both modes:
```
            stack/unwind ------------| "extract-boot-args" #user-code
            #script %/D/devel/red/red-src/red/system/utils/1/1.red
            o: declare red-object!
            object/make-at o 1
            probe object/get-words o
            p: [1 2 3]
            zero-fill p p + 3
            probe [p/1 p/2 p/3]
            #script %/D/devel/red/red-src/red/system/utils/1/1.red ------------| {#system [ o: declare red-object! object/make-at o ...} #user-code
```

**Expected behavior**

`-c` should successfully compile the script, otherwise it requires full compilation cycle only to detect a single missing export

Also I expected `-c` in an empty dir to be equivalent to `-c -u` but as explained above there are some subtleties. At least I haven't seen these subtleties documented anywhere.

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-05T17:11:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5090#issuecomment-1059798765>

    Compilation options `-c`, `-r`, `-u` are mutually exclusive.

--------------------------------------------------------------------------------

On 2022-03-05T17:16:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5090#issuecomment-1059799459>

    Should be documented in `--help` output?

--------------------------------------------------------------------------------

On 2022-03-07T05:37:06Z, dander, commented:
<https://github.com/red/red/issues/5090#issuecomment-1060212988>

    And/or return an error if they are used in combination.

--------------------------------------------------------------------------------

On 2022-03-08T21:14:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5090#issuecomment-1062218409>

    There is an error in your example code, it's `zerofill` and not `zero-fill`.
    
    I confirm that the example code compiles fully using `-u` compilation mode.

--------------------------------------------------------------------------------

On 2022-03-08T21:23:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5090#issuecomment-1062225796>

    Ah, indeed! `-u` is ok then, except it should not delete the final dll when it fails?

--------------------------------------------------------------------------------

On 2022-03-08T21:42:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5090#issuecomment-1062240643>

    > except it should not delete the final dll when it fails?
    
    LibRedRT.dll file presence is used by the toolchain to know if it needs to update the DLL or not (in other words, it will renew it only if the file is not present). I'm not willing to spend time changing the logic in the toolchain just to avoid one extra compilation in case the `-u` compilation fails.

