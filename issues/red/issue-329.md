
#329: Extension of DocStrings to Alias Struct! & #define
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/329>

It would be good to be able to have generated documentation include information on defined types, constants and routines:
# define start 1  "start value for timer"
# define stop 2 "stop value for timer"
# define read 3 "read value for timer"
# define timer value [the-timer-function value] "timer function - value - start, stop or read"

time-struct!: alias struct! [
 {Time structure}
 hours    [integer!]               "hours"
 mins      [integer!]               "mins"
 sec        [integer!]               "seconds"
 msec    [integer!]               "milli-seconds"
]

It would probably be equally good to allow such DocStrings for enum!s too.

I have implemented a convention of a function with a "private" DocString not being documented in the generated docs. We could do the same for defs, enums and aliases.



Comments:
--------------------------------------------------------------------------------

On 2013-05-05T12:22:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/329#issuecomment-17450954>

    Wish moved to v2 wish list on wiki.

