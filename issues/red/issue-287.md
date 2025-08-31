
#287: The block `definitions` in the compiler.r source code does not seem to be used
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/287>

I stumbled on this because I was looking for the precise rules governing `context` ("namespace") names. I only see initialization and consultation, never filling? Do I overlook something?



Comments:
--------------------------------------------------------------------------------

On 2012-10-31T18:15:56Z, dockimbel, commented:
<https://github.com/red/red/issues/287#issuecomment-9955862>

    See line 212 in %loader.r.

--------------------------------------------------------------------------------

On 2012-10-31T18:31:23Z, meijeru, commented:
<https://github.com/red/red/issues/287#issuecomment-9956447>

    I stand corrected.

