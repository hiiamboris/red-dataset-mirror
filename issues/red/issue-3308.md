
#3308: [WISH] make `pre-load` better
================================================================================
Issue is closed, was reported by nedzadarek and has 32 comment(s).
[type.wish]
<https://github.com/red/red/issues/3308>

It should be more user-friendly. I found 3 things but there might be more:
1) You should be able to turn it off and on (when you don't need pre parsing or the `pre-load` causes some errors)
2) There shouldn't be trailing newline at the end of the source
3) You should be able to add/delete/modify more than one "pre-load function".

I implemented above features in 2 versions (run those gists in a different consoles): 
https://gist.github.com/nedzadarek/c7d06b7137eea9570f2be41575567f93

```
about
Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-01T21:14:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3308#issuecomment-377817357>

    1. Simply setting it to `none` should work, yes? Also, comparing to fixed strings is not how to go about this. First, it means you could never pre-process inputs that match those hard coded strings. Second, think in terms of Red values, rather than strings, as a general rule. 
    
    2. Needs strong justification. It is not an automatic reformatter.
    
    3. Is potentially fraught with peril, and also easily done outside `pre-load`. e.g., just wrap the multi-func handling into your own function (the spec taking 2 args [src part]). The risk here is that the order in which processing is done is critical, yes?
    
    I think the way to approach these enhancements is to build them as support functions, as in your gist, showing the pros and cons. 

--------------------------------------------------------------------------------

On 2018-04-01T21:36:58Z, nedzadarek, commented:
<https://github.com/red/red/issues/3308#issuecomment-377818647>

    @greggirwin 
    1) No. There are some cases where it doesn't work:
    ```
    >> system/lexer/pre-load: func [src] [print 'not-executed clear src]
    == func [src][print 'not-executed clear src]
    >> 3
    not-executed
    >> system/lexer/pre-load: none
    not-executed
    >> 3
    not-executed
    ```
    2) Why it need justification? Why you even need new line at the end? 
    3)
    > wrap the multi-func handling into your own function 
    
    You mean something like my wrapper: https://gist.github.com/nedzadarek/c7d06b7137eea9570f2be41575567f93#file-block_version-red-L4 ?
    Yes, the order is important (I assume that `map!` have and will have insertion-order).

--------------------------------------------------------------------------------

On 2018-04-02T00:02:21Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-377826816>

    Turning pre-loading on and off could be better, agreed, but that's the price you pay for abusing experimental high-level features without a second thought.
    
    The rest is highly opinionated and unidiomatic duplication of existing macro functionality.

--------------------------------------------------------------------------------

On 2018-04-02T04:52:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3308#issuecomment-377854299>

    @nedzadarek, Good note on #1 there. So you need the ability to turn it off, then clear it, then turn it back on in your case, yes? I'm still not sure this is something we want to encourage. 
    
    For #2, what is the purpose of trimming the end? 

--------------------------------------------------------------------------------

On 2018-04-02T06:26:33Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-377865514>

    > Why you even need new line at the end?
    
    First justify why we need an _absense_ of newline at the end.

--------------------------------------------------------------------------------

On 2018-04-03T12:52:25Z, nedzadarek, commented:
<https://github.com/red/red/issues/3308#issuecomment-378238917>

    @9214 Without newline it easier to parse. 
    
    > The rest is highly opinionated and unidiomatic duplication of existing macro functionality.
    
    If we are compiling the code then you are right. What about interpreted code? 
    
    @greggirwin 's 
    
    > For #2, what is the purpose of trimming the end?
    
    So we can match simple commands like `turn on this feature`. Without trimming we would have to `parse` or `find`. I think simple comparison for such simple commands is easier and faster with `=`. 
    
    > So you need the ability to turn it off, then clear it, then turn it back on in your case, yes? I'm still not sure this is something we want to encourage.
    Yes. 

--------------------------------------------------------------------------------

On 2018-04-03T13:30:53Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-378250672>

    @nedzadarek
    > Without newline it easier to parse.
    
    No, it's not easier to parse, in fact it's quite the opposite. Lines have delimiters on purpose, and sometimes text is intentionally padded. Delimiter-directed translation is a simple and useful technique, which your change will make useless for no good reason (aside from your personal preferences). Source code in a textual form, which ends with a trailing newline, allow snippets to be directly copy-pasted and executed in REPL. It can also bring syntactical meaning in a dialect-specific context.
    
    I can't see how one symbol can make parsing (even a trivial comparison with prototype string) too complex all of a sudden. 
    
    > If we are compiling the code then you are right. What about interpreted code?
    
    I suggest you to re-read [this article](https://www.red-lang.org/2016/12/entering-world-of-macros.html) before making such claims. Red macros are both compiled and interpreted. Citing the source above (emphasis mine):
    > As Red strives to keep the source code accepted by the compiler and interpreter as interchangeable as possible, **the preprocessor can also be run by the interpreter, between load and eval phases, supporting exactly the same features as the compiler version**. 
    
    > So we can match simple commands like turn on this feature. Without trimming we would have to parse or find.
    
    Are you saying that you can match `"turn on this feature"` but not `"turn on this feature^/"`?
    
    > I think simple comparison for such simple commands is easier and faster with =.
    
    Can we see the benchmarks maybe?
    
    @greggirwin 
    Per turning `pre-load` on and off - this is an issue in REPL only, when user doesn't understand what (s)he's doing and intentionally breaks pre-load stage (by malforming input and making it  un`load`able or semantically incorrect), so as none of his/her inputs being recognized anymore (even a command to reset `pre-load`). We, possibly, can provide an escape mechanism for that in console settings, which will set `pre-load` back to `none`, bypassing console input entirely. Maybe in a Reset tab, which can also start a fresh console session?

--------------------------------------------------------------------------------

On 2018-04-03T17:25:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3308#issuecomment-378330356>

    @nedzadarek I'll come back to my first comment about not using string equality comparisons for this kind of thing. @9214 makes some great points as well.
    
    Users are, of course, free to do things however they want, and we know a lot will take this approach because it's the only way to do it in many other languages. But it's at odds with more idiomatic Red approaches, and those are what we want to use in the core as much as possible.
    
    Your other suggestions can be discussed further, the the trimming part is a no-go for me, and I'm sure it will be for Nenad as well.

--------------------------------------------------------------------------------

On 2018-04-06T09:35:13Z, nedzadarek, commented:
<https://github.com/red/red/issues/3308#issuecomment-379201627>

    @9214 
    > I suggest you to re-read this article before making such claims. Red macros are both compiled and interpreted. Citing the source above (emphasis mine):
    
    I read it and: 
    
    > The preprocessing (including macro expansion) is applied to the whole source fed to the compiler (or interpreter) after the load phase, so it is applied on a parse tree (similar to an AST).
    > You can copy/paste those code snippets in the console, wrapping them in a do expand [...]
    
    Correct me if I'm wrong but you cannot parse anything using macros. 
    
    > Are you saying that you can match "turn on this feature" but not "turn on this feature^/"
    > I can't see how one symbol can make parsing (even a trivial comparison with prototype string) too complex all of a sudden.
    
    It's not hard to parse with newline. It's just simpler without it.
    
    >this is an issue in REPL only, when user doesn't understand what (s)he's doing
    
    One user can use many `pre-load`s from a different users.
    
    > No, it's not easier to parse, in fact it's quite the opposite.
    
    I don't understand how no newline at the end can cause problems. 
    
    > Source code in a textual form, which ends with a trailing newline, allow snippets to be directly copy-pasted and executed in REPL. 
    
    I'm not saying to change source(s) of users code. It can be copy-pasted, newline = enter key. Programmer will just get `foo` instead of `foo^/`.
    
    > It can also bring syntactical meaning in a dialect-specific context.
    
    I have only seen one language that uses newline at the end: [Whitespace wikipedia](https://en.wikipedia.org/wiki/Whitespace_(programming_language)).
    
    > Lines have delimiters on purpose, and sometimes text is intentionally padded. Delimiter-directed translation is a simple and useful technique, which your change will make useless for no good reason (aside from your personal preferences).
    
    I don't understand how deleting `<newline>` (I'm using `tag!` for a newline at the end) would change anything:
    ```
    some code<newline>
    ```
    and this code:
    ```
    some
    code<newline>
    ```
    
    @greggirwin I realized now that `trim` deletes other characters as well, not only `newline`. I'm sorry for confusion!

--------------------------------------------------------------------------------

On 2018-04-06T10:54:37Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-379219383>

    @nedzadarek 
    
    > Correct me if I'm wrong but you cannot parse anything using macros.
    
    I don't understand what you mean by "cannot parse anything using macros" here.
    It's one thing to apply transformations to the source code, and another to alter its lexical form. Red macros are used for the former, `pre-load` is used for the latter. Your examples, while using `pre-load`, just mimic macro functionality by substituting tokens. A valid use-case would be to alter lexical form of tokens themselves (see example [here](https://github.com/9214/smorgasbord/blob/master/red/cadadaverous.red)).
    
    > It's not hard to parse with newline. It's just simpler without it.
    
    I don't see how it is simpler, if it's the same. For me it seems that you just have some strong syntactical preferences, as in  "`^/` at the end doesn't look cute, so it should be deleted".
    
    > One user can use many pre-loads from a different users.
    
    You have **one** `pre-load` function with well-defined functionality. You can mash together multiple Parse grammard (or simlper methods) inside it if you need, and use them for string processing. What's the use-case for abusing `pre-load` so hard? Do you *really* need reader macros to solve your problem?
    
    > I don't understand how no newline at the end can cause problems... I don't understand how deleting <newline> (I'm using tag! for a newline at the end) would change anything.
    
    And I, in turn, don't understand what benefits deletion of newline provides, aside from your hollow argument about "simplicity". It seems that you're naively assuming that `pre-load` operates on input as a whole, which is not true, since preprocessing can be applied to a part of the string (`load/part`) too -- and in this use-case newline should serve its purpose as line separator, e.g. user processes end of string (part with newline at the end) in one way and everything in-between in another way.

--------------------------------------------------------------------------------

On 2018-04-06T13:27:41Z, nedzadarek, commented:
<https://github.com/red/red/issues/3308#issuecomment-379252994>

    > I don't understand what you mean by "cannot parse anything using macros" here.
    
    I mean that macros cannot parse all valid strings. For example macro cannot parse `:3` while `pre-load` can parse it.

--------------------------------------------------------------------------------

On 2018-04-06T14:32:02Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-379271559>

    @nedzadarek as I said, it's because `pre-load` acts on lexing stage, and operates on `string!`, while macro is executed between `load` and evaluation phases, and operates on code directly. However, all examples that you provided can be reproduced with macros, not with `pre-load`.

--------------------------------------------------------------------------------

On 2018-04-06T17:17:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3308#issuecomment-379318810>

    Let's see if we can reign this in. `Pre-load` is the equivalent of reader macros in Lisp, as @9214 says. to support non-standard syntax *before* data is `load`ed. From that view, we don't know what that data might look like, only the user does. If I pre-process it, with `trim` before letting them process it, we remove certain possibilities, yes? That is, nobody can then *ever* use trailing whitespace. Maybe that's not too much of a limitation though. @nedzadarek's reason for wanting it is:
    
    > So we can match simple commands like turn on this feature. Without trimming we would have to parse or find. I think simple comparison for such simple commands is easier and faster with =.
    
    Which is a weak and non-idiomatic use case. If someone wants to trim it themselves, it's easy enough. I'll also argue that it would be better to use a different approach for turning `pre-load` on and off. Using hard coded string commands further limits its use, as nobody could ever have those strings as commands in data they may load, without running afoul of them.
    
    Today, the `pre-load` mechanism is minimal and very clean and, I think, sufficient. The problem of being able to turn it off comes from having `clear src` in your `pre-load` func, yes @nedzadarek? Without that you can safely reset it to `none` without issue. What is the root cause there? If we identify that, and explain what's safe, or not, to do in `pre-load`, people should be able to avoid that problem, yes?

--------------------------------------------------------------------------------

On 2018-04-08T13:29:12Z, nedzadarek, commented:
<https://github.com/red/red/issues/3308#issuecomment-379550705>

    @greggirwin `clear src` was just simple way to avoid setting `system/lexer/pre-load` to some value (even `none`). There are other things that can cause it, for example user want to prohibit setting `system/...` so s/he have done something like this: `system/lexer/pre-load: func [src] [if f: find src "system/" [change f "_system/"]]`. I don't know how many cases would be where user adds something "good" but it prohibit changing `system/lexer/pre-load`.
    
    > I'll also argue that it would be better to use a different approach for turning pre-load on and off
    sing hard coded string commands further limits its use, as nobody could ever have those strings as commands in data they may load, without running afoul of them.
    
    I guess I can just "parse" something like this: `system/lexer/pre-load: on` or `system/lexer/pre-load: off`.
    I guess nobody would use that kind of code, right?
    If this is not right too then I don't know how to make it programatically (in code not by some menu(s)). 

--------------------------------------------------------------------------------

On 2018-04-08T14:39:28Z, 9214, commented:
<https://github.com/red/red/issues/3308#issuecomment-379555454>

    @nedzadarek 
    
    > clear src was just simple way
    
    It was a simple way to make console entirely inoperable, because from now on it won't accept **any** input, which you `clear` before loading stage.
    
    > user want to prohibit...
    
    And he/she should do so using `protect` and `unprotect`, which are planned (moreover, I think `system` word/path will be protected by default). Your example is an extremely crude workaround for that, which works only in REPL.
    
    > I guess nobody...
    
    I'm sorry, but "guess"? It's not a quiz show. You're pushing a change and fail to back it up with sound arguments.
    
    In general, *nothing* stops you from setting `pre-load` to *any* value, it's just that you keep abusing this feature in REPL only, and REPL is closely tied to console input. Unless there's some way to bypass this standard input, I can't see any way to turn it off "programmatically".

--------------------------------------------------------------------------------

On 2018-04-09T00:44:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3308#issuecomment-379596759>

    > `clear src` was just simple way to avoid setting system/lexer/pre-load to some value (even none). 
    
    @nedzadarek, Do you understand what `clear src` is doing there, and why it breaks the system?
    
    `pre-load` is a simple way to access *very* advanced functionality. It can't be made safe. I think the best thing we can do is document its behavior in more detail. Feel free to start a wiki page for that.
    
    If you want to create a system that allows you do dynamically alter loading behavior, the best thing to do is build that on top of the existing `pre-load` behavior.

