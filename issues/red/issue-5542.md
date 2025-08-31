
#5542: [View] False focus events when interacting with the taskbar icon
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/5542>

**Describe the bug**

Window receives a false `on-focus` event as I observe in two cases:
- when window was in focus and became unfocused as a result of click on its icon in the taskbar (`unfocus focus` sequence)
- when window was not in focus and became focused as a result of click on its icon in the taskbar (`focus focus` sequence)

<img width=300 src=https://i.gyazo.com/e0357ebe6ddf76cee7fc5645a0f09ee3.gif />

**To reproduce**

1. Run the following script in CLI+View console:
```
Red []

insert-event-func 'test func [fa ev] [
	if all [fa/type = 'window find [focus unfocus] ev/type] [print [now/time tab fa/size ev/type]]
]
view []
```
2. Follow steps from the bug description

**Expected behavior**

No false `focus` event in both cases

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 182 date: 16-Aug-2024/3:34:58 commit: #dbc93da47047667023a66c5edf1aa1d63ff6f0d0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-09-23T15:56:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5542#issuecomment-2368715446>

    Related somewhat https://github.com/red/red/issues/3728

--------------------------------------------------------------------------------

On 2024-09-23T17:36:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5542#issuecomment-2368936099>

    On GTK - no `focus` or `unfocus` events at all, no matter what I do.

--------------------------------------------------------------------------------

On 2024-09-25T02:32:00Z, qtxie, commented:
<https://github.com/red/red/issues/5542#issuecomment-2372765758>

    I got this on Win11:
    ```
    >> view []
    10:28:55        131x100 unfocus
    10:28:56        131x100 focus
    10:28:56        131x100 focus
    10:28:57        131x100 unfocus
    10:28:59        131x100 focus
    10:28:59        131x100 focus
    10:29:03        131x100 unfocus
    ```
    
    Only case 2 `focus focus` occurs. case 1 works correctly on Win11.

