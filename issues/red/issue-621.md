
#621: Adding an integer with NONE generates a strange number
================================================================================
Issue is closed, was reported by kealist and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/621>

May be similar to: #605

```
red>> 1 + none
== 164173
red>> 2 + none
== 164174
```

Rebol 2:

```
>> 1 + none
** Script Error: Cannot use add on none! value
** Where: halt-view
** Near: 1 + none
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-17T20:11:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/621#issuecomment-30786204>

    Yes, there are many more such missing guards.

--------------------------------------------------------------------------------

On 2013-12-18T16:59:17Z, dockimbel, commented:
<https://github.com/red/red/issues/621#issuecomment-30859299>

    There is no error checking in Red yet, especially for arguments to functions (including natives and actions). The current few errors checkings/reporting are hardcoded in order to be able to use Red until proper error! datatype and error checking is implemented.
    
    So I'm dismissing this ticket as it refers to a planned but unimplemented feature yet.

