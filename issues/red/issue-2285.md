
#2285: Error (Bus error 10) with program compiled on macOS 
================================================================================
Issue is closed, was reported by StephaneVeneri and has 2 comment(s).
<https://github.com/red/red/issues/2285>

With the simple script:

```
Red []
print "Bonjour"
```

Compilation with red-23oct16-6db8fef -c script.red
The compilation is ok but the result of execution:
**Bus error: 10**

If I compile with red-23oct16-6db8fef -c -r script.red, there no problem to the execution.



Comments:
--------------------------------------------------------------------------------

On 2016-10-26T20:43:06Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/2285#issuecomment-256471000>

    I tested with the last automated build **red-26oct16-9e2e09f** and it works fine.

