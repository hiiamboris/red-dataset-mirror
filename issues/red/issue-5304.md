
#5304: [Regression] Molded extreme percent values are not loadable
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5304>

worked in `red-21may20-398d73317.exe`

**Describe the bug**
```
>> 10000000000000%
== 1e13%
>> 1e13%
*** Syntax Error: (line 1) invalid float at 1e13%
*** Where: set
*** Near : transcode/trace buffer :delimiter-lex
*** Stack: load 
```

**Expected behavior**

mold/load round-trip

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4661 date: 1-Apr-2023/18:58:04 commit: #368b90da1a7667ecc5ecf8dcdca59cc6c74ab8b5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```

see also https://github.com/red/red/issues/4379


Comments:
--------------------------------------------------------------------------------

On 2023-04-07T19:37:31Z, greggirwin, commented:
<https://github.com/red/red/issues/5304#issuecomment-1500582015>

    Do we *need* extreme `percent!` values? To that end, we can either design useful limits, or document known limits due to implementations (this holds true elsewhere). Leaking the implementation detail is doc'd right now, but should it be? If we were to design `percent!` by purpose and use cases, what would those docs look like?
    ```
    >> 1'000'000'000'000.1%
    == 1000000000000%
    >> 1'000'000'000.1%
    == 1000000000.1%
    >> 1'000'000'000.123%
    == 1000000000.123%
    >> 1'000'000'000.1234%
    == 1000000000.123%
    ```

--------------------------------------------------------------------------------

On 2023-04-07T19:53:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5304#issuecomment-1500593133>

    I'd rather not clip percents carelessly, or they will overflow all the time in calculations. If they're not useful in calculations, then they're only barely more useful over having a float with a `%` in the format string: the only benefit of having percents will be leveraging them in dialects.
    
    Other interesting cases:
    ```
    >> to percent! 1.#inf
    == 1.#INF
    >> to percent! 1.#nan
    == 1.#NaN
    ```
    `percent!` value over mold+load becomes a `float!`.
    
    This relates to the lacking `mold/all` construction syntax, to which `mold` in this case should IMO fall back. 

--------------------------------------------------------------------------------

On 2023-04-07T20:55:13Z, greggirwin, commented:
<https://github.com/red/red/issues/5304#issuecomment-1500637627>

    I didn't suggest we clip them carelessly. Do we need to consider intermediate values? Of course. But let's not resort to fear mongering. :^)
    
    The key question is:
    
    > If we were to design percent! by purpose and use cases, what would those docs look like?

