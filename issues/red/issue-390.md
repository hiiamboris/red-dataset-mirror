
#390: switch type? broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/390>

```
Red []

item: 9
switch type? item [
    integer! [
        print item
    ]
]
```

Nothing is printed.



Comments:
--------------------------------------------------------------------------------

On 2013-01-22T23:15:22Z, dockimbel, commented:
<https://github.com/red/red/issues/390#issuecomment-12572534>

    You should be using `type?/word` here to make it work, else you try to match a datatype! with a word!, which will always fail.

--------------------------------------------------------------------------------

On 2013-01-22T23:40:13Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/390#issuecomment-12573415>

    A type name is just a word, isn't it? How come this works:
    
    ```
    print integer! = type? 0
    ```

--------------------------------------------------------------------------------

On 2013-01-23T00:22:51Z, dockimbel, commented:
<https://github.com/red/red/issues/390#issuecomment-12575196>

    A type name is a word that gets reduced to a datatype! when evaluated. In your example, both side of the equality are evaluated to datatype! values.
    
    ```
    red>> type? integer!
    == datatype!
    ```
    
    In the `switch` block, the type names are not evaluated, so to match them, you also need to provide a word! value.

--------------------------------------------------------------------------------

On 2013-01-24T00:41:01Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/390#issuecomment-12631284>

    OK, I would have expected switch values to be evaluated. I suppose it's faster this way. I was never able to program enough REBOL due to its closed nature.

