
#1952: WISH: Allow setting words to path in object to keep its binding
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/1952>

Currently, when you set word to a path in object that is not `any-block!` you get the value but lose binding:

```
obj: object [a: [1 2 [3 4]]]
c: obj/a/3/1
c: 5
obj = [a: [1 2 [3 4]]]
```

This would be nice and very useful:

```
obj: object [a: [1 2 [3 4]]]
c: in obj 'a/3/1
c: 5
obj = [a: [1 2 [5 4]]]
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T11:38:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1952#issuecomment-280308087>

    You can already achieve similar feature using `set`:
    ```
    obj: object [a: [1 2 [3 4]]]
    c: 'obj/a/3/1
    set c 5
    obj = object [a: [1 2 [5 4]]]
    ```
    What you are asking for is not compatible with how words and contexts work. When you write`
    ```
    c: in obj 'a/3/1
    ```
    You make the word `c` refer to lit-path `a/3/1`. `c` is not concerned by what binding is used inside that path. When you evaluate `c: 5`, you make `c` refer to a different value than the path, that is how set-words work in Red and Rebol, it does not (and cannot) trigger any special action on the old value itself. One way to trigger a "special" action on setting `c` would be to wrap all that code in an object and use the ownership system to trigger an object event, though it would be overkill, given that the regular Red language allows you to set values to lit-paths as shown above.

