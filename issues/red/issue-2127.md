
#2127: help output format for functions refinements: USAGE is misleading
================================================================================
Issue is closed, was reported by dander and has 10 comment(s).
[type.review] [status.contribution]
<https://github.com/red/red/issues/2127>

The usage format displayed by help shows each refinement coming after the function arguments, which is not valid Red syntax.

ex:

```
red>> help insert

USAGE:
    insert series value /part length /only /dup count

DESCRIPTION:
     Inserts value(s) at series index; returns series past the insertion. 
     insert is of type: action!

ARGUMENTS:
     series  [series! bitset! map!]
     value  [any-type!]

REFINEMENTS:
     /part => Limit the number of values inserted.
         length  [number! series!]
     /only => Insert block types as single values (overrides /part).
     /dup => Duplicate the inserted values.
         count  [number!]
```

It would be clearer to remove the refinements altogether (since there is a refinement section below), or to have them on separate lines.
possibly:

```
insert series value
insert/part series value length
...
```

or

```
insert series value
      /part length
      /only
...
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-24T23:23:49Z, Oldes, commented:
<https://github.com/red/red/issues/2127#issuecomment-289166187>

    @dockimbel what is your opinion?

--------------------------------------------------------------------------------

On 2017-03-24T23:34:45Z, Oldes, commented:
<https://github.com/red/red/issues/2127#issuecomment-289167616>

    With the above modification the output is:
    ```
    >> ? insert
    USAGE:
        INSERT series value
    
    DESCRIPTION:
        Inserts value(s) at series index; returns series past the insertion.
        INSERT is an action! value.
    
    ARGUMENTS:
        series     -> [series! bitset! map!]
        value      -> [any-type!]
    
    REFINEMENTS:
        /part      -- Limit the number of values inserted
           length  -> [number! series!]
        /only      -- Insert block types as single values (overrides /part)
        /dup       -- Duplicate the inserted values
           count   -> [number!]
    ```

--------------------------------------------------------------------------------

On 2017-05-06T05:54:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2127#issuecomment-299618211>

    I agree that we could leave out refinements in the usage string. Building combinations of them is certainly doable, but may be more confusing than helpful, once you get beyond 2 refinements.

--------------------------------------------------------------------------------

On 2017-05-09T21:58:21Z, greggirwin, commented:
<https://github.com/red/red/issues/2127#issuecomment-300313945>

    @dander, would you please check this with the latest version of `help` and sign off on it if it looks good.

--------------------------------------------------------------------------------

On 2017-05-09T22:06:11Z, dander, commented:
<https://github.com/red/red/issues/2127#issuecomment-300315608>

    Oh, yeah, I have been loving the new `help`. My complaint for this issue was about the refinements on the usage string. As you mentioned above, it has been addressed. Thanks to you both for all the work on improving this!

