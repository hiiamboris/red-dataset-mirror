
#2594: TO PATH! preserves nested any-block! values
================================================================================
Issue is closed, was reported by greggirwin and has 12 comment(s).
[status.wontfix]
<https://github.com/red/red/issues/2594>

```
>> p1: to path! [a b c]
== a/b/c
>> p2: to path! [a b/c]
== a/b/c
>> p1 = p2
== false
>> mold p1
== "a/b/c"
>> mold p2
== "a/b/c"
>> length? p1
== 3
>> length? p2
== 2
>> p1/2
== b
>> p2/2
== b/c
```
```
>> to path! reduce ['b to block! 'name/phone]
== b/[name phone]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-18T03:48:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2594#issuecomment-294668203>

    That's how it works in Rebol too, what do you suggests?

--------------------------------------------------------------------------------

On 2017-04-18T04:43:47Z, greggirwin, commented:
<https://github.com/red/red/issues/2594#issuecomment-294676251>

    I expected it to flatten it. Even `mold/all` doesn't show the difference. It creates a value that can't be loaded in the case of a block of words being appended, which is like the trick in R2 of making issue!s with spaces in them, where some of the data was effectively hidden. In the path case, molding and loading it changes the value. 
    
    Ultimately, the question is what value the current behavior provides, and why it works the way it does.

--------------------------------------------------------------------------------

On 2017-04-18T04:45:36Z, greggirwin, commented:
<https://github.com/red/red/issues/2594#issuecomment-294676441>

    I ran into this when dynamically constructing paths, which I don't do very often. I can't remember hitting this in R2, but I may not have appended paths, just compose them from words.

--------------------------------------------------------------------------------

On 2017-04-18T04:48:58Z, greggirwin, commented:
<https://github.com/red/red/issues/2594#issuecomment-294676761>

    I can easily work around it in this case, with `append`, but I think the "these two things look identical in all ways, but aren't the same" is confusing. I don't see how `mold/all` could do better, unless it creates construction syntax.

--------------------------------------------------------------------------------

On 2017-07-28T15:59:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2594#issuecomment-318692584>

    >"these two things look identical in all ways, but aren't the same" is confusing.
    
    We have the same behavior in many other datatypes in Redbol:
    ```
    >> word! = first [word!]
    == false
    >> none = first [none]
    == false
    ```
    The lexical space used by Redbol is not big enough to represent all the possible values you can construct at runtime (even construction syntax cannot represent everything, like different bindings for same word), so we can end up with overlappings. Those are the limits of the text representation. That said, it should be possible to improve that a bit with syntax coloring.
    
    We could flatten by default in many cases when setting a path as an element of another path, but the user can still workaround it using the `/only` refinement in `change`, `append`, `insert`, `remove`,...
    
    Red has a default neutral position on those operations for now, until we find a better option (which can also never happen, both R2 and R3 kept such behavior probably because no better option was found). So I will close this ticket, as this is a design topic.

--------------------------------------------------------------------------------

On 2017-07-29T03:52:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2594#issuecomment-318801619>

    Started https://github.com/red/red/wiki/Path!-notes

