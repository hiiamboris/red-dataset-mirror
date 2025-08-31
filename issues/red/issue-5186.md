
#5186: Object events handler stack corruption
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5186>

```
o: make object [on-change*: does []] [
	i: 1
	on-change*: func [w o n] [print [" ***" w "changed" :o ">" :n]]
]

do probe [o/i: o/i + 1]
do probe [set in o 'i o/i + 1]
do probe [do bind [i: i + 1] o]
```
```
 *** on-change* changed ?function? > ?function?
[o/i: o/i + 1]
 *** i changed 1 > 2
[set in o 'i o/i + 1]
 *** i changed 2 > 3
[do bind [i: i + 1] o]
 *** i changed 3 > 4
```

Pure magic...

_Originally posted by @hiiamboris in https://github.com/red/red/issues/3804#issuecomment-1118484325_


Comments:
--------------------------------------------------------------------------------

On 2022-08-26T21:53:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5186#issuecomment-1228992121>

    Hmm. Is there a problem in this snippet?

--------------------------------------------------------------------------------

On 2022-08-26T22:23:34Z, dockimbel, commented:
<https://github.com/red/red/issues/5186#issuecomment-1229010015>

    Hmmm... seems I was fooled by the `make object [...` part, I read it as `make object! [...`.
    
    I'll close this false issue then.

