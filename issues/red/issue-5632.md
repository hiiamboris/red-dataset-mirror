
#5632: Attempt to change text in a TAB-PANEL tab label can go wrong
================================================================================
Issue is closed, was reported by dsunanda and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5632>



**Describe the bug**
Attempt to change text in a TAB-PANEL tab has odd side-effect.

Change to the Nth tab's text can also change the text in the first

Windows latest build (18-jun-2025)

 
       
https://i.imgur.com/ruYBdGp.png
https://i.imgur.com/dwAeqWI.png


**To reproduce**
```
unview/all
view/no-wait [
    TP: tab-panel 300x300 [
       "aaaaa" []
       "bbbbb" []
       "ccccc" []
       ]
    return
    b: button "Before" [tp/data/3: uppercase tp/data/3 b/text: "After"  ] 
        ]
```      

**Expected behavior**
Only one tab label to change.

Workaround is to add COPY:
```
tp/data/3: uppercase COPY tp/data/3
```

**Screenshots**
https://i.imgur.com/ruYBdGp.png
https://i.imgur.com/dwAeqWI.png

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2025-07-12T19:51:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5632#issuecomment-3066005824>

    `uppercase` and `lowercase` do not trigger live updates in faces anymore, as they can't transfer proper contextual information when taking a face path argument.

--------------------------------------------------------------------------------

On 2025-07-13T08:40:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5632#issuecomment-3066724668>

    This 'fix' above was quite rushed. It just disabled deep change detection for upper/lower-case funcs. Such detection is already far from being reliable, so why are we breaking it further?
    
    Before:
    ```
    >> r: deep-reactor [s: "abc" on-deep-change*: func [o w t a n i p] [print [w i p]]]
    == make object! [
        s: "abc"
    ]
    >> uppercase r/s
    s 0 3
    == "ABC"
    ```
    After:
    ```
    >> r: deep-reactor [s: "abc" on-deep-change*: func [o w t a n i p] [print [w i p]]]
    == make object! [
        s: "abc"
    ]
    >> uppercase r/s
    == "ABC"
    ```

--------------------------------------------------------------------------------

On 2025-07-13T08:46:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5632#issuecomment-3066727417>

    The bug can be reproduced with any other change, e.g.:
    ```
    view/no-wait [
        TP: tab-panel 300x300 [
           "aaaaa" []
           "bbbbb" []
           "ccccc" []
           ]
        return
        b: button "Before" [tp/data/3: head change tp/data/3 "AAA" b/text: "After"  ] 
    ]
    ```
    
    <img width=300 src=https://github.com/user-attachments/assets/ca8b5a55-9d42-4a36-b8d0-05aa5fefb14f />
    
    `Red 0.6.6 for Windows built 13-Jul-2025/3:34:57+08:00  commit #3da04fc`

--------------------------------------------------------------------------------

On 2025-07-13T17:47:46Z, greggirwin, commented:
<https://github.com/red/red/issues/5632#issuecomment-3067192028>

    It's another case where users need to be aware of why (and when) `copy` is needed. Is a fix needed at all, or can we just document that?

--------------------------------------------------------------------------------

On 2025-07-14T05:37:07Z, dockimbel, commented:
<https://github.com/red/red/issues/5632#issuecomment-3067897788>

    A fix was needed to workaround the lack of contextual information transmitted during `deep-change` triggering (no string position info in `tab-panel/data` block, so defaulted to select the first one every time).

