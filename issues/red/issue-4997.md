
#4997: Invalid float at .e
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4997>

**Describe the bug**

Lexer does not allow words to start with `.e`, thinks it's an exponent:
```
>> [.a .b .c .d .e]
*** Syntax Error: (line 1) invalid float at .e]
*** Where: set
*** Stack: load 
>> .end
*** Syntax Error: (line 1) invalid float at .end
*** Where: set
*** Stack: load 
>> .e10
== 0.0
>> .e-10
== 0.0
>> .ex10
*** Syntax Error: (line 1) invalid pair at .ex10
*** Where: set
*** Stack: load 
>> .e1e2e3
== 0.0
>> .2e1e2e3
== 1.#INF
>> '.e
== .e
>> '.e1e2
== .e1e2
>> '.2e1e2
== .2e1e2
```

**Expected behavior**

I suggest `e` does not get treated as exponent unless there was at least one digit before it. Let `.e10` be a word, so things like `.entry10` become words too.

Also no `e1e2e3` in any case.

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-02T10:32:01Z, dockimbel, commented:
<https://github.com/red/red/issues/4997#issuecomment-1027794560>

    Agreed, except for ".e" which will not be allowed as literal, as it can be an erroneous float literal (due to bad truncation e.g.). It's still possible to use it as a word using a lit-word form.

--------------------------------------------------------------------------------

On 2022-02-02T12:51:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4997#issuecomment-1027910312>

    Is it worth having a special case, trading valid word for invalid float?

--------------------------------------------------------------------------------

On 2022-02-02T13:04:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4997#issuecomment-1027921278>

    No, the exponent form should have a one digit before it as you proposed. I've overlooked it.

