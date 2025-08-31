
#1752: Provide --scan complier option
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/1752>

A --scan compiler option that checked the syntax of a source program, listing all errors, would be very useful for testing.

If it could check for errors other than syntax errors it would be even more useful.



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T11:00:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1752#issuecomment-280300320>

    I don't think this could work as you think. If you have ever used a C compiler, it outputs an exhaustive list of errors found, not stopping at the first one. Most of the time, the majority of the reported errors are pointless, as they are cascading from an initial error (could be syntactic or semantic error), messing up the processing of the source code.
    
    For syntactic errors, there is no way to know where to *resume*, as *after the invalid token* position cannot be determined, as the token's type cannot be recognized for sure.

--------------------------------------------------------------------------------

On 2018-04-23T01:31:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1752#issuecomment-383430269>

    Closing as no longer wished.

