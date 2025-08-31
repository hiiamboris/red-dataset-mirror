
#2578: cannot select character from file! or url! value using /<integer>
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/2578>

Compare:
```
>> s: "ab"
== "ab"
>> s/1
== #"a"
>> f: %ab
== %ab
>> f/1
== %ab/1
>> u: a:b
== a:b
>> u/1
== a:b/1
```
The interpretation of the `/...` expression as an _extension_ of the file or url path is sometimes useful (although `[re]join` will also work), but with an integer the system breaks down... 



Comments:
--------------------------------------------------------------------------------

On 2017-04-14T09:57:15Z, qtxie, commented:
<https://github.com/red/red/issues/2578#issuecomment-294128456>

    Yes. I think we should remove this feature. 
    1. It's easy to be misused. (I write some buggy code becuase of that recently. 😓 )
    2. It makes the path rule more complex.

--------------------------------------------------------------------------------

On 2017-07-28T16:17:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2578#issuecomment-318697689>

    No `rejoin` would not work, as that path extension is handled in a *smart* way to avoid duplicate slashes. 
    
    Slash characters are an intrinsic part of files and urls (unlike for other `any-string!` series), so having a special path handling is natural, as it gives a useful extra feature which is commonly used for those types. It is a feature supported by all Rebol versions, so for all those reasons, we should keep it.

--------------------------------------------------------------------------------

On 2017-07-28T23:48:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2578#issuecomment-318786118>

    I agree with Doc here. It's important to note, but also valuable. 

