
#2421: In area face, tab is set at 8 spaces, tab size apparently cannot be configured
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2421>

I would prefer it at 4 spaces, or better still, configurable...


Comments:
--------------------------------------------------------------------------------

On 2017-02-12T11:16:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2421#issuecomment-279211516>

    We should add a property for that in `face/options`, like `face/options: [tabs: <integer>]`.

--------------------------------------------------------------------------------

On 2017-02-14T10:42:20Z, meijeru, commented:
<https://github.com/red/red/issues/2421#issuecomment-279672682>

    Is the default now changed to 4 (commit `966930e`)? 

--------------------------------------------------------------------------------

On 2017-02-14T10:49:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2421#issuecomment-279674331>

    Yes.

--------------------------------------------------------------------------------

On 2017-02-18T03:36:05Z, qtxie, commented:
<https://github.com/red/red/issues/2421#issuecomment-280818651>

    Now we can set tab size in area/options:
    ```
    view [a: area do [a/options: [tabs: 8]]]
    ```

