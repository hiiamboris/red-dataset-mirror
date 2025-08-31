
#3678: `help` is often useless when invoked from within a CLI script
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3678>

**Describe the bug**

script: `Red [] b: [1] ? b`
output of `red --cli script.red`:
```
B is a block! value.  ...
```
Great. Very insightful. No matter how short the block is, it's never displayed with the `--cli` option.

**Expected behavior**
From the console the same code works fine:
```
>> ? b
B is a block! value.  length: 1  [1]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Dec-2018/23:37:37+03:00 commit #873a756
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-23T20:50:42Z, endo64, commented:
<https://github.com/red/red/issues/3678#issuecomment-449662493>

    Confirmed.
    Additional note, when I try to compile that script, it gives `Compilation Error: undefined word ?` error. Both with `-u` and `-r`.

--------------------------------------------------------------------------------

On 2018-12-24T16:12:50Z, dockimbel, commented:
<https://github.com/red/red/issues/3678#issuecomment-449750881>

    @endo64 `help` and the `?` shortcut are only compiled with the console, as they are useless in a non-interactive environment like a compiled user script.

--------------------------------------------------------------------------------

On 2018-12-24T16:41:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3678#issuecomment-449753541>

    @dockimbel IMO these are often more convenient to debug with than `probe`, because of their user-friendly output. That's why https://github.com/red/red/issues/3487 was implemented.

--------------------------------------------------------------------------------

On 2018-12-30T01:15:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3678#issuecomment-450532409>

    @hiiamboris does `help-string` work? That's the non-console version.

--------------------------------------------------------------------------------

On 2018-12-30T01:20:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3678#issuecomment-450532627>

    Redirection of `print` being the issue.

--------------------------------------------------------------------------------

On 2018-12-30T01:22:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3678#issuecomment-450532731>

    Ah, I think I get it now. We have a `system/console`, but not a `system/console/size` to work against.

--------------------------------------------------------------------------------

On 2019-01-10T12:51:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/3678#issuecomment-453085338>

    I'll add a closely related bug here, instead of a new issue. `dump-reactions` is useless in CLI console as well, because it relies on `system/console/size/x` which is `0` for it:
    
    Consider `1.red`:
    ```
    r: make reactor! [a: 1 b: is [a * 2] c: 0]
    react/link func [x y][x/c: y/a * 3] [r r]
    dump-reactions
    ```
    
    ```
    > red --cli 1.red
    1:---
      Source: object
       Field: a
      Action:
      Target: b
    2:---
      Source: object
       Field: a
      Action:
        Args:
    ```
    
    While the normal output should be (apart from strange newlines after the numbers):
    ```
    1
    :---  Source: object [a b c]
       Field: a
      Action: [a * 2]
      Target: b
    2
    :---  Source: object [a b c]
       Field: a
      Action: func [x y][x/c: y/a * 3]
        Args: [object [a: 1 b: 2 c: 3] object [a: 1 b: 2 c: 3]]
    ```

