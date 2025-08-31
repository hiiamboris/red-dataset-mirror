
#2338: make map! from object
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2338>

Every valid object can be turned into a valid map. I cannot see problem.


Comments:
--------------------------------------------------------------------------------

On 2017-02-20T08:21:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2338#issuecomment-281014965>

    Objects have binding, maps do not have. If you have:
    ```
    obj: context [
        a: 123
        b: [a]
    ]
    ```
    and make a map out of it, it will keep the binding to the object context, preventing it from being garbage-collected and probably confusing the user about what should `[a]` reduce to. Now imagine that your object holds function, with words bound to the object context, the evaluation of the functions would be hard to follow.
    
    So, such conversion could be implemented, though, I do not see any use-case which could benefit from it, but I see many troubles it could bring to many users.
    
    I will close this wish for now, feel free to re-open it if you find some use-cases where it could bring an advantage.

--------------------------------------------------------------------------------

On 2017-02-20T08:36:48Z, meijeru, commented:
<https://github.com/red/red/issues/2338#issuecomment-281017727>

    Does the inverse problem not occur, e.g. with:
    ```
    obj: make object! #(a: 123 b: [a])
    ```
    What should the second `a` be bound to? BTW I tried to have this interpreted, but got an error, although the conversion matrix says it should be allowed.

