
#5487: WindowsXP compile target does not work for any source: error in draw-gdi.reds, in function: exec/gui/draw-begin
================================================================================
Issue is closed, was reported by wesinator and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5487>

**Describe the bug**
The WindowsXP target of redc does not work for any source.

any source file will give this error:
```
Target: WindowsXP
 
Compiling to native code...
*** Compilation Error: left and right argument must be of same type for: <>
*** left: float32!, right: integer!
*** in file: %/C/<winpath>/<user>/<working_dir>/modules/view/backends/windows/draw-gdi.reds
*** in function: exec/gui/draw-begin
*** at line: 651
*** near: [<> dpi-factor 100 [
        ratio: (as float32! dpi-factor) / (as float32! 100.0)
        GdipScaleWorldTransform graphics ratio ratio 0
        ctx/scale-ratio: ratio
    ]]
```

**To reproduce**
Steps to reproduce the behavior:
1. [calculator example](https://raw.githubusercontent.com/red/code/master/Showcase/calculator.red) (this is the example I used but the error is the same for any source file).
2. compile with `redc -r -t WindowsXP calculator.red`

**Expected behavior**
Compiles an XP compatible binary in the view mode, that does not use the unsupported Windows GetGestureInfo API.

**Screenshots**
![redc_windowsxp_mode_err](https://github.com/red/red/assets/5124946/f5895e09-c3d9-4bbe-99e9-dd71d506511e)

**Platform version**
Tested on Windows 10 and Windows XP compilation hosts.

red-toolchain-21feb24-58b8f8937

Also, the red REPL seems to be compiled for the Windows target that uses Windows 7+ gesture APIs, which means the binary doesn't load even though it technically would work on XP:
![redview_xp_getgestureinfo](https://github.com/red/red/assets/5124946/62e522f4-498a-489e-a34e-b5072c6c7530)

it would make more sense for the red REPL to be compiled with a WindowsXP target (once this bug is fixed), given that the system is already 32-bit only anyway.

[NO_TRAIN]::


