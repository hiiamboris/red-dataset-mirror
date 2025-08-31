
#1233: Allow block for PUT's second argument
================================================================================
Issue is open, was reported by WiseGenius and has 8 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/1233>

Whether this is called `modify`, `put` or whatever:

```
red>> m: #(a 1 b 7)
== #(
    a: 1
    b: 7
)
red>> modify m [b c] [2 3]
*** Script error: modify does not allow block for its field argument
*** Where: modify
)
```

Proposed result:

```
red>> m
== #(
    a: 1
    b: 2
    c: 3
```

This might only work if [this proposal](https://github.com/red/red/wiki/use-blocks-as-keys) to allow `block!` keys in `map!`s were to be rejected. This looks encouraging:

```
red>> #([a b c] [1 2 3])
*** Script error: block type is not allowed here
*** Where: make
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-11T11:37:39Z, WiseGenius, commented:
<https://github.com/red/red/issues/1233#issuecomment-111094141>

    In case it wasn't clear above, the reasoning about `put` here, follows again from an analogy with `set`:
    
    ```
    red>> set 'a 1
    == 1
    red>> set [b c] [2 3]
    == [2 3]
    red>> c
    == 3
    ```
    
    `put` can then be thought of as `set` in the context of a `map!` (with the `map!` inserted before the first 2 arguments):
    
    ```
    red>> m: #(a 1 b 7)
    == #(
        a: 1
        b: 7
    )
    red>> put m 'a 1
    == #(
        a: 1
        b: 7
    )
    red>> put m [b c] [2 3]
    == #(
        a: 1
        b: 2
        c: 3
    )
    ```
    
    Or as `set` in the context of an `object!` (with the `object!` inserted before the first 2 arguments):
    
    ```
    red>> o: make object! [a: 1 b: 7]
    == make object! [
        a: 1
        b: 7
    ]
    red>> put o 'a 1
    == make object! [
        a: 1
        b: 7
    ]
    red>> put o [b c] [2 3]
    == make object! [
        a: 1
        b: 2
        c: 3
    ]
    ```
    
    Or in the context of a `series!`, etcetera.

--------------------------------------------------------------------------------

On 2015-06-11T12:00:29Z, dockimbel, commented:
<https://github.com/red/red/issues/1233#issuecomment-111105968>

    At first look, it seems very interesting and useful feature to have, providing column-oriented bulk changes.

--------------------------------------------------------------------------------

On 2015-06-11T12:27:59Z, WiseGenius, commented:
<https://github.com/red/red/issues/1233#issuecomment-111115334>

    When wondering what `put` would do on a `block!` such as this:
    
    ```
    put [[a b c] 4 a 1 b 7 c 13] [a b c] [1 2 3]
    ```
    
    Consider that `put` would have an `/only` refinement like `select` does:
    
    ```
    red>> select [[a b c] 4 a 1 b 7 c 13] [a b c]
    == none
    red>> select/only [[a b c] 4 a 1 b 7 c 13] [a b c]
    == 4
    ```
    
    So:
    
    ```
    red>> put [[a b c] 4 a 1 b 7 c 13] [a b c] [1 2 3]
    == [[a b c] 4 a 1 b 2 c 3]
    red>> put/only [[a b c] 4 a 1 b 7 c 13] [a b c] [1 2 3]
    == [[a b c] [1 2 3] a 1 b 7 c 13]
    ```
    
    This implies that without an `/only` refinement, rather than return `none`, `select` should do this:
    
    ```
    red>> select [[a b c] 4 a 1 b 7 c 13] [a b c]
    == [1 7 13]
    ```

--------------------------------------------------------------------------------

On 2020-03-27T14:25:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/1233#issuecomment-605029512>

    I'm missing objects as map keys second time already :(
    ```
    >> make map! reduce [object [] object []]
    *** Script Error: object! type is not allowed here
    *** Where: make
    *** Stack:  
    
    >> put #() object [] object []
    *** Script Error: put does not allow object! for its key argument
    *** Where: put
    *** Stack:  
    
    >> extend #() reduce [object [] object []]
    *** Script Error: object! type is not allowed here
    *** Where: extend
    *** Stack:  
    ```
    
    Although I wonder, should `select map object` always use /same comparator?
    
    And this is especially nonsensical:
    ```
    >> put make hash! [] object [] object []
    *** Script Error: put does not allow object! for its key argument
    *** Where: put
    *** Stack:  
    
    >> put [] object [] object []
    *** Script Error: put does not allow object! for its key argument
    *** Where: put
    *** Stack:  
    ```
    Whereas `select` (counterpart of `put`) perfectly handles this:
    ```
    >> b: reduce [o: object [] 1]
    >> h: reduce [o 2]
    >> select b o
    == 1
    >> select h o
    == 2
    ```
    
    Also I think `put` should have /same refinement to be on par with select here.

