
#5506: VID area blocked and slow on big text
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 16 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5506>

Vid Areas, with big text are initialy locked.
Also there is a great slowness in insertion and deletion operations 

[Gitter discussion](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$my96pQvsHNQwg17R1Ehc1H9xor84JfjRvvyElnqggnw?via=gitter.im&via=matrix.org&via=tchncs.de)

**To reproduce**
Run the following code
To unlock the area, simply insert a character with CTRL + V

```
text: "abcdefghijklmnopqrstuvzABCDEFGHIJKLMNOPQRSTUVZ1234567890!"


size: 2048 * 1048 / (length? text)

area-text: copy ""



repeat idx size [

	text: random text
	append area-text rejoin [text lf]
	 
] 


view [
	area area-text 500x500
]
```



**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 29 date: 28-Feb-2024/21:14:05 commit: #186d215db4d9260885838ca4d846c6d5ceb7e005 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-05-24T13:28:12Z, qtxie, commented:
<https://github.com/red/red/issues/5506#issuecomment-2129540031>

    Fixed the lock issue. I don't think we can fix the slowness.

--------------------------------------------------------------------------------

On 2024-05-24T13:58:28Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5506#issuecomment-2129607950>

    > Fixed the lock issue. I don't think we can fix the slowness.
    
    Hope you can do something as I have actually reached the ceiling. The documents I am working on are more than 1MB and the area is quite unusable.
    
    

--------------------------------------------------------------------------------

On 2024-05-24T19:09:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5506#issuecomment-2130193436>

    @qtxie Commenting this [scrollbar updating](https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L772) fixes the slowness issue. We need a better way to update the scrollbars in such case. Maybe only when a new row is created/deleted? Or better when the scrollbar receives the focus?
    
    There's also an excessive GC triggering caused by reactivity handling on that same event. It does not seem to affect UI performance, but it's still annoying to see a GC pass on almost every key stroke inside such overloaded `area` widget...

--------------------------------------------------------------------------------

On 2024-05-24T19:28:09Z, dockimbel, commented:
<https://github.com/red/red/issues/5506#issuecomment-2130230650>

    Actually, the `area` seems to be fine without that `update-scrollbars` code except for switching on/off the scrollbars automatically, that is then lost. It should be possible to have a lightweight solution for such need in the `area` case... Maybe have it set by the user as a face flag?

--------------------------------------------------------------------------------

On 2024-05-24T22:28:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5506#issuecomment-2130451169>

    Pushed a fix in [this branch](https://github.com/red/red/tree/issue-5506).
    
    This is a proposed temporary fix until `object!` gets an `'on-get` event (which would allow updating the facet in a lazy way). @qtxie Please review it and let me know your opinion.
    
    * Removes the slow call to `update-scrollbars` (auto-activation of scrollbars disabled, we need a solution for that).
    * Adds a new `no-sync` flag to disable auto-sync of `/text` facet.
    * Use `system/view/platform/update-text <face>` to force updating of `/text` facet with the GUI widget text content.
    
    I've tested it successfully with the above test code with following additions:
    ```
    view [
        z: area area-text 500x500 with [flags: 'no-sync]
        button "Sync" [system/view/platform/update-text z]
    ]
    ```

--------------------------------------------------------------------------------

On 2024-05-25T01:24:27Z, qtxie, commented:
<https://github.com/red/red/issues/5506#issuecomment-2130642764>

    @dockimbel I think it's OK to do the changes.

--------------------------------------------------------------------------------

On 2024-05-25T07:03:27Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5506#issuecomment-2130985617>

    Here it works, the slowness has disappeared!
    

--------------------------------------------------------------------------------

On 2024-05-25T19:58:59Z, dockimbel, commented:
<https://github.com/red/red/issues/5506#issuecomment-2131418116>

    Fix merged to master. Let us know if any regression on `area` behavior occurs on Windows platform.

