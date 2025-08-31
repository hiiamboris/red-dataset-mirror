
#4224: [R/S] Float by integer division is bugged
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/4224>

**Describe the bug**

```
Red/System []
s: 1
e: 2
f: as float32! 3.0
g: 3.0
probe f / (e - s)
probe g / (e - s)
```
Output:
```
-1.#IND.0
-1.#IND.0
```
Happens only when dividing by integer expression. `/ (s)` or `/ 1` work fine.

**Expected behavior**
```
3.0
3.0
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-07T15:52:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4224#issuecomment-571645889>

    Any kind of promotion doesn't work properly either:
    ```
    probe f / as float32! (e - s)
    probe g / as float! (e - s)
    ```
    Output:
    ```
    0.3333333         
    0.3333333333333333
    ```
    Or rather - it works backwards - dividing the second operand by the 1st

--------------------------------------------------------------------------------

On 2020-01-09T21:25:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4224#issuecomment-572763271>

    Doing such math operation without explicit type casting is not a supported feature in R/S currently. The version with explicit casting is expected to work, so this looks like a bug.

--------------------------------------------------------------------------------

On 2020-01-09T21:28:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4224#issuecomment-572764584>

    According to R/S spec:
    > The resulting value type for math operators is the type of the left argument (an implicit type casting is operated when required).
    
    Perhaps the spec should be clarified then.

--------------------------------------------------------------------------------

On 2020-01-27T16:38:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4224#issuecomment-578835960>

    There's more to this bug. Not only there's a wrong result, but it causes certain **undefined behavior - local variables become filled with trash** and it leads to a crash in the end.
    
    Can't point to an exact minimal reproducible scenario as the amount of trash grows gradually, but here's a snippet that crashes: https://gitlab.com/snippets/1933695
    
    If you inspect the output of it, it starts with extreme floating point values (e-300, e+160..) which are not produced by the algorithm, and then integer values become extreme too, then assertions fail, or (if you don't use the `-d` flag, it just crashes).

