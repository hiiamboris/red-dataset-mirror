
#3262: WISH: /LENGTH refinement for MIN and MAX
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/3262>

Sometimes I want to get the longest/shortest series out of two. Usually I resort to something like:
```red
>> get pick [x y] greater? length? x: [1 2] length? y: [3 4 5]
== [3 4 5]
>> get pick [x y] lesser? length? x: [1 2] length? y: [3 4 5]
== [1 2]
```
I wish I could use `max` and `min` for that, but they compare elements at series indexes.
```red
>> max [100][1 2 3]
== [100]
>> min [1 2 3][100]
== [1 2 3]
>> min [100][1 2 3]
== [1 2 3]
```
 I understand that there're reasons for this functionality, and what I propose is `/length` refinement so as:
```red
>> min/length [4 5 6][1 2 3 4]
== [4 5 6]
>> max/length [4 5 6][1 2 3 4]
== [1 2 3 4]
```



Comments:
--------------------------------------------------------------------------------

On 2018-03-15T09:22:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3262#issuecomment-373311578>

    How is `(max/min)/length` better than the `longer/shorter` mezz approach mentioned in Gitter chat? By overriding `min/max` more, you create more incompatibilities, less explicit clarity about types and intention, and it will be a *lot* more work from glancing at the R/S code. Native to action dispatch, to datatype changes for `compare`, unless you try to short circuit and do it just in the native. That would be much easier, as then you don't have to propagate the new refinement everywhere beyond that either.

--------------------------------------------------------------------------------

On 2018-03-15T10:05:29Z, 9214, commented:
<https://github.com/red/red/issues/3262#issuecomment-373323850>

    @greggirwin I don't mind mezzanines, for me it feels like `longest/shortest` matches `max/min` semantics.

--------------------------------------------------------------------------------

On 2018-04-25T06:41:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3262#issuecomment-384177055>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

