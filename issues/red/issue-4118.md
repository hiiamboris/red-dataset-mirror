
#4118: running out of memory when MOLDing or FORMing deeply nested face
================================================================================
Issue is closed, was reported by 9214 and has 26 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/4118>

**Describe the bug**
Title.

**To reproduce**
```red
layout [foo: base center font-size 0 on-down [probe '>>> form face probe '<<<]]

view make face! [
    type: 'window
    size: foo/size + 20
    pane: reduce collect [loop 44 [keep copy foo]]
]
```
Usage of `center` and `font-size` creates `para!` and `font!` objects, respectively, which contribute to the issue.

Click on base, and, after GUI stutter, observe the console output:
```
>>>
*** Internal Error: not enough memory
*** Where: form
*** Stack: view do-events do-actor do-safe
```

**Expected behavior**
```
>>>
<<<
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 2-Nov-2019/20:40:59+01:00 commit #1d32938
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-18T17:43:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-575922087>

    Curiously, the original snippet doesn't reproduce the issue anymore. Since Dec 20th build you have to use `loop 60` or more.

--------------------------------------------------------------------------------

On 2020-01-18T17:46:25Z, 9214, commented:
<https://github.com/red/red/issues/4118#issuecomment-575922337>

    https://github.com/red/red/commit/bba311f2 ?

--------------------------------------------------------------------------------

On 2020-01-18T17:53:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-575922954>

    Yes, indeed. The older builds topped 850MB, while the new ones reach 1.7GB before they fail. And never recycle ;)

--------------------------------------------------------------------------------

On 2022-09-22T11:51:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254914343>

    I have found no bug in the cycle detection code. The huge memory consumption is caused by the attempt at serializing the huge graph created by the face tree, mainly caused by the `/parent` facets in `face!`, `font!` and `para!` objects.
    
    I propose the `/parent` blocks be kept at tail all the time by the View engine, so that we keep the serialization output minimal.

--------------------------------------------------------------------------------

On 2022-09-22T11:55:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254918530>

    This is related to https://github.com/red/red/issues/4464 discussion
    What I'm doing in Spaces is /parent, /cache are words, and /map and /content (which are analogous to /pane) also contain words, pointing to objects. All to avoid mold noise.

--------------------------------------------------------------------------------

On 2022-09-22T12:04:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254927516>

    > What I'm doing in Spaces is /parent, /cache are words, 
    
    So you are cluttering the symbol table just for the sake of avoiding direct object references? That does not look like a good solution.

--------------------------------------------------------------------------------

On 2022-09-22T12:07:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254930502>

    Not so many symbols really (a few dozen but they are used for template names anyway, but they're bound to anonymous one-off objects). Bigger issue is I can't use paths to access such words content. But still it was worth it so far. When I see e.g. `parent:  'cell` in mold output that tells me so much more than `parent: make object! [...]`. 
    
    P.S. I still might revisit this choice one day and rewrite mold instead.

--------------------------------------------------------------------------------

On 2022-09-22T12:16:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254941493>

    If you are seeing `parent: make object! [...]`, that means the parent object has already been serialized, so you already looked at it in the output in order to reach that part.
    
    Your solution is _ad hoc_. There's already `dump-face` to output the main info of a big face tree in a readable way. Then you can use the path notation to directly access all the face details if you need to.
    
    ```
    layout [foo: base center font-size 0 on-down [probe '>>> dump-face face probe '<<<]]
    
    view win: make face! [
        type: 'window
        size: foo/size + 20
        pane: reduce collect [loop 10 [keep copy foo]]
    ]
    ```
    gives you on click:
    ```
    >>>
     Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
    <<<
    ```
    and:
    ```
    >> dump-face win
     Type: window Style: none Offset: 1230x670 Size: 128x100 Text: "Red: untitled"
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
         Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
    ```

--------------------------------------------------------------------------------

On 2022-09-22T12:19:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254943818>

    >  and rewrite mold instead.
    
    I guess you know by now what are the chances that such deep modification there would be accepted to the main repo without prior discussion and approval.

--------------------------------------------------------------------------------

On 2022-09-22T12:22:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254947637>

    Never said I would push it, I may rewrite it just for local use in Spaces. Problem with `dump-face` is what if a space appears in another data somewhere, e.g. in a block? It will be dumped to the fullest.
    
    I will need a `mold` that accepts all datatypes, but when it meets a space or face object it outputs it's name or name+part of content depending on the already-reached output nesting level. So far such `mold` rewrite was challenging enough to avoid it.

--------------------------------------------------------------------------------

On 2022-09-22T12:28:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254952974>

    > Problem with dump-face is what if a space appears in another data somewhere, e.g. in a block? It will be dumped to the fullest.
    
    Why `dump-face` couldn't be modified to handle such cases?

--------------------------------------------------------------------------------

On 2022-09-22T12:33:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-1254958872>

    Then it will not be called `dump-face` but some `probe` variant, which it will be, as it will have to accept any-list and more :)

--------------------------------------------------------------------------------

On 2022-11-03T13:39:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4118#issuecomment-1302130815>

    I agree, my solution was ad hoc, and I after all decided that we should work on our tools, not find workarounds for their issues. I had [success](https://codeberg.org/hiiamboris/red-spaces/src/branch/internalized-name/design-cards/words-or-objects.md) with `mold` eventually, but `form` is just out of my reach, as it's too pervasive. And the above fix doesn't solve the root issue, only works around it. So this issue is deeply tied to https://github.com/red/REP/issues/134 and should be seen as a debug facilities design issue (and it still runs out of memory on space trees).

