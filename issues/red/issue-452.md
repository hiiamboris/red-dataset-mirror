
#452: MAKE string with a string spec errors out
================================================================================
Issue is closed, was reported by greggirwin and has 8 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/452>

make string! "a"



Comments:
--------------------------------------------------------------------------------

On 2013-03-28T21:45:26Z, dockimbel, commented:
<https://github.com/red/red/issues/452#issuecomment-15617310>

    MAKE is currently very poor wrt the accepted specification values. You should find several more of these kind of errors with other datatypes. We need a matrix of the possible values and for each case, decide what to do with it. Also checking in R3 sources might help build such matrix quickly.

--------------------------------------------------------------------------------

On 2013-04-02T09:37:55Z, dockimbel, commented:
<https://github.com/red/red/issues/452#issuecomment-15765627>

    We probably need the TO action be implemented to handle all those specific MAKE cases.

--------------------------------------------------------------------------------

On 2013-04-02T16:40:37Z, greggirwin, commented:
<https://github.com/red/red/issues/452#issuecomment-15787207>

    TO would be great.I've hit a few places in mezzanines where it will eventually be needed.

--------------------------------------------------------------------------------

On 2016-06-22T14:21:44Z, dockimbel, commented:
<https://github.com/red/red/issues/452#issuecomment-227759516>

    I am closing this ticket as it's a unimplemented by planned feature.

