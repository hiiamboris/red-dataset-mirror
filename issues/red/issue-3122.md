
#3122: Cannot define functions inside face! object
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3122>

### Expected behavior
```
>> test: make face! [
[        type: 'base
[        myfunc:    does [ 'nothing ]
[    ]

== make object! [
    type: 'base
    offset: none
    size: none
...
```
### Actual behavior
```
>> test: make face! [
[        type: 'base
[        myfunc:    does [ 'nothing ]
[    ]

*** Where: do
*** Stack: load
*** Script Error: old has no value
*** Where: series?
*** Stack: series?
```
### Steps to reproduce the problem
Input following code into red console.
```
test: make face! [
    type: 'base
    myfunc:    does [ 'nothing ]
]
```
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 28-Nov-2017



Comments:
--------------------------------------------------------------------------------

On 2017-11-28T06:46:51Z, qtxie, commented:
<https://github.com/red/red/issues/3122#issuecomment-347429749>

    FYI, this commit 9178838f7569b6e3d28fedcf070f04ab7e6e4e33 causes the error.

--------------------------------------------------------------------------------

On 2017-12-01T23:24:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3122#issuecomment-348640916>

    @endo64 found a regression due to this fix it seems.

--------------------------------------------------------------------------------

On 2017-12-03T15:09:19Z, endo64, commented:
<https://github.com/red/red/issues/3122#issuecomment-348781067>

    This error still occurs if `system/view/debug? is true`
    I have fixed it in PR #3073 

