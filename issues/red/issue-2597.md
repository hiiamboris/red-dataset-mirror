
#2597: compiler: wired crash on redefining functions and returning result
================================================================================
Issue is closed, was reported by x8x and has 10 comment(s).
[type.compiler]
<https://github.com/red/red/issues/2597>

Both examples belows works fine when compiled:
```
now*: :system/words/now
now: func [/time][do [now*/time]]
a: now/time
print a
```
```
trim*: :system/words/trim
trim: func [string /tail][do [trim*/tail string]]
a: trim/tail {123}
print a
```

But, adding `return` as here:
```
now*: :system/words/now
now: func [/time][return do [now*/time]]
a: now/time
print a
```
```
trim*: :system/words/trim
trim: func [string /tail][return do [trim*/tail string]]
a: trim/tail {123}
print a
```
will crash on execution.
Strangely, these will work:
```
now*: :system/words/now
now: func [/time][return do [now*/time]]
print now/time
```
```
trim*: :system/words/trim
trim: func [string /tail][return do [trim*/tail string]]
print trim/tail {123}
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-18T18:14:30Z, x8x, commented:
<https://github.com/red/red/issues/2597#issuecomment-294934150>

    Not `refinements` related as this will crash as well:
    ```
    trim*: :system/words/trim
    trim: func [string][return do [trim* string]]
    a: trim {123}
    print a
    ```

--------------------------------------------------------------------------------

On 2020-07-17T11:05:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/2597#issuecomment-660044851>

    @x8x can you still reproduce the crash? I think it was solved.. somehow...

--------------------------------------------------------------------------------

On 2020-07-20T12:57:36Z, x8x, commented:
<https://github.com/red/red/issues/2597#issuecomment-661022755>

    Closing this, all above crashing examples runs fine on latest Red.

--------------------------------------------------------------------------------

On 2020-07-20T13:05:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/2597#issuecomment-661027119>

    We should write a regression test for this though.

--------------------------------------------------------------------------------

On 2020-07-23T04:14:26Z, theSherwood, commented:
<https://github.com/red/red/issues/2597#issuecomment-662810085>

    @x8x Any idea what version of the compiler you were using at the time? I'm using one from Apr 17, 2017 (1c2005d066cb67b2b1a78c317af346ed789489e7) and I'm unable to replicate the crash for testing.

