
#107: Redefining integer! messes up the epilog code.
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/107>

As part of the epilog, the compiler inserts a call to `***-on-quit` with two integer arguments, both zero. These arguments are checked against the function spec, which says that they both should be `integer!`. If `integer!` has been redefined in the meantime, this gives a compilation error.

```
integer!: alias struct! [i [byte!]]
*** Compilation Error: argument type mismatch on calling: ***-on-quit
*** expected: [struct! [i [byte!]]], found: [integer!]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-25T09:57:08Z, dockimbel, commented:
<https://github.com/red/red/issues/107#issuecomment-1437422>

    Looks like you have found an heavy argument in favor of your request for issue #78. :-)

--------------------------------------------------------------------------------

On 2011-06-26T17:16:59Z, dockimbel, commented:
<https://github.com/red/red/issues/107#issuecomment-1441855>

    I have forbidden base type names for using as alias names. A compilation error will now be raised on such attempt.

