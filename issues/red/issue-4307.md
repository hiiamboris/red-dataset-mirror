
#4307: RENAME does not accept file! as its argument
================================================================================
Issue is open, was reported by rebolek and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/4307>

While RENAME lists `[port! file! url!]` as accepted arguments, it does not accept `file!`:

```
>> rename %delme.red %delme.txt
*** Script Error: rename does not allow file! for its from argument
*** Where: rename
*** Stack:

>> ? rename
USAGE:
     RENAME from to

DESCRIPTION:
     Rename a file.
     RENAME is an action! value.

ARGUMENTS:
     from         [port! file! url!]
     to           [port! file! url!]
```

As `rename` is not marked as `[TBD]`, I expect this to work.

Tested on latest build on macOS.


Comments:
--------------------------------------------------------------------------------

On 2020-02-27T10:55:08Z, meijeru, commented:
<https://github.com/red/red/issues/4307#issuecomment-591908766>

    Althought `rename` is not marked as `TBD`, it is indeed one of the not-yet-implemented actions. The only actions on files that _are_ implemented currently are: `delete` `query` `read` and `write`.

