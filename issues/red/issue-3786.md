
#3786: WISH: add --quiet flag to red.r to prevent consoles from launching after compiling
================================================================================
Issue is closed, was reported by gltewalt and has 20 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3786>

Can be useful for admin scripts written in Red that keep Red binaries current, or for a future `upgrade` feature.
I have made the changes to red.r in my repo.

```
C:\Users\Old Man\Desktop\red\build\bin>red --cli --quiet
Compiling compression library...
Compiling Red console...

C:\Users\Old Man\Desktop\red\build\bin>
```


Comments:
--------------------------------------------------------------------------------

On 2019-02-20T05:12:26Z, gltewalt, commented:
<https://github.com/red/red/issues/3786#issuecomment-465427083>

    Used in a script. 
    
    ```
    C:\Users\Old Man>rbu
    Updating Red...
    Compiling compression library...
    Compiling Red console...
    Compiling Red GUI console...
    Done.
    C:\Users\Old Man>
    ```

--------------------------------------------------------------------------------

On 2019-02-20T20:13:39Z, endo64, commented:
<https://github.com/red/red/issues/3786#issuecomment-465736406>

    Didn't your PR work?

--------------------------------------------------------------------------------

On 2019-02-20T20:58:01Z, 9214, commented:
<https://github.com/red/red/issues/3786#issuecomment-465751170>

    @endo64 Greg forgot to add the final touch.

--------------------------------------------------------------------------------

On 2019-02-20T21:01:00Z, gltewalt, commented:
<https://github.com/red/red/issues/3786#issuecomment-465752237>

    It works but the PR was an experiment with GitHubs new Draft feature. 
    Do I make a regular PR and tie it to this Wish somehow?

--------------------------------------------------------------------------------

On 2019-02-20T22:10:56Z, 9214, commented:
<https://github.com/red/red/issues/3786#issuecomment-465775454>

    @gltewalt you can reference it from a ticket as a proof-of-concept.

--------------------------------------------------------------------------------

On 2019-02-20T23:26:16Z, gltewalt, commented:
<https://github.com/red/red/issues/3786#issuecomment-465797009>

    #3787 

--------------------------------------------------------------------------------

On 2019-08-14T15:47:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3786#issuecomment-521303464>

    @gltewalt What about this ticket? Is the PR for it ready?

--------------------------------------------------------------------------------

On 2019-08-15T09:22:04Z, endo64, commented:
<https://github.com/red/red/issues/3786#issuecomment-521576339>

    @dockimbel @gltewalt It looks that PR (already merged #3787) doesn't work as expected:
    
    ```
    D:\Projects\Red\red\build\bin>..\build.r
    
    D:\Projects\Red\red\build\bin>red --cli --quiet
    Compiling compression library...
    Compiling Red console...
    *** Access Error: cannot open: %--quiet
    *** Where: read
    *** Stack:
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >>
    ```

--------------------------------------------------------------------------------

On 2019-08-15T09:24:26Z, 9214, commented:
<https://github.com/red/red/issues/3786#issuecomment-521577568>

    @endo64 there's no indication that PR was merged, @gltewalt closed it for later resubmission.

--------------------------------------------------------------------------------

On 2019-08-15T09:28:10Z, endo64, commented:
<https://github.com/red/red/issues/3786#issuecomment-521578840>

    @9214 Thanks, I thought it was merged.

