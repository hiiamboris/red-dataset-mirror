
#2443: Consecutive ticks in number types cannot be used
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2443>

I am not sure if it’s bug or feature, however it's possible in Rebol:

```
>> 123''456'789
== 123456789
```

Red throws error instead:

```
c> 123''456'789
*** Syntax Error: invalid integer! at "123''456'789"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-20T08:32:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2443#issuecomment-281016849>

    AFAIK, the convention is to use a single tick as separator for groups of 3 digits, so I guess it's a lexer issue in Rebol. 

--------------------------------------------------------------------------------

On 2017-02-20T09:41:09Z, rebolek, commented:
<https://github.com/red/red/issues/2443#issuecomment-281031241>

    I remember multiple ticks in an old (cca 1930) book, but I am fine with single tick.

