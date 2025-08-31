
#286: Minor documentation issues on keywords
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [Red/System] [type.documentation]
<https://github.com/red/red/issues/286>

In the list in section 18 of the specification, `&` is mentioned as reserved, it is not. OTOH, `null` is not mentioned, and it IS reserved.



Comments:
--------------------------------------------------------------------------------

On 2012-10-30T16:43:21Z, dockimbel, commented:
<https://github.com/red/red/issues/286#issuecomment-9913044>

    `&` is reserved for future possible use, the mention in the documentation is for preventing users from using that symbol as identifier in their code. `null` should be mentioned.

--------------------------------------------------------------------------------

On 2012-10-30T17:03:30Z, meijeru, commented:
<https://github.com/red/red/issues/286#issuecomment-9913892>

    But experimentally, `&: 1` is compiled without any problem!

--------------------------------------------------------------------------------

On 2012-10-30T18:05:45Z, dockimbel, commented:
<https://github.com/red/red/issues/286#issuecomment-9916533>

    The current Red/System compiler code will be trashed in a few months (Red/System rewrite in Red should start in January), do you think it is worth time and code lines to enforce that?

--------------------------------------------------------------------------------

On 2012-10-31T07:44:28Z, meijeru, commented:
<https://github.com/red/red/issues/286#issuecomment-9935616>

    Let's leave it then...

