
#2359: difference, exclude, intersect and union results in runtime error when parameters are string! and block!
================================================================================
Issue is closed, was reported by guaracy and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2359>

string! and block!

```
--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> about
Red 0.6.1 - 4-Dec-2016/16:54:24-2:00
red>> union {1 2 3} [4 5 6]

*** Runtime Error 101: no value matched in SWITCH
*** at: 080698CDh
```

block! and string!

```
red>> union [1 2 3] {1 2 3}

*** Runtime Error 1: access violation
*** at: 0806AEBFh
```



Comments:
--------------------------------------------------------------------------------

On 2016-12-06T07:54:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2359#issuecomment-265084122>

    Good catch, thank you!

