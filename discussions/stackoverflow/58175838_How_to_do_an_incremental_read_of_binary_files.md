# How to do an incremental read of binary files

**Link:**
<https://stackoverflow.com/questions/58175838/how-to-do-an-incremental-read-of-binary-files>

**Asked:** 2019-09-30 22:06:08 UTC

------------------------------------------------------------------------

TL;DR: can I do an incremental read of binary files with Red or Rebol?

I would like to use Red to process some large (13MB to 2GB) structured
binary files (Kurzweil synthesizer files). I\'ve used other languages
(C, Go, Tcl, Ruby, Dart) to walk through these files, and now I\'d like
to do the same with Red or Rebol.

Is there a way to incrementally read binary files, byte by byte? All I
see is read/binary which seems to slurp the entire file at once (or a
part of a file).

I\'ll need to jump around a little bit, too (either peek at the next
byte, or skip to the end of a section, or skip past variable length
strings to the start of data).

(Yes, I could make some helpers that tracked the position and used
read/part/seek.)

I would like to make a call to the low level OS read/seek if that is
possible - something new to learn.

This is on macos, but a portable solution would be great.

Thanks!

PS: \"open/read %abc\" gives an error \"\*\*\* Script Error: open does
not allow file! for its port argument\", even though the help message
say the port argument is \"port \[port! file! url! block!\]\"

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by 9214

Rebol has
[ports](http://www.rebol.com/docs/core23/rebolcore-14.html){rel="nofollow noreferrer"}
for that, which are planned for
[0.7.0](https://trello.com/c/Iz0cl1e8/61-070-full-i-o-support){rel="nofollow noreferrer"}
release in Red. So, current I/O is very basic and buffer-only, and
`open` is a preliminary stub.

> I would like to make a call to the low level OS read/seek if that is
> possible - something new to learn.

You can leverage
[Rebol](http://www.rebol.com/docs/library.html){rel="nofollow noreferrer"}
or
[Red/System](https://static.red-lang.org/red-system-specs.html#section-15){rel="nofollow noreferrer"}
FFI as a learning excercise.

*Comment by aMike:* Thank you! I\'ll see if I can get something running
with Red/System. Looking forward to \'ports\'!

------------------------------------------------------------------------

### Answer (score: 4) --- by endo64

Here is how you would do it in Rebol:

    >> file: open/direct/binary %file.dat
    >> until [none? probe copy/part file 20]
    >> close file
    #{732F7072696E74657253657474696E6773312E62}
    #{696E504B01022D00140006000800000021006149}
    #{0910890100001103000010000000000000000000}
    ...
    #{000000006A290000646F6350726F70732F617070}
    #{2E786D6C504B0506000000000D000D0068030000}
    #{292C00000000}
    none

`first file` or `pick file 1` will return the next byte value
(`integer!`)

This even works with text files: `open/lines/direct`, in that case
`copy/part file 20` will return 20 lines, or you can use `pick file 1`
or `first file` to get the next line.

Soon this will be available on Red too.

*Comment by aMike:* This will be very nice when Red gets \'ports\'.
Thank you!

------------------------------------------------------------------------

## Comments on question

*Comment by sqlab:* did you try ***read/binary/seek/part %your_file
position length*** ? It\'s working in Red under windows at least.

*Comment by aMike:* Yes, I can use that. My fear is that each call would
involve an open, seek, read, close. (In addition to the global
\"current_position\" variable.) I\'ll try to instrument some test
programs and see what happens. Thank you!
