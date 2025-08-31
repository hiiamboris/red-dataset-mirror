
#1673: Crash on pair / float
================================================================================
Issue is closed, was reported by mikeparr and has 4 comment(s).
[status.dismissed] [status.resolved]
<https://github.com/red/red/issues/1673>

Using red-054  Windows 7.  Code:

print 100x20 / 3.2
**\* Math Error: unsupported right operand for pair operation
**\* Runtime Error 13: integer divide by zero
## **\* at: 0042D454h

Red  indicates an error in the right operand, but then produces 'divide by zero' error, and crashes.



Comments:
--------------------------------------------------------------------------------

On 2016-03-03T10:23:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1673#issuecomment-191695588>

    I get proper error catching in latest Red version from master branch:
    
    ```
    red>> print 100x20 / 3.2
    *** Script error: float type is not allowed here
    *** Where: /
    ```

--------------------------------------------------------------------------------

On 2016-03-16T08:09:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1673#issuecomment-197205265>

    Can't reproduce this issue with Red versions from master branch, so I'm closing it.

