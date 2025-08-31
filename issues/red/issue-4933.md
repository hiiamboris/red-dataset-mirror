
#4933: TRANSCODE/NEXT and LOAD/NEXT problems with non-ASCII chars
================================================================================
Issue is closed, was reported by giesse and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4933>

(Tested on latest commit on master as of today.)
```
>> load/next {"Gab’s Books"^/Work In P} 'pos
== "Gab’s Books"
>> pos
== "ork In P"
>> load/next {"Gab's Books"^/Work In P} 'pos
== "Gab's Books"
>> pos
== "^/Work In P"
```
Also:
```
>> transcode/next "фывапр abcdef"
== [фывапр "f"]
```
But:
```
>> to "" second transcode/next to #{} "фывапр abcdef"
== " abcdef"
```


Comments:
--------------------------------------------------------------------------------

On 2021-07-20T18:26:46Z, dockimbel, commented:
<https://github.com/red/red/issues/4933#issuecomment-883603608>

    The issue occurs only on `string!` input, it works fine on `binary!` input.
    
    The fix above seems to work only on `transcode/next "фывапр abcdef"` case, but not on the other ones.

--------------------------------------------------------------------------------

On 2021-07-21T09:00:45Z, giesse, commented:
<https://github.com/red/red/issues/4933#issuecomment-884019217>

    > The issue occurs only on `string!` input, it works fine on `binary!` input.
    
    That's what I meant with the "But:" example, sorry for not being clear. (@hiiamboris found that out.)
    

