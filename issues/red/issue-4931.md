
#4931: [Compiler] Can't auto-type variables read or set inside subroutine code
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.compiler]
<https://github.com/red/red/issues/4931>

**Describe the bug**

This does not compile (-c or -r):
```
Red []

rout: routine [return: [integer!] /local sr [subroutine!] x][
	sr: [x: 1]
	sr
	0
]

probe rout
```
Says:
```
*** Compilation Error: variable not declared
*** in file: %/D/devel/red/red-src/red/2.red
*** in function: exec/rout
*** at line: 353
*** near: [x: 1]
```
Which is not true.
Manually providing a type for `x` or assigning `x` outside of subroutine code works fine.

**Expected behavior**

Type inferred by the compiler.

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-13T11:18:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4931#issuecomment-879001928>

    This also serves as source of all kinds of weird errors, even if variable itself was declared outside of subroutine, but later used inside of it:
    ```
    Red []
    
    rout: routine [
    	x [any-type!]
    	return: [integer!]
    	/local sr [subroutine!] y
    ][
    	y: as red-integer! x
    	sr: [y]
    	0
    ]
    
    probe rout 100
    ```
    Compiler says:
    ```
    Compiling to native code...
    *** Red/System Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event
    *** Where: get-width
    *** Near:  [value: first compiler/get-type operand
    either
    ]
    ```
    
    Different code - different errors:
    ```
    Red []
    
    rout: routine [
    	x [any-type!]
    	return: [integer!]
    	/local sr [subroutine!] y
    ][
    	y: as red-integer! x
    	sr: [stack/push as cell! y]
    	0
    ]
    
    probe rout 100
    ```
    Compiler says:
    ```
    *** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value
    *** Where: cast
    *** Near:  [forall list [
    expr: list/1
    if block? unbox/deep expr [comp-expression expr yes]
    if object? expr [cast expr]
    if type <> 'inline [
    either all [types not tag? expr block? types/1 'value = last types/1] [
    emitter/push-struct expr resolve-aliased types/1
    ] [
    emitter/target/emit-argument expr fspec
    ]
    ]
    if types [types: skip types -2]
    ]]
    ```
    Etc etc. Go figure. Best error I've got so far is "variable not declared" (just because I'm reading it in subroutine code)

--------------------------------------------------------------------------------

On 2021-07-21T15:43:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4931#issuecomment-884291908>

    Auto-typing is not supported for variables used in subroutines. This is due to subroutines being collected upfront from a function body and being compiled first, before any other code inside the function (regardless of the subroutine body location inside the function). The compiler being working in a single-pass, the lookahead ability is almost non-existent, so it cannot analyze later code ahead of time to determine a variable's type for past code.
    
    So as long as you declare a type for all variables used in subroutines, everything should work fine as expected. The "compiler internal errors" you are seeing above are just internal compiler crashes due to letting such case pass instead of catching it early and reporting a user error. 

--------------------------------------------------------------------------------

On 2021-07-21T15:54:38Z, dockimbel, commented:
<https://github.com/red/red/issues/4931#issuecomment-884299870>

    I have provided a fix that:
    - catches the above "compiler internal error" cases and report a proper error message forcing the user to declare the type:
    `*** Compilation Error: type declaration missing for variable y used in subroutine sr`
    - let the initial case pass, so that the auto-typing from within a subroutine will be accepted.
    
    I'll let you or someone else add regression tests for those cases if you think they are worth tracking (I personally always type my R/S locals). Just add R/S level tests instead of Red routine ones, as it's a R/S compiler issue/limitation.

--------------------------------------------------------------------------------

On 2021-07-21T18:35:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4931#issuecomment-884405339>

    #4934 
    I guess we also need to mention this limitation in R/S docs

--------------------------------------------------------------------------------

On 2021-07-21T19:57:45Z, greggirwin, commented:
<https://github.com/red/red/issues/4931#issuecomment-884458447>

    Hmmm, we never got R/S docs in with the rest of them. We should do that.

