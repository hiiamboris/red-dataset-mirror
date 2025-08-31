
#3268: Console doesn't catch some `cause-error` from `try` (and quits)
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/3268>

### Steps to reproduce the problem
`>> try [break]`
(or anything from system/catalog/errors/throw category)

### Expected behavior
same as if there was no "try"
```
--== Red 0.6.3 ==--
Type HELP for starting information.

>> break
*** Throw Error: no loop to break
*** Where: break
*** Stack:
```

### Actual behavior
silent exit from the console (although an extra layer of try/all catches this)

### Red version and build date, operating system with version.
Red 0.6.3 system/build/config/build-basename = %console-**2017-8-3-49893** (stable) and %console-**2018-3-11-43723** (nightly)
OS: win7 x64 v6.1.7601


Comments:
--------------------------------------------------------------------------------

On 2018-07-18T08:06:18Z, bitbegin, commented:
<https://github.com/red/red/issues/3268#issuecomment-405846317>

    That's how it is designed. You should use try/all.
    
    ```
    >> ? try
    USAGE:
         TRY block
    
    DESCRIPTION: 
         Tries to DO a block and returns its value or an error. 
         TRY is a native! value.
    
    ARGUMENTS:
         block        [block!] 
    
    REFINEMENTS:
         /all         => Catch also BREAK, CONTINUE, RETURN, EXIT and THROW exceptions.
    
    >> try/all [break]
    *** Throw Error: no loop to break
    *** Where: break
    *** Stack:  
    
    >> 
    ```

--------------------------------------------------------------------------------

On 2018-07-18T09:17:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3268#issuecomment-405866873>

    I disagree @bitbegin . It should report an error instead of crashing.

--------------------------------------------------------------------------------

On 2018-07-18T13:00:10Z, bitbegin, commented:
<https://github.com/red/red/issues/3268#issuecomment-405921750>

    Maybe we should set /all for default, and remove /all

--------------------------------------------------------------------------------

On 2018-07-18T20:13:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3268#issuecomment-406059363>

    R2:
    ```
    >> try [break]
    ** Throw Error: Nothing to break
    ** Near: break
    >> break
    ** Throw Error: Nothing to break
    ** Near: break
    ```
    Red:
    ```
    >> try [break]
    <poof!>
    
    >> try/all [break]
    *** Throw Error: no loop to break
    *** Where: break
    *** Stack:  
    
    >> break
    *** Throw Error: no loop to break
    *** Where: break
    *** Stack:  
    ```
    
    This needs more research. It may be something the console needs to handle differently, or may be due to compiler and interpreter differences. Not something we want to change lightly, without full understanding.

--------------------------------------------------------------------------------

On 2018-07-18T20:13:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3268#issuecomment-406059530>

    I agree that it shouldn't crash though.

--------------------------------------------------------------------------------

On 2018-11-26T23:26:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/3268#issuecomment-441839408>

    See https://github.com/red/red/pull/3614 for the fix

