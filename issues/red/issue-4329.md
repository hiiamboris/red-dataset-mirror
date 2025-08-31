
#4329: Downloading >520kB file gets mangled with GC on
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4329>

This happens on Linux/macOs only, Windows users reports it works just fine.

See this code:

```
>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
== {<!DOCTYPE html>^/<html class="client-nojs" lang="en" dir="ltr">^/<head>^/<meta charset="UTF-8"/>^/<title>List of United States counties and county equivalents - Wikipedia</title>^/<script>document.documentElement.classNam...
>> skip page 550000
== {"^@I^@o^@w^@a^@ ^@C^@i^@t^@y^@,^@ ^@I^@A^@ ^@M^@e^@t^@r^@o^@p^@o^@l^@i^@t^@a^@n^@ ^@S^@t^@a^@t^@i^@s^@t^@i^@c^@a^@l^@ ^@A^@r^@e^@a^@"^@>^@I^@o^@w^@a^@ ^@C^@i^@t^@y^@,^@ ^@I^@A^@ ^@M^@e^@t^@r^@o^@p^@o^@l^@i^@t^@a^@n^@ ^@S^@t^@a^@t^@i^@s^@t^@i^@c^@a^@l^@ ^@A^@r^@e^@a^@<^@/^@a^@>^@^/^@<^@/^@t^@d^@>^@<^@/^@t^@r^@>^@^/^@<^@t^@r^@>...
```

First ~520'000 chars of the file are fine, but then the output changes to (what seems like) 16bit Unicode.

The bug is gone when turning the GC off:

```
>> recycle/off
>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
== {<!DOCTYPE html>^/<html class="client-nojs" lang="en" dir="ltr">^/<head>^/<meta charset="UTF-8"/>^/<title>List of United States counties and county equivalents - Wikipedia</title>^/<script>document.documentElement.classNam...
>> skip page 550000
== {ea</a>^/</td></tr>^/<tr>^/<td><a href="/wiki/Onondaga_County,_New_York" title="Onondaga County, New York">Onondaga</a>^/</td>^/<td style="text-align:right;">468,387^/</td>^/<td><a href="/wiki/Syracuse,_NY_Metropolitan_Stati...
```

See this conversation for details: https://gitter.im/red/bugs?at=5e68c2778011bb652a081054



Comments:
--------------------------------------------------------------------------------

On 2020-05-15T08:04:44Z, qtxie, commented:
<https://github.com/red/red/issues/4329#issuecomment-629094160>

    @rebolek Are we OK to close it?

--------------------------------------------------------------------------------

On 2020-05-18T13:35:58Z, rebolek, commented:
<https://github.com/red/red/issues/4329#issuecomment-630187571>

    @qtxie certainly, it works fine now, AFAIK.

