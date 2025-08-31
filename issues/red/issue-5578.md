
#5578: [View] R/S-initiated changes to face/state are not triggering on-change
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.wish] [GUI]
<https://github.com/red/red/issues/5578>

**Describe the bug**

My idea was to track the moment `face/state` becomes `none` so I would know that any keyboard focus on that face is now invalid and I need to restore it to another target.

I know `face/state` is [excluded from reactivity's scope](https://github.com/red/red/blob/66b2f5ba1fbb789f542928375f44fe669ab429f5/modules/view/view.red#L451) for some reason. However I expect that `on-change*` should not itself be affected.

When I inject tracking code into `on-change*` however, I see a lot of changes being missed. In the below code, after 1 second the base is auto-removed from the pane, so it state becomes `none`
```
>> view [b: base with [on-change*: func spec-of :on-change* compose [print ["CHANGE" word mold/flat/part :old 20 '=> mold/flat/part :new 20] (body-of :on-change*)]] rate 1 on-time [?? b/state remove b/parent/pane ?? b/state b/state: b/state]]
CHANGE on-change* func [word old new / => func [word old new /
CHANGE options none => [style: base vid-ali
CHANGE offset none => 10x10
CHANGE parent make object! [type:  => make object! [type: 
CHANGE state none => [handle! 0 none fals                        ;) first assignment is being detected
b/state: [handle! 0 none false]
CHANGE parent make object! [type:  => none
b/state: none                                                    ;) was set to none since, but change was missed
CHANGE state none => none                                        ;) manual change gets detected as expected
```

**To reproduce**
1. Run ` view [b: base with [on-change*: func spec-of :on-change* compose [print ["CHANGE" word mold/flat/part :old 20 '=> mold/flat/part :new 20] (body-of :on-change*)]] rate 1 on-time [?? b/state remove b/parent/pane ?? b/state b/state: b/state]]` - should reflect setting of `state` to `none`.
2. Run `view [b: base with [on-change*: func spec-of :on-change* compose [print ["CHANGE" word mold/flat/part :old 20 '=> mold/flat/part :new 20] (body-of :on-change*)]] rate 1 on-time [?? b/state unview ?? b/state b/state: b/state]]` - also should reflect it.

**Expected behavior**

`on-change*` should detect facet changes done from R/S side

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 217 date: 28-Nov-2024/20:56:25 commit: #a69159226c6885ef7e67c7c9bc50514fd49f03b2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```
See also https://github.com/red/red/issues/5575


Comments:
--------------------------------------------------------------------------------

On 2025-03-13T10:26:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5578#issuecomment-2720743572>

    > on-change* should detect facet changes done from R/S side
    
    See my related comment there: https://github.com/red/red/issues/5575#issuecomment-2720711185
    
    > I know face/state is [excluded from reactivity's scope](https://github.com/red/red/blob/66b2f5ba1fbb789f542928375f44fe669ab429f5/modules/view/view.red#L451) for some reason.
    
    It's excluded because `/state` is meant for internal use only. It's exposed in the face object because we don't have anywhere else to put it internally and there's no way to hide or make some fields "private" in objects yet. 
    
    > My idea was to track the moment face/state becomes none so I would know that any keyboard focus on that face is now invalid and I need to restore it to another target.
    
    The user-level way to check if a face is "alive" or not is its `/parent` field. If a face is connected to a face tree with a `screen` face as root, it's operational and can interact with the GUI engine. If it's disconnected from such face tree (`/parent` set to `none`), then it's just a face object with no effect on the GUI engine. So, you can rather use `/parent` to track the face liveness and that field triggers reaction when set to `none`.

--------------------------------------------------------------------------------

On 2025-03-16T07:19:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5578#issuecomment-2727238253>

    In theory sounds sound, but in practice:
    ```
    >> view [b: base rate 99 on-time [unview]] ? b/parent/type ? b/parent/parent/type
    B/PARENT/TYPE is a word! value: window
    
    B/PARENT/PARENT/TYPE is a word! value: screen
    ```

--------------------------------------------------------------------------------

On 2025-03-16T10:32:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5578#issuecomment-2727322188>

    I would consider that a bug. We should severe those parent links (at least the one with the `screen` face).

