
#3788: [View] unwanted `menu` transfer onto `alt-down` of another face
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3788>

**Describe the bug**

`menu` of one face can be carried over to another face where it wasn't defined:

**To reproduce**
```
view [
	a: text-list data ["1" "2"] with [menu: ["entry" entry]]
	b: base on-alt-down [a/selected: 1]
]
```
right-click on the base `b` square: it shows the menu that was defined for `a` only

**Expected behavior**

`b` should not have any menus popping up

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-21T00:28:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3788#issuecomment-465811842>

    Something to do with overriding `on-alt-down`.
    ```
    view [
    	a: text-list data ["1" "2"] with [menu: ["entry" entry]]
    	b: base with [menu: ["B entry" entry]] ; B's menu
    ]
    
    view [
    	a: text-list data ["1" "2"] with [menu: ["entry" entry]]
    	b: base ; no menu
    ]
    ```

--------------------------------------------------------------------------------

On 2019-02-21T00:48:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/3788#issuecomment-465816084>

    Yes. With both `on-alt-down` and `selected:`

--------------------------------------------------------------------------------

On 2019-02-21T06:56:12Z, qtxie, commented:
<https://github.com/red/red/issues/3788#issuecomment-465884236>

    Looks like something wrong in VID.

--------------------------------------------------------------------------------

On 2020-02-28T18:35:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/3788#issuecomment-592666089>

    Seems to have been fixed between Apr 13 and Apr 22, 2019. 
    Probably by https://github.com/red/red/commit/069f33520c00c57f297886fc7272f60a259579bb

