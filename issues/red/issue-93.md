
#93: Peculiar treatment of statements within parentheses
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/93>

One is not supposed to put statements within parentheses. Still, I tried the following (`printf  ==  print form`)

```
s: 1 (printf s) ; OK compiles and runs as if () were not there
(s: 1) printf s ; idem
(s: 1 printf s) ; "undefined symbol s"
s: 1 (s: s + 1 printf s) ; prints 1, not 2
```

It looks like only the last of a series of statements and expressions within parenthesis is executed. The others are ignored without warning.



Comments:
--------------------------------------------------------------------------------

On 2011-06-13T18:59:12Z, dockimbel, commented:
<https://github.com/red/red/issues/93#issuecomment-1361034>

    Now parentheses are limited to one expression only, more will raise a compilation error. The purpose of parentheses is to mark execution priority in expressions. This behaviour needs to be documented in the upcoming "Expressions" section of the specification.
    
    I am leaving the issue open until the specification is updated.

--------------------------------------------------------------------------------

On 2011-06-14T17:05:12Z, meijeru, commented:
<https://github.com/red/red/issues/93#issuecomment-1367511>

    The fix is not complete: the following compiles OK while I think it should not
    
    ```
    i: 1 (i: i + 1) printf i ; result is 2
    ```

--------------------------------------------------------------------------------

On 2011-06-18T21:04:01Z, dockimbel, commented:
<https://github.com/red/red/issues/93#issuecomment-1394615>

    Tested OK.

