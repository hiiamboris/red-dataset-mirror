
#5068: WISH: SET-IN for PARSE
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5068>

PARSE is often used to initialize and write data in contexts. Actually, you need to use temporary words and defer to code in parens the task of writing inside the container. To make things simpler and give parse rules a boost in readability, it would be good to have a `SET-IN`  command to write `SET-IN container 'word <rule>`

container: make object! [a: none b: none]

```
set temp-val integer! (set in container 'a temp-val)
set temp-val string! (set in container 'b temp-val)
```

would become:

```
set-in container 'a integer!
set-in container 'b string!
```

Which is far more readable

This mechanism could be extended to any container with keys like maps




Comments:
--------------------------------------------------------------------------------

On 2022-02-13T13:31:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5068#issuecomment-1038119743>

    Not needed at all:
    
    ```
    container: make object! [a: none b: none]
    
    rule: [set a integer!]
    bind rule container
    
    parse [123] rule
    ?? container
    ```
    outputs:
    ```
    container: make object! [
        a: 123
        b: none
    ]
    ```

