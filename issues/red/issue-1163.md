
#1163: Interpreter: Foreach doesn't allow block returned from function as its series argument
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1163>

##### EXAMPLE 1

``` rebol
f: function [
    /l
][
    b: []
    if l [return b]
    append b 1
]
f f f
foreach a f/l [print a]
```

returns:

```
*** Script error: foreach does not allow word for its series argument
*** Where: foreach
```

while this code:

``` rebol
f: function [
    /l
][
    b: []
    if l [return b]
    append b 1
]
f f f
foreach a head f/l [print a]
```

correctly returns:

```
1
1
1
```
##### EXAMPLE 2

``` rebol
f: function [
    /l
][
    b: []
    if l [return b]
    append b [1 2]
]
f f f
foreach [a b] f/l [print [a b]]
```

returns:

```
(nothing)
```

while this code:

``` rebol
f: function [
    /l
][
    b: []
    if l [return b]
    append b [1 2]
]
f f f
foreach [a b] head f/l [print [a b]]
```

correctly returns:

```
1 2
1 2
1 2
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-07T21:15:13Z, x8x, commented:
<https://github.com/red/red/issues/1163#issuecomment-100021338>

    Problem may be related to the use of `return` in the function.
    works:
    
    ``` rebol
    red>> f: does [[1]] foreach a f [print a]
    1
    ```
    
    doesn't work:
    
    ``` rebol
    red>> f: does [return [1]] foreach a f [print a]
    *** Script error: foreach does not allow word for its series argument
    *** Where: foreach
    ```

--------------------------------------------------------------------------------

On 2015-05-08T03:44:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1163#issuecomment-100091759>

    Is your code above run through interpreter or compiler?

--------------------------------------------------------------------------------

On 2015-05-08T04:13:27Z, x8x, commented:
<https://github.com/red/red/issues/1163#issuecomment-100096933>

    Above where run in the interpreter, just compiled both and there is no issue.

