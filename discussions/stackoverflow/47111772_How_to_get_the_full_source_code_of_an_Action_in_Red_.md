# How to get the full source code of an Action in Red?

**Link:**
<https://stackoverflow.com/questions/47111772/how-to-get-the-full-source-code-of-an-action-in-red>

**Asked:** 2017-11-04 14:29:27 UTC

------------------------------------------------------------------------

As I can see read is not native

    >> native? :read
    == false

but when I tried to get the source code with

    write-clipboard mold :read

I only got header of read

      make action! [[
          "Reads from a file, URL, or other port" 
          source [file! url!] 
          /part {Partial read a given number of units (source relative)} 
          length [number!] 
          /seek "Read from a specific position (source relative)" 
          index [number!] 
          /binary "Preserves contents exactly" 
          /lines "Convert to block of strings" 
          /info 
          /as {Read with the specified encoding, default is 'UTF-8} 
          encoding [word!]
      ]]

Can I get the rest body somehow ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

The source code of `native!` and `action!` values is written in
[Red/System](http://static.red-lang.org/red-system-specs.html){rel="nofollow noreferrer"}
and part of the low-level runtime library code. They are not implemented
in Red itself for sake of performance or because they require access to
low-level features not available at Red level. Natives source code have
a single entry point which you can find in the
[runtime/natives.reds](https://github.com/red/red/blob/master/runtime/natives.reds){rel="nofollow noreferrer"}
file. For actions, it is more complex as they
[delegate](https://github.com/red/red/blob/master/runtime/actions.reds){rel="nofollow noreferrer"}
their implementation to each datatype. Actions are basically methods for
the datatype classes.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* For natives, \@rebolek wrote a function to read
from the the git(hub) source

*Comment by Geeky I:* Also, you can use `source` to get the source code,
don\'t have to `write-clipboard mold` anything

*Comment by Geeky I:*
[gist.github.com/rebolek/dc1bb8c17f0c97e4dbf918126fcab6f1](https://gist.github.com/rebolek/dc1bb8c17f0c97e4dbf918126fcab6f1){rel="nofollow noreferrer"}
