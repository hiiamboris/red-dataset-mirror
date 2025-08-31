
#2431: DO and LOAD do not skip the Red header
================================================================================
Issue is open, was reported by meijeru and has 10 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2431>

In Rebol a well formed Rebol header (`Rebol [...]`) is not evaluated to obtain the result of DO or LOAD. I am not sure what the policy for Red is going to be, but so far it seems the Red header is not skipped.


Comments:
--------------------------------------------------------------------------------

On 2017-02-09T18:21:53Z, geekyi, commented:
<https://github.com/red/red/issues/2431#issuecomment-278727810>

    I don't understand by `do` skipping the header, but `load` definitely behaves differently:
    Rebol2:
    ```rebol
    >> load {Rebol}
    == Rebol
    >> load {Rebol []}
    == [
    ]
    >> load {Rebol [green] blue}
    == blue
    ```
    In red:
    ```red
    red>> load {Red [green] blue}
    == [Red [green] blue]
    ```
    All my tests with `do` so far, indicates header is `load`ed but not evaluated (similar to a `block!`)
    Any examples?

--------------------------------------------------------------------------------

On 2017-02-11T15:51:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2431#issuecomment-279154330>

    Currently in Red, the header is supposed to be skipped by DO, though, in practice, DO is failing to do so in all cases.
    
    I think having LOAD handle it, like in Rebol, is probably a better option, as LOAD is the constructor of Red values, when imported from external world, so it needs to identify the provided content as "Red data" before proceeding, which is accomplished through the Red header checking.

--------------------------------------------------------------------------------

On 2017-02-15T14:50:14Z, meijeru, commented:
<https://github.com/red/red/issues/2431#issuecomment-280030679>

    See also new issue #2439

--------------------------------------------------------------------------------

On 2017-03-17T21:39:38Z, x8x, commented:
<https://github.com/red/red/issues/2431#issuecomment-287478078>

    It is my understanding that a file loaded by `load` doesn't need a Red header, but doing a file with `do` does.
    Actually doing a file doesn't skip the Red header, it works as a side effect of the `red` color being defined in `%red/environment/colors.red` here is the proof:
    ```
    unset 'red
      do %test.red
    *** Script Error: Red has no value
    *** Where: do
      do load %test.red
    *** Script Error: Red has no value
    *** Where: do
    ```
    More a bug then a wish imho.

--------------------------------------------------------------------------------

On 2017-03-18T10:49:51Z, geekyi, commented:
<https://github.com/red/red/issues/2431#issuecomment-287535162>

    @x8x I may be wrong, but the side effect may have been intentional, as it allows the following convention:
    ```rebol
    Rebol [
      file: %r2red.r
      ..blah..blah..
    ]
    Red[]
    ```
    For creating Red and Rebol inter-operable files. Still speculation, but I feel doc had chosen a name that already exists as a Rebol `word!` for this. (and Red having "Re.." in it)
    
    All just what it looks to me on the outside
    
    That said, do you still think it would cause problems? (Rebol could also have been unset, also, it could contain malicious code, etc. But I don't immediately imagine that would be out of control of the developer..)

