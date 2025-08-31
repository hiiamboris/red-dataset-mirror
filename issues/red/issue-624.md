
#624: Interpreter keeps running after "word has no value!" error, doesn't say what word
================================================================================
Issue is closed, was reported by hostilefork and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/624>

Currently Red keeps running if you hit a "word has no value" case, e.g.

```
Red []
foo
print "After foo"
```

Will output:                   

```
*** Error: word has no value!
After foo
```

If your program has a lot of output it can be particularly easy to miss that you hit an error case.

It would also be very helpful to have the error message indicate the name of which word it is that has no value.

Note that when compiling, an error of this kind is generated:

```
*** Compilation Error: undefined word foo 
*** in file: %/Projects/teenage-coding/DUNGEON/test.red
*** near: [foo print "After foo"]
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T23:51:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/624#issuecomment-30893264>

    This was discussed a year ago. There's currently no error recovery in Red; it requires implementing types such as error! and typeset! and an exceptions framework in Red.
    
    I agree that getting the name of the undefined word or path would be helpful in the meantime.

--------------------------------------------------------------------------------

On 2013-12-19T02:30:07Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/624#issuecomment-30900607>

    Hm, undefined paths have turned into a halt, apparently sometime recently:
    
    red>> x
    **\* Error: word has no value!
    red>> x/1
    
    **\* Script error: action 7 not defined for type: 2

--------------------------------------------------------------------------------

On 2014-02-13T13:28:20Z, dockimbel, commented:
<https://github.com/red/red/issues/624#issuecomment-34977420>

    @Kaj-de-Vos Yes, the way path are treated has changed recently, they now internally rely on an action!.
    
    As Kaj explained, the current error catching is a _poor's man_ implementation until we get proper error/exception support built in. We let the interpreter continue most of the time in order to make it let painful for the user, but this could corrupt memory so, after any runtime error, currently the behavior is indefined. We won't invest more into the current very limited error handling.

