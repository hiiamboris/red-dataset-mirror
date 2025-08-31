
#1490: Trying to incorrectly set a word of an object causes console to crash
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1490>

``` Red
red>> o: make object! [f: 5]
== make object! [
    f: 5
]
red>> set in o 'f 7
== 7
red>> set [o/f] 10

*** Runtime Error 1: access violation
*** at: 0001DF97h
```

(Noted by Sunanda)



Comments:
--------------------------------------------------------------------------------

On 2015-12-05T00:21:25Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1490#issuecomment-162116500>

    Rebol gives a script error
    
    ``` Rebol
    >> set [o/f] 10
    ** Script Error: Invalid argument: o/f
    ** Near: set [o/f] 10
    >> set o/f 10
    ** Script Error: set expected word argument of type: any-word block object
    ** Near: set o/f 10
    ```

--------------------------------------------------------------------------------

On 2016-01-15T10:50:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1490#issuecomment-171931938>

    Also needs to be checked by the compiler.

