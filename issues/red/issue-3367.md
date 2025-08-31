
#3367: GUI Console App crashes on macOS when loaded via Apple Scripting
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3367>

### Expected behavior
The GUI console will be opened
### Actual behavior
The GUI Console crashes:

```text
Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BREAKPOINT (SIGTRAP)
Exception Codes:       0x0000000000000002, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Trace/BPT trap: 5
Termination Reason:    Namespace SIGNAL, Code 0x5
Terminating Process:   exc handler [0]

Application Specific Information:
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid parameter not satisfying: [self canBecomeMainWindow]'
```
[Full crash log](https://gist.github.com/PeterWAWood/0676f20a0176cf71ea949fc34c3d55cc)  

I get the same crash trying to open the GUI console from AppleScript.

There is no crash if the GUI console is already running.

### Steps to reproduce the problem
1. Open macOS ScriptEditor app.
2. Enter either the following line of AppleScript or JavaScript, replacing macView with the name of the GUI console app bundle. 
     tell application "macView" to activate
or
     Red = Application('macView');
3. Run the script
4. The crash will occur
### Red and platform version
```
macOS 10.12.16
commit 9ce2aacce1509943ac11efa3b13457e8a66f03b4 (HEAD -> master, upstream/master)
```


