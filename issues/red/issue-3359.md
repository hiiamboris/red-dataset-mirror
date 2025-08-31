
#3359: Error messages for make on unallowed types are inconsistent
================================================================================
Issue is closed, was reported by meijeru and has 16 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3359>

### Expected behavior

Using `make` with a type for which it is not defined should always give the message

    *** Script Error: make does not allow <type> for its type argument
    *** Where: make
    *** Stack:  


### Actual behavior

With `datatype! routine!` and `event!` this message is indeed displayed.
With `native!` and `action!`, the other two types for which `make` is not defined, the message is

    *** Script Error: cannot MAKE <type> from: <...>
    *** Where: make
    *** Stack:  

This will leave the users wondering from which expression they CAN indeed make a native or action, but in reality this will never succeed.

### Steps to reproduce the problem

Use `make` with any of the above-mentioned types.

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 669 date: 27-Apr-2018/10:07:23 commit: #4c36108655f3410124f8539543cbd4bc4525fed1 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 16299 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T19:14:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3359#issuecomment-523156179>

    You are making false assumptions there. `make` is defined for `native!` and `action!`:
    ```
    >> puts: make native! [[v [any-type!]] 23]
    == make native! [[v [any-type!]]]
    >> puts "Hello"
    Hello
    ```

--------------------------------------------------------------------------------

On 2019-08-21T08:12:23Z, meijeru, commented:
<https://github.com/red/red/issues/3359#issuecomment-523348293>

    These "makes" are used in the initalizing phase of the toolchain, I suppose. But should they be available to the user?? And if so, what is the semantics??

--------------------------------------------------------------------------------

On 2019-08-21T10:53:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3359#issuecomment-523405544>

    They are available to the users as a way to recreate a `native!` or `action!` value if needed. For example, after doing a `print: none`, you can recreate the `print` native if necessary. Rebol supports that too.
    
    The second argument is just `[[<spec>] <id>]` here `<spec>` is the right action/native spec block (a wrong one will currently lead to a crash), and `<id>` is the index of the action/native in their respective internal tables: [actions ID](https://github.com/red/red/blob/master/runtime/macros.reds#L69), [natives ID](https://github.com/red/red/blob/master/runtime/macros.reds#L147)
    
    We could be saving the spec blocks internally so that the user wouldn't need to provide them at all (IIRC that is what R3 does), though, we would still need a way to provide them when booting the runtime.

--------------------------------------------------------------------------------

On 2019-08-21T13:00:01Z, meijeru, commented:
<https://github.com/red/red/issues/3359#issuecomment-523445901>

    I myself know how it works, but look at the way you explain it - it sounds awfully esoteric for the general user. R2 forbade it altogether.

--------------------------------------------------------------------------------

On 2019-08-21T15:55:52Z, meijeru, commented:
<https://github.com/red/red/issues/3359#issuecomment-523523249>

    I have added some wording to the spec document saying it is not recommended...

--------------------------------------------------------------------------------

On 2019-08-26T21:12:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3359#issuecomment-525034657>

    There are a lot of esoteric features in Red. I don't know that we have, or will have a "general user". Those working at higher levels may never touch this, or `bind`, or HOFs, or `parse`, but Red is also about *building* tools and dialects, and this feature could play prominently there.

--------------------------------------------------------------------------------

On 2019-08-28T13:40:50Z, 9214, commented:
<https://github.com/red/red/issues/3359#issuecomment-525750176>

    It would be nice if `body-of` on `native!`s and `action!`s returned their IDs, the way R2 does.
    ```rebol
    >> second :find
    == 53
    ```
    Curiously, this works only with `second` but not with `body-of`, which yields `none` instead (same as in R3).

--------------------------------------------------------------------------------

On 2019-08-29T16:08:21Z, meijeru, commented:
<https://github.com/red/red/issues/3359#issuecomment-526255230>

    Let's make that a wish!!

