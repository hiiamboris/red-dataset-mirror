
#3202: Crash when assign function result of an object
================================================================================
Issue is closed, was reported by Zamlox and has 10 comment(s).
<https://github.com/red/red/issues/3202>

### Expected behavior
Following sequence of code should execute in gui console without crashing
```
a: none
obj: object [
	f1: does [
		11
	]
]
a: obj/f1
```
### Actual behavior
It crash when executed in gui console
Culprit commit: bca86785936b0750b994702daa15734361237f1f
### Steps to reproduce the problem
Fire up gui console and execute the above code
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 16-Jan-2018/9:28:40+02:00
OS: Windows 7


Comments:
--------------------------------------------------------------------------------

On 2018-01-16T12:13:28Z, rebolek, commented:
<https://github.com/red/red/issues/3202#issuecomment-357942095>

    This is duplicate of https://github.com/red/red/issues/3156

--------------------------------------------------------------------------------

On 2018-01-16T12:15:56Z, Zamlox, commented:
<https://github.com/red/red/issues/3202#issuecomment-357942585>

    Yep, looks like.

--------------------------------------------------------------------------------

On 2018-01-16T18:03:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3202#issuecomment-358051183>

    Added a comment for this ticket to #3156, and will close this so we focus there.
    
    Thanks @zamlox!

--------------------------------------------------------------------------------

On 2018-01-20T19:49:11Z, toomasv, commented:
<https://github.com/red/red/issues/3202#issuecomment-359197358>

    As with sibling issues, explicit typing is work-around:
    ```
    >> a: to-integer obj/f1
    == 11
    ```

--------------------------------------------------------------------------------

On 2018-01-21T00:31:45Z, gltewalt, commented:
<https://github.com/red/red/issues/3202#issuecomment-359213621>

    >> a: reduce obj/f1
    == 11

