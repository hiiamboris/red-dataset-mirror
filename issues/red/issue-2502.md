
#2502: select <binary> yields char! value instead of integer! value
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2502>

In all other cases of series selection, the result has the element type of the series. But see this:
```
>> b: #{010203}
== #{010203}
>> select b #{01}
== #"^B"   ; should be 2
>> select b #{0102}
== #"^C"   ; should be 3
```
   


Comments:
--------------------------------------------------------------------------------

On 2017-03-27T10:11:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2502#issuecomment-289411217>

    Agreed, but actually, it should be an integer, `#{02}` is a binary series, it's not an element of a binary series. (in the general case, `select == second find series value`)

--------------------------------------------------------------------------------

On 2017-03-27T14:57:42Z, meijeru, commented:
<https://github.com/red/red/issues/2502#issuecomment-289479758>

    I agree. Will you take it on now that I have changed the title and the content? 

