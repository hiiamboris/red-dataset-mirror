
#2424: Red #macro does not allow DOES instead of FUNC
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2424>

If one wants to use the macro facility for simple text substitution, e.g. introducing an abbreviation for a complicated expression which occurs many times, one still has to declare a function of no arguments. I know this is not an effective restriction, but it seems easy to allow `does` to mean `func [ ]` even at this level.


Comments:
--------------------------------------------------------------------------------

On 2017-02-12T11:03:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2424#issuecomment-279210827>

    I was thinking about introducing `does` in a latter version of the preprocessor.
    
    What about simplifying it even further? For example, allowing the following form:
    ```
    #macro old-word: <value>
    ```

