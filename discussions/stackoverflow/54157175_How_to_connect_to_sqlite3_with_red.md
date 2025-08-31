# How to connect to sqlite3 with red

**Link:**
<https://stackoverflow.com/questions/54157175/how-to-connect-to-sqlite3-with-red>

**Asked:** 2019-01-12 06:03:20 UTC

------------------------------------------------------------------------

I have tried loading two sqlite libraries mentioned on the red website,
however they both are rebol based and give \"invalid issue\" errors such
as:

    *** Syntax Error: invalid issue! at "^-^-^-#[datatype! integer!]^-[*bind-int (sid"
    *** Where: do
    *** Stack: do-file expand-directives load

Would like to fetch data from an sqlite store and update the same from
red.

edit: I\'ve managed to use `call/output` to call the sqlite3 executable,
but don\'t know if there are better ways to do this.

    files: ""
    call/output {sqlite3 test.sqlite "select bookid, title from books order by rowid desc limit 10"} files
    rows: split files "^/"

Each row then needs to be split.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by 9214

In your case interpreter choked on a so-called *construction syntax*
`#[...]`, which is supported only partially in Red at this point.

Moreso, usage of SQLite3 bindings (and any I/O-oriented library)
requires a `port!` datatype implementation, which will come only in
0.7.0 release. In the meantime, `call` should cover you well, even if it
looks like an ad-hoc solution.

*Comment by endo64:* Small correction, `port!` datatype will come in
0.7.0.

*Comment by 9214:* \@endo64 my mistake, I\'ve misinterpret the change in
roadmap. I thought that full I/O have substituted Android support, which
was planned on 0.6.5 before; turns out Android was pushed to 0.7.1, and
I/O support indeed stayed on 0.7.0.

------------------------------------------------------------------------

## Comments on question
