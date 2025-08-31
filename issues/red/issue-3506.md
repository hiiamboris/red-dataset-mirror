
#3506: `unset 'none` kills console
================================================================================
Issue is closed, was reported by toomasv and has 18 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3506>

### Expected behavior
`unset 'none` throws error or something
### Actual behavior
`unset 'none` silently kills console.
Same with e.g. `unset body-of #(a: none)`.
### Steps to reproduce the problem
As above
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 828 date: 12-Aug-2018/3:37:05 commit: #6229b573535ea841cecb8d326b9905d91ad91679 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-14T18:01:20Z, meijeru, commented:
<https://github.com/red/red/issues/3506#issuecomment-412962425>

    This is very much related to re-assigning pre-defined words. There has been an extensive discussion about this already in the red/bugs room on Gitter, starting [here](https://gitter.im/red/bugs?at=5b6d23c72a8e6c6083a2ac16).

--------------------------------------------------------------------------------

On 2018-08-14T18:46:54Z, toomasv, commented:
<https://github.com/red/red/issues/3506#issuecomment-412976423>

    @meijeru Should I delete this? Also connected to https://github.com/red/red/issues/3338

--------------------------------------------------------------------------------

On 2018-08-14T19:05:30Z, meijeru, commented:
<https://github.com/red/red/issues/3506#issuecomment-412981946>

    #3338  has been resolved, and thus the application of `unset` should not anymore give a crash in general. The fact that unsetting pre-defined words gives a crash is not a matter of wrong programming of the toolchain, but inevitable since the toolchain, which is (partially) written in Red, depends for its operation on pre-defined words having their original meaning. I would leave it to the Red team to dismiss this, though. @dockimbel @greggirwin 

--------------------------------------------------------------------------------

On 2018-08-14T19:55:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3506#issuecomment-412995695>

    This is interesting. Let's leave it open for the moment, and see if we can find out exactly why it crashes. It may be a systemic problem, not easily solved, or it may just be something simple. Rebol doesn't crash if you do this, but certainly anything written to expect `none` won't work anymore.

--------------------------------------------------------------------------------

On 2018-08-14T20:06:10Z, meijeru, commented:
<https://github.com/red/red/issues/3506#issuecomment-412998519>

    I compare this to the redefinition of `equal?` which made the toolchain crash the first time an equality was tested (#360). Then @dockimbel was able to put the finger on it exactly, but it might be onerous to do the same thing for `none` and would not give more than intellectual satisfaction, if you ask me... 

--------------------------------------------------------------------------------

On 2018-08-15T08:29:09Z, bitbegin, commented:
<https://github.com/red/red/issues/3506#issuecomment-413129875>

    Not same reason as #3338, but still a big problem that maybe we can fix.
    
    fix steps:
    
    1. add a protect flag for data's header field, maybe bit 14 for this flag
    
    2. when a word! is created, set this flag to "unprotect" status.
    
    3. when a word! need to be set, check this flag, if it's "unprotect", it can be set normally, otherwise fire error!
    
    4. provide `protect` and `unprotect` function to set this flag
    
    5. we can set Red key words to "protect" status after runtime loading finished.
    
    
    In step 5, if we protect Red key words, we cannot unset these words. if unprotect these words, modify Red key words will crash Red environment. (these will be different from Rebol action)
    To avoid these situations, we should distinguish Red key words from key words used in Red environment.
    
    Maybe step 5 meet current needs.
    

--------------------------------------------------------------------------------

On 2018-08-16T08:08:07Z, qtxie, commented:
<https://github.com/red/red/issues/3506#issuecomment-413461937>

    Actually it is not a crash in this case, just the console exit.
    As the console itself is a Red program, once `None` being unset, all the code rely on it will be broken. 
    This is the [main loop](https://github.com/red/red/blob/master/environment/console/engine.red#L222-L228) in the console engine:
    ```
    forever [
        eval-command ask any [
            cue
            all [string? set/any 'p do [prompt] :p]
            form :p
        ]
    ]
    ```
    After `None` is unset, `eval-command` will throw an error, which will exit the `forever` loop. 
    So a simple fix is to add a `try` block around `eval-command`.
     ```
    forever [
        try [
            eval-command ask any [
                cue
                all [string? set/any 'p do [prompt] :p]
                form :p
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2018-08-16T08:21:49Z, bitbegin, commented:
<https://github.com/red/red/issues/3506#issuecomment-413465612>

    Other key words should be considered to be unset (if/either/case/all/any/empty?, so on), not only `none` key word.

--------------------------------------------------------------------------------

On 2019-09-05T11:47:13Z, dockimbel, commented:
<https://github.com/red/red/issues/3506#issuecomment-528325937>

    Protection flags and `protect/unprotect` natives are the solution for such cases, but that is planned for 0.8.0, so I'll close this ticket as "deferred".

