
#1782: Put parsing rules from transcode into a separate context, to make them accessible.
================================================================================
Issue is closed, was reported by SteeveGit and has 6 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1782>

 **Transcode** function in red/environment/lexer.red defines all its parsing rules in local.
Instead, they could have their own context in **system/lexer** so that we can reuse them in our own code.



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T18:24:21Z, 9214, commented:
<https://github.com/red/red/issues/1782#issuecomment-602083299>

    @dockimbel is this still relevant?
    
    ```red
    >> parse to binary! "1 word [:block]" [integer! word! space #"[" get-word! #"]"]
    == true
    ```

--------------------------------------------------------------------------------

On 2020-07-30T12:08:56Z, 9214, commented:
<https://github.com/red/red/issues/1782#issuecomment-666326043>

    ↑ ping.

--------------------------------------------------------------------------------

On 2020-10-05T11:37:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1782#issuecomment-703575841>

    As the lexer has been redesigned and reimplemented totally, this ticket does not apply anymore. 

