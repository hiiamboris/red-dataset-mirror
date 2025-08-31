
#5633: Function constructor ignores the spec's index
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5633>

**Describe the bug**
```
>> f: func [x y] [x + y]
== func [x y][x + y]
>> spec: next spec-of :f
== [y]
>> g: func spec [1 + y]
== func [x y][1 + y]
```

**Expected behavior**

`== func [y][1 + y]`

**Platform version**
`Red 0.6.6 for Windows built 13-Jul-2025/21:27:17+08:00  commit #31205e5`


Comments:
--------------------------------------------------------------------------------

On 2025-07-22T19:36:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5633#issuecomment-3104584992>

    The `function!` internals cannot store the spec block offset (that would require a lot of extra code everywhere in the runtime), so either we require the user to copy the spec when not at head or the copying will be done internally in such cases. Which one do you prefer?
    
    ```
    >> g: func copy spec [1 + y]
    == func [y][1 + y]
    ```
    
    NB: I've switched the ticket type to `type.review` as that was the intended behavior.

--------------------------------------------------------------------------------

On 2025-08-04T07:28:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5633#issuecomment-3149445104>

    Internal copying is probably a lesser of evils.

