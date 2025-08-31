
#5473: email accepts ' which is not allowed
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 8 comment(s).
<https://github.com/red/red/issues/5473>

**Describe the bug**
Red accepts `'` in email which is not allowed as [here](https://stackoverflow.com/a/2049510) (Thanks to @hiiamboris for the reference)

(I don't know if it should be allowed to have illegal character to let Red "user" code to parse them or not)


**To reproduce**
```
probe type? 'select@raw`
email!
```


**Platform version**

-----------RED & PLATFORM VERSION----------- 

RED: [ branch: "master" tag: #v0.6.4 ahead: 5088 date: 16-Jan-2024/7:06:36 commit: #49a98d164a11da9e809a5aca45f462e662e5ca6d ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]

--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2024-02-02T16:18:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5473#issuecomment-1924195825>

    > Red accepts ' in email which is not allowed as [here](https://stackoverflow.com/a/2049510) (
    
    The text you are pointing to literally says the opposite:
    ```
    The local-part of the email address may use any of these ASCII characters:
    
    * uppercase and lowercase Latin letters A to Z and a to z;
    * digits 0 to 9;
    * special characters !#$%&'*+-/=?^_`{|}~;
    [...]
    ```

--------------------------------------------------------------------------------

On 2024-02-02T17:58:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5473#issuecomment-1924415040>

    you're quoting the local, not domain part @dockimbel 

--------------------------------------------------------------------------------

On 2024-02-02T20:05:05Z, greggirwin, commented:
<https://github.com/red/red/issues/5473#issuecomment-1924601740>

    Certainly a Red Specs gray area. Today the lexer defines the rules, so some of those special chars don't work. e.g. `#$%/^{}`. They either create two different values, e.g. file!/issue!/refinement and ref!, open a string, or error out. The more advanced rules, like parens, aren't supported by email! either, and I think that's OK.
    
    The confusing part in this case is the tick mark normally used by lit-word!. As soon as you include `@` in a word it becomes an email. That's OK as `@` is doc'd as being illegal in words. And it can't be a breaking sigil, or email form can't exist.
    
    The question, then, is _should_ email allow ticks? If so, should it also allow them at the head? The only reason to do so is to support the full RFC spec, which we're not going to do. Too many conflicts with other types in Red. A tick at the head of an email looks confusing to me, reading like a literal word value. _However_, nobody is going to make you do that.
    
    It's OK as it is, IMO, but if we make ticks illegal, at least in the head position, I'm not opposed to that either.

--------------------------------------------------------------------------------

On 2024-02-07T19:09:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5473#issuecomment-1932696907>

    > you're quoting the local, not domain part @dockimbel
    
    The provided code example has a single quote in the _local part_ and not in the domain part (back-quote there). The ticket description is written in such a way that it confuses the reader about the reported issue...

