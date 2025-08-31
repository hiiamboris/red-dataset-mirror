
#4790: Loading C1 codepoints messes up system/words.
================================================================================
Issue is closed, was reported by dsunanda and has 10 comment(s).
[status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4790>

**Describe the Issue**

Encountering invalid strings can bypass ATTEMPT, and seemingly corrupt SYSTEM/WORDS

```
attempt [load compress "hello"]
*** Access Error: invalid UTF-8 encoding: #{8B000000}
```

The ATTEMPT was not trapped, and now system/words is partially inaccessible:

```
system/words
*** Access Error: invalid UTF-8 encoding: #{8B000000}

recycle
system/words
== make object! [...]
```

(Issues found in trying to LOAD a script which may - or may not be - saved as COMPRESSed)

**Platform**

Windows:

```
 date: 24-Dec-2020/23:08:25
commit: #98f31b56d03e314735d951419f4cb0d9304372f2
build-basename: %gui-console-2020-12-24-83328

```


Comments:
--------------------------------------------------------------------------------

On 2021-01-14T08:18:19Z, qtxie, commented:
<https://github.com/red/red/issues/4790#issuecomment-760011182>

    The lexer creates a word which cannot be mold.
    ```
    >> load #{8B}
    *** Access Error: invalid UTF-8 encoding: #{8B000000}
    *** Where: mold
    *** Stack:
    >> type? load #{8B}
    == word!
    ```

--------------------------------------------------------------------------------

On 2021-01-28T16:55:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4790#issuecomment-769223333>

    Additionally `to-binary load #{8B}` will crash the session.

--------------------------------------------------------------------------------

On 2021-02-01T21:53:17Z, Oldes, commented:
<https://github.com/red/red/issues/4790#issuecomment-771184592>

    It's not fixed!
    ```red
    >> error? try [transcode #{8B}]
    == false
    >> system/words
    *** Access Error: invalid UTF-8 encoding: #{8B000000}
    ```
    or:
    ```red
    >> error? try  [transcode #{42137E26C646365C}]
    == true
    >> system/words
    *** Access Error: invalid UTF-8 encoding: #{C6463600}
    ```
    [Credits](https://gitter.im/red/bugs?at=6018678d9238c531ad19f7ac) belongs to @dsunanda 

--------------------------------------------------------------------------------

On 2021-02-01T22:12:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4790#issuecomment-771195237>

    See chat here for reopening: https://gitter.im/red/bugs?at=6018678d9238c531ad19f7ac

--------------------------------------------------------------------------------

On 2021-08-20T16:45:21Z, dockimbel, commented:
<https://github.com/red/red/issues/4790#issuecomment-902821682>

    The last example still causes troubles, but all the other code snippets are working fine.

