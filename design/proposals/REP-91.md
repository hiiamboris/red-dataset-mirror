
#91: WISH: allow `none!` as an `unset`'s argument 
================================================================================
Issue is open, was reported by Oldes and has 6 comment(s).
<https://github.com/red/REP/issues/91>

May be useful if one needs to _unset_ a value in a context, where the value is not presented at all.
So far it is like:
```red
>> ctx: context [a: 1]
== make object! [
    a: 1
]
>> unset in ctx 'a
>> unset in ctx 'b ;<--- will cause an error, because there is no `b` in `ctx`
*** Script Error: unset does not allow none! for its word argument
```


Comments:
--------------------------------------------------------------------------------

On 2020-12-29T01:30:38Z, greggirwin, commented:
<https://github.com/red/REP/issues/91#issuecomment-751915171>

    How would it be useful? And is weakening that check, for what I think will be rare cases, better than being explicit in checking whether the word exists in the context or using `attempt` and a comment that you're ignoring those errors?

--------------------------------------------------------------------------------

On 2020-12-29T07:37:23Z, Oldes, commented:
<https://github.com/red/REP/issues/91#issuecomment-751981986>

    My motivation came by answering here https://stackoverflow.com/a/65343543/494472
    
    You are right that the use would be rare. But I don't think that one would hsve to do ettor checks for this.

--------------------------------------------------------------------------------

On 2020-12-29T17:34:37Z, greggirwin, commented:
<https://github.com/red/REP/issues/91#issuecomment-752175857>

    Excellent info for context, thanks. 

