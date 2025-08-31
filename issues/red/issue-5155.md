
#5155: [VID] word assigment should come earlier
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5155>

**Describe the bug**

I have a few small annoyances with `name: style` in VID:
```
>> p: none view [p: panel [do [? p]]]
P is a none! value: none    ;) pane doesn't know about `p:` yet

>> system/view/VID/styles/base2: copy/deep system/view/VID/styles/base
>> append system/view/VID/styles/base2 [init: [? b]]
>> b: none view [b: base2]
B is a none! value: none    ;) init code doesn't know about `b:`
```

**Expected behavior**

It is preferable that object be created and assigned to a word before `init` evaluation and `pane` parsing. 

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33
```



Comments:
--------------------------------------------------------------------------------

On 2022-06-29T17:06:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5155#issuecomment-1170248447>

    should be type.gui type.review priority.low, but MS broke everything again

--------------------------------------------------------------------------------

On 2022-08-21T15:48:39Z, dockimbel, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221571205>

    > p: none view [p: panel [do [? p]]]
    P is a none! value: none    ;) pane doesn't know about `p:` yet
    
    You can use predefined `face` word to access the current face object. It could be possible to modify VID to set such label earlier, though, the facets are not set until all the face optional instructions are not processed, so I don't see what purpose would that change help fulfill, as most of the facets would be set by VID anyway?
    
    > append system/view/VID/styles/base2 [init: [? b]]
    
    You can use predefined `face` word to access the current face object instead of relying on an optional label. Again, what would be the purpose of accessing the label so early?

--------------------------------------------------------------------------------

On 2022-08-21T17:04:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221583948>

    Hard question after almost 2 months ;)
    IIRC when I was working on VID/S, I tried to write layouts somewhat like this:
    ```
    view [
    	h: host [
    		b: button "B" react [b/limits: (xy: h/size - 20) .. xy]
    	]
    ]
    ```
    Reaction gets silently ignored which annoyed me. Turned out `h` was unset at the time (VID/S evaluates before `h` face is finished). I then tried this:
    ```
    view [
    	host 100x100 with [h: self] [
    		b: button "B" react [b/limits: (xy: h/size - 20) .. xy]
    	]
    ]
    ```
    Now I get `h` but I also have to define `100x100` size, which is `none` otherwise. But `with [h: self]` is ugly workaround.
    
    Don't quite recall what was the thing with `init`, probably something like that too.

--------------------------------------------------------------------------------

On 2022-08-21T17:17:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221586360>

    This seems like a regular "doing something before its reference exists problem", not specific to VID. That's solvable only with tradeoffs, which may be worth it sometimes. e.g. a notation for deferred evaluation of handling of none refs in those cases. But those have costs when it comes to maintenance, reasoning, typos silently failing, etc.

--------------------------------------------------------------------------------

On 2022-08-21T18:03:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221593963>

    What's the point of defending a design issue? It's not a context declaration where set-word lies outside of it and can't be accessed. It's a dialect, and we as designers should do our best to improve it where possible. In Spaces I just initialize the word before evaluating any of the code, and it all works fine. This issue was already solved there.

--------------------------------------------------------------------------------

On 2022-08-22T02:17:49Z, greggirwin, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221712816>

    When a design is questioned, either everyone agrees it should be changed ("How obvious!") or someone proposes a *new* design, and they are weighed against each other, and *both* need to be defended. Agreed?
    
    I wasn't defending the design. I was saying "Hmmm, how should we think about this?" This ties into when things are evaluated, and our mental models of how things work. For example, yes, VID is a dialect and could probably support this, based on what @dockimbel said. Does that set a new precedent to say "normal" Red works vs dialects, when it comes to specs and initializing aggregate types or structures? And is that better overall, or is it more confusing? e.g. learning and keeping deferred evaluation rules in our heads.

--------------------------------------------------------------------------------

On 2022-08-22T07:58:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5155#issuecomment-1221989934>

    > And is that better overall
    
    Of course. I've shown you real example that a human can read and understand. If the computer could understand it without human jumping around with the tambourine that's always better.

--------------------------------------------------------------------------------

On 2022-08-22T12:13:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5155#issuecomment-1222271230>

    So the actual use-case is being able to address one of the current parents panel face from within a nested reactive expression. I agree that it worth supporting. 
    
    My default reluctance on such change is related to many View users relying too much on labels for faces instead of the implicit `face` word or just accessing the face from the face tree. This results in people creating dynamic VID code with many faces, each  using dynamically created set-words as labels... That's a bad pattern that I try not to encourage, and this change does encourage it. Anyway, I think that this change is overall a positive one, so it's done now.

--------------------------------------------------------------------------------

On 2022-08-22T17:44:55Z, greggirwin, commented:
<https://github.com/red/red/issues/5155#issuecomment-1222707255>

    > I've shown you real example that a human can read and understand.
    
    Our own designs are always obvious to us. Well, almost always anyway. So you question a design and that's OK. I pose thoughts related to your re-design and that's OK too, right?

--------------------------------------------------------------------------------

On 2022-08-22T19:40:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5155#issuecomment-1222838502>

    Sure ;)

