
#2297: set-path!s execute get-word!s
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2297>

```
red>> m: copy #()
== #()
red>> o: make object! [w: none]
== make object! [
    w: none
]
red>> f: function [x][loop 20 [prin uppercase x] print x]
== func [x][loop 20 [prin uppercase x] print x]
red>> 
red>> 
red>> v: :f "a"					;;<- This behaves as expected.
== "a"
red>> 
red>> 
red>> m/k: :f "a"				;;<- This unexpectedly executes the function.
AAAAAAAAAAAAAAAAAAAAA
== func [x][loop 20 [prin uppercase x] print x]
red>> 
red>> 
red>> o/w: :f "a"				;;<- This unexpectedly executes the function.
AAAAAAAAAAAAAAAAAAAAA
== func [x][loop 20 [prin uppercase x] print x]
```

May be related to [#2201](https://github.com/red/red/issues/2201).


Comments:
--------------------------------------------------------------------------------

On 2016-11-03T10:33:58Z, WiseGenius, commented:
<https://github.com/red/red/issues/2297#issuecomment-258108691>

    Looks like it's not just `get-word!`s.
    
    ```
    red>> m: copy #()
    == #()
    red>> m/k: function [x][loop 20 [prin uppercase x] print x] "a"
    AAAAAAAAAAAAAAAAAAAAA
    == func [x][loop 20 [prin uppercase x] print x]
    ```

--------------------------------------------------------------------------------

On 2016-11-03T11:14:16Z, WiseGenius, commented:
<https://github.com/red/red/issues/2297#issuecomment-258116100>

    Looks like it isn't just `set-path!`s either:
    
    ```
    red>> m: copy #()
    == #()
    red>> set 'm/k function [x][loop 20 [prin uppercase x] print x] "a"
    *** Script Error: m/k is missing its x argument
    *** Where: k
    ```
    
    It's just the additional execution that's the problem. In all the examples so far, the assignment does succeed:
    
    ```
    red>> m
    == #(
        k: func [x][loop 20 [prin uppercase x] print x]
    )
    ```

--------------------------------------------------------------------------------

On 2016-11-03T16:13:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2297#issuecomment-258191007>

    Good catch!

