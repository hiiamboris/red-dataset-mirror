
#2633: make error! [<type> <id>] does not bind the error type and id to the message
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2633>

See also #2629
```
>> e: make error! [math zero-divide]
*** Math Error: attempt to divide by zero
*** Where: ???
>> e/id
== zero-divide
>> get e/id
*** Script Error: zero-divide has no value
*** Where: get
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-27T14:27:47Z, meijeru, commented:
<https://github.com/red/red/issues/2633#issuecomment-297729741>

    Same issue when using object-spec:
    `e: make error! [type: 'math id: 'zero-divide]`

--------------------------------------------------------------------------------

On 2017-05-01T10:36:04Z, meijeru, commented:
<https://github.com/red/red/issues/2633#issuecomment-298316913>

    Same issue when using `cause-error` which calls `make`.

--------------------------------------------------------------------------------

On 2019-08-20T14:14:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2633#issuecomment-523034835>

    Why should those symbols be bound to the message? You can easily retrieve the message already using a path accessor:
    ```
    e: make error! [math zero-divide]
    system/catalog/errors/(e/type)/(e/id)
    
    == "attempt to divide by zero"
    ```
    Given how rare such retrieving would be done in user code and how easy it is already to get the message, I don't think it is worth adding extra code in the runtime library for creating such bindings.

