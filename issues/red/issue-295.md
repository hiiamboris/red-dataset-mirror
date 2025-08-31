
#295: push and pop: do they work?
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/295>

I can't find where these built-in functions are translated. Also, after executing a large number of pops, I would expect stack underflow, which does not seem to occur.



Comments:
--------------------------------------------------------------------------------

On 2012-11-06T22:23:00Z, dockimbel, commented:
<https://github.com/red/red/issues/295#issuecomment-10130360>

    They work on the current thread execution stack, so at lowest possible level. Their usage suppose an understanding of the Red/System execution stack layout and how it works. They are translated in target back-ends (IA-32.r and ARM.r) directly into their CPU equivalents.
    
    I don't know how your are issuing the large number of pops, you might easily get unwanted side-effects. Can you show me the loop code?

--------------------------------------------------------------------------------

On 2012-11-07T13:31:47Z, meijeru, commented:
<https://github.com/red/red/issues/295#issuecomment-10148218>

    I just issued a series of `pop` commands written one after the other, without looping.

--------------------------------------------------------------------------------

On 2012-11-07T20:11:28Z, dockimbel, commented:
<https://github.com/red/red/issues/295#issuecomment-10163127>

    The native stack does not start at its bottom when a Red/System program starts executing its main code. Some space is taken by arguments passed from command-line, environment variables, libc, etc...The precise stack layout is varying and platform-dependent. You might need dozens or even hundreds of `pop` calls to generate an underflow.

--------------------------------------------------------------------------------

On 2012-11-08T08:24:21Z, meijeru, commented:
<https://github.com/red/red/issues/295#issuecomment-10179811>

    OK You satisfied my curiosity :-)

