
#2755: Unassigned routine value gives compiler internal error
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2755>

Source: `Red [ ] routine [ ] [ ]`
Result:
```
-=== Red Compiler 0.6.2 ===- 
Compiling C:\Projects\Red\programs\red-inspector\test.red ...
...using libRedRT built on 5-Jun-2017/10:42:31+2:00
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: block! 
*** Where: comp-routine 
*** Near:  [name: check-func-name get-prefix-func to word!] 
> Terminated with exit code 1.
```



Comments:
--------------------------------------------------------------------------------

On 2017-06-05T20:10:06Z, meijeru, commented:
<https://github.com/red/red/issues/2755#issuecomment-306290979>

    This case is not catered for; the compiler assumes that `routine` is always preceded by a set-word.

--------------------------------------------------------------------------------

On 2017-07-28T17:37:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2755#issuecomment-318716874>

    The compiler will now return: `*** Compilation Error: a routine must have a name`

