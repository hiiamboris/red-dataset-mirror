
#2427: lit-word! '/ and '// don't parse
================================================================================
Issue is closed, was reported by ksf and has 6 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2427>

```
red>> '*
== *
red>> '+
== +
red>> '/
*** Syntax Error: invalid value at "'/"
*** Where: do
red>> '//
*** Syntax Error: invalid value at "'//"
*** Where: do
```

...I want to parse a block containing math expressions and this is making it kinda hard.

TBH, though, I don't even know whether `//` is a valid rebol word: As `/` is supposed to end a word it should be two.


Comments:
--------------------------------------------------------------------------------

On 2017-01-31T08:45:44Z, meijeru, commented:
<https://github.com/red/red/issues/2427#issuecomment-276306500>

    On my version, it works:
    ```
    red>> '/
    == /
    red>> type? '/
    == word!
    ```

--------------------------------------------------------------------------------

On 2017-01-31T10:37:16Z, ksf, commented:
<https://github.com/red/red/issues/2427#issuecomment-276329436>

    I maybe should've mentioned that that was 0.6.1 stable:
    
    ```
    red>> system/build
    == "19-Jan-2017/23:56:53+1:00"
    ```
    
    And, indeed, on latest master 
    
    ```
    red>> system/build
    == make object! [
        date: "31-Jan-2017/11:32:15+1:00"
        config: make object! [
            config-name: 'Windows
            OS: 'Windows
            OS-version: 0
            ABI: none
    ```
    
    Things work as expected.
    
    (Maybe I shouldn't report bugs after my call-it-a-day beer :)

--------------------------------------------------------------------------------

On 2017-02-12T10:47:06Z, dockimbel, commented:
<https://github.com/red/red/issues/2427#issuecomment-279210086>

    Works fine in master branch:
    ```
    red>> '/
    == /
    red>> '//
    == //
    ```

