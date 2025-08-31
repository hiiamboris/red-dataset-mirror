
#365: Cannot find use of %imports.reds
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/365>

I am documenting some aspects of the compiler (initially for my own understanding). In figuring out the order and relation of the #include files I could not find where %imports.reds is included. Did I overlook something?



Comments:
--------------------------------------------------------------------------------

On 2013-01-03T20:26:10Z, dockimbel, commented:
<https://github.com/red/red/issues/365#issuecomment-11859327>

    It is called from %red/compiler.r

--------------------------------------------------------------------------------

On 2013-01-03T21:08:31Z, meijeru, commented:
<https://github.com/red/red/issues/365#issuecomment-11860910>

    How can a .reds file be called from a Rebol source?

--------------------------------------------------------------------------------

On 2013-01-04T01:14:33Z, dockimbel, commented:
<https://github.com/red/red/issues/365#issuecomment-11868674>

    Sorry, I have misread the filename. It is a leftover from old code, the content of this file has been dispatched in the various files in %platform/ folder, so %imports.reds should be removed. Thank you for noticing it!

