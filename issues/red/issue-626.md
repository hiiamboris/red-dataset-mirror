
#626: Compiler error on routine
================================================================================
Issue is closed, was reported by iArnold and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/626>

The program 

```
Red []
remainder: routine [
 m  [integer!]
    n       [integer!]
    return: [integer!]
][
 m % n
]
i: 8
j: 5
b: remainder i j
print [ "i is: " i " j is: " j " remainder i j gives: " b ". Is this right?"]
```

gives error:

```
*** Syntax Error: Missing matching ]
*** line: 8
*** at: {[ ^M
^-m % n^M
]^M
^M
i: 8^M
j: 5^M
^M
b: remain}
```

When changing the Red/System function to // (modulo) but keeping the function name remainder gives

```
...compilation time:     141 ms
Compiling to native code...
*** Compilation Error: undefined symbol: remainder
*** in file: %/C/pathtored/routine_001.red
*** at line: 1
*** near: [remainder
    integer/get r_arg integer/get r_arg + 1
    stack/unwind
]
```

Using /// (the internal representation) for % is no good either. I can solve this issue using a proper #system-global [#include %redsfile.reds] but as the // (modulo) is also Red/System only and that works as was stated in the Blog entry of the 0.3.2 release under "Routines" I kind of expected this remainder functionality to work.

And using a different name like modulo or as I used here compute-remainder instead of remainder solves this latter issue:

```
Red []

compute-remainder: routine [
 m  [integer!]
    n       [integer!]
    return: [integer!]
][
 m // n
]
i: 8
j: 5
b: compute-remainder i j
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-24T05:54:55Z, qtxie, commented:
<https://github.com/red/red/issues/626#issuecomment-31159749>

    @iArnold
    1. `%` is for file, not a operator.  
    2. `remainder` is an `action` in Red, like `form`, `make` etc. Red runtime (In Red/System Level) has already define a function named `remainder`. If you define a routine (In Red/System Level) also named `remainder` and the function signature is different, it will cause the error. But you can define it as a function in Red Level.

--------------------------------------------------------------------------------

On 2013-12-24T07:50:26Z, iArnold, commented:
<https://github.com/red/red/issues/626#issuecomment-31162326>

    Thank qtxie.
    I am making a routine from Red/System code. The // (modulo) is also only Red/System not Red and this works. The % is in Red system the infix operator for remainder calculation. 
    See http://static.red-lang.org/red-system-specs.html#section-8.1 
    If one works I expect the other to work too.
    
    I would consider it an additional value if a list of all available functions was to be added to /presented on the website.

--------------------------------------------------------------------------------

On 2013-12-25T01:04:22Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/626#issuecomment-31188751>

    It doesn't look like a clash with the standard REMAINDER to me. ROUTINEs end up in the Red/System exec/ context, while the Red runtime is in the red/ context. When functions conflict, the compiler prints their spec signatures.
    
    It prints a mysterious bracket error instead, so the first issue looks like an early loader error. Arnold sounds right to me about the special status of % in the loader.

--------------------------------------------------------------------------------

On 2013-12-25T06:28:49Z, qtxie, commented:
<https://github.com/red/red/issues/626#issuecomment-31192895>

    @Kaj-de-Vos Thank you for pointing that out. What I said above is incorrect. Seems it's a bug now.

--------------------------------------------------------------------------------

On 2014-01-20T23:25:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/626#issuecomment-32807215>

    This change has made it impossible to redefine natives in Red.

--------------------------------------------------------------------------------

On 2014-01-21T01:43:12Z, qtxie, commented:
<https://github.com/red/red/issues/626#issuecomment-32814172>

    @Kaj-de-Vos Could you describe it in detail ? Is there any information about the error ?

--------------------------------------------------------------------------------

On 2014-02-07T23:42:50Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/626#issuecomment-34519469>

    I have to revert this change to compile my code.

--------------------------------------------------------------------------------

On 2014-02-09T21:45:27Z, kealist, commented:
<https://github.com/red/red/issues/626#issuecomment-34587947>

    Ran into trouble with this today.   Can't compile a bunch of scripts I used to be able to compile

--------------------------------------------------------------------------------

On 2014-02-13T10:03:22Z, dockimbel, commented:
<https://github.com/red/red/issues/626#issuecomment-34963851>

    @iArnold You mixed up two different issues in the same one:
    1. `%` word handling in a routine
    2. routine reusing the name of an already defined function.
    
    They should have been reported in two separate tickets.
    
    The first one has just been fixed. For the second one, the fix by @qtxie was correct. If that fix introduces regression in user code, please report it now with a short code example if possible.

--------------------------------------------------------------------------------

On 2014-02-13T15:21:16Z, iArnold, commented:
<https://github.com/red/red/issues/626#issuecomment-34988080>

    Hi Nenad, 
    Correct, they came together as I will explain here.
    Issue 1. was the one I reported this issue for. Issue 2. was a by product using the name remainder for this routine. Without this routine in the code example above the function remainder is not 
    very productive:
    Red []
    i: 8
    j: 5
    b: remainder i j
    print [ "i is: " i " j is: " j " remainder i j gives: " b ". Is this right?"]
    
    Thi sresults in:
    C:\project\red>remdirect.exe
    i is: 8  j is: 5  remainder i j gives: 8 . Is this right?
    
    This lead me into using the name remainder for this routine, not realising that 'remainder already had been claimed.
    
    You ask for example of regressions, I had none of these regressions but Kaj and Josh had them. I will test this fix later.
    
    Thanks!
    
    Arnold 

--------------------------------------------------------------------------------

On 2014-02-13T20:54:03Z, iArnold, commented:
<https://github.com/red/red/issues/626#issuecomment-35024644>

    I can now confirm that the routine using % for the Red/System remainder now works correct! (This is issue no 1.)
    When using the reserved 'remainder the compilation fails
    **\* Compilation Error: undefined symbol: remainder 
    **\* in file: %/data/develop/red/testscripts/redsma.red 
    **\* at line: 1 
    **\* near: [remainder 
        integer/get r_arg integer/get r_arg + 1 
        stack/unwind
    ]
    Regards,
    Arnold

