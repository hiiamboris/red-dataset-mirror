
#3129: React errors keep being re-thrown
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3129>

### Expected behavior
```
>> view [ a: field b: field react [ bb/text: a/text ] ]
*** Script Error: bb has no value
*** Where: set-path
*** Stack: view layout react  
>> view [ a: field b: field react [ b/text: a/text ] ]
```
Program should now run sucsessfully 
### Actual behavior
```
>> view [ a: field b: field react [ bb/text: a/text ] ]
*** Script Error: bb has no value
*** Where: set-path
*** Stack: view layout react  

>> view [ a: field b: field react [ b/text: a/text ] ]
*** Script Error: bb has no value
*** Where: set-path
*** Stack: view layout react  
```
The original syntax error is thrown again, even when the error has been corrected.
### Steps to reproduce the problem
As shown above
### Red version and build date, operating system with version.
Red version: 0.6.3 
date: 22-Nov-2017/23:06:38-07:00
Windows 10 Pro 


Comments:
--------------------------------------------------------------------------------

On 2017-12-01T23:24:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3129#issuecomment-348640874>

    `Clear-reactions` doesn't help. After running the above `view` example after clearing, the relation shows back up in `dump-reactions` output.

--------------------------------------------------------------------------------

On 2017-12-05T10:38:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3129#issuecomment-349264680>

    Good finding!

