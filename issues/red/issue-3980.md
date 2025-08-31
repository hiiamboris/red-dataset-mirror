
#3980: [macOS] `layout/parent` causes access violation
================================================================================
Issue is closed, was reported by nulldatamap and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3980>


**Describe the bug**
The usage of `layout/parent` in this specific context results in an access violation.

**To reproduce**
Running the following code:
```red
Red [needs 'view]

view [
	panel on-down [
		layout/parent compose [
			text "A: " text "B"
		] crash-box none
	]
    crash-box: group-box []
]
```
Then clicking on the panel, results:
```
*** Runtime Error 1: access violation
*** at: A6C1CF13h
```

**Expected behavior**
The face tree to be built and added to `crash-box` without crashing.

**Platform version**
```
Red 0.6.4 for macOS built 9-Aug-2019/10:17:57+02:00 commit #8a9920e
```



Comments:
--------------------------------------------------------------------------------

On 2019-08-09T14:01:26Z, 9214, commented:
<https://github.com/red/red/issues/3980#issuecomment-519930815>

    Cannot reproduce on W10.

--------------------------------------------------------------------------------

On 2019-08-09T14:19:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3980#issuecomment-519937205>

    Cannot reproduce on W7 either, seems to be macOS-specific.

--------------------------------------------------------------------------------

On 2019-08-09T19:22:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/3980#issuecomment-520035239>

    reminds me of https://github.com/red/red/issues/3762 , although that one crashes on Windows.

--------------------------------------------------------------------------------

On 2019-08-09T20:18:04Z, 9214, commented:
<https://github.com/red/red/issues/3980#issuecomment-520050454>

    @hiiamboris would be great if anyone with macOS compared stack dumps.

