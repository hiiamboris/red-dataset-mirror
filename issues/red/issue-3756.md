
#3756: select on `hash!` randomly succeeds/fails (GC likely)
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3756>

**Describe the bug**

```
>> h: make hash! reduce [make object! [] 123 make object! [] 234 make object! [] 345]
>> select h object []
== none
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== 123
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== none
>> select h object []
== 345
>> select h object []
== 345
```
Also confirmed by @rebolek and @BeardPower: :point_up: [January 24, 2019 3:57 PM](https://gitter.im/red/bugs?at=5c49b63f95e17b4525a18a37)

**To reproduce**

It's unclear yet what triggers it. Sometimes `select` returns `none` dozens of times in a row. Try typing random stuff into GUI console, repeating the initial `h: ....` assignment, waiting a few secs before another `select`...

Probably better, `loop` method:
```
h: make hash! reduce [make object! [] 123 make object! [] 234 make object! [] 345]
loop 100 [prin [select h object [] space] h]
```
```
>> none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  none  none  234  none  none  none  345  none  none  none  none  none  none  none  123  none  == make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
```

After `recycle/off` it fails only once and then always returns `none`.

**Expected behavior**

Should be `123` always with `select`, and `none` with `select/same`


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-25T03:49:34Z, qtxie, commented:
<https://github.com/red/red/issues/3756#issuecomment-457446294>

    FYI. Finding a block! or object! value in the hash! will fallback to use linear search, unless the `/same` refinement is used.

--------------------------------------------------------------------------------

On 2019-01-27T00:05:23Z, endo64, commented:
<https://github.com/red/red/issues/3756#issuecomment-457877063>

    @greggirwin Looks like this issue solved now. (Tested on Win10)

--------------------------------------------------------------------------------

On 2019-01-27T08:54:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3756#issuecomment-457900396>

    ```
    >> loop 100 [prin [select h object [] space] h]
    123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  123  == make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
    >> loop 100 [prin [select/same h object [] space] h]
    none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  none  == make hash! [make object! [] 123 make object! [] 234 make object! [] 345]
    ```
    I confirm on W7. @qtxie is lightning fast :) Good job! I'm closing it.

--------------------------------------------------------------------------------

On 2019-01-27T22:45:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3756#issuecomment-457961571>

    Great work team!

