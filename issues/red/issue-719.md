
#719: In words, case is significant for non-ascii characters
================================================================================
Issue is closed, was reported by IngoHohmann and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/719>

Case is significant for non-ascii characters:

```
red>> ä: 1
== 1
red>> Ä
*** Error: word has no value!
```

But it is not significant for ascii characters:

```
red>> a: 1
== 1
red>> A
== 1
```

I know, this is a deep issue, and maybe opening this now is premature



Comments:
--------------------------------------------------------------------------------

On 2014-03-07T16:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/719#issuecomment-37039975>

    We do not yet have support for upper/lowercasing and case-insensitive comparison of non-ASCII characters, but we will add that for the 1.0.
    
    @PeterWAWood Could you please remind me what was our conclusion about the Unicode collations algorithm support we talked about for Red?

--------------------------------------------------------------------------------

On 2014-03-07T16:56:15Z, PeterWAWood, commented:
<https://github.com/red/red/issues/719#issuecomment-37043388>

    Sure, when I can find time to pull my notes together (to remember the conclusion) and update the wiki page. I'll try to get it done some time next week.

--------------------------------------------------------------------------------

On 2016-02-06T18:59:02Z, dockimbel, commented:
<https://github.com/red/red/issues/719#issuecomment-180838136>

    We have a partial support for deeper Unicode features. Such code now runs fine:
    
    ```
    red>> ä: 1
    == 1
    red>> Ä
    == 1
    ```

