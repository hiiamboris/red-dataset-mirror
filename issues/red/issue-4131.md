
#4131: WISH: as string! should work on binary!
================================================================================
Issue is open, was reported by meijeru and has 18 comment(s).
[type.wish]
<https://github.com/red/red/issues/4131>

`to string! <binary>` uses utf-8 decoding, which is fine for most purposes. However, when one wants to decode a binary value that is encoded using ISO-8859-1 or Windows-1252, and this is quite common in e-mail transmission, one should like to use _direct_ conversion of each byte into an 8-bit character. The mechanism is there: `as` could allow `binary! -> string!`.


Comments:
--------------------------------------------------------------------------------

On 2020-03-22T11:54:07Z, 9214, commented:
<https://github.com/red/red/issues/4131#issuecomment-602187704>

    I think `as binary! <string>` might also be useful.

--------------------------------------------------------------------------------

On 2020-03-22T14:18:22Z, meijeru, commented:
<https://github.com/red/red/issues/4131#issuecomment-602207540>

    "_I think `as binary! <string>` might also be useful._" Careful: strings are stored with either 8, 16 or 32 bits per character, in an implementation-dependent way. Since `as binary!`  does not convert to UTF-8 it will leave the bit sequences intact, and the user may not be able to determine from the binary result what the bit-size per character actually is.

--------------------------------------------------------------------------------

On 2020-03-23T11:46:17Z, 9214, commented:
<https://github.com/red/red/issues/4131#issuecomment-602543760>

    `as binary!` simply gives you a raw view into `string!`s buffer, it's up to the user to keep tabs on the encoding.
    
    There's at least one use-case for that, related to matching strings by datatypes in Parse (`fast-lexer` branch), which, because of the lexer's byte-oriented nature, requires the input string to be converted to `binary!` first. `to` suffices, but it copies the content.

--------------------------------------------------------------------------------

On 2020-04-24T11:53:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4131#issuecomment-618965502>

    Encoding/decoding different locales like ISO-8859-1 is planned to be handled by the codec system.

--------------------------------------------------------------------------------

On 2020-04-29T19:47:50Z, 9214, commented:
<https://github.com/red/red/issues/4131#issuecomment-621424949>

    Another use-case that I just stumbled upon: analyzing binary data.
    ```red
    >> as string! find read/binary %binary.exe "deflate"
    == {deflate 1.1.4 Copyright 1995-2002 Jean-loup Gailly ^@^@^@^@^@^@^@^@^@^@^@^@<ÀG^@^D^@^D^@^H^@^D^@ÁG^@^D^@^E^@^P^@^H^@ÁG^@^D^@^F^...
    ```
    
    Without `as` I would have to `copy/part` the `binary!` first, without knowing in advance how much (or up to what terminating char/byte) of ASCII data to copy, and losing the ability to navigate the original data with series actions, and then resort to `to`:
    
    ```red
    >> ; presupposes that I know that it's 50 characters long 
    >> to string! copy/part find read/binary %binary.exe "deflate" 50
    == {deflate 1.1.4 Copyright 1995-2002 Jean-loup Gailly}
    >> ; presupposes that I know that it's null-terminated
    >> to string! first parse read/binary %binary.exe [collect [to "deflate" keep to null]]
    == {deflate 1.1.4 Copyright 1995-2002 Jean-loup Gailly }
    ```
    
    Also, `to` throws an encoding error if data is not a valid UTF-8, but with `as` you can get partially corrupted string with `�` characters and somesuch, which at times is tremendously useful.
    
    Consider also if one wants to make a hex editor in Red with View: one `area` can contain `as string!` representation, another  (in theory) raw binary dump, changing one will affect the other. OTOH, that would require "conversion hooks" for `data` and `text` facets (i.e. you specify what conversion to apply instead of the default `to`, e.g. `as`)... but I digress.

--------------------------------------------------------------------------------

On 2020-04-29T19:57:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4131#issuecomment-621430021>

    Can't you just `parse read/binary %binary.exe [to "deflate" copy s to #"^@"] to string! s`?

--------------------------------------------------------------------------------

On 2020-10-08T17:12:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4131#issuecomment-705707576>

    > Another use-case that I just stumbled upon: analyzing binary data.
    
    String! has a specfic internal encoding (UCS1, UCS2 or UCS4). If a string! is constructed from a binary! with unknown encoding, how can be possible to garantee that the string is properly encoded?
    
    For example, what is `as string! {FFFF}` supposed to return? If the `unit` series field is set to 1 (which is the case because the series buffer is shared), then what `FF` means in UCS1 when the upper limit is `7F`?
    
    I see no way for a working series buffer overlapping between string! and binary! with the way strings are implemented currently. 

--------------------------------------------------------------------------------

On 2020-10-08T17:18:39Z, 9214, commented:
<https://github.com/red/red/issues/4131#issuecomment-705710878>

    @dockimbel right. I argued [recently](https://github.com/red/red/pull/4363#issuecomment-701354177) that only `as binary! <string>` case should remain. OTOH, if such `binary!` buffer is modified, then the resulting string will likely get corrupted.

--------------------------------------------------------------------------------

On 2020-10-08T17:24:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4131#issuecomment-705713920>

    > OTOH, if such binary! buffer is modified, then the resulting string will likely get corrupted.
    
    We can't allow that to happen.

