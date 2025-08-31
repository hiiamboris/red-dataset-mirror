
#5471: Rich-text size is inconsistent across various setups.
================================================================================
Issue is closed, was reported by luce80 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5471>

**Describe the bug**
Rich-text size is inconsistent across various setups.

**To reproduce**
```
view [
	below space 0x0
	rich-text 100x20 data [font 9 "ABCDEFGHIJKLM" /font] 			; assigned size 9
	rich-text 100x20 data ["ABCDEFGHIJKLM"]					;@@ gets size 9.178...
	rich-text 100x20 data [font 10 "ABCDEFGHIJKLM" /font]			; assigned size 10
	rich-text 100x20 data ["ABCDEFGHIJKLM"] with [font: make font! []] 	;@@ gets size 10 but system/view/fonts/size = 9`
] 
```
This is similar but even more evident.
```
view [
	rich-text "abcdABCDEFGH"
		draw compose [
			pen red
			text 0x10 (rt: rtd-layout ["abcdABCDEFGH"])
		]
		on-created [
			rt/font: make font! [color: blue] ;@@ changes rt font size (and not color?)
		]
]
```

**Expected behavior**
2 and 4 should be identical and no "strange" size should appear. Perhaps the 2nd size is due to a (not)-rounding error?

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-25T03:27:27Z, qtxie, commented:
<https://github.com/red/red/issues/5471#issuecomment-1909283493>

    ```
    view [
    	rich-text "abcdABCDEFGH"
    		draw compose [
    			pen red
    			text 0x10 (rt: rtd-layout ["abcdABCDEFGH"])
    		]
    		on-created [
    			rt/font: make font! [color: blue] ;@@ changes rt font size (and not color?)
    		]
    ]
    ```
    `pen` color overrides font color in DRAW.

--------------------------------------------------------------------------------

On 2024-02-13T18:56:58Z, luce80, commented:
<https://github.com/red/red/issues/5471#issuecomment-1942192220>

    After fix, the second example is still wrong because changing "rt" font! with a new one makes its SIZE bigger.

--------------------------------------------------------------------------------

On 2024-02-14T12:23:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5471#issuecomment-1943668011>

    Fixed, thanks.

