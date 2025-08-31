
#455: All words in system/words come back as type datatype!.
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/455>

It looks like every word in system/words comes back as a datatype of datatype!.

foreach word system/words [print [mold word tab mold type? get word]]



Comments:
--------------------------------------------------------------------------------

On 2013-04-01T21:34:14Z, dockimbel, commented:
<https://github.com/red/red/issues/455#issuecomment-15738746>

    Issue is caused by a leftover from Red very early implementation, when context support was not available, all words were store in a special "root" block. Once contexts were done, a global context was added, but the old root storage was not removed resulting in a two-legged global context resulting in incoherent results in some cases.

