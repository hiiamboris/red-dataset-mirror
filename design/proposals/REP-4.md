
#4: Include optional error details when firing an error
================================================================================
Issue is open, was reported by PeterWAWood and has 0 comment(s).
[Wish]
<https://github.com/red/REP/issues/4>

This was previously red issue [1973](https://github.com/red/red/issues/1973) opened by @greggirwin

```
red>> checksum/with "" 'tcp ""
** You can't use /with for CRC32 or TCP methods.
*** Script error: invalid argument: ""
*** Where: checksum
```

From @dockimbel  "It needs a case-by-case treatment. The detail error line is welcome, and would be a good improvement of error reporting, but not as first line. It would need to be part of the error! object (we would need a new field). We would need also to see how it should be handled in the runtime library code in R/S, as a literal string there would need to be internalized first (preferably in a lazy way) before being usable by Red's API. Another concern would be also to be able to optionally discard them during compilation (for saving space in generated binaries, we could extend the purpose of red-help? compilation option)."



