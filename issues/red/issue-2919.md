
#2919: access violation then setting `on-change*` inside object to non-function
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2919>

```Red
gollum: object [
    on-change*: func [my-precious old new][
        print "nuh-uh!"
        self/my-precious: old
    ]
    my-precious: 'Ring
]

gollum/on-change*: 'violate!
```
```Red
*** Runtime Error 1: access violation
*** at: 00437577h
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-23T11:33:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2919#issuecomment-317246798>

    The object event API is a work in progress, so all the possible checks for valid definitions are not yet implemented.

--------------------------------------------------------------------------------

On 2018-03-11T12:27:47Z, endo64, commented:
<https://github.com/red/red/issues/2919#issuecomment-372111617>

    Just a note, using `set` also leads to same issue
    
    ```
    >> o: object [a: 1 on-change*: func [w o n] []]
    >> set o none
    *** Script Error: invalid argument: none
    >> o/a: 2
    *** Script Error: invalid argument: none
    >> body-of o
    == [a: 2 on-change*: none]  ;<<<
    ```

--------------------------------------------------------------------------------

On 2018-03-11T12:47:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2919#issuecomment-372112858>

    @endo64 Please open a new ticket, and reference this one.

