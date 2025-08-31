# A particular diff

**Link:**
<https://stackoverflow.com/questions/76550021/a-particular-diff>

**Asked:** 2023-06-25 10:46:22 UTC

------------------------------------------------------------------------

I have 2 files: **list-folder1.txt** and **list-folder2.txt**. These
files are derived from the `ls -1R` command run on linux in their
respective folders (similar folders consisting of thousands of files and
some subdirectories). I would like a **difference.txt** file with the
list of files present in **list-folder2.txt** but not present in
**list-folder1.txt** also indicating the folder. (Example:
`ls -1R examples > list-folder-old.txt` is:

    examples:
    c
    lua

    examples/c:
    Makefile
    env.c
    helloworld.c

    examples/lua:
    fizzbuzz.lua

`ls -1R examples > list-folder.txt` is:

    examples:
    c
    lua
    file1.txt

    examples/c:
    Makefile
    env.c
    file2.txt
    helloworld.c

    examples/lua:
    file3.txt
    fizzbuzz.lua

difference.txt shuold be:

    examples:
    file1.txt

    examples/c:
    file2.txt

    examples/lua:
    file3.txt

Is there an easy way in Reboland to solve this problem? Is it better to
use read with parse or read/lines?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

Given your example file, you can try using `exclude` to subtract the
second set of lines from the first one. E.g.:

    write/lines %difference.txt exclude read/lines %list-folder2.txt read/lines %list-folder1.txt

That should work for both Red and Rebol. In case of Red, if you want to
use it from a batch script, I recommend downloading the \"CLI Red\"
version from the
[download](https://www.red-lang.org/p/download.html){rel="nofollow noreferrer"}
page.

> Is it better to use read with parse or read/lines?

If the need is just to split the file into lines that can be directly
processed, go with `read/lines`. If anything more than that is needed,
then go with `read` then `parse`.

*Comment by noein:* Thanks for the reply. Indeed your script shows the
missing files but I lose the information of the folder where they are. I
have improved the example.

------------------------------------------------------------------------

## Comments on question
