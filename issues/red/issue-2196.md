
#2196: Phantom map! keys
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2196>

Any `integer!` keys after the 64th to be added to a `map!` hang around after being removed.

```
red>> m: #()
== #()
red>> repeat k 70 [
[        m/:k: {x}
[        m/:k: none
[    ]
== none
red>> m
== #()
red>> keys-of m
== [65 66 67 68 69 70]
red>> m/65
== none
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-04T19:23:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/2196#issuecomment-444224948>

    This one has regressed in 0.6.4.
    ```
    >> m: #()
    == #()
    >> repeat k 70 [
    [    	m/:k: {x}
    [    	m/:k: none
    [    ]
    == none
    >> keys-of m
    == [65 66 67 68 69 70]
    ```

--------------------------------------------------------------------------------

On 2018-12-04T23:33:48Z, greggirwin, commented:
<https://github.com/red/red/issues/2196#issuecomment-444300496>

    Looks like the fix from 02-sep-2016 regressed. A number of changes in `reflect` exist.  Once fixed, let's make sure we have tests for this. 
    
    Good catch.

