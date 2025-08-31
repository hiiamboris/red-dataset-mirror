
#4818: set-focus fails on window faces
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/4818>

**Describe the bug**
```
>> w: view/no-wait [base green] ()
>> set-focus w            ;) fails!
*** Script Error: path none is not valid for none! type
*** Where: eval-path
*** Stack: set-focus  
>> set-focus w/pane/1     ;) works!
```

**Expected behavior**

`set-focus` activates the selected window. Esp. useful when having multiple windows.

**Platform version**
```
Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-03T18:39:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4818#issuecomment-772730454>

    That feature is not implemented yet, but it would be a useful addition. The window's `/selected` facet should be set to a logic value to track which window is currently active.

--------------------------------------------------------------------------------

On 2021-02-03T18:42:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4818#issuecomment-772732285>

    What about `screen/selected`? Will it be used?
    Though I suspect regardless of screens count, there's only one active window..

--------------------------------------------------------------------------------

On 2023-04-25T22:42:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4818#issuecomment-1522510855>

    > That feature is not implemented yet, but it would be a useful addition. The window's `/selected` facet should be set to a logic value to track which window is currently active.
    
    This won't work IMO. Each window has its own single focused control, and when you switch from window to window, focus should return into the same control where it was. Setting it to a logic value is losing it.
    
    On one hand, keyboard focus is a single system-wide value.
    
    On another hand it is remembered on many levels:
    - each window remembers last focused control on window switch
    - tab-panel pane, browser tabs (pages), playlists, and any other custom paging controls we may invent (e.g. in Spaces) remember last focused item on page switch
    - field and area controls could be made to remember caret location in a similar way when refocused
    - calendar keeps its selected item on refocus
    
    Basically we can model it all as a tree, where only single path is focused at the same time, but switch between branches restores any path on that branch. Having /selected facet of each widget point to its immediate children or caret locationo should work fine as long as we have a root to start looking from.
    
    Screens seems to be the only thing breaking the model. If screens represent displays, multiple screen faces do not work, because single window can span any number of displays. Active window is also one on all displays, not one per display. I suggest revising `screens` idea, leaving single screen and providing another way to query multi-display metrics.
    
    For focus R2 rightly used single focal-face, but when we go beyond faces it's trickier. I'm using a path for focus in Spaces (as for many other things), because there focus doesn't end at a face but goes deeper into it. Of course if /selected facet was uniform across the View subsystem we could easily reconstruct this path from it. For that it would be better to set it to a child face object rather than to a number. Both because we don't want to move focus into another child if something is added/removed from the pane, and because it will be easier to construct a path, just by iterating while /selected is an object.

--------------------------------------------------------------------------------

On 2024-09-23T17:16:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4818#issuecomment-2368893802>

    Funny, without any `screen/selected` `set-focus` of any face on Windows activates its window as well. But not on GTK.

