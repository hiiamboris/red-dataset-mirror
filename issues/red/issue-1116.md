
#1116: Interpreter crash when evaluating a native! redefined inside an object!
================================================================================
Issue is closed, was reported by x8x and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1116>

This construct crash the interpreter:

``` rebol
o: object [
    sin*: :sin
    set 'sin does [
        sin* none
    ]
]
```

Result from console:

``` rebol
red>> o: object [
[     sin*: :sin
[     set 'sin does [
[      sin* none
[     ]
[    ]
== make object! [
    sin*: routine ["Returns the trigonometric sine"...
red>> sin

*** Runtime Error 1: access violation
*** at: 0002752Dh

```



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T11:35:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1116#issuecomment-96616082>

    Fixed by commit [852be588](https://github.com/red/red/commit/e42ff022b11de571fbe2ee2de9fb2861852be588).

--------------------------------------------------------------------------------

On 2015-04-27T15:02:40Z, x8x, commented:
<https://github.com/red/red/issues/1116#issuecomment-96692352>

    ``` rebol
      o: object [
    [        sin*: :sin
    [        set 'sin does [
    [            sin* none
    [        ]
    [    ]
    ;   make object! [
        sin*: routine ["Returns the trigonometric sine"...
      sin
    *** Script error: sin* does not allow none for its <anon> argument
    
      o/sin*
    *** Script error: sin* is missing its angle argument
    *** Where: sin*
    ```
    
    `<anon> argument` should be `angle argument`

--------------------------------------------------------------------------------

On 2015-04-28T02:43:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1116#issuecomment-96889996>

    The `<anon>` issue has been fixed now.

--------------------------------------------------------------------------------

On 2015-04-30T18:47:40Z, x8x, commented:
<https://github.com/red/red/issues/1116#issuecomment-97920153>

    not sure it's fixed, here an example with latest nightly:
    
    ``` rebol
    red>> o: object [
    [        sin*: :sin
    [        set 'sin does [
    [            sin* none
    [        ]
    [    ]
    == make object! [
        sin*: routine ["Returns the trigonometric sine"...
    red>> sin
    *** Script error: sin* does not allow none for its <anon> argument
    *** Where: sin*
    ```

--------------------------------------------------------------------------------

On 2016-07-26T12:14:57Z, x8x, commented:
<https://github.com/red/red/issues/1116#issuecomment-235249907>

    Should this one be reopened? I still get `<anon>` instead of `angle`:
    
    ```
      o: object [
              sin*: :sin
               set 'sin does [
                 sin* none
                ]
           ]
    ;   make object! [
        sin*: routine [
            "Returns the trigonomet...
      sin
    *** Script Error: sin* does not allow none! for its <anon> argument
    *** Where: sin*
    ```

--------------------------------------------------------------------------------

On 2017-02-16T09:04:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1116#issuecomment-280273531>

    This code now works properly in the interpreter.

