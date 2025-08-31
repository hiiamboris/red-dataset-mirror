
#1707: Crash with 'make'
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1707>

Typing -
`a: make native! []`
or
`a: make action! []`
in the red-console crashes it with 

```
*** Runtime Error 1: access violation
*** at: 0041CED7h
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-12T17:05:59Z, meijeru, commented:
<https://github.com/red/red/issues/1707#issuecomment-195775513>

    I have reason to believe that `make op!` does the same.

