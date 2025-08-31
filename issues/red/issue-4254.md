
#4254: [View] Script Error when killing a window just shown
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4254>

**Describe the bug**

```
>> view [base red on-created [print "CREATED" unview]]
CREATED
*** Script Error: path none is not valid for none! type
*** Where: eval-path
*** Stack: view show  
>>
```

**Expected behavior**
```
>> view [base red on-created [print "CREATED" unview]]
CREATED
>>
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-22T14:10:53Z, meijeru, commented:
<https://github.com/red/red/issues/4254#issuecomment-577198806>

    Confirmed for 13-Jan-2020 build on W10. The addition of `print "CREATED"` is not necessary. Without it it will give the same message.

--------------------------------------------------------------------------------

On 2020-01-22T21:16:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4254#issuecomment-577389508>

    @meijeru it's just there to illustrate that the error comes after the actor's evaluation. Though probably even better to place it like this: `[unview print "CREATED"]`

--------------------------------------------------------------------------------

On 2020-06-29T16:59:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4254#issuecomment-651243829>

    Working in the current build

--------------------------------------------------------------------------------

On 2020-06-29T18:33:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4254#issuecomment-651288974>

    Works here now too.

