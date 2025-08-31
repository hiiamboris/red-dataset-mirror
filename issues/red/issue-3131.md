
#3131: Functions inside face! objects are called during creation
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3131>

### Expected behavior
Inner functions should not be called during creation of a `face!` object
### Actual behavior
Functions are called.
### Steps to reproduce the problem
```
make face! [
    type: 'base
    size: 100x100
    f: does [print "1"]
    e: does [print "2"]
]
;1 
;1
;2
;2
```
### Red version and build date, operating system with version.
0.6.3 / 1-Dec-2017/23:54:40+03:00 / Win10 x64

Related to #3122 


Comments:
--------------------------------------------------------------------------------

On 2017-12-04T12:37:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3131#issuecomment-348950387>

    @endo64 Good fix, but it overlaps with a fix I have pushed a few days ago. Please rebase that patch and make it a PR, so I can integrate it.

--------------------------------------------------------------------------------

On 2017-12-04T14:30:51Z, endo64, commented:
<https://github.com/red/red/issues/3131#issuecomment-348978139>

    @dockimbel I rebased my branch onto your patch, but I'm not sure if messed up. If you see any problem, I can close PR #3073, reset my branch and make a clean one.

--------------------------------------------------------------------------------

On 2017-12-09T22:13:22Z, endo64, commented:
<https://github.com/red/red/issues/3131#issuecomment-350509315>

    I made a clean fix for this issue, please see #3139, I closed the messed PR #3073 

