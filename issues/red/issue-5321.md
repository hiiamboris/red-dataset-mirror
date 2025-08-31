
#5321: Tag into tag insertion doesn't look right
================================================================================
Issue is open, was reported by hiiamboris and has 16 comment(s).
<https://github.com/red/red/issues/5321>

**Describe the bug**
```
>> append/part <one> <two> length? <two>
== <one<tw>
```

**Expected behavior**
`== <onetwo>`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-05-18T23:37:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5321#issuecomment-1553783075>

    Both R2 and R3 produce the same result. Though, I agree that it does not look good.
    
    @greggirwin Do you remember if such result was justified in Rebol?  I remember that there was a logical reason for that, but can't remember which one. Also, it seems the behavior of R3 was [changed back](https://www.curecode.org/rebol3/ticket.rsp?id=10) to the R2 one. See also [R3#854](https://www.curecode.org/rebol3/ticket.rsp?id=854).

--------------------------------------------------------------------------------

On 2023-05-19T11:37:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5321#issuecomment-1554444213>

    Also this:
    ```
    >> head change/part <one> <one> length? <one>
    == <<one>>
    ```

--------------------------------------------------------------------------------

On 2023-05-19T20:47:51Z, greggirwin, commented:
<https://github.com/red/red/issues/5321#issuecomment-1555231949>

    I only remember that tags were so hard to predict, and use safely, in this regard that I avoided them at all costs, outside of literal use in data formats.
    ```
    >> append <one> <two>
    == <one<two>>
    >> <one<two>>
    *** Script Error: > is missing its value2 argument
    *** Where: >
    *** Near : <one<two> >
    *** Stack:  
    
    >> <<one>>
    *** Script Error: > is missing its value2 argument
    *** Where: >
    *** Near : <<one> >
    *** Stack:  
    
    ```

--------------------------------------------------------------------------------

On 2023-05-19T20:57:14Z, greggirwin, commented:
<https://github.com/red/red/issues/5321#issuecomment-1555240303>

    It falls into the same uncanny valley as making unloadable values of any type (and tag! docs note that you can do this), but more insidious because they seem like they are just bracketed strings that could contain anything. My favorite timebomb in R2 for this was issues with spaces, because anything after a space was basically invisible.

--------------------------------------------------------------------------------

On 2023-05-20T18:20:55Z, greggirwin, commented:
<https://github.com/red/red/issues/5321#issuecomment-1555966212>

    Correct me if I'm wrong, but tags in SGML/HTML/XML can't contain `>`, because that ends the tag. There is no escape and no nesting. They also can't contain`<`, right, but it's not harmful? And even if they could, nobody is going to do that because you can't trust that every parser out there will handle it well. So why don't we make tags do the right thing and omit their brackets when the target type is a `tag!`. If types are mixed, string and tag, it's on the user. Because we do want the brackets when building strings, and if someone mods a tag with a string containing `<`, OK. If they go so far as to work `>` into a tag, that's still not a problem in many cases, as they can be used as interim values and coerced back to strings safely. It's a similar issue with `file!` values that may not be valid, or not valid on a given FS. If someone works `>` into a tag and then tries to load it, they get what they deserve. the alternative is vanishing brackets or errors, which I think is worse in this case.

--------------------------------------------------------------------------------

On 2023-05-20T18:26:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5321#issuecomment-1555967261>

    HTML tags can contain <> as `&lt;&gt;` though (in URLs).

--------------------------------------------------------------------------------

On 2023-05-21T01:56:03Z, greggirwin, commented:
<https://github.com/red/red/issues/5321#issuecomment-1556061677>

    I can't imagine we'll want to make that specific in the datatype, for many reasons. But once you've got a tag, a high level sanitizer will be easy.

--------------------------------------------------------------------------------

On 2023-05-21T01:56:40Z, greggirwin, commented:
<https://github.com/red/red/issues/5321#issuecomment-1556061807>

    Or we can tell people to pre-process data, same sanitizer, before inserting into tags.

