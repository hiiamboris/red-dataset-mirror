
#5469: Crash when attempting to set wrap? of a rich-text para! inside a draw block.
================================================================================
Issue is closed, was reported by luce80 and has 8 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5469>

**Describe the bug**
Red crashes when attempting to set `wrap?` of a rich-text `para!` inside a `draw` block.

**To reproduce**
Steps to reproduce the behavior:
```
view [
	base "hoi" draw compose [text 0x10 (rtd-layout ["Hi"])]
		ON-CREATE [
			face/draw/3/para: make para! [wrap?: false]
			face/draw/3/para/wrap?: true  ;@@ CRASH
		]
]
```

**Expected behavior**
No crash.

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-21T19:47:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5469#issuecomment-1902741404>

    ```
    *** in file: /d/devel/red/red-src/master/modules/view/backends/windows/gui.reds
    *** at line: 249
    ***
    ***   stack: gui/get-face-handle 04A6254Ch
    ***   stack: gui/update-para 04A6254Ch 5
    ***   stack: ctx||475~update-para 04A6254Ch 5
    ***   stack: red/interpreter/exec-routine 04A6253Ch
    ```

--------------------------------------------------------------------------------

On 2024-01-22T22:03:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5469#issuecomment-1904903330>

    It is not related to rich-text widget, the following shorter code results in the same error:
    ```
    view [
        base "hoi" on-create [
            face/para: make para! [wrap?: false]
            face/para/wrap?: true  ;@@ CRASH
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2024-01-22T22:14:53Z, dockimbel, commented:
<https://github.com/red/red/issues/5469#issuecomment-1904919828>

    @qtxie Please confirm that this is the right fix. Thanks.

--------------------------------------------------------------------------------

On 2024-01-23T01:34:13Z, qtxie, commented:
<https://github.com/red/red/issues/5469#issuecomment-1905132784>

    @dockimbel Yes. It's the right fix.

