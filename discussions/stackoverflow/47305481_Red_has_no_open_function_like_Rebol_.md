# Red has no open function like Rebol?

**Link:**
<https://stackoverflow.com/questions/47305481/red-has-no-open-function-like-rebol>

**Asked:** 2017-11-15 10:51:40 UTC

------------------------------------------------------------------------

I want to read 10 lines from the end of a big text file without loading
the whole file in memory.

I wanted to try to use Open as explained here for Rebol [In Rebol, what
is the idiomatic way to read a text file line by
line?](https://stackoverflow.com/questions/27939492/in-rebol-what-is-the-idiomatic-way-to-read-a-text-file-line-by-line)

But Red doesn\'t have open function ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

You can try a `read/lines/seek/part %yourfile offset blocksize`

But I have no clue. You have to test and adapt your offset and
blocksize.

*Comment by endo64:* There is a difference between Rebol\'s and Red\'s
simple IO implementation of `read/part/lines`. On Rebol it reads number
of lines given in `part` parameter. In Red, it first reads the `part` of
the file and then splits it into `lines`. So `read/lines/part %file 2`
returns different results for Red and Rebol. I think it will be fixed on
Red when full IO is implemented.

*Comment by sqlab:* But with **read/lines/seek/part** you can write your
own read-line function. But as GC is not available, there is probably no
advantage compared to reading the whole file at once. Only if you know
the filesize and want the last lines, then there are some advantages.

------------------------------------------------------------------------

### Answer (score: 1) --- by rebolek

Red doesn\'t have `open` function *yet*. Full IO support is planned for
0.7.0. So you have to either wait or use OS calls directly.

------------------------------------------------------------------------

## Comments on question

*Comment by sqlab:* Full I/O is not yet available in Red. Wait for 0.7.0
[trello.com/b/FlQ6pzdB/red-tasks-overview](https://trello.com/b/FlQ6pzdB/red-tasks-overview){rel="nofollow noreferrer"}
