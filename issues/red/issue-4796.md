
#4796: Misformed literal string cannot be ended in console
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4796>

Entering unbalanced literal string in console enters a loop that cannot be ended:
```
>> %{}%%
{    }%
{    }%
{
```

**Expected behavior**
String should be closed with correct ending as in following case
```
>> %%{}%
{    }%%
== "}%^/"
```

**Platform version**
```
Red 0.6.4 for Windows built 9-Jan-2021/1:47:49+02:00 commit #db2c060
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-09T14:14:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4796#issuecomment-757229491>

    related https://github.com/red/red/issues/4744

