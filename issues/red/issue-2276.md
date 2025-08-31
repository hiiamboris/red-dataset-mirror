
#2276: to word! to string! on a file value loses the series pointer
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/2276>

Use case: in order to know what code to use in `save/as <file> <encoding>` I wish to retrieve the file extension as a word! value (e.g. `%filename.png => 'png`). Now `to word!` on a file value is not allowed. Thus one needs to chain `to word!` and `to string!`. But if the file value is the result of `find` and thus the series pointer is not at the head, this fact is lost!

```
red>> save-file: %abc.def
== %abc.def
red>> ext: next find/last save-file %.
== %def
red>> to string! ext
== "def"
red>> to word! to string! ext
== abc.def
red>> to word! "def"
== def
```



Comments:
--------------------------------------------------------------------------------

On 2016-10-18T14:58:48Z, meijeru, commented:
<https://github.com/red/red/issues/2276#issuecomment-254534684>

    The problem is even simpler to locate, without using file values
    
    ```
    red>> to word! next "abcdef"
    == abcdef ; should be bcdef !!
    ```

--------------------------------------------------------------------------------

On 2016-11-16T01:36:03Z, qtxie, commented:
<https://github.com/red/red/issues/2276#issuecomment-260827127>

    Fixed in the latest version.

