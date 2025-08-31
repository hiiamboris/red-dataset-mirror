
#4735: Shouldn't conversion from string to word do check of input validity?
================================================================================
Issue is closed, was reported by Oldes and has 20 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/4735>

Current situations in `Red` is like:
```red
>> to word! "a{b}c"
== a
>> to word! "a b c"
== a
```
In Rebol2:
```
>> to word! "a b c"
== a b c
>> to word! "a{b}c"
== a{b}c
```
and in Rebol3:
```
>> to word! "a b c"
** Script error: contains invalid characters
** Where: to
** Near: to word! "a b c"

>> to word! "a{b}c"
== a{b}c
```

I think that it should throw error in all cases like does R3 with spaces.

Tested with:
```
Red 0.6.4 for Windows built 18-Nov-2020/3:13:59+01:00 commit #8ee5a9f
```


Comments:
--------------------------------------------------------------------------------

On 2020-11-20T23:36:38Z, Oldes, commented:
<https://github.com/red/red/issues/4735#issuecomment-731461284>

    On the other side, current situation may be useful in situation like:
    ```red
    >> to word! as string! <a href="foo">
    == a
    ```

--------------------------------------------------------------------------------

On 2020-11-22T00:44:25Z, greggirwin, commented:
<https://github.com/red/red/issues/4735#issuecomment-731659082>

    I don't think the tag example is that useful. 

--------------------------------------------------------------------------------

On 2020-11-24T08:56:11Z, Oldes, commented:
<https://github.com/red/red/issues/4735#issuecomment-732753139>

    @greggirwin so you think that there should be error message like in R3 instead of this silent truncation?

--------------------------------------------------------------------------------

On 2020-11-24T17:29:29Z, greggirwin, commented:
<https://github.com/red/red/issues/4735#issuecomment-733126593>

    Yes. It's one thing to make a non-loadable but usable value, which could potentially be mapped back to the original. It's another to create a value that is so lossy that predicting behavior will be difficult. That doesn't mean we won't have *any* lossy conversions, but this one seems particularly bad.

--------------------------------------------------------------------------------

On 2020-11-27T16:13:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4735#issuecomment-734902400>

    @Oldes 
    > ```red
    > to word! as string! <a href="foo">
    > == a
    > ```
    
    You can do it using:
    ```
    >> transcode/one as string! <a href="foo">
    == a
    ```
    

--------------------------------------------------------------------------------

On 2020-11-27T16:38:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4735#issuecomment-734914443>

    It's now reporting an error in all those invalid cases. 
    Adding a unit test is left to the poster @Oldes or anyone willing to submit a PR. ;-)

--------------------------------------------------------------------------------

On 2020-11-27T17:47:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4735#issuecomment-734935902>

    > transcode/one as string! <a href="foo">
    
    @dockimbel I only get `a` using `transcode`. 
    ```
    >> transcode/one as string! <a href="foo">
    == a
    >> mold transcode/one as string! <a href="foo">
    == "a"
    ```

--------------------------------------------------------------------------------

On 2020-11-27T17:47:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4735#issuecomment-734936029>

    Unless that's part of the new fix.

--------------------------------------------------------------------------------

On 2020-11-27T18:18:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4735#issuecomment-734944249>

    @greggirwin Not sure what you mean. Using `transcode`, you will get all values tokenized:
    ```
    >> transcode as string! <a href="foo">
    == [a href= "foo"]
    ```

--------------------------------------------------------------------------------

On 2020-11-27T19:35:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4735#issuecomment-734962723>

    Ah, I see what you mean now. I thought you meant that should convert the complete tag value to the word.

