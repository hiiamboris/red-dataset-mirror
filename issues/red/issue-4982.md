
#4982: Invalid result of `to-red-file "\\"` call on Windows
================================================================================
Issue is open, was reported by Oldes and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/4982>

Currently there is correct:
```red
>> to-red-file "\\machine\shareName\msvcSrc\crt\headerFiles\stdlib.h"
== %/machine/shareName/msvcSrc/crt/headerFiles/stdlib.h
```
But incorrect:
```red
>> to-red-file "//"
== %/none
>> to-red-file "\\"
== %/none
```
Expected result is `%/` in both cases above.
https://gitter.im/red/bugs?at=6166b450a41fd20699ded88d


Comments:
--------------------------------------------------------------------------------

On 2021-10-14T20:13:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4982#issuecomment-943693679>

    - `%/machine/shareName/msvcSrc/crt/headerFiles/stdlib.h` conflicts with drive namespace, namely if machine name is a single letter you can't access it, so I recommend using `%//` or `%/?/` prefix for UNC paths in Red (related: https://github.com/red/red/issues/3422)
    - using `%//` as a shortcut to current drive's root I think is of low value, as it's not portable and one can always get the drive prefix from `what-dir`:
      ```
      >> root: take/part what-dir 2
      == %/C
      >> root/file.ext
      == %/C/file.ext
      ```

--------------------------------------------------------------------------------

On 2021-10-14T21:41:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4982#issuecomment-943757261>

    Thanks for linking to the other ticket @hiiamboris. I like the idea of `%//?/`, but the form doesn't denote literality (just made that up), and if we want to support file globbing (I know I do), we'd have to escape `?` as a wildcard. AFAIK the world hasn't solved the portability problem, so we have to decide how much we can safely handle in Red, and how we tell users a filename is "safe" versus "use at your own risk." 
    
    Does anyone know if there are other OSs, or places where a special form for `file!` values that are pass-thru values to the OS are used? It's another case where we want to guide people to make good choices, and have to decide how important an escape hatch is for special cases.

--------------------------------------------------------------------------------

On 2021-10-14T22:24:25Z, Oldes, commented:
<https://github.com/red/red/issues/4982#issuecomment-943784560>

    Imho... the `\\?\` should be prefixed internally, if the red-file (which does not have such a limit) is too long. It should not be something, what normal user must know. Not a big issue for me.. I've never hit this limit so far (but who knows what will come).
    
    Actually, I'm not using `%//` either. I was just testing edge cases to see, what happens.

--------------------------------------------------------------------------------

On 2021-10-15T07:56:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4982#issuecomment-944080710>

    > Imho... the `\\?\` should be prefixed internally,
    
    @Oldes maybe not internally, but exposed when converted `to-local-file`, e.g. we wanted to pass it into a `call`. I agree `to-red-file` may hide it, though this makes `to-local-file to-red-file` conversion lossy, so needs justification.
    
    @greggirwin not sure what you mean by pass-thru file values, but you can get a good summary [here](https://en.wikipedia.org/wiki/Path_%28computing%29#Representations_of_paths_by_operating_system_and_shell)
    
    Other funny paths:
    - `C:file` - this has been around since early DOS versions or maybe even older than that, expands to `C:\(CWD of C drive)\file` (not supported by Red currently) 
    - `C:\path\file:stream` - since NT3.1 - denotes alternate NTFS stream, used only after full pathnames (works with Red)
    
      Red can add streams to directories including root of the drive:
      ```
      >> write %"d:\:1" "12"
      >> read %"d:\:1"
      == "12"
      ```
      so hideous, no one will ever notice ;)

--------------------------------------------------------------------------------

On 2021-10-15T22:05:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4982#issuecomment-944747127>

    @hiiamboris thanks for the link. :+1: By "pass thru" I meant something treated like `//?/` for raw content.
    
    Lossy conversions are generally bad. Having the extra slash shouldn't affect `file!` values. What we come to then is how each local conversion takes place, and making users aware that systems using _any_ non-portable file/path syntax does so at their own risk.
    
    Given the `c:file` example, I thought "that's a `url!`", so we can add even more joy because of https://en.wikipedia.org/wiki/File_URI_scheme
    
    The stream variants are like IPv6 special forms in how they bring tears to my eyes. Not tears of joy.
    
    Seems we're into another area that needs design review.

