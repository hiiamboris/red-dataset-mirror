
#5284: Suggestion: different notation for 'dates', 'filenames', etc
================================================================================
Issue is closed, was reported by Alexey-T and has 6 comment(s).
<https://github.com/red/red/issues/5284>

This is a suggestion to change the notation of some types in Red.

- now: filename is `%"some name"`
- proposal: filename is `f"some name"`

and

- now: date is `19-October-2000`
- proposal: date is `d"19-October-2000"`

do the same for similar types too. Idea is from python: f-strings, r-strings.

why? it allows to see the code easier.


Comments:
--------------------------------------------------------------------------------

On 2023-02-17T17:24:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5284#issuecomment-1434976692>

    @Alexey-T be honest, are you seriously saying that `19-October-2000` is harder to read than `d"19-October-2000"` or you just recalled a similarity and wanted to point it out? ;)

--------------------------------------------------------------------------------

On 2023-02-17T17:32:29Z, Alexey-T, commented:
<https://github.com/red/red/issues/5284#issuecomment-1434997118>

    I say this seriously, because `19-October-2000` looks like 5 tokens:
    
    - integer 19
    - minus operator
    - variable October
    - minus
    - integer

--------------------------------------------------------------------------------

On 2023-02-17T17:42:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5284#issuecomment-1435012040>

    It only looks like that until you realize that in Rebol and Red tokens are delimited by whitespace. If you put away your Pascal background, you'll see that `19-October-2000` is in fact how humans prefer to write dates, and I can find you a bunch of web standards that prescribe this or similar notation.
    
    I suggest visiting [the docs](https://github.com/red/docs/blob/master/en/datatypes/date.adoc) to see all supported date formats (and that date is a standalone datatype in Red, not a flavor of string).
    
    And also [docs on file](https://github.com/red/docs/blob/master/en/datatypes/file.adoc) to find out that `%` prefix is most of the time enough for a `file!` value, e.g. `%myscript.red` is a file, while `fmyscript.red` is a word. As you learn you'll see that your proposals might not be for the best ;) We design for humans, and while humans may be taught to perceive the text as machines do, ultimately they're not very good at it.
    
    Red has a long design history, and lexical forms are one of its strengths, so was deeply thought out.
    
    You are welcome by the way to join our [learning room](https://matrix.to/#/%21wUTlqkqOhNGtfQzIsO%3Amatrix.org?via=tchncs.de&via=gitter.im&via=matrix.org) should you have further questions or proposals.

