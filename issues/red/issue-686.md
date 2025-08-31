
#686: parse: quote does not quote set-word!s
================================================================================
Issue is closed, was reported by IngoHohmann and has 6 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/686>

red>> parse [return][quote return:]
== true

On Linux,
git status
Auf Branch master
Ihr Branch ist auf dem selben Stand wie 'origin/master'.



Comments:
--------------------------------------------------------------------------------

On 2014-02-19T16:49:29Z, earl, commented:
<https://github.com/red/red/issues/686#issuecomment-35519971>

    As [mentioned on SO chat](http://chat.stackoverflow.com/transcript/message/14805386#14805386) this is most likely desired behaviour, as various word types compare equal as long as the spelling is the same, i.e. `(quote return) = (quote return:)`.
    
    For a type-specific comparison in `parse`, you can use the `ahead` keyword:
    
    ```
    red>> parse [return] [ahead set-word! 'return]
    == false
    red>> parse [return] [ahead word! 'return]
    == true
    ```

--------------------------------------------------------------------------------

On 2014-02-20T19:29:38Z, dockimbel, commented:
<https://github.com/red/red/issues/686#issuecomment-35659455>

    This is a side-effect of using the `=` operator by default for values comparisons in PARSE. There is a `/strict` refinement planned (but not yet implemented for PARSE) that would use `==` (strict-equal) instead. 
    
    @earl, I think that should solve such kind of cases (including integer! = decimal! cases too). In Rebol:
    
    ```
    >> parse [1][1.0]
    == true
    ```

--------------------------------------------------------------------------------

On 2014-04-20T15:54:34Z, dockimbel, commented:
<https://github.com/red/red/issues/686#issuecomment-40897824>

    Ok, so the describe behavior is the expected one, nothing to change.

