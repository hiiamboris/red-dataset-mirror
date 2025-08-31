
#5570: Using ? keep does not find any documentation information for the keep function
================================================================================
Issue is closed, was reported by ScriptGo and has 8 comment(s).
<https://github.com/red/red/issues/5570>

```red
>> ? keep
No matching values were found in the global context.
```

Platform version

`Red 0.6.5 for Linux built 29-Nov-2024/4:56:25+08:00  commit #a691592`


Comments:
--------------------------------------------------------------------------------

On 2024-12-02T05:54:53Z, gurzgri, commented:
<https://github.com/red/red/issues/5570#issuecomment-2510641807>

    `keep` is only defined in `collect` contexts.
    
    ```Red
    >> collect [help keep]
    ```

--------------------------------------------------------------------------------

On 2024-12-02T05:56:36Z, ScriptGo, commented:
<https://github.com/red/red/issues/5570#issuecomment-2510643543>

    > `keep` is only defined in `collect` contexts.
    > 
    > ```red
    > >> collect [help keep]
    > ```
    
    It can't be used alone?

--------------------------------------------------------------------------------

On 2024-12-02T05:58:31Z, ScriptGo, commented:
<https://github.com/red/red/issues/5570#issuecomment-2510645490>

    > `keep` is only defined in `collect` contexts.
    > 
    > ```red
    > >> collect [help keep]
    > ```
    
    OK, I see. Thanks.

--------------------------------------------------------------------------------

On 2024-12-02T08:52:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5570#issuecomment-2510920708>

    @ScriptGo please ask questions in [red/help](https://matrix.to/#/%21wUTlqkqOhNGtfQzIsO%3Amatrix.org?via=gitter.im&via=matrix.org&via=nitro.chat) or [red/bugs](https://matrix.to/#/%23red_bugs%3Agitter.im?via=gitter.im&via=matrix.org&via=nitro.chat) before posting new issues on GitHub

