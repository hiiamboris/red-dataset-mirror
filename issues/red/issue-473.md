
#473: #export doesn't work in CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/473>

```
Red/System []

c: context [
    e: does []
    #export [e]
]
```

-= Red/System Compiler =- 
**\* Compilation Error: undefined exported symbol: e 
**\* at line: 5 
**\* near: [
    #export [e]
]



Comments:
--------------------------------------------------------------------------------

On 2013-05-04T16:36:21Z, dockimbel, commented:
<https://github.com/red/red/issues/473#issuecomment-17437123>

    I will rather support paths in #export directive, as I prefer people to use such directive from global context, so your code would become:
    
    ```
    Red/System []
    
    c: context [
        e: does []
    ]
     #export [c/e]
    ```

