
#4119: Confusing error message on encountering $ inside block
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/4119>

I was formulating a parse rule for strings not incorporating a `$` sign. I would have liked to call the rule `non$` but `$` is not allowed in words. That is fair, but when such a non-word is inside a block, the interpreter gives a confusing error message. It should of course have been the same as for the first case.

```
>> non$
*** Syntax Error: invalid value at "$"
*** Where: do
*** Stack: load 
>> rule: [ any non$ "something else"]
*** Syntax Error: missing #"]" at "$]"
*** Where: do
*** Stack: load 

```


Comments:
--------------------------------------------------------------------------------

On 2019-11-04T18:22:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4119#issuecomment-549483393>

    `\` as well. 
    ```
    >> rule: [ any non\ "something else"]
    *** Syntax Error: missing #"]" at {\ "something else"]}
    *** Where: do
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2019-11-04T22:34:21Z, meijeru, commented:
<https://github.com/red/red/issues/4119#issuecomment-549578672>

    Most likely all non-allowed characters in `word!` values gives this confusing message, so it must be a single imperfection in the lexer. Given that the lexer is being redesigned, one should remember to test this with the new lexer as soon as it is in operation, so as to hopefully discard this issue then.

--------------------------------------------------------------------------------

On 2020-03-20T20:28:06Z, 9214, commented:
<https://github.com/red/red/issues/4119#issuecomment-601896527>

    I propose we close it.
    
    ```red
    >> $non
    *** Syntax Error: (line 1) invalid money at $non
    *** Where: transcode
    *** Stack: load 
    >> non\
    *** Syntax Error: (line 1) invalid character at \
    *** Where: transcode
    *** Stack: load 
    ````

--------------------------------------------------------------------------------

On 2020-03-20T20:46:17Z, meijeru, commented:
<https://github.com/red/red/issues/4119#issuecomment-601903515>

    I am OK with closing it if there are the tests I mentioned.

--------------------------------------------------------------------------------

On 2020-07-25T06:07:21Z, theSherwood, commented:
<https://github.com/red/red/issues/4119#issuecomment-663815536>

    Tests were added. So I suspect that this can be closed.

