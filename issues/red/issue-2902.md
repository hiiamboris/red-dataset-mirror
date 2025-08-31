
#2902: make url! [mailto abc@def.com] produces invalid url
================================================================================
Issue is closed, was reported by meijeru and has 16 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2902>

```
>> make url! [mailto abc@def.com]
== mailto://abc@def.com
```
should be
```
== mailto:abc@def.com
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-19T07:51:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2902#issuecomment-316302168>

    The current result is consistent with other scheme names. We will not make [special lists](https://tools.ietf.org/html/rfc3986#section-1.1.2) for changing the MOLDed `url!` formatting output. It is up to the user to format the URL differently. The future `format` dialect could also provide some help there (@greggirwin).

--------------------------------------------------------------------------------

On 2017-07-19T08:10:39Z, DideC, commented:
<https://github.com/red/red/issues/2902#issuecomment-316306590>

    `replace form mailto://abc@def.com "//" ""`
    Not so hard !

--------------------------------------------------------------------------------

On 2017-07-19T11:00:35Z, meijeru, commented:
<https://github.com/red/red/issues/2902#issuecomment-316349882>

    So the current facility is a partial one. Should be documented as such.

--------------------------------------------------------------------------------

On 2017-07-19T17:21:47Z, greggirwin, commented:
<https://github.com/red/red/issues/2902#issuecomment-316457257>

    I don't think it's partial so much as consistent.

--------------------------------------------------------------------------------

On 2017-07-19T18:06:47Z, meijeru, commented:
<https://github.com/red/red/issues/2902#issuecomment-316469818>

    It is not consistent, just simplistic, because it adds `://` after the protocol regardless of its nature.

--------------------------------------------------------------------------------

On 2017-07-19T21:17:49Z, greggirwin, commented:
<https://github.com/red/red/issues/2902#issuecomment-316520354>

    How is that not consistent? I agree that it creates a non-conformant mailto url, and would also for a number of others. The alternative is to head down the path outlined in https://tools.ietf.org/html/rfc3986#section-3.1 and implement special rules for *every* scheme, which means a catalog area in the system for new schemes as well, because users may create their own, yes?
    
    This is a case where I think someone would have to make a strong argument *and* provide an acceptable solution, for the change to be considered. 
    
    It's easy to document the current behavior, and also easy to work around.

--------------------------------------------------------------------------------

On 2017-07-19T21:19:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2902#issuecomment-316520659>

    Step one might be to write a mezzanine that does this. Not hard to do, and provides a concrete basis for discussion.

--------------------------------------------------------------------------------

On 2017-07-25T07:13:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2902#issuecomment-317650843>

    > It is not consistent, just simplistic, because it adds :// after the protocol regardless of its nature.
    
    The `url!` datatype makes no differences between different schemes, they are all treated equally, that is consistency.
    
    For the different formatting, that should be handled at high-level than the datatype, using mezzanine code.

