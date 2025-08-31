
#3430: invisible window appears when using the alpha channel
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug] [status.reviewed] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/3430>

[/bugs discussion](https://gitter.im/red/bugs?at=5b2b75967da8cd7c8c5fe072)

### Expected behavior
```
view [base 100x100 99.99.0 focus on-key [unview]]
```
creates a window which is **active** and when you close it by alt-f4 it unviews itself

### Actual behavior
now I'm adding .0 to the color (or any other number, doesn't matter, just to make it 4-tuple):
```
view [base 100x100 99.99.0.0 focus on-key [unview]]
```
creates a window with **inactive** title bar and the `base`
and another invisible window that accepts the keyboard input!

When I press alt-f4 the invisible window is closed and the main window becomes active. After that:
- input is not accepted anymore
- the parent window that is now active does not contain the base square
- another alt-f4 hit closes this window


### Steps to reproduce the problem
no one in the chat room was able to reproduce it, but I have this behavior on both nightly and stable builds

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-30T16:52:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/3430#issuecomment-450573018>

    No longer relevant in 30 Dec 2018 build.

--------------------------------------------------------------------------------

On 2019-03-23T22:24:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3430#issuecomment-475909874>

    `view [base 100x100 99.99.0.0 focus on-key [unview]]` works
    `view [base 100x100 99.99.0.1 focus on-key [unview]]` doesn't. Alt-F4 tends to "close" layered bases instead of the window - very annoying.
    Plus the inactive title bar thing, not so important.

--------------------------------------------------------------------------------

On 2019-03-27T17:10:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3430#issuecomment-477259563>

    Can't reproduce on Win10. Likely Win7 specific.

