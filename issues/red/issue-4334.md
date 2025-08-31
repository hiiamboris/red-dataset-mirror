
#4334: [VID] Incorrect height inferrence from DROP-DOWN
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4334>

**Describe the bug**

Layout size does not stretch to account for `drop-down` size:
`view [drop-down font-size 50]`
![](https://i.gyazo.com/d3d44cbe4b77eb6a58035476f15d2d68.png)

**Expected behavior**

![](https://i.gyazo.com/9cefa6f7035934e732e674507ea03182.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-12T23:19:28Z, qtxie, commented:
<https://github.com/red/red/issues/4334#issuecomment-598474073>

    Remember that on some platforms the height of some controls (drop-down, field, etc.) cannot be changed. For example on macOS the controls have very limited customization.

--------------------------------------------------------------------------------

On 2020-03-12T23:59:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4334#issuecomment-598483470>

    Then the question is whether we standardize to the lowest common denominator, for portability, or make each platform work the best it can, and user's have to know that not all behavior is portable. Not being a MacOS guy, how does XCode other others tell you that you can do that?

--------------------------------------------------------------------------------

On 2020-03-14T08:39:21Z, henrikmk, commented:
<https://github.com/red/red/issues/4334#issuecomment-599028854>

    I don't think one should go for the lowest common denominator, as that will cause more problems than offering a workaround to affected platforms.
    
    The lowest common denominator has to be coded and tested for, for every platform that Red supports, whereas workarounds only are for affected platforms.
    
    The workaround can then be removed, once the platform support is rectified through OS changes or a custom widget is created that solves the problem.

--------------------------------------------------------------------------------

On 2020-03-21T17:40:50Z, 9214, commented:
<https://github.com/red/red/issues/4334#issuecomment-602077614>

    Related: https://github.com/red/red/issues/1437 https://github.com/red/red/issues/1791 https://github.com/red/red/issues/2796 https://github.com/red/red/issues/3760 https://github.com/red/red/issues/3827 https://github.com/red/red/issues/3861
    
    As @greggirwin said, we need to cut that knot and decide if we support the truly cross-platform feature subset or push each platform as far as it can go, noting the differences between them.

--------------------------------------------------------------------------------

On 2020-05-15T08:01:05Z, qtxie, commented:
<https://github.com/red/red/issues/4334#issuecomment-629092559>

    The point of using a native GUI framework is making the APP follows the guidelines of the OS UI, not customize the widgets. We'd better to put our effort in a new customizable GUI framework, rather than hacking the native GUI.

--------------------------------------------------------------------------------

On 2020-05-15T16:19:39Z, greggirwin, commented:
<https://github.com/red/red/issues/4334#issuecomment-629351912>

    I mostly agree with @qtxie, but I come back to my question: how does XCode other others tell you that you can do that? Do Mac developers expect this, and is it something we can fix with language. That is, in the docs, we just note this behavior and limitation. 

--------------------------------------------------------------------------------

On 2020-05-16T02:45:22Z, qtxie, commented:
<https://github.com/red/red/issues/4334#issuecomment-629577199>

    IIRC, You cannot change the height of drop-down in the Interface Builder editor in XCode, and there are no APIs to do it.

--------------------------------------------------------------------------------

On 2020-05-16T03:11:46Z, greggirwin, commented:
<https://github.com/red/red/issues/4334#issuecomment-629579812>

    In that case, we can _easily_ note this limitation in the docs, IMO.

