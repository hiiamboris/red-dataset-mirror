
#109: Curious error message when statement follows condition in while/until
================================================================================
Issue is closed, was reported by meijeru and has 16 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/109>

The condition block of a `while` (and the single block of an `until`) may contain statements, but apparently not after the last expression which should be of `logic!` type. That is fine, but the error message is curious (it obtains also if `s: 2` is replaced by `print "hello"`, which has nothing to do with `integer!`).

```
s: 1 while [1 > 2 s: 2][print "shouldn't come here"]
*** Compilation Error: WHILE requires a conditional expression
*** expected: [logic!], found: [integer!]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-25T16:01:24Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/109#issuecomment-1438242>

    PRINT returns an integer status code. Actually, I think it would be nice if PRINT and PRIN returned a logic! success status.

--------------------------------------------------------------------------------

On 2011-06-25T18:23:43Z, dockimbel, commented:
<https://github.com/red/red/issues/109#issuecomment-1438714>

    I will try to modify the error message for WHILE (currently it is the same error code for IF, EITHER, WHILE and UNTIL).
    
    About PRINT: actually, I think that the most logical change should be to make it return nothing (like in REBOL). It should be obvious if the PRINT succeeded or not.

--------------------------------------------------------------------------------

On 2011-06-25T19:06:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/109#issuecomment-1438850>

    It will then only be obvious if a human checks all output, after running the program in his head to determine what it should be. REBOL supposedly throws an error if a PRINT messes up. I think returning UNSET would be OK for Red, but not for Red/System.

--------------------------------------------------------------------------------

On 2011-06-26T10:25:31Z, dockimbel, commented:
<https://github.com/red/red/issues/109#issuecomment-1440573>

    On second thought, `prin*` functions could return their argument value so that they could be used in expressions as `probe` is used in REBOL.

--------------------------------------------------------------------------------

On 2011-06-26T10:57:55Z, meijeru, commented:
<https://github.com/red/red/issues/109#issuecomment-1440613>

    What is the likelihood that PRIN\* needs to pass an error code?

--------------------------------------------------------------------------------

On 2011-06-26T16:15:07Z, dockimbel, commented:
<https://github.com/red/red/issues/109#issuecomment-1441695>

    Error message changed for WHILE and UNTIL, it is now:
    `*** Compilation Error: <function> requires a conditional expression as last expression`
    
    I am leaving this ticket opened until I decide on `prin*` functions return value.

--------------------------------------------------------------------------------

On 2011-06-26T22:51:52Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/109#issuecomment-1443740>

    "What is the likelihood that PRIN\* needs to pass an error code?"
    
    Simple things should be easy, hard things should be possible. If it doesn't return an error status, it will be impossible to check for errors when you want to.

--------------------------------------------------------------------------------

On 2011-06-30T02:16:33Z, earl, commented:
<https://github.com/red/red/issues/109#issuecomment-1472221>

    Closing this as fixed. Moved the PRIN\* discussion to a separate ticket: issue #118.

