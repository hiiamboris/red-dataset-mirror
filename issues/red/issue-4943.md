
#4943: FIND/match/tail overshoots on lists
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4943>

**Describe the bug**
```
>> find/match [1 2 3 4 5] [1]
== [2 3 4 5]
>> find/match [1 2 3 4 5] [1 2]
== [3 4 5]
>> find/match [1 2 3 4 5] [1 2 3]
== [4 5]

>> find/match/tail [1 2 3 4 5] [1]
== [3 4 5]
>> find/match/tail [1 2 3 4 5] [1 2]
== [5]
>> find/match/tail [1 2 3 4 5] [1 2 3]
== []
```

**To reproduce**
```
find/match/tail [1 2 3 4 5] [1]
find/match/tail [1 2 3 4 5] [1 2]
find/match/tail [1 2 3 4 5] [1 2 3]
```

**Expected behavior**

Since /match already returns tail, /tail should be ignored.

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-08-03T19:49:45Z, greggirwin, commented:
<https://github.com/red/red/issues/4943#issuecomment-892119082>

    Great catch! Now here's something interesting. Look what R2 does.
    ```
    >> find/match/tail [1 2 3 4 5] [1]
    == none
    >> find/match/tail [1 2 3 4 5] [1 2]
    == none
    ```
    I don't think that was ever reported. Behaves the same for strings.

--------------------------------------------------------------------------------

On 2021-08-03T19:52:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4943#issuecomment-892120646>

    It's a tricky design choice. @meijeru might have thoughts on that. _Should_ `/match` return the tail? It's implicit, and doc'd, more useful than a strange `logic!` result would be, but removes the option to process _from_ the match position.

--------------------------------------------------------------------------------

On 2021-08-03T20:17:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4943#issuecomment-892136904>

    Agreed. I would rather have it return position unchanged (and I do recall wanting that 1 or 2 times, don't recall what for though).

--------------------------------------------------------------------------------

On 2021-08-04T08:20:29Z, meijeru, commented:
<https://github.com/red/red/issues/4943#issuecomment-892464807>

    /tail        => Return the tail of the match found, rather than the head.
    /match       => Match at current index only and return tail of match.
    
    If /match returns the match position instead of the tail, this gives more flexibility, because THEN the user can add /tail to obtain the behaviour which is now default, and process from the match position without /tail.

--------------------------------------------------------------------------------

On 2021-08-04T17:20:43Z, greggirwin, commented:
<https://github.com/red/red/issues/4943#issuecomment-892834390>

    Sounds like we all agree, but @dockimbel has to weigh in because it is a breaking change. Looks like console code uses `find/match` in a few places. Changing those to add `/tail` shouldn't be a problem, and any other code that breaks can do the same.  It seems a worthwhile change because it makes things more flexible and more explicit.

--------------------------------------------------------------------------------

On 2021-08-11T20:04:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4943#issuecomment-897114282>

    @greggirwin I agree with the proposed change.

