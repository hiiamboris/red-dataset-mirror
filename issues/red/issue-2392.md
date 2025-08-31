
#2392: Loader regression on words containing "<>"
================================================================================
Issue is closed, was reported by maximvl and has 10 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2392>

Words containing `<>` are not loaded correctly in recent builds:
```
red>> a-<>: 5
*** Script Error: a- has no value
*** Where: catch
red>> a-<>
*** Script Error: <> operator is missing an argument
*** Where: catch
red>> system/build/date
== "31-Dec-2016/18:23:29+3:00"
```

```
--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> a-<>: 5
== 5
red>> a-<>
== 5
red>> system/build/date
== "11-Oct-2016/1:36:36+3:00"
```


Comments:
--------------------------------------------------------------------------------

On 2017-01-01T09:59:02Z, meijeru, commented:
<https://github.com/red/red/issues/2392#issuecomment-269897550>

    Should they really be words??? I see no inconvenience in not allowing them

--------------------------------------------------------------------------------

On 2017-01-01T17:48:06Z, maximvl, commented:
<https://github.com/red/red/issues/2392#issuecomment-269912293>

    @meijeru Well, people who did other languages saw no inconvenience in not allowing `-`, `!`, `?` and others. Should we do the same? I doubt it. I would like have as much flexibility in word's names as possible.

--------------------------------------------------------------------------------

On 2017-01-02T20:28:44Z, meijeru, commented:
<https://github.com/red/red/issues/2392#issuecomment-270017012>

    I am frankly amazed that <> are allowed in words, because they delimit a tag! value. Incidentally, REBOL 2 allows the assignment you cite, but curiously not the word `a-<>` on its own.
    The issue you have come upon may be caused by the commit 3c6e320 of 2-Dec-2016.

--------------------------------------------------------------------------------

On 2017-01-03T11:50:10Z, meijeru, commented:
<https://github.com/red/red/issues/2392#issuecomment-270098651>

    Of course `<` and `>` on their own, as well as `<=` `>=` and `<>` must be recognized as words as well. This does not make it easier for the lexers ;-)

--------------------------------------------------------------------------------

On 2017-02-15T05:04:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2392#issuecomment-279917961>

    It is not a regression, but an intended change in order to allow sticky words and tags to be recognized properly by the lexer:
    ```
    >> [<b>hello</b>]
    == [<b> hello </b>]
    ```
    It is very difficult to come up with a set of parsing rules to support that, while still allowing angle brackets inside words. A side-effect is that `<>` pattern becomes unavailable in words. 
    
    Rebol2/3 are implementing such support for sticky tags differently, and it leads to weird cases which are IMO more problematic than the Red trade-off.
    
    In Rebol2/3:
    ```
    >> [word<tag>]
    == [word <tag>]
    >> [word<tag>:]
    == [word<tag>:]
    >> [word<>]
    == [word <>]
    >> [word-<>]
    == [word- <>]
    >> [word<<>]
    ** Syntax Error: Invalid word -- <<>
    ** Near: (line 1) [word<<>]
    >> [word<<]
    ** Syntax error: invalid "word" -- "word<<"
    ** Near: (line 1) [word<<]
    >> [word>>]
    ** Syntax error: invalid "word" -- "word>>"
    ** Near: (line 1) [word>>]
    >> [<<]
    == [<<]
    >> [<<<]
    ** Syntax error: invalid "word" -- "<<<"
    ** Near: (line 1) [<<<]
    >> [word<=>]
    ** Syntax error: invalid "word" -- "word<=>"
    ** Near: (line 1) [word<=>]
    ```
    in Red:
    ```
    red>> [word<tag>]
    == [word <tag>]
    red>> [word<tag>:]
    *** Syntax Error: missing #"]" at "[word<tag>:]"
    *** Where: do
    red>> [word<>]
    == [word <>]
    red>> [word-<>]
    == [word- <>]
    red>> [word<<>]
    == [word< <>]
    red>> [word<<]
    == [word<<]
    red>> [word>>]
    == [word>>]
    red>> [<<]
    == [<<]
    red>> [<<<]
    == [<<<]
    >> [word<=>]
    (session freezes)
    ```
    The lexer error in the 2nd case is valid, but the message is incorrect (already reported in another ticket). That last one seems to be just a bug to fix (I'll open a ticket for that).
    
    Maybe in the future, we can figure out better grammar rules to allow more words to be formed, though, more sophisticate rules will also probably put an overhead on the lexer.

