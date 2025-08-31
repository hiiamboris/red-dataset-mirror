
#940: float! should be float32! when 32-bit.
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [Red/System] [type.documentation]
<https://github.com/red/red/issues/940>

I think there's a typo here:
http://static.red-lang.org/red-system-specs.html#section-4.4
http://static.red-lang.org/red-system-specs-light.html#section-4.4

On the first line, it says.
“Float! memory size is 32-bit.”

I'm guessing that's supposed to say:
“Float32! memory size is 32-bit.”

Since it's talking about `float32!`, and since `float!` memory size is 64-bit as stated here:
http://static.red-lang.org/red-system-specs.html#section-4.3
http://static.red-lang.org/red-system-specs-light.html#section-4.3

Is this the appropriate place to report such mistakes in documentation, or is there a preferred channel?



Comments:
--------------------------------------------------------------------------------

On 2014-09-21T10:06:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/940#issuecomment-56294520>

    Thanks for reporting the mistake. For me, this is the best place to report it.

--------------------------------------------------------------------------------

On 2014-09-21T10:07:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/940#issuecomment-56294552>

    I've fixed the text and committed the changes. They will be reflected on the web site next time it is rebuilt.

--------------------------------------------------------------------------------

On 2014-09-21T13:15:15Z, dockimbel, commented:
<https://github.com/red/red/issues/940#issuecomment-56298416>

    @WiseGenius Thanks for reporting it. For such kind of typos, you can simply post a new Pull Request with the fix.

