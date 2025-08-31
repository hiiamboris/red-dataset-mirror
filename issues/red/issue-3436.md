
#3436: Strange behaviour of `type?`
================================================================================
Issue is closed, was reported by a-nick-fischer and has 12 comment(s).
<https://github.com/red/red/issues/3436>

### Expected behavior
```
type? #[1 2 3]
*** Syntax Error: invalid issue! at "e? #[1 2 3]"
*** Where: do
*** Stack: load

type? @[1 2 3]
*** Syntax Error: invalid email! at ...
*** Where: do
*** Stack: load
```
### Actual behavior
```
type? #[1 2 3]
*** Syntax Error: invalid issue! at "e? #[1 2 3]"
*** Where: do
*** Stack: load

type? @[1 2 3]
== [1 2 3]
```

### Steps to reproduce the problem
See above.

### Red and platform version
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 753 date: 18-Jun-2018/13:11:17 commit: #67531575c64581836051ae76359bbe72f1227120 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-22T15:45:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/3436#issuecomment-399486942>

    @nickkoro02 
    ```
    >> [@[1 2 3]]
    == [@ [1 2 3]]
    ```
    your second expression is equivalent to `(type? @) ([1 2 3])`

--------------------------------------------------------------------------------

On 2018-06-22T18:27:14Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3436#issuecomment-399536634>

    Oh, didn't see that, thank you. But why is `@` a separator and `#` isn't? You can neither declare variables like `foo@bar` nor like `foo#bar`. 

--------------------------------------------------------------------------------

On 2018-06-22T21:10:09Z, 9214, commented:
<https://github.com/red/red/issues/3436#issuecomment-399583027>

    @nickkoro02 `@` is lexed as a valid `email!`, `#[1 2 3]` is lexed as an invalid `issue!`. So actual behavior is an expected one. Next time double-check your findings in [/bugs](https://gitter.im/red/bugs) room before filing an issue.

--------------------------------------------------------------------------------

On 2018-06-23T02:06:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3436#issuecomment-399622690>

    Are we OK to close this issue then?

--------------------------------------------------------------------------------

On 2018-06-23T06:16:17Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3436#issuecomment-399638379>

    @9214 Well, thank you, got it now. I'll check in /bugs next time.
    
    @greggirwin yes.

--------------------------------------------------------------------------------

On 2018-06-23T23:09:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3436#issuecomment-399716571>

    👍 

