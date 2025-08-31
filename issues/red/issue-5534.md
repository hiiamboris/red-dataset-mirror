
#5534: MacOS binaries not found (404 on website)
================================================================================
Issue is closed, was reported by matronator and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/5534>

**Before submitting**
Prior to opening this ticket, please share your finding in our [dedicated chat](https://gitter.im/red/bugs), so we can confirm it and help in reproducing it, including on other platforms.

**Describe the bug**
https://static.red-lang.org/dl/mac/red-view?reload=true returns 404.

**To reproduce**
Steps to reproduce the behavior:
1. Go to 'https://www.red-lang.org/p/download.html'
2. Click on 'Red-view for macOS'
3. See error

**Expected behavior**
Download macOS release.

**Screenshots**
<img width="677" alt="Snímek obrazovky 2024-08-10 v 0 47 53" src="https://github.com/user-attachments/assets/890872ca-b4c7-4888-8145-fe06de5bac0a">

**Platform version**
macOS 14.5

* This can be done all at once by running `about/debug` command from Red console and pasting its output here.
* `About/debug/cc` automatically copies the output to the clipboard.



Comments:
--------------------------------------------------------------------------------

On 2024-08-10T13:26:37Z, qtxie, commented:
<https://github.com/red/red/issues/5534#issuecomment-2281761742>

    FYI. The red-toolchain is built on Github Action. https://github.com/red/red/actions/runs/10331730172
    Though it's 32-bit only and won't work on macOS 14.5.

--------------------------------------------------------------------------------

On 2024-08-10T15:04:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5534#issuecomment-2282180363>

    I've fixed the backend script and launched a new build. That macOS binary link should now be working fine.

