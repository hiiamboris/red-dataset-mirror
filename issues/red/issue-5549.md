
#5549: Inner objects in faces blow them up
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5549>

**Describe the bug**

(A consequence of https://github.com/red/red/issues/4524 )
I wanted to hide some series from face's `on-deep-change*` by wrapping them into an object, assuming that the inner object will be the series owner and not the face itself. But if I do that, face's `on-deep-change*` trips over it with an error:
```
*** Script Error: index? does not allow none! for its series argument
*** Where: index?
*** Near : on-face-deep-change* owner word target action 
*** Stack: view show show do-safe on-created on-face-deep-change* eval-set-path 
```

**To reproduce**
1. Add a series in an object to some face:
   ```
   system/view/VID/styles/test: [default-actor: on-click-cluck template: [type: 'base size: 40x40 color: cyan text: "test" obj: object [s: []]]]
   ```
2. Test it:
   ```
   view [test on-created [append face/obj/s 'x]]
   ```
3. Observe the mentioned above error from `s` modification

**Expected behavior**

Within the scope of this ticket - no errors. Particular behavior belongs to #4524

**Platform version**
`Red 0.6.5 for Windows built 16-Aug-2024/11:34:58+08:00  commit #dbc93da`


