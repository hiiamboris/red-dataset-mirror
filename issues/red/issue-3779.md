
#3779: System sound plays when pressing the TAB key in a field (view).
================================================================================
Issue is closed, was reported by amreus and has 8 comment(s).
[status.built] [type.wish] [GUI]
<https://github.com/red/red/issues/3779>

**Describe the bug**
A system sounds plays when pressing the tab key in a `view` field.

**To reproduce**
Steps to reproduce the behavior:
1. Create a view window with one or more fields.
2. Click to focus the cursor in any field.
3. Press the tab key.

Tab Navigation Example Code:

```
Red [ needs: 'view]

key-handler: function [evt next-fld] [
    switch evt/key reduce [
        tab [ set-focus get next-fld ]
    ]
]

view [
    title "New Person"
    style fld: field 150

    text "First Names"
    name: fld on-key [key-handler event 'surname]
    return

    text "Surname"
    surname: fld on-key [key-handler event 'name ]
    return

    button "Save" []
    button "Cancel" [unview]

    do [ set-focus name ]
]
```

**Expected behavior**
No sound is expected.  On Windows the tab key is expected to navigate to the next field on forms without audio feedback.  


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Feb-2019/13:45:38-05:00 commit #a4d8240

```



Comments:
--------------------------------------------------------------------------------

On 2019-02-10T16:41:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/3779#issuecomment-462149669>

    Confirmed on W7 x64. I intentionally enabled a sound scheme in audio settings and pressing tab does produce a sound.
    
    @amreus you should probably also append your tab-navigation code to show that the sound remains there even when you have a handler for the on-key event.

--------------------------------------------------------------------------------

On 2019-02-11T00:48:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3779#issuecomment-462197611>

    @amreus, good, well-formed ticket. Thanks for that. This is a known issue, as the native control doesn't automatically support tabbing as you expect. This plays in to the much larger design issue of tab control and ordering in GUIs, which is why it hasn't been addressed yet. We *might* be able to do the simplest thing right now, but @qtxie would have to say if it's worth the effort, knowing it may change in the future.

--------------------------------------------------------------------------------

On 2019-02-11T23:28:17Z, amreus, commented:
<https://github.com/red/red/issues/3779#issuecomment-462537799>

    As a hobbyist, the issue just an annoyance.  If I were distributing or selling software made with Red then the issue would be quite unacceptable.  But to me at this moment the issue is not terribly important - only filed it for the record.

--------------------------------------------------------------------------------

On 2019-02-11T23:45:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3779#issuecomment-462541764>

    Remember that Red is still Alpha software. 

