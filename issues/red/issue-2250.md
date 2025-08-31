
#2250: `difference` behaves different in rebol
================================================================================
Issue is closed, was reported by wolframkriesing and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2250>

In Red I get

``` red
red>> difference [1:00] [2:00 1:00]
== [1:00:00 2:00:00 1:00:00]
```

in rebol I get (what I had expected)

``` rebol
>> difference [1:00] [2:00 1:00]
== [2:00]
```

I see two differences
1) it should not list `1:00` twice and
2) the formatting contains the seconds, which rebol does not



Comments:
--------------------------------------------------------------------------------

On 2016-10-02T17:42:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2250#issuecomment-250984023>

    Good catch! It looks like time! may need a switch case of its own in `do-set-op` in %natives.reds.
    
    On the formatting, it's possible that Red will always include seconds by default, and you'll use the future `format` function to suppress them if you want. It's more consistent than Rebol this way.

