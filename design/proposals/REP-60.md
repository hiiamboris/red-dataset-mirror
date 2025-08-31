
#60: WISH: allow set-words in Parse's SET & COPY
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
<https://github.com/red/REP/issues/60>

Allow:
`set word: rule`
`copy word: rule`
as an alternative to:
`set word rule`
`copy word rule`
so that `word` can be automatically localized by `function`s (else it's always a source of bugs and manual labor after every refactor)



Comments:
--------------------------------------------------------------------------------

On 2019-12-25T19:15:02Z, greggirwin, commented:
<https://github.com/red/REP/issues/60#issuecomment-568924215>

    If set-words have a different behavior, based on whether they follow a keyword, it seems like it will complicate `parse`, possibly leading to more bugs and work, offsetting gains from this feature. The alternative, to prep a func at the mezz level, adds to the number of func-making funcs we already have, and being very specialized. And it will have a long name if we specialize it to this purpose. :^\

--------------------------------------------------------------------------------

On 2020-11-30T18:22:49Z, Oldes, commented:
<https://github.com/red/REP/issues/60#issuecomment-735958806>

    I don't think that allowing `set-word!` after `set` or `copy` command could complicate anything. And parse rules are really common source of leaked variables.

--------------------------------------------------------------------------------

On 2020-12-01T13:03:17Z, loziniak, commented:
<https://github.com/red/REP/issues/60#issuecomment-736537912>

    > `s: 1 f: function[][parse ["abc"][set s string!]]  f`
    
    I think current behavior is consistent with main Red syntax. I wouldn't expect `s` to not leak, because it's the same with normal `set` function:
    
    ```
    >> s: 1 f: function[][set 's "xyz"] f
    == "xyz"
    >> s
    == "xyz"
    ```

--------------------------------------------------------------------------------

On 2020-12-01T15:49:26Z, hiiamboris, commented:
<https://github.com/red/REP/issues/60#issuecomment-736639311>

    @loziniak I hope you're not trying to say that you're a fan of the tedious procedure of manually detecting newly introduced words and extracting them out of the Parse rules (;

--------------------------------------------------------------------------------

On 2020-12-02T05:21:46Z, greggirwin, commented:
<https://github.com/red/REP/issues/60#issuecomment-736997926>

    @hiiamboris I hope you're not trying to say that modal keyword one-shot relays are a free lunch. ;^)

--------------------------------------------------------------------------------

On 2020-12-02T12:41:24Z, hiiamboris, commented:
<https://github.com/red/REP/issues/60#issuecomment-737205870>

    I accept a slight readability price, same as with `set [x: y: z:] stuff` (;

--------------------------------------------------------------------------------

On 2025-01-10T00:46:17Z, GiuseppeChillemi, commented:
<https://github.com/red/REP/issues/60#issuecomment-2581517994>

    I agree, it would save a lot of time debugging. I would like having it too.
    

