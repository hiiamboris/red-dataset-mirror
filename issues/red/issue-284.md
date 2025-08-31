
#284: Infix function defined in context and used outside will not compile, gives strange error message 
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/284>

I compiled

```
c: context [
    f: func [[infix] a [integer!] b[integer!] return: [integer!]][a + b]
]
print 1 c/f 2
```

Result:

```
*** Compilation Error: return type missing in function: print
```



Comments:
--------------------------------------------------------------------------------

On 2012-10-30T22:07:22Z, dockimbel, commented:
<https://github.com/red/red/issues/284#issuecomment-9924833>

    Infix detection works only on words, not on context paths, so the compiler gets totally lost there. This might take a day or two to get fixed, as I am making some deep refactoring in the namespace implementation.

--------------------------------------------------------------------------------

On 2012-11-01T12:26:01Z, dockimbel, commented:
<https://github.com/red/red/issues/284#issuecomment-9978502>

    I am thinking about raising a compilation error in such case. Firstly because the "fix" is costly (both in time and additional code), secondly because infix usage with paths looks odd (to say the least) and reads very hard. The infix syntax support in Red/System was meant mainly for user-defined operators, and maybe a few well-chosen words (like IN, FROM, UNION, ...). So, the best thing to do is probably to forbid path usage for infix functions.

--------------------------------------------------------------------------------

On 2012-11-01T14:19:25Z, meijeru, commented:
<https://github.com/red/red/issues/284#issuecomment-9981543>

    I think that is a fair solution.

--------------------------------------------------------------------------------

On 2012-11-04T14:43:23Z, dockimbel, commented:
<https://github.com/red/red/issues/284#issuecomment-10051133>

    A proper compilation error is now raised in such case.

