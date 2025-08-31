
#1674: Regression on auto-updating display after changing window's pane
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1674>

```
view win: layout [
    button "test" [
        append win/pane make face! [
            type: 'button
            text: "new"
            offset: 70x10
            size: 40x30
        ]
        ;show win       <-- shouldn't need show call in auto-sync mode
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-06T12:31:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1674#issuecomment-192883822>

    The following [line](https://github.com/red/red/blob/master/modules/view/VID.red#L342) is causing the problem. 
    
    @qtxie We need to have a look together at how to fix that properly.

--------------------------------------------------------------------------------

On 2016-03-07T08:51:47Z, qtxie, commented:
<https://github.com/red/red/issues/1674#issuecomment-193162747>

    @dockimbel As you already know, this [line](https://github.com/red/red/blob/master/modules/view/VID.red#L342) of code is intend to fix the issue in this code in `livecode.red`:
    
    ```
    if attempt [lay: layout load source/text][
        output/pane: lay/pane
    ]
    ```
    
    I just figure out that the problem is when we do `output/pane: lay/pane`, we don't change the owner of the `lay/pane`, the `lay/pane`'s owner is still `lay` object. see the [bind](https://github.com/red/red/blob/master/runtime/ownership.reds#L103) function.
    
    So how do we solve it ? 
    1. Do we just change the owner to another object ?
    2. Should we allow multi-owner ?

