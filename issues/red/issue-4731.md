
#4731: Lexing inconsistency with set/get words starting with `<` character
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/4731>

Currently:
```
>> quote <<<
== <<<
>> quote <<<:
*** Syntax Error: (line 1) invalid word at <<<:
```
which is also related to:
```
>> load {<<<}
== <<<
>> load {:<<<}
== [:< <<] ;<-- it should be `:<<<` instead as `<<<` is valid word now
```
```
Red 0.6.4 for Windows built 18-Nov-2020/3:13:59+01:00 commit #8ee5a9f
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-19T08:47:40Z, 9214, commented:
<https://github.com/red/red/issues/4731#issuecomment-730222360>

    Duplicate of https://github.com/red/red/issues/4562.

