
#1126: load does not accept single # as issue!, whereas interpreter has no problem
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1126>

Compare

```
type? # 
== issue!
mold # 
== "#"
load "#"
== Syntax Error: invalid Red value at: #
```

R2 has no problem loading.

Of course, it is another question whether an empty issue is a good idea.



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T02:09:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1126#issuecomment-96876385>

    Issue! nature has changed, it is string-like in R2 and word-like in R3. Red followed R3 on that, so I think that an empty word should not be allowed.
    
    It is interesting to see that the console allows such syntax while relying on LOAD itself. :-)

