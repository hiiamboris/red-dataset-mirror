
#1571: Regression: group-box size ignores content
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1571>

Unlike before, `group-box` has a fixed size of about `200x200` no matter how big the content is:

```
view [
    group-box [
        text "This is a really long text. I don't think the group-box will accomodate it like it used to."
        return
        field "This is a really long field. I don't think the group-box will accomodate it either."
        return
        area "Even this area isn't safe."
    ]
]
```

Or how small:

```
view [
    group-box [
        text "Granny, what large size you have!"
    ]
]
```

The size can still be specified in VID, though:

```
view [
    group-box [
        text "Hello, World!"
    ] 100x100
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T04:02:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1571#issuecomment-178358978>

    Good catch, I knew there was a good reason why those widgets didn't have a default size in the first place. ;-)

--------------------------------------------------------------------------------

On 2016-02-02T04:44:05Z, WiseGenius, commented:
<https://github.com/red/red/issues/1571#issuecomment-178371579>

    In the second example, the `group-box` is still about `200x200` and doesn't shrink to the smaller size like it used to.

--------------------------------------------------------------------------------

On 2016-02-02T04:57:41Z, WiseGenius, commented:
<https://github.com/red/red/issues/1571#issuecomment-178376087>

    Also, removing the `area` from the first example makes `group-box` revert back to being too small:
    
    ```
    view [
        group-box [
            text "This is a really long text. I don't think the group-box will accomodate it like it used to."
            return
            field "This is a really long field. I don't think the group-box will accomodate it either."
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2016-02-02T08:10:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1571#issuecomment-178437820>

    Should be the right fix now.

