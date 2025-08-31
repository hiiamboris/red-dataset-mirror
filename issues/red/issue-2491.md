
#2491: Newline Character gets replaced by `%A` instead of `%0A` when appended to a URL
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2491>

Rebol2
```
>> a: http://www.abc.com
== http://www.abc.com
>> rejoin [a "^/"]
== http://www.abc.com%0A
>> append copy a newline
== http://www.abc.com%0A
```

Red
```
red>> a: http://www.abc.com
== http://www.abc.com
red>> rejoin [a "^/"]
== http://www.abc.com%A
red>> append copy a newline
== http://www.abc.com%A
```

AFAIK, rebol2's behaviour is correct.


Comments:
--------------------------------------------------------------------------------

On 2017-03-22T14:39:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2491#issuecomment-288419510>

    Agreed.

