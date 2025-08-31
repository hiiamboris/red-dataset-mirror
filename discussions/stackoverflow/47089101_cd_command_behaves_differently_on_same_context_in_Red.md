# cd command behaves differently on same context in Red

**Link:**
<https://stackoverflow.com/questions/47089101/cd-command-behaves-differently-on-same-context-in-red>

**Asked:** 2017-11-03 05:35:20 UTC

------------------------------------------------------------------------

See latest lines: from same context %/C/ directory, doing \"cd rebol\"
works in one case and doesn\'t work in another case:

        >> what-dir
        == %/C/rebol/
        >> cd ..
        == %/C/
        >> what-dir
        == %/C/
        >> cd rebol
        == %/C/rebol/
        >> what-dir
        == %/C/rebol/
        >> cd /
        *** Script Error: / operator is missing an argument
        *** Where: catch
        *** Stack:  

        >> what-dir
        == %/C/rebol/
        >> cd ..
        == %/C/
        >> cd rebol
        == %/C/rebol/
        >> cd %/
        == %/
        >> what-dir
        == %/C/
        >> cd rebol
        *** Access Error: cannot open: %/rebol/
        *** Where: do
        *** Stack: cd change-dir cause-error  

        >> 

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by rebolek

I am not on Windows right now, so I can\'t test it, but I believe there
is problem here:

    >> cd %/
    == %/
    >> what-dir
    == %/C/
    >> cd rebol
    (...)

`cd %/` changes directory to the root directory and that is definitely
`%/C/` as reported by `what-dir`. So I guess `what-dir` is reporting
wrong directory. I will try to add info later, when I will check it on
Windows, or maybe someone will be faster and confirms it :) You can also
try `read %/` to see what\'s there (it should be block of Windows
drives).

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

There seems to be a difference between **what-dir** and **pwd**

    >> ls
        C/                   D/                   E/                   Z/               
    >> pwd
    %/
    >> what-dir
    == %/C/
    >> 

**pwd** and **cd** (change-dir) use **system/options/path** leading to
the issue, that should be reported.

**/** is the infix operator for a division. It will lead always to this
error message if not in the rigth context

    >> /
    *** Script Error: / operator is missing an argument
    *** Where: catch
    *** Stack:  

    >> 10 / 5
    == 2
    >>

------------------------------------------------------------------------

## Comments on question
