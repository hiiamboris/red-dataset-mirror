
#897: Can't 'get direct value.
================================================================================
Issue is closed, was reported by qtxie and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/897>

Both compiler and interpreter have this issue.

```
red>> x: 3
== 3
red>> get x

*** Runtime Error 1: access violation
*** at: 0043EF9Fh
```



Comments:
--------------------------------------------------------------------------------

On 2014-08-09T03:18:49Z, qtxie, commented:
<https://github.com/red/red/issues/897#issuecomment-51675641>

    But we can get indirect value.
    
    ```
    red>> x: 3
    == 3
    red>> a: [x]
    == [x]
    red>> get a/1
    == 3
    ```

--------------------------------------------------------------------------------

On 2014-08-09T06:15:54Z, meijeru, commented:
<https://github.com/red/red/issues/897#issuecomment-51678563>

    In R2 (but not R3) the argument of `get` should be a lit-word! Does this have anything to do with it?

--------------------------------------------------------------------------------

On 2014-08-09T07:41:32Z, dockimbel, commented:
<https://github.com/red/red/issues/897#issuecomment-51680046>

    @meijeru You are right, we overlooked that before opening this ticket. `get` needs a lit-word! argument in Red too, the crash happens because of the not yet implemented type-checking.

--------------------------------------------------------------------------------

On 2014-08-23T04:55:41Z, dockimbel, commented:
<https://github.com/red/red/issues/897#issuecomment-53142842>

    I am closing this ticket. For the record:
    
    ```
    red>> x: 3
    == 3
    red>> get 'x
    == 3
    ```

