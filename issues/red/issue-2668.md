
#2668: SAVE does not accept binary! as destination
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2668>

```
USAGE:
    SAVE where value /header header-data /all /length /as format
DESCRIPTION: 
    Saves a value, block, or other data to a file, URL, binary, or string 
    SAVE is a function! value
ARGUMENTS:
    where    [file! url! string! binary! none!] "Where to save"
    value     "Value(s) to save"

>> save "" 1
== "#{31}"
>> save #{} 1
*** Script Error: suffix? does not allow binary! for its path argument
*** Where: suffix?
```
In the case of a string destination, I would have expected a molded result (`"1"`) but NOT a string containing a binary UTF-8 encoded value! In the case of a binary destination, I would have expected a plain binary value (here `#{31}` ) and not an error.




Comments:
--------------------------------------------------------------------------------

On 2018-08-16T20:37:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2668#issuecomment-413676791>

    We need to determine the behavior for non-file values with `suffix?`. Url and email are pretty clear, as the same, but strings...tough call, and binary should return none. 

--------------------------------------------------------------------------------

On 2018-08-21T18:59:44Z, meijeru, commented:
<https://github.com/red/red/issues/2668#issuecomment-414785476>

    But why should `suffix?` be invoked on strings and binary destinations at all ?!!?

--------------------------------------------------------------------------------

On 2018-08-22T21:13:15Z, greggirwin, commented:
<https://github.com/red/red/issues/2668#issuecomment-415182165>

    @meijeru, right you are. `Save` should shortcut in the case of binary, as there is *no* codec needed.

--------------------------------------------------------------------------------

On 2018-12-12T08:42:35Z, meijeru, commented:
<https://github.com/red/red/issues/2668#issuecomment-446507005>

    `save` also allows `none` as an argument (why?) and also this errors out on `suffix?`

--------------------------------------------------------------------------------

On 2018-12-12T19:34:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2668#issuecomment-446715203>

    "Why?" is a good question, but it's clearly intentional, as the `none` case is handled explicitly in the code. It basically becomes a no-op.

--------------------------------------------------------------------------------

On 2018-12-14T23:52:46Z, endo64, commented:
<https://github.com/red/red/issues/2668#issuecomment-447512911>

    `save` accepting `none` is like writing `/dev/null`, but I see no use for it in Red. I'm for removing `none` from spec (and the code related).

