
#1087: PARSE using rule modified while running can execute past tail of series
================================================================================
Issue is closed, was reported by hostilefork and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1087>

```
red> parse "abcde" rule: ["a" "b" (clear rule) "c" "d" "e"]
== true
```

Executing past the series tail for modified rules has resulted in crashes in Rebol...because of the way PARSE is implemented.  (It captures a pointer to the value series, and steps through it with ++, but this is a problem if the underlying series needs to be expanded during the enumeration since the pointer goes bad after the reallocation.)  I have not looked to see if Red's implementation has _that_ specific problem or not; but it will have the problem if it mirrored the implementation that does not have the safety net of Do_Next which checks the series length each step and re-fetches the series data.

[See the CureCode ticket for more info](http://curecode.org/rebol3/ticket.rsp?id=2214)



Comments:
--------------------------------------------------------------------------------

On 2015-04-09T19:34:33Z, earl, commented:
<https://github.com/red/red/issues/1087#issuecomment-91336476>

    Just to be perfectly clear here (for the sake of those who did not follow the extensive discussion on SO chat that preceded these bug reports):
    
    The bug is, that self-modifying rules don't work.
    
    When doing comparisons against Rebol, be aware that self-modifying rules also don't consistently work in R2 or R3. For the following example:
    
    ```
    print parse "abcd" rules: ["a" "b" (remove back tail rules) "c" "d"]
    print parse "abcd" rules: ["a" "b" (clear rules) "c" "d"]
    ```
    
    R2 and R3 print true + false (so one self-modifying rule works while the other doesn't); Red currently prints true + true (so both self-modifying example rules don't work).

--------------------------------------------------------------------------------

On 2015-04-21T12:10:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1087#issuecomment-94766948>

    After the fix, it returns `false` in both cases now.

