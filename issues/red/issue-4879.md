
#4879: MOLD & FORM go nuts over an url in the object
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4879>

**Describe the bug**

This demoes how `mold/part` works with and without an url:
![](https://i.gyazo.com/3cb5befdc501b94027d94402a0798aa9.gif)

**To reproduce**

Create an object with an url in it and mold/part or form/part it:
```
Red []
o1: object [
    field1: "value of field1"
    field2: "value of field2"
    field3: "value of field3"
    field4: "value of field4"
    field5: "value of field5"
]
o2: make o1 [
    field6: url://here
]
i: 0
view [
	style area': area 300x200 font-name system/view/fonts/fixed
	a1: area' rate 5 on-time [
		a1/text: mold/part o1 i: i + 1
		a2/text: mold/part o2 i
		a2/selected: a1/selected: as-pair 1 i + 1
	]
	a2: area'
]
```
1. Result makes no sense
2. Ending `]` is never printed

**Expected behavior**

The one to the left

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-14T22:20:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4879#issuecomment-819885569>

    That's a fun one. Great demo. Looking at the calls from object to url's `mold`, to string/encode-url, there are things that look suspicious if you don't know the code (like me). e.g. url/mold returning zero, `:size` mapping to `string/encode-url`'s `type` arg. That's where comments would really help.

--------------------------------------------------------------------------------

On 2021-04-24T11:38:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4879#issuecomment-826079921>

    Could we have some minimal code to reproduce the issue that does not involve View and GUI animations?

--------------------------------------------------------------------------------

On 2021-04-24T12:03:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4879#issuecomment-826082765>

    ```
    >> form/part object [x: 1 u: u://rl] 1
    == "x: 1^/u: u"
    >> mold/part object [x: 1 u: u://rl] 1
    == "make object! [^/    x: 1^/    u: u"
    ```
    ?

--------------------------------------------------------------------------------

On 2021-06-24T16:28:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4879#issuecomment-867782970>

    Another issue appears with urls in blocks:
    ```
    >> [http:// 1 2 3]
    == [http://
    >> mold/part [http:// 1 2 3] 999
    == "[http://"
    ```

