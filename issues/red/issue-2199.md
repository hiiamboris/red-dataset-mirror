
#2199: Runtime crash on redefining function!, action! while it's called.
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2199>

```
parse parse: ["hello"] ["hello"]
find find: [1000] 1000
forall (forall: [10.0] 'forall) []
foreach test foreach: [10 20 30] []
*** Runtime Error 1: access violation
*** at: 00000000h

test: func [a b] [append a b]
test test: [10 20 30] 40
*** Runtime Error 1: access violation
*** at: 0042E1A5h
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-21T09:39:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2199#issuecomment-281292470>

    Words protection mechanism for core words, has not been implemented yet. As it will probably not be added before 0.9.0, this ticket will be closed with "deferred" status.
    
    For the second case (redefining a word referring to a function while calling it), it might be fixable now...

--------------------------------------------------------------------------------

On 2017-02-21T10:27:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2199#issuecomment-281304032>

    Now the user function name redefinition will work properly:
    ```
    red>> test: func [a b] [append a b]
    == func [a b][append a b]
    red>> test test: [10 20 30] 40
    == [10 20 30 40]
    ```

--------------------------------------------------------------------------------

On 2020-06-18T13:05:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2199#issuecomment-646004073>

    New fix and regression test: https://github.com/red/red/commit/8efeaf19b64a1265b119bc503b321ced37ee157f

