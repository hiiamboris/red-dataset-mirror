
#1910: When ASK is given a molded block that contains newlines, it prints it twice
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/1910>

The first printing is the intended result of ask, the second printing is AFTER receipt of the ENTER.

```
red>> test: [
[    1 2 3
[    4 5 6
[    ]
== [
    1 2 3 
    4 5 6
]
red>> ask mold test
[
    1 2 3 
    4 5 6
[
    1 2 3 
    4 5 6
]
== ""
red>>
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-17T09:34:27Z, meijeru, commented:
<https://github.com/red/red/issues/1910#issuecomment-219667297>

    Note also there is a `]`missing!

--------------------------------------------------------------------------------

On 2017-03-03T13:01:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1910#issuecomment-283947303>

    Will be fixed in the new console engine for 0.6.3.

--------------------------------------------------------------------------------

On 2018-11-21T02:06:40Z, qtxie, commented:
<https://github.com/red/red/issues/1910#issuecomment-440501813>

    Fixed in the new GUI console.

