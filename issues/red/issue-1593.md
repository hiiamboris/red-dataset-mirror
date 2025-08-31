
#1593: Regression: vid.red won't run
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1593>

Interpreted:

```
red>> do %tests/vid.red
*** Script error: path none is not valid for none type
*** Where: >
```

It compiles, but when the executable is run:

```
H:\Work\Red\Tests Red\2016-02-05-00-03-01-red-master\red-master>vid
*** Script error: path none is not valid for none type
*** Where: >
*** Stack: view if set either layout while switch set ctx183~fetch-options until
 unless either set switch switch foreach if >
```

Issue on both Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-05T07:17:03Z, rebolek, commented:
<https://github.com/red/red/issues/1593#issuecomment-180232446>

    I can confirm the bug with different layout also. Last working commit is `93ed546`, checking out `5c4cc34` will trigger this one.

--------------------------------------------------------------------------------

On 2016-02-07T10:07:45Z, WiseGenius, commented:
<https://github.com/red/red/issues/1593#issuecomment-180990007>

    It's the tab-panel:
    
    ```
    red>> view [
    [        tab-panel [
    [            "tab2" [text "two"]
    [        ]
    [    ]
    *** Script error: path none is not valid for none type
    *** Where: >
    ```

