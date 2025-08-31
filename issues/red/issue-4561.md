
#4561: cannot type BINARY! in console multi-line mode
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/4561>

**Describe the bug**
Red console enters multi-line editing mode when user types opening series delimiter on a single line. This mode does not work for `binary!` values.

**To reproduce**
```
>> #{
*** Syntax Error: (line 2) invalid binary at #{
*** Where: transcode
*** Stack: load 
```

Same holds for construction syntax, but that might be expected since it's only partially implemented.

**Expected behavior**
```
>> #{
{    }
== #{}
```

**Platform version**
 W10, b452716, both GUI and CLI consoles.



Comments:
--------------------------------------------------------------------------------

On 2020-07-06T03:05:52Z, bitbegin, commented:
<https://github.com/red/red/issues/4561#issuecomment-653990931>

    https://github.com/red/red/pull/4536

