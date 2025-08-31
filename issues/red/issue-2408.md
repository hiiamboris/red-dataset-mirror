
#2408: compiling gui-console naively (such as with README instructions) gives a missing gui error
================================================================================
Issue is closed, was reported by geekyi and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2408>

**tl;dr** : user error
```
Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined context gui
*** in file: %/C/Users/XX/Documents/GitHub/red/red/environment/console/terminal.reds
*** at line: 1478
*** near: [
    with gui [
        #script %/C/Users/XX/Documents/GitHub/red/red/environment/console/windows.reds
        ps: as tagPAINTSTRUCT 0
```
Actually, I had encountered this error before. And maybe others in the past.
After trying various things, I realize I may be just encountering a host of minor usability bugs created by the modularization of red and `libred` .. which I'd tried to debug before and forgot about.
## Steps to reproduce
Clear libred files:
 ```
do/args %red.r clear`
```
Compile:
Note: This works with using either `>> do/args %red.r <file>` or `>> rc <file>`
 ```
rc "%environment/console/gui-console.red"
```
## Workaround
```
rc "-t windows %environment/console/gui-console.red"
```
## Conclusion
So I'd actually forgot how I had to compile %gui-console.red. And the big error dump had me confused.
Trying to compile %console.red gives a better error:
```
>> rc "-t windows %environment/console/console.red"

-=== Red Compiler 0.6.1 ===-

Compiling C:\Users\XX\Documents\GitHub\red\red\environment\console\console.red ...
*** Compilation Error: Windows target requires View module (`Needs: View` in the header)
*** in file: %/C/Users/XX/Documents/GitHub/red/red/environment/console/console.red
```
## Solutions?
1. Put instructions for gui `rc "-t windows"` in the README (maybe a `gui` target would be better?)
2. Give an error complementary to `(`Needs: View` in the header)`
3. Make the default target gui (not MSDOS) on windows?
4. Automagically switch between targets


Comments:
--------------------------------------------------------------------------------

On 2019-09-14T19:18:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2408#issuecomment-531506323>

    The GUI console needs to be compiled in release mode. The instructions in README file were updated by commit https://github.com/red/red/commit/cd0d31ccfbbad4cde6860c9a265f879f0daead09.

