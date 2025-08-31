
#1842: Console closes when executing throw without a catch
================================================================================
Issue is closed, was reported by Zamlox and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1842>

Executing:

```
red>> throw 10
```

will close the console.



Comments:
--------------------------------------------------------------------------------

On 2016-05-11T01:52:31Z, x8x, commented:
<https://github.com/red/red/issues/1842#issuecomment-218341900>

    Looks like fixed. I get this on MacOS and Linux:
    
    ```
      throw 10
    *** Throw error: no catch for throw: 10
    *** Where: =
    ```

--------------------------------------------------------------------------------

On 2016-05-11T07:44:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1842#issuecomment-218386074>

    Fixed by commit [7bf5ccb7](https://github.com/red/red/commit/a3ba27a192e77fc0629c0b9848fcd2c37bf5ccb7).
    
    Will investigate the wrong `Where:` field reporting.

--------------------------------------------------------------------------------

On 2016-05-11T09:00:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1842#issuecomment-218401753>

    The error report is more accurate now:
    
    ```
    red>> throw 10
    *** Throw error: no catch for throw: 10
    *** Where: throw
    ```

