
#2295: Change keep in parse dialect to treat a single character as string! rather than a char!
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2295>

Currently if the parse matches a single character in an input string, ```keep``` appends the value as a ```char!``` to  the ```collect``` block. I found this to be counter intuitive. I think that it would be more consistent for ```keep``` to append a ```string!``` containing the single character.

Current behaviour:
```
red>> parse "1" [collect [keep to end]]
== [#"1"]
red>> parse "12" [collect [keep to end]]
== ["12"]
```
Desired behaviour:
```
red>> parse "1" [collect [keep to end]]
== ["1"]
red>> parse "12" [collect [keep to end]]
== ["12"]
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-22T12:26:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2295#issuecomment-281655538>

    So, now you have all the possibilities covered:
    * by default, nothing is changed, you get a single value or a list of value in range-capturing mode.
    * `keep pick` collects all the matched values separately
    * `keep copy <word>` collects all the matched values as a series (of same type as input).
    
    For example:
    ```
    red>> parse "1" [collect [keep to end]]
    == [#"1"]
    red>> parse "12" [collect [keep to end]]
    == ["12"]
    
    red>>  parse "1" [collect [keep pick to end]]
    == [#"1"]
    red>> parse "12" [collect [keep pick to end]]
    == [#"1" #"2"]
    
    red>>  parse "1" [collect [keep copy _ to end]]
    == ["1"]
    red>> parse "12" [collect [keep copy _ to end]]
    == ["12"]
    ```
    Note: `_` is a word, any word would do, here I use underscore to signify that we don't care about that word or his value, as it is immediatly collected by `keep`.

