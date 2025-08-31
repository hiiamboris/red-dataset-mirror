
#1643: Removing item from TEXT-LIST is not reflected in GUI under certain conditions
================================================================================
Issue is open, was reported by rebolek and has 2 comment(s).
[status.waiting] [type.review] [GUI]
<https://github.com/red/red/issues/1643>

This one is bit tricky to trigger. It requires there’s TEXT-LIST **and** TAB-PANEL in the layout and that you are removing from **both** widgets. Compile this code:

```
Red [
    Needs: 'View
]

data: ["one" "two" "three" "four"]

view [
    l: text-list data data
    t: tab-panel 300x200 ["one" [] "two" [] "three" [] "four" []]
    return
    button "del" [
        remove back tail data
        remove back tail t/pane
        t/data: data
    ]
]
```

Press **[del]** twice, two values get removed. Press it third time, tab is properly removed, but there are still two items in the text-list. Same with fourth click.



Comments:
--------------------------------------------------------------------------------

On 2016-02-21T07:40:24Z, dockimbel, commented:
<https://github.com/red/red/issues/1643#issuecomment-186768049>

    You are sharing the same `data` block between the two faces, this is not properly supported yet as it requires some changes in the ownership system, which won't happen in this release.
    
    As a workaround, if you re-assign the `data` block to the text-list too, you will get a proper refresh:
    
    ```
    data: ["one" "two" "three" "four"]
    
    view [
        l: text-list data data
        t: tab-panel 300x200 ["one" [] "two" [] "three" [] "four" []]
        return
        button "del" [
            remove back tail data
            remove back tail t/pane
            l/data: t/data: data
        ]
    ]
    ```

