
#4359: Mac OSX Catalina Install Error
================================================================================
Issue is closed, was reported by dmrobotix and has 2 comment(s).
<https://github.com/red/red/issues/4359>

When I try to install red on Mac OSX Catalinta I get the following error: 
zsh: bad CPU type in executable: ./red-064
**To reproduce**
Steps to reproduce the behavior:
1. Go to the main website and download the installer file for MacOSX
2. Open Terminal and navigate to where you saved the file
3. Enter command: chmod u+x <red-binary>
4. Enter command: ./<red-binary>
5. Get error.

In my case, <red-binary> is red-064.

**Expected behavior**
You will get the error: zsh: bad CPU type in executable: ./red-064

**Platform version (please complete the following information)**
MacOSX Catalina 10.15.3, using zsh in the Terminal.



Comments:
--------------------------------------------------------------------------------

On 2020-03-22T14:02:30Z, 9214, commented:
<https://github.com/red/red/issues/4359#issuecomment-602205340>

    Hi @dmrobotix. Red is currently limited to 32-bit only, so the error message is expected since Catalina dropped support for it. There are plans to address that issue in a step-by-step manner, by gradually transitioning Red to 64-bit, but it can be tackled differently and we haven't decided on the best approach yet, not to mention that it will pull our focus from the more urgent, core tasks.
    
    In the meantime, you can use the virtualization tools of your choice to run Red on macOS. @x8x might have some ready-made solution for that.

