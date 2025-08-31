
#3221: PRIN / PRINT doesn't output anything after compilation on Windows targets
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3221>

### Expected behavior
Script prints `something` in shell console.
### Actual behavior
No output (checked on Wine, Win7 and Win10). 
Wine chokes with following exception:
```
*** Runtime Error err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x416191
```
### Steps to reproduce the problem
```Red
Red [Needs: View]
print "something"
```
Compile the script above for `Windows` or `WindowsXP` targets and execute it from shell. Same script  works as expected for `Linux` (with `Needs: View` omitted for obvious reasons) and `MSDOS` targets.

### Red version and build date, operating system with version.
I think it applies to latest ones too.
```Red
>> about
Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-02-08T03:59:18Z, qtxie, commented:
<https://github.com/red/red/issues/3221#issuecomment-363995433>

    It has been fixed in 0.6.4 branch.

--------------------------------------------------------------------------------

On 2018-06-21T23:27:02Z, 9214, commented:
<https://github.com/red/red/issues/3221#issuecomment-399274167>

    @qtxie is it OK that this issue still persists in the latest release? Wasn't `0.6.4` branch merged into master some time ago?

--------------------------------------------------------------------------------

On 2018-06-22T02:56:45Z, qtxie, commented:
<https://github.com/red/red/issues/3221#issuecomment-399305590>

    It is normal that PRIN / PRINT doesn't output anything after compilation on Windows targets. It should not crash anymore in the latest version.

--------------------------------------------------------------------------------

On 2018-06-22T14:09:13Z, 9214, commented:
<https://github.com/red/red/issues/3221#issuecomment-399455207>

    @qtxie 
    > It is normal that PRIN / PRINT doesn't output anything after compilation on Windows targets.
    
    Will it stay that way? I'd like to implement a console interface fallback (i.e. if executable is called with an argument, then print output into console, otherwise launch GUI) for my app, which is problematic because of the issue with `prin` and `print`. 
    
    This forces me to use MSDOS as a compilation target, which works, but then there appears a blank console window in the background each time users launches GUI mode.

--------------------------------------------------------------------------------

On 2018-06-24T02:45:21Z, qtxie, commented:
<https://github.com/red/red/issues/3221#issuecomment-399724632>

    @9214 In this case you need to integrated a GUI console into your app. 

