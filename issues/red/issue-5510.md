
#5510: [Regression] CLI console can't be compiled with the native GUI backend
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5510>

**Describe the bug**

Current CLI `console.red` code with only the Config commented out:
```
Red [
	Title:	"Red console"
	Author: ["Nenad Rakocevic" "Kaj de Vos"]
	File: 	%console.red
	Tabs: 	4
	Needs:	[JSON CSV View]
	; Config: [GUI-engine: 'terminal]
	Rights: "Copyright (C) 2012-2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %input.red
#include %../help.red
#include %../engine.red

cli-console-ctx: context [
	settings: #include %settings.red

	launch: does [
		settings/load-cfg

		system/console/init "Red Console"
		system/console/launch
	]
]

_save-cfg: function [][
	cli-console-ctx/settings/save-cfg
]

cli-console-ctx/launch
```
`redc -r console.red` results in:
```
Compiling to native code...
*** Compilation Error: wrong syntax in SWITCH block at: VK_RETURN return KEY_ENTER default return KEY_NONE
*** in file: %/D/devel/red/red-src/red/environment/console/CLI/win32.reds
*** in function: exec/terminal/fd-read
*** at line: 212
*** near: [[37 [return -23] 39 [return -22] 38 [return -20] 40 [return -21] 45 [return -26] 46 [return -27] 36 [return -25] 35 [return -24] 33 [return -28] 34 [return -29]
        VK_RETURN [return KEY_ENTER]
        default [return KEY_NONE]
    ]]
```
Same result if I specify `Config: [GUI-engine: 'native]` explicitly.

**Expected behavior**

Successful compilation, backend should not be TUI.

**Platform version**
```
Red 0.6.5 for Windows built 15-Jun-2024/10:46:42+03:00  commit #b9c77bc
```


