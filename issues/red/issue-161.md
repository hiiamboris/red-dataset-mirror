
#161: as-integer byte! reads integer instead of byte in complex expression
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/161>

```
a: as-byte 1
b: as-byte 2
print as byte-ptr! (as-integer b) << 16 or as-integer a
```

00020201



Comments:
--------------------------------------------------------------------------------

On 2011-08-19T23:03:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/161#issuecomment-1857324>

    If I now try to compile the sample code above I get a compiler internal error:
    
    ```
    Red/System []
    
    a: as-byte 1
    b: as-byte 2
    print as byte-ptr! (as-integer b) << 16 or as-integer a
    print lf
    ```
    
    gives 
    
    ```
    >> do/args %rsc.r "%/Users/peter/Code/Red-System/test.reds"   
    Script: "Red/System compiler wrapper" (none)
    
    -= Red/System Compiler =- 
    Compiling /Users/peter/Code/Red-System/test.reds ...
    Script: "Red/System IA-32 code emitter" (none)
    *** Compiler Internal Error: Script Error : with-right-casting has no refinement called alt 
    *** Where: emit-comparison-op 
    *** Near:  [with-right-casting/alt [
    emit-variable-poly args/2 
    #{8A15} #{8B15} 
    #{8A55} #{8B55}
    ] 
    emit-poly [#{38D0} #{39D0}]
    ] 
    
    ```
    
    I wrote some tests yesterday to try and isolate the problem, but didn't get finished. When I did so Kaj's expression worked as expected except when including "print as byte-ptr!". I have written up a test in a new test file - print-test.r with Kaj's original example. It also crashes the compiler, I'll commit it to github soon. 

--------------------------------------------------------------------------------

On 2011-08-20T10:14:29Z, dockimbel, commented:
<https://github.com/red/red/issues/161#issuecomment-1858981>

    It seems you had an issue pulling all changes, the `/alt` refinement is part of the same commit that fixed this issue. See `%target-class.r` changes in [162e77d6](https://github.com/dockimbel/Red/commit/162e77d67a1a924c8718a9591f57e0270f3df07f).

--------------------------------------------------------------------------------

On 2011-08-20T14:00:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/161#issuecomment-1859538>

    Yes, you're right. I've re-fetched the latest version and merged the changes - the test now works.

