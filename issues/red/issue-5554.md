
#5554: Use of `return:` keyword in a function specification may be confusing
================================================================================
Issue is open, was reported by Oldes and has 18 comment(s).
[type.design]
<https://github.com/red/red/issues/5554>

Use of `return:` keyword in a function specification may be confusing when used with functions which automatically collects set-words... In Red it is probably only `function` so far. In Rebol it is also `wrap` which uses `bind/set` internally (reason why I noticed the issue).

```red
>> f1: function[][ f2: func[return: [integer!]][ return 42 'oh-no! ] f2 ]
== func [/local f2 return][f2: func [return: [integer!]] [return 42 'oh-no!] f2] ;; return is collected as a local word!
>> f1
== oh-no! ;;<-- expected is 42
```

Maybe it would be better to use some other type than a set-word.



Comments:
--------------------------------------------------------------------------------

On 2024-11-05T14:50:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5554#issuecomment-2457380402>

    `return:` as a set-word is the most readable and human-friendly option we have. The core issue is elsewere: words collecting used by those functions is a form of static analysis that is inadequate in Redbol languages. The case of set-words in function's spec block is not the only victim of such wrong approach, same goes for any nested set-word:
    ```
    >> f1: function[][o: object [return: 123] return 42 'oh-no!] f1
    == oh-no!
    ```
    
    Given how easy it is to shoot yourself in the foot using `function`, we try to promote it for advanced users only, though everybody (including myself) gets bitten by it from time to time. The deep static analysis approach is just fundamentally flawed, there's no fixing it. 
    
    That said, maybe a shallow analysis (like we do for object's body on creation) would be a good workaround, capturing only set-words at root level. That could help fix most of those gotcha cases, while making it easier to spot/debug the remaining ones, by forcing users to initialize local words at function's body root level. The other alternative would be just to drop the `function` constructor.

--------------------------------------------------------------------------------

On 2024-11-06T07:00:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5554#issuecomment-2458853811>

    I'm strongly against shallow analysis, as then you would have to manually declare most of the local words, making it no different than `func`. And I'm almost never using `func` because I just can't do this bookkeeping in my head, and it would be #1 source of bugs in my code if I did.
    
    `#local`, `#extern` and `#return` seem like an easy workaround. Or `<local>`, `<extern>`, `<return>`. But I'm not sure about picking the low hanging fruits here.
    
    The deep issue here in my opinion is that REBOL made modification of words external to the function the easiest thing to do, while in practice it's the rarest and most damaging use case. By addressing deep issues with design we avoid becoming another C++, where tons of features were piled up upon a design that was never meant for them.
    
    Object words can be explicitly set as `self/word:` which unambiguously documents the intent and is bug-proof. We have no problem with this use case.
    
    For setting global words we don't have a good way. Most often we just *want to use (read)* a global word that is shadowed, and even then the `system/words/` prefix is quite unnecessarily long (could have been just `module/` or `lib/` or something). *Setting* a global word like this is also an extremely rare case, and should require an explicit prefix, like `export word: expression` or `system/words/word: expression`. Without such prefix I would very much prefer an error thrown. I even have a [leaked words scanner](https://codeberg.org/hiiamboris/red-common/src/branch/master/leak-check.red), the existence of which is an indication of how bad is the issue.
    
    It shouldn't be too hard to modify the `set` native when it is requested to set a *set-word* to check if there's function in the stack or only `do` and flow control natives, and then decide if it results in an error or the change is silently allowed. The goal is to prevent creeping leaks and make the setting of outer scope words explicit. Making `func` much safer, though still requiring bookkeeping.
    
    Usage of `set 'word` may however indicate *an intent* to refer to the outer scope. But it has also to be consistent with `set word`, where `word` refers to another word, and it's always outside the function's scope, but again, rarely in the global scope.
    
    So, regarding `set` I see two options that may help us:
    - make setting global words an error unless it is explicit
    - make it only an error if a set-word! (not word!) is passed to `set`
    
    Since `function` is a great tool though, and going to be used a lot, it makes sense to eliminate set-words usage that is not intended for setting them, like `return:`. And it makes sense to allow set-words usage where it is intended, like [in Parse](https://github.com/red/REP/issues/60) and `foreach` (as `foreach x: [1 2 3] [...]`). 
    
    Side note: I consider it a kludge that current `foreach` and `repeat` are scanned for by `function`, while all user-defined loops don't have this privilege. At the very least it could be a user-modifiable set of parse patterns to look for. Though this topic touches [iterators](https://github.com/red/REP/issues/168) now as current loops leave a lot to be desired.
    
    I can imagine then the following:
    ```
    word: 1 + 2                                             ;) works
    f1: does [word: 1 + 2] f1                               ;) fails
    f2: does [system/words/word: 1 + 2] f2                  ;) works
    f3: does [set 'word 1 + 2] f3                           ;) works (unless 'word' is global?)
    f4: does [set 'system/words/word 1 + 2] f4              ;) works
    f5: function [foreach x [1 2 3] []] f5                  ;) fails, or needs easy extensibility to support it
    f6: function [foreach x: [1 2 3] []] f6                 ;) works
    f7: func [#return [integer!] #local x] [x: 1 x + 1] f7  ;) works, doesn't affect the outer `function` 
    ```
    
    By the way, what I believe Brian has done in Ren-C after the introduction of scopes is he made `let` add words to the current function stack at run time (as `let x: value`), and banning accidental outside references. Probably not a fit for Red, but just noting it for the reference.

--------------------------------------------------------------------------------

On 2024-11-06T11:29:19Z, Oldes, commented:
<https://github.com/red/red/issues/5554#issuecomment-2459499229>

    I reviewed some of existing function definitions which are constructed using `function` call and I must say that using just a shallow analysis would be too radical change (possibly breaking a lot of existing code). It is very common that words are set only deeper inside the function's body. And `function` is often used in cases where there are many words used.

--------------------------------------------------------------------------------

On 2024-11-06T12:05:54Z, Oldes, commented:
<https://github.com/red/red/issues/5554#issuecomment-2459575579>

    Also I think that having `/local` as a special refinement is useful. In Rebol it is possible to use it in recursion function calls (or as private state values).. like:
    ```rebol
    >> fun: func [a /local b][ b: 1 + any [b 0] either b < 5 [a: a * 2 print [b a] fun/local a b]['done] ]   fun 1
    1 2
    2 4
    3 8
    4 16
    == done
    ```
    It is not possible in Red btw:
    ```red
    >> fun: func [a /local b][ b: 1 + any [b 0] either b < 5 [a: a * 2 print [b a] fun/local a b]['done] ]   fun 1
    1 2
    *** Script Error: fun has no refinement called local
    ```
    
    So it is only about the `return:` in the `function` spec. I hesitate to use `#return`, because hashes are used in code pre-processing and there could be conflicts in the future:/
    
    Brian removed `function` in his Ren-C...  it just throws an error. It is also a no-go.

--------------------------------------------------------------------------------

On 2024-11-07T02:38:39Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5554#issuecomment-2461196666>

    One of the idea I have had during last year was to fine tune sub blocks localizing using refinements:
    
    ```
    f: function [
    ] [
    
      a: 22
    
      /nolocalize [b: 10]
    
      [c: 22  /nolocalize [d: 66]]
    
    ]
    
    ```
    
    so the collected words would be: `a: c:`
    
    Or they could act as a switch until a `/localize` is found in nested blocks or any other level

--------------------------------------------------------------------------------

On 2024-11-07T09:24:11Z, Oldes, commented:
<https://github.com/red/red/issues/5554#issuecomment-2461722212>

    @GiuseppeChillemi 
    In Rebol:
    ```red
    >> b: 1 f: function/extern [][a: 22 + b: b + 2] [b]
    >> f
    == 25
    
    >> spec-of :f
    == [
        /local a
    ]
    ```
    In Red:
    ```red
    >> b: 1 f: function [/extern b][a: 22 + b: b + 2]
    == func [/local a][a: 22 + b: b + 2]
    >> f
    == 25
    >> spec-of :f
    == [/local a]
    ```

--------------------------------------------------------------------------------

On 2024-11-07T15:17:50Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5554#issuecomment-2462501388>

    @Oldes I know but the idea behind /nolocalize /localize is to mark areas or blocks,  or switch on/off the localizer so all the set-words are skipped without need for /extern and mention them one by one. 

--------------------------------------------------------------------------------

On 2024-11-07T16:02:19Z, Siskin-Bot, commented:
<https://github.com/red/red/issues/5554#issuecomment-2462613877>

    @GiuseppeChillemi I am pretty sure that your idea will never happen.

--------------------------------------------------------------------------------

On 2024-11-07T17:29:55Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5554#issuecomment-2462834143>

    it is just an idea. There are many based on this. You could instruct the interpreter to change a lot of working via a switch and then provide parameters. The problem with this is that it needs a way to skip a passive block where the switch inside of it should be considered as data and  not as command
    
    

