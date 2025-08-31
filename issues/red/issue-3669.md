
#3669: Missing escape char ^ when loaded TAG with it inside
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[test.written]
<https://github.com/red/red/issues/3669>

Current behavior:
```
>> <a^>
== <a>
>> load {<a^>}
== <a>
```
Expected `<a^>` or error?

```
Red 0.6.4 for Windows built 26-Nov-2018/12:26:10+01:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T11:07:51Z, 9214, commented:
<https://github.com/red/red/issues/3669#issuecomment-602028140>

    On `fast-lexer`:
    ```red
    >> <a^>
    == <a^>
    >> load {<a^>}
    == <a>
    ```

--------------------------------------------------------------------------------

On 2020-07-13T18:16:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3669#issuecomment-657713903>

    Just needs a regression test now and can be closed then.

