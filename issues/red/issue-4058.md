
#4058: MacOS terminal delay
================================================================================
Issue is closed, was reported by ralfwenske and has 4 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4058>

MacOS: hitting return several times in terminal ( or worse: holding it down a few seconds ) causes long delay until >> shows again.

Alvydas Vitkauskas confirmed:
It also happens if you just keep Red console open for a few minutes without doing anything.

**Platform version**
```
Red 0.6.4 for macOS built 28-Sep-2019/2:46:20+10:00 commit #d0e6692
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-24T14:26:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4058#issuecomment-557893682>

    It really became impossible to use.
    Not so much as `<Enter>` triggers the bug but entering/pasting something a few times.
    Then after each line display happens a 10 second delay (always the same).
    And this delay stops in an instant when I activate or deactivate the terminal.
    
    https://github.com/red/red/commit/d0e669240923f5268c6107c70f3659a1cb2375b8 is the cause of the regression (setting interval to 50ms in the future and looping)
    Perhaps this should be done on only once rather than in every `do-events`?

--------------------------------------------------------------------------------

On 2019-12-15T19:18:31Z, rebred, commented:
<https://github.com/red/red/issues/4058#issuecomment-565838159>

    very very slow. 5 seconds or more when typing to get any feedback. unusable

