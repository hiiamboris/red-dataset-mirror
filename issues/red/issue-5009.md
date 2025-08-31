
#5009: Issues in paths are not lexed
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.wish] [type.design]
<https://github.com/red/red/issues/5009>

**Describe the bug**

Sometimes it's useful to have #issue instead of word in the data (came up in XML codec). But currently one needs parens for that:
```
>> b: [#x 1 #y [#z 2]]
>> b/#y/#z
*** Syntax Error: (line 1) invalid issue at #y/#z
*** Where: case
*** Stack: load 
>> b/#x: 3
*** Syntax Error: (line 1) invalid issue at #x: 3
*** Where: set
*** Stack: load 
>> b/(#y)/#z
== 2
>> b/(#x): 3
== 3
```
I don't think parens are a necessity, since `/` and `:` chars are invalid in issues anyway, and path access is more useful than the error behavior. R2 allows `b/#y/#z`.

**Expected behavior**

Issues work inside paths without parens.

**Platform version**
```
Red 0.6.4 for Windows built 6-Dec-2021/19:27:05+03:00  commit #252d78d
```



Comments:
--------------------------------------------------------------------------------

On 2021-12-17T21:42:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/5009#issuecomment-997048031>

    See also #5007 on compiler problems

--------------------------------------------------------------------------------

On 2022-02-18T16:53:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5009#issuecomment-1044830081>

    Another important use case blocked by this bug is mimicking refinements for macro functions.
    
    E.g. imagine we define a macro `#my-fun <args>` that conditionally translates into `my-fun <args>` call at runtime. If `my-fun` supports any refinements, we may want to pass them to the macro as well: `#my-fun/ref <args>`.
    
    Right now, it's not lexed:
    ```
    >> [#my-fun/ref]
    *** Syntax Error: (line 1) invalid issue at #my-fun/ref]
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    ```
    R2 however supports this, so there will be no problems with compiler:
    ```
    >> [#my-fun/ref]
    == [#my-fun /ref]
    ```

