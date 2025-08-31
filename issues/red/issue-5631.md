
#5631: JSON strings incorrectly escaped
================================================================================
Issue is open, was reported by PeterWAWood and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5631>

**Describe the bug**
When `to-json` encounters a string that requires "escaped characters" to output Rebol values, it uses Red "string  escaping" not JavaScript escaping.

```
>> m: make map! compose [ ordinary-word "a^(82)b" (to word! "a^(82)b") 1 ] 
== #[
    ordinary-word: "a^(82)b"
    ab: 1
]
>> to-json m
== {{"ordinary-word":"a^(82)b","a^(82)b":1}}
```
Note: The Word datatype docs state that ASCII control characters are illegal in strings but the above code "successfully" uses an ASCII control character in a word.

**To reproduce**
Run the above code in a Red console

**Expected behavior**
`to-json #[ ordinary-word "a^(82)b" ]` should return `{{"ordinary-word":"a\u0082b"}}`

**Platform version**
RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]


Comments:
--------------------------------------------------------------------------------

On 2025-07-07T13:27:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5631#issuecomment-3045148085>

    Related discussion: https://matrix.to/#/%23red_bugs%3Agitter.im/%24NyxH8tgYV5423xUCP1wNTJf2ZDJyfZu2cTyAfjd7rsA?via=gitter.im&via=matrix.org&via=nitro.chat

--------------------------------------------------------------------------------

On 2025-07-12T19:53:01Z, dockimbel, commented:
<https://github.com/red/red/issues/5631#issuecomment-3066006478>

    I let @rebolek do the fix.

--------------------------------------------------------------------------------

On 2025-07-12T22:48:32Z, greggirwin, commented:
<https://github.com/red/red/issues/5631#issuecomment-3066174115>

    For reference, here is the example code from Gitter (the link refuses to work for me).
    
    ```
    >> m: make map! compose [ (to word! "a^(82)b") 1 plain-word 2 ]
    == #[
        ab: 1
        plain-word: 2
    ]
    >> m/ab
    == none
    >> m/(to word! "a^(82)b")
    == 1
    
    >> to-json m
    == {{"a^(82)b":1,"plain-word":2}}
    ```
    
    ```
    >>> "a^(82)b".length
    7
    >>> "a\u0082b".length
    3
    ```

