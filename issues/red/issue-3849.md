
#3849: event-eating TEXT face
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3849>

**Describe the bug**

Let `F` be `field` or `area` face and let `T` be `text` face. 

With that said, insertion of `event/key` into `T/text` facet from within `F`'s event handler effectively "eats" the said event. 

**To reproduce**
```red
view [t: text "" field on-key [append t/text event/key]]
```
Typing text updates `t` without updating `field`. 

**Expected behavior**
I expect `field` to behave as usual.

**Screenshots**
![bug](https://user-images.githubusercontent.com/15716466/56421429-e1e81300-62bb-11e9-9957-070d9622fa1e.gif)


**Platform version (please complete the following information)**
Latest, W10.



