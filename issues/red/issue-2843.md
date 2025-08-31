
#2843: Wish: the /user part of an email value is of string! datatype.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 14 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2843>

```Red
>> em: jennifer@abc.com
== jennifer@abc.com
>> em/user
== jennifer
>> type? em/user 
== email!
```
I wish
```Red
>> em/user
== "jennifer"
>> type? em/user 
== string!
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-04T08:30:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2843#issuecomment-312815618>

    Agreed, that would be more consistent with the `/user` setting access, and less confusing (`jennifer` looks like a word, the type cannot be inferred from its literal form).

--------------------------------------------------------------------------------

On 2017-07-04T08:49:02Z, meijeru, commented:
<https://github.com/red/red/issues/2843#issuecomment-312819946>

    By the same token, I should wish that the `/host` part be of type `url!`, because it looks also like a word and its type cannot be inferred. Try `type? xyz.com`.

--------------------------------------------------------------------------------

On 2017-07-04T08:59:48Z, DideC, commented:
<https://github.com/red/red/issues/2843#issuecomment-312822607>

    url! implied a protocol specifier (ie: http:// or pop:// or whatever://). I don't see what it could be in this case. So to me it may be a string! too.

--------------------------------------------------------------------------------

On 2017-07-04T09:04:56Z, meijeru, commented:
<https://github.com/red/red/issues/2843#issuecomment-312823878>

    The implied protocol specifier with an internet host addres is always `http://`. Try this in any browser. So either the `/host` component has `http://` prefixed to make it a correct `url!` literal, or we settle for a `string!` value as well.

--------------------------------------------------------------------------------

On 2017-07-04T09:55:02Z, dockimbel, commented:
<https://github.com/red/red/issues/2843#issuecomment-312836656>

    There is no path accessor for `url!`. `url!` and `file!` interpret paths as a concatenation action.

--------------------------------------------------------------------------------

On 2017-07-04T10:04:41Z, meijeru, commented:
<https://github.com/red/red/issues/2843#issuecomment-312838829>

    So, let us have the `/host` part as a `string!` value also, please?

--------------------------------------------------------------------------------

On 2017-07-04T10:11:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2843#issuecomment-312840379>

    @meijeru The change applies to both `/user` and `/host`.

