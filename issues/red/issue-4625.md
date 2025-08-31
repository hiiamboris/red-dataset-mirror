
#4625: Invalid UTF-8 Loading string would require an additional string
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 4 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/4625>

Loading or DOing a script which has in it high ASCII characters like latin accented ones, causes "INVALID UTF-8 ENCODING". One may think he is receiving this message just because the file has some kind of error, not understanding that he may be reading an ASCII file with accented characters. To avoid this situation, I suggest adding the following string:

"you may be using accented ASCII characters in your file, which are not compatible to UTF-8. ASCII files are readable only up to character Ox7F"







Comments:
--------------------------------------------------------------------------------

On 2020-09-30T12:21:04Z, dockimbel, commented:
<https://github.com/red/red/issues/4625#issuecomment-701354585>

    "High ASCII" or "Extended ASCII" are improper and confusing terms:
    ```
    Using the term "extended ASCII" on its own is sometimes criticized,[1][2][3] because it can be mistakenly interpreted to mean that the ASCII standard has been updated to include more than 128 characters or that the term unambiguously identifies a single encoding, neither of which is the case.
    ```
    https://en.wikipedia.org/wiki/Extended_ASCII
    
    ASCII is a 7-bit encoding format. If you are using accented character, you are most probably using one of the locale ISO 8859 encoding formats. 
    
    In all cases, none of those are UTF-8 encoding format, so Red's error message is accurate there. It is not the purpose of error message to teach users about encoding formats, nor other basic computer-related concepts. Moreover, the error message you are proposing is very specific to your use-case, so it does not qualify for a general error message.

--------------------------------------------------------------------------------

On 2020-10-01T06:17:21Z, rebolek, commented:
<https://github.com/red/red/issues/4625#issuecomment-701912910>

    @GiuseppeChillemi See my [codepage.red](https://gitlab.com/rebolek/castr/-/blob/master/codepage.red) script which can convert 11 most popular non-CJK codepages to UTF-8.

