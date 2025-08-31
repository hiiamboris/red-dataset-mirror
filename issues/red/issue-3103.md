
#3103: Error Message change for func contexts
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3103>

### Expected (desired) behavior

`context for x is not available`

See: https://github.com/red/red/wiki/Guru-Meditations#function-contexts

### Actual behavior

`x is not in the specified context`

### Steps to reproduce the problem

```
>> do bind [x] has [x][x: 1]
*** Script Error: x is not in the specified context
*** Where: do
*** Stack:
```

### Red version and build date, operating system with version.

0.6.3, as of 10-Nov-2017


Comments:
--------------------------------------------------------------------------------

On 2017-11-11T08:19:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3103#issuecomment-343648889>

    Implemented by commit [212a6c43](https://github.com/red/red/commit/6413a38bbcea6920978f7db4953de751212a6c43).

