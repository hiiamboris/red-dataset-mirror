
#1162: IN native behavior inconsistent with Rebol version
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/1162>

in Rebol:

```
>> ctx: context [a: 1]  in ctx [a]
== [a]
```

in Red:

```
red>> ctx: context [a: 1]  in ctx [a]
== make object! [
    a: 1
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-07T09:22:01Z, Oldes, commented:
<https://github.com/red/red/issues/1162#issuecomment-99789532>

    Looks it's just not implemented for `block` type as this is ok:
    
    ```
    red>> a: 2 ctx: context [a: 1]  do in ctx 'a
    == 1
    ```

--------------------------------------------------------------------------------

On 2015-05-28T04:29:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1162#issuecomment-106166611>

    I fail to see why `in` was allowed to do that, as it just duplicates the behavior of `bind`.

--------------------------------------------------------------------------------

On 2016-02-03T09:44:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1162#issuecomment-179128574>

    I am closing this ticket as this feature seems redundant with `bind`.

