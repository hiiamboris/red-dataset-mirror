
#2445: Cannot use leading zeros in tuple elements
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2445>

Rebol:

```
>> 01.02.03
== 1.2.3
```

Red:

```
c> 01.02.03
*** Syntax Error: invalid float! at "01.02.03"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-20T09:41:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2445#issuecomment-281031315>

    Now up to 2 leading zeros are accepted by the lexers.

