# How can I store list of directory files using pure Red language?

**Link:**
<https://stackoverflow.com/questions/48776999/how-can-i-store-list-of-directory-files-using-pure-red-language>

**Asked:** 2018-02-13 22:50:41 UTC

------------------------------------------------------------------------

I am trying to store list of files from directory in variable (using
**only** CLI, Red version: 0.6.3).

I tested couple of functions from [\"Red by
example\"](http://www.red-by-example.org/#cat-f01){rel="nofollow noreferrer"}
documentation, but all of them give me only an CLI output with list of
elements from directory:

-   [list-dir](http://www.red-by-example.org/#list-dir){rel="nofollow noreferrer"}
-   [ls](http://www.red-by-example.org/#ls){rel="nofollow noreferrer"}
-   [dir](http://www.red-by-example.org/#dir){rel="nofollow noreferrer"}

When I tried save it into variable, I\'ve got an errors like:

    >> var: list-dir %tests
        other-tests.red         README.md               poc-tests.red      
    *** Script Error: var: needs a value
    *** Where: var
    *** Stack: 

    >> files: ls tests
    other-tests.red         README.md               poc-tests.red       
    *** Script Error: files: needs a value
    *** Where: files
    *** Stack:  

    >> other: dir %tests
    other-tests.red         README.md               poc-tests.red       
    *** Script Error: other: needs a value
    *** Where: other
    *** Stack:  

I also found the
[call](http://www.red-by-example.org/#call){rel="nofollow noreferrer"}
method, which give me possibility to run external scripts (like shell
scripts), and by that I can execute OS command `ls`:

    >> filelist: ""
    >> call/output "ls tests" filelist
    >> print filelist
    other-tests.red
    poc-tests.red
    README.md

But this solution is dependent on the operating system. For example in
MS Windows `call/output "dir tests" filelist` will work.

**Can anyone tell me - is there another solution for that using pure Red
code without executing external scripts?**

Maybe somewhere there are some `magic` functions from **Red System**,
whose will give us that?

That\'s would be great to be independent of OS.

Thanks for the answers

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 10) --- by rgchris

All that\'s required is a READ of the directory:

    read %tests/

This will give you a block of FILE! values for the contents of the
directory.

*Comment by Mateusz Palichleb:* Wow, it works. Earlier I was trying to
execute `read %tests`, but without `/` sign. Thanks to your advice I
have whole problem resolved. Thanks!

------------------------------------------------------------------------

## Comments on question
