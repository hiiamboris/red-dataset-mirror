
#535: Regression on getting address in CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/535>

Most probably a regression from #533:

```
Red/System []

c: context [
    x: 0
    print :x
]
```

-= Red/System Compiler =- 
**\* Compilation Error: undefined symbol: x 
**\* at line: 5 
**\* near: [:x]



Comments:
--------------------------------------------------------------------------------

On 2013-09-23T03:35:47Z, qtxie, commented:
<https://github.com/red/red/issues/535#issuecomment-24897524>

    Seems like the problem caused by check word in function 'comp-get-word', which is added in #533 
    
    ```
    comp-get-word: has [spec name ns symbol][
        name: to word! pc/1
        comp-word/with/check name         <-- this cause the error
        ......
    ```
    
    Then we can't find the word in 'globals', because we are in the context.
    change to this will fix this issue, but I don't know if it's the right way to fix it.
    
    ```
    comp-get-word: has [spec name ns symbol][
        name: to word! pc/1
        comp-word/with/check resolve-ns name
        ......
    ```

--------------------------------------------------------------------------------

On 2013-09-23T10:14:13Z, dockimbel, commented:
<https://github.com/red/red/issues/535#issuecomment-24909985>

    @qtxie Kudos to you for having the courage to dive into the compiler code! :-) 
    
    That's the right fix for this issue as `resolve-ns` is not applied to the word in `comp-word` when using the `with` option. It can even be further improved by putting `resolve-ns` call one line up (as it needs to be prefixed with the context anyway to be correct):
    
    ```
    comp-get-word: has [spec name ns symbol][
        name: resolve-ns to word! pc/1
        comp-word/with/check name
        ...
    ```
    
    If you wish to send me a pull request with that fix, I'll be glad to accept it so you get credits for it in the github history (just mention that's a fix for issue #535 in the commit log).

