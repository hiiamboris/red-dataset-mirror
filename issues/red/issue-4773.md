
#4773: [VID] Button reordering logic assumes equal button size, makes buttons overlap
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[status.problem] [GUI] [type.design]
<https://github.com/red/red/issues/4773>

[December 19, 2020 1:36 AM](https://gitter.im/red/bugs?at=5fdd2eeb93af5216fc4d3925)

**Describe the bug**

Off the top of my head:
![](https://i.gyazo.com/67d434ac2540179ec17d3fc962dee5be.png)
![](https://i.gyazo.com/52d5f85a7f87a742a3d313470bf10dad.png)
![](https://i.gyazo.com/73c4d2347a284480d0d8eddaf44c75ff.png)

**To reproduce**
`view [button "cancel" button "show another"]`
`view [button 50 "cancel" button 100 "longer text" button 20 "OK"]`
`view [panel 2 [below button 50 "cancel" field button 100 "longer text" field button 20 "OK" field]]`

**Expected behavior**

Well, that's the whole challenge here ;) How to rearrange the layout so that it's not messed up.
Ideally, produced layout should look as if the corresponding VID expressions for these buttons were swapped: `button 50 "cancel" button 20 "OK"` -> `button 20 "OK" button 50 "cancel"`, so this may require an additional processing stage.

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```



