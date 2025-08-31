
#3411: Bug: to-UTC-date and to-local-date crash the GUI console
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3411>

`to-UTC-date` and `to-local-date` defined at bottom of `%environment/functions.red` crash the GUI console but run fine in the CLI console.

### Expected behavior
```
  to-UTC-date now
;   8-Jun-2018/16:24:20
```
### Actual behavior
```
  to-UTC-date now
*** Runtime Error 1: access violation
*** at: 000E6452h
```

Related issue: https://github.com/red/red/issues/3329
Related PR: https://github.com/red/red/pull/3335

### Red and platform version
```
Red 0.6.3 for macOS built 8-Jun-2018/8:00:47+07:00 commit #9af869a
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-08T16:43:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3411#issuecomment-395818873>

    If I paste the source for `to-UTC-date` into the GUI console, it no longer crashes.
    
    Same for `to-local-date`.
    
    Red 0.6.3 for Windows built 7-Jun-2018/19:00:47-06:00 commit #9af869a

--------------------------------------------------------------------------------

On 2018-06-08T22:27:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3411#issuecomment-395908939>

    I can confirm the crash with commit 9af869ac1b35afe61161fb1082451483135a76b0 (HEAD -> master, upstream/master)

--------------------------------------------------------------------------------

On 2018-06-08T22:31:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3411#issuecomment-395909587>

    I ran my test script that runs the Red tests in a GUI console on Mac. The tests run to completion because there are no tests of `to-UTC-date` or `to-local-date`.

--------------------------------------------------------------------------------

On 2018-06-08T22:38:52Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3411#issuecomment-395911078>

    Though all in all, `to-UTC-date` seems to be a misnamed. They change only the timezone but do not adjust the date.
    ```text
    to-UTC-date: func [
    	"Returns the date with UTC zone"
    	date [date!]
    	return: [date!]
    ][
    	date/timezone: 0
    	date
    ]
    ```
    The same with `to-local-date`.

--------------------------------------------------------------------------------

On 2018-06-09T09:46:14Z, x8x, commented:
<https://github.com/red/red/issues/3411#issuecomment-395955810>

    @PeterWAWood Not sure I understand your comment,
    ```
      a: now
    ;   9-Jun-2018/2:42:03+05:00
      to-utc-date a
    ;   8-Jun-2018/21:42:03
    ```
    date is correctly being adjusted.

--------------------------------------------------------------------------------

On 2018-06-09T10:00:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3411#issuecomment-395956642>

    So it is. I should have read the docs.

--------------------------------------------------------------------------------

On 2018-06-09T12:45:01Z, endo64, commented:
<https://github.com/red/red/issues/3411#issuecomment-395966552>

    @x8x @PeterWAWood I think confusion comes from this, changing `zone` doesn't adjust date, but changing `timezone` does:
    
    ```
    >> a: now
    == 9-Jun-2018/15:42:50+03:00
    >> a/zone: 0
    >> a
    == 9-Jun-2018/15:42:50  ;<< didn't adjust
    
    >> a: now
    == 9-Jun-2018/15:43:03+03:00
    >> a/timezone: 0
    >> a
    == 9-Jun-2018/12:43:03	;<< adjust!
    ```

--------------------------------------------------------------------------------

On 2018-06-09T13:50:43Z, x8x, commented:
<https://github.com/red/red/issues/3411#issuecomment-395970972>

    @endo64 That's documented here https://doc.red-lang.org/en/date.html

