
#2552: Insufficient encapsulation of GUI console code
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2552>

There are many words, both variables and functions, visible at global level, which are in fact internal to the GUI console code. This could be harmful whan the user inadvertently rebinds these words.


Comments:
--------------------------------------------------------------------------------

On 2017-06-09T15:12:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2552#issuecomment-307415976>

    Console is being rewritten in 0.6.4, so tickets for current version will not be processed.

--------------------------------------------------------------------------------

On 2017-06-09T15:15:05Z, meijeru, commented:
<https://github.com/red/red/issues/2552#issuecomment-307416769>

    OK I will close

