
#604: FORM underscore broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/604>

`red>> form "_"`
== "^p"
`red>> form #"_"`
== "^p"



Comments:
--------------------------------------------------------------------------------

On 2013-12-14T14:51:44Z, qtxie, commented:
<https://github.com/red/red/issues/604#issuecomment-30575293>

    In file `string.red`, line number: 34
    
    ```
    34: while [i < MAX_ESC_CHARS][        ;-- change i < MAX_ESC_CHARS to i <= MAX_ESC_CHARS will fix this issue
    35:       escape-chars/i: null-byte
    36:        i: i + 1
    37: ]
    ```
    
    But my question is, if we only have 32 escape chars, why you set MAX_ESC_CHARS to `60h` instead of `32` ?

--------------------------------------------------------------------------------

On 2013-12-14T18:15:13Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/604#issuecomment-30582401>

    Thanks, I suspected something like that.

--------------------------------------------------------------------------------

On 2013-12-17T11:17:27Z, dockimbel, commented:
<https://github.com/red/red/issues/604#issuecomment-30743144>

    @qtxie This routine for handling characters escaping was ported from the Rebol3 sources where (IIRC) `5Eh` character was also part of this table. It slipped away in the Red version, but I'm not sure if we'll need to put it back or not. We need more exhaustive unit testing for the whole ASCII range.

--------------------------------------------------------------------------------

On 2013-12-17T12:56:07Z, qtxie, commented:
<https://github.com/red/red/issues/604#issuecomment-30748389>

    Hmm, I find you handle `5Eh` in function `append-escaped-char`, I guess you plan to remove it from the escape-chars table (For saving memory), but you forgot for some reasons (have lunch? ;-) ).

--------------------------------------------------------------------------------

On 2013-12-17T14:35:20Z, dockimbel, commented:
<https://github.com/red/red/issues/604#issuecomment-30755221>

    Hehe :-). In fact, after having a quick look at it, I prefer to optimize for performances and code size rather than saving a few bytes in this case. So, I think `5Eh` management should be put back into the escape-chars table. Do you agree or do you see a better option?

--------------------------------------------------------------------------------

On 2013-12-17T14:42:56Z, dockimbel, commented:
<https://github.com/red/red/issues/604#issuecomment-30755870>

    I'm proceeding with fixing this bug and getting `5Eh` back in the table.

--------------------------------------------------------------------------------

On 2013-12-17T15:30:07Z, qtxie, commented:
<https://github.com/red/red/issues/604#issuecomment-30760076>

    I aggree with you.

