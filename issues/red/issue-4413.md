
#4413: FEAT: (DESIGN) Deprecate percent encoding in `file!` values; mold as quoted files instead
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/4413>

This is a design change request, which applies to all versions of Red.

Percent encoding in files may have helped with OS portability, or was done for URL compatibility, that sort of makes sense, but also complects files for (maybe) not a great reason. Today files inherit from URL in Red, so that's an implementation byproduct, and Rebol compatible. The downside is that it makes files with spaces, the most common special char, harder to read, and is not how OS file systems represent them.

The idea here is to use quoted file format (`%"...") instead. This is currently done for empty `file!`s.

There are open design and performance questions: special chars are the big one. The current URL molding rules `%XX` a mixed subset of reserved (general and sub delim) url chars, and we need to define the exact set of characters that trigger quoting when molded. If no special chars exist, the output is simply prefixed with the `%` sigil as it is today. The smaller the set of special characters, the less there are to check.

Note that special chars in this context are NOT the same as those any particular file system (dis)allows


Comments:
--------------------------------------------------------------------------------

On 2020-08-03T13:02:17Z, 9214, commented:
<https://github.com/red/red/issues/4413#issuecomment-668009940>

    Granted by cc15d58c, and should be closed as such.
    ```red
    >> %"a file name with spaces"
    == %"a file name with spaces"
    ```

