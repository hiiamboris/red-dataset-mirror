
#4991: Memory CORRUPTION during MOLD
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/4991>

**Describe the bug**

Need 2 scripts.
1. Generator script `1.red`:
```
Red [] 
make-dir %tmp/
b: [[[]]]
random/seed 1337
repeat i 3000 [
	do random/only [
		[append/only b/1 copy []]
		[append random/only b/1 copy/part random n: {^A^B^C^D^E^F"""""^{^}фывапроолджэ} random length? n]
		[new-line skip b/1 random length? b/1 yes]
	]
	write probe rejoin [%tmp/ i] b mold/only b
]
```
2. Loader script `2.red`:
```
Red [] 
repeat i 3000 [
	if error? e: try [load rejoin [%tmp/ i]] [print [i e]]
]
```

Run `red --cli 1.red` then `red --cli 2.red`
Output of `2.red` is:
```
1154 *** Syntax Error: (line 185) invalid string at {ж"э^Eл^D^A"^{"о^F^Cаы%]
*** Where: transcode
*** Stack: load
1165 *** Syntax Error: (line 186) invalid string at {^F"^}ол"жэо"ф^A^{д"^Dы
*** Where: transcode
*** Stack: load
1214 *** Syntax Error: (line 78) invalid string at "]
*** Where: transcode
*** Stack: load
2304 *** Syntax Error: (line 356) invalid character at }] [{^}ыпфлэ^Dжрд^C"^A
*** Where: transcode
*** Stack: load
2618 *** Syntax Error: (line 128) invalid string at "ап}]
*** Where: transcode
*** Stack: load
```

The 1st two errors are obvious: `}` gets replaced by `%` and by `^E`.
For the rest, there is an unclosed string in some of the *preceding* lines, not near value that is reported. Again `}` gets replaced by `õ`, `Å` and `¥`.

**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2021/14:56:13+03:00  commit #7218fb4
```



Comments:
--------------------------------------------------------------------------------

On 2021-11-04T16:24:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4991#issuecomment-961205428>

    A continuation of https://github.com/red/red/issues/4291, though that one doesn't produce any garbage for me anymore.
    
    We're also experiencing an issue that in ~1% cases a perfectly valid HTTP request (with `write/info`) fails with the server reporting 400 Bad Request. I suspect the same cause for it.

--------------------------------------------------------------------------------

On 2021-11-04T17:57:41Z, dockimbel, commented:
<https://github.com/red/red/issues/4991#issuecomment-961285833>

    No need to run script `2.red`, the following code from console is enough to reproduce the issue:
    ```
    >> load %tmp/1254
    *** Syntax Error: (line 78) invalid string at "] 
    
    *** Where: transcode
    *** Stack: load 
    ```
    
    EDIT: seems that the erroneous files are changing on each new set generation, so the `2.red` script is indeed required.

--------------------------------------------------------------------------------

On 2021-11-04T18:31:12Z, dockimbel, commented:
<https://github.com/red/red/issues/4991#issuecomment-961310277>

    > The 1st two errors are obvious: } gets replaced by % and by ^E.
    
    How can I see that? 
    
    EDIT: don't bother, I've figured out a way.

--------------------------------------------------------------------------------

On 2021-11-04T18:57:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4991#issuecomment-961329904>

    If the GC is disabled, no issue happens (`%2.red`  runs without reporting any error).
    
    If I disable the GC (using `collector/active?: no`) in `string/append-char` (which is heavily used by `string/mold`) and restoring the GC at the end of that function, no issue occurs.
    
    In `string/append-char`, no error occurs if I disable the GC around the following line: https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L641

