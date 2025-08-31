
#100: Curious error with size? <type>
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/100>

I mistakenly tried to take the size of `pointer! [integer!]` (hadn't caught on to the need to put a base-type only), and got the following:

```
printf size? pointer! [integer!]
*** Compiler Internal Error: Script Error : Invalid path value: integer!
*** Where: check-cc
*** Near:  [if functions/:name/3 = '?? [
throw-error ["calling convention undefined at this point for:" name]
```

]]



Comments:
--------------------------------------------------------------------------------

On 2011-06-23T07:44:42Z, meijeru, commented:
<https://github.com/red/red/issues/100#issuecomment-1423710>

    I feel privileged to have submitted issue 100, and impressed by the speed with which issued have been resolved!

--------------------------------------------------------------------------------

On 2011-06-23T08:08:31Z, meijeru, commented:
<https://github.com/red/red/issues/100#issuecomment-1423809>

    Similarly,
    
    ```
    printf size? null
    *** Compiler Internal Error: Script Error : emit-load expected value argument of type: char logic integer
     word string struct path paren get-word
    *** Where: get-size
    *** Near:  [target/emit-load select datatypes type/1]
    ```

--------------------------------------------------------------------------------

On 2011-06-23T09:29:55Z, dockimbel, commented:
<https://github.com/red/red/issues/100#issuecomment-1424159>

    Rudolf, I should feel lucky that you are working hard to shorten my sleep time. ;-)
    
    More seriously, I will take this opportunity to publicly thank to you for all the time you have put so far, in testing releases, reporting issues and writing libraries of code. You have significantly helped Red/System to become a better product. Thank you for that.

--------------------------------------------------------------------------------

On 2011-06-23T22:06:19Z, dockimbel, commented:
<https://github.com/red/red/issues/100#issuecomment-1428855>

    Now both "base type" and full type specification are accepted. But only the size of the base type is returned in any case. Size? needs to be documented in the specification.

--------------------------------------------------------------------------------

On 2011-06-23T22:06:39Z, dockimbel, commented:
<https://github.com/red/red/issues/100#issuecomment-1428857>

    Tested OK.

