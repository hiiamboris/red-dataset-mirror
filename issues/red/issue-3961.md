
#3961: gui-console crashed on macOS
================================================================================
Issue is closed, was reported by bitbegin and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3961>

**Describe the bug**
compile gui-console.red, and run it, it crashed. however, this `https://github.com/red/red/commit/720abebbd214fe2ba96f50e322bb3a9d2d0d5142` commit can fix it.  

I had added more log, to test it:

```
  print-line as cell! view
  t: 54h ; ivar_getOffset ivar
  print-line as cell! t
  print-line as cell! view + t
  ce: as cell! view + t
  print-line as red-object! (as cell! view + t)
  print-line as red-object! ce
  re: as red-object! (as cell! view + t)
  print-line re
```

results:

```
01820D60
00000054
01820DB4
01820DB4
01820DB4
0013A60A      ;-- should be 01820DB4, seems something wrong with `pointer!` calculation
```

**To reproduce**
Steps to reproduce the behavior:
1. if you use master branch, Revert `https://github.com/red/red/commit/720abebbd214fe2ba96f50e322bb3a9d2d0d5142` 
2. compile gui-console.red
3. run it

**Expected behavior**
gui-console not crashed


**Screenshots**

if compiled with flag -d:

```
*** Runtime Error 1: access violation
*** in file: /Users/bitbegin/Desktop/red/runtime/datatypes/object.reds
*** at line: 133
***
***   stack: red/object/get-values 00613C00h
***   stack: gui/draw-text-box 00000000h BFFFD218h 00613C00h true
***   stack: gui/draw-rect 6615408 -1857573143 0 0 1.128792e+09 1.128792e+09
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 30-Jul-2019/14:19:01+08:00 commit #3f14bf4
```



Comments:
--------------------------------------------------------------------------------

On 2019-08-05T09:02:14Z, qtxie, commented:
<https://github.com/red/red/issues/3961#issuecomment-518149865>

    A simple code snippet to reproduce this issue:
    ```
    Red []  
    
    #system [
        obj123: context [
            test1: func [
                view    [integer!]
                return: [red-object!]
                /local
                    t   [integer!]
                    ce  [cell!]
                    re  [red-object!]
            ][
                print-line as cell! view
                t: 54h ; ivar_getOffset ivar
                print-line as cell! t
                print-line as cell! view + t
                ce: as cell! view + t
                print-line as red-object! (as cell! view + t)
                print-line as red-object! ce
                re: as red-object! (as cell! view + t)
                print-line re
                as red-object! (as cell! view + t)
            ]
        ]
    ]
    
    routine1: routine [][
        probe obj123/test1 01820D60h
    ]
    
    routine1
    ```

--------------------------------------------------------------------------------

On 2019-08-09T15:21:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3961#issuecomment-519959731>

    The issue is caused by the R/S compiler not handling well the nested type casting in:
    ```
     as red-object! (as cell! view + t)
    ```
    The nested addition expression is not generated, resulting in a corrupted result.
    

