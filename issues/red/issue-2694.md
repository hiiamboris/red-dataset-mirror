
#2694: to-set-word does not lead to binding
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2694>

```
>> a: 1
== 1
>> to-set-word 'a 2
== 2
>> a
== 1
```
I would have thought that the second expression is equivalent to `a: 2` but it does not work.


Comments:
--------------------------------------------------------------------------------

On 2017-05-18T16:46:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2694#issuecomment-302467803>

    There is no "double evaluation", `to-set-word 'a 2` evaluates to `a: 2` and returns the last value: `2`.
    
    Same behavior as: `last reduce [to-set-word 'a 2]`.

--------------------------------------------------------------------------------

On 2017-05-18T16:48:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2694#issuecomment-302468112>

    Please do not open a ticket for each and every question you have, that is not the purpose of a bugtracker. Use the chat rooms on Gitter preferably, unless it's really an issue which requires code fixing.

--------------------------------------------------------------------------------

On 2017-05-18T16:50:12Z, meijeru, commented:
<https://github.com/red/red/issues/2694#issuecomment-302468697>

    It is not always easy to understand that there is no code to be fixed!

--------------------------------------------------------------------------------

On 2017-05-19T05:37:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2694#issuecomment-302613311>

    I understand that, though the bugtracker should not be the default option, it should rather be the last resort. Processing tickets has a cost for the Red team, and adding many tickets which are just questions or remarks, make it harder to track and identify the one reporting severe bugs which require quick fixing.
    
    It is not always easy to tell if it's a bug or intended feature, as the documentation is not written, though you can ask questions or submit use-cases in red/red, or red/bugs chat rooms, then open a ticket if it's a confirmed issue. This would speed up the process and avoid creating extra tickets.

