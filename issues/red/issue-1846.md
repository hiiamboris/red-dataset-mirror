
#1846: save function wrongly saves a block
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
[status.dismissed] [type.wish] [status.reviewed]
<https://github.com/red/red/issues/1846>

```
  save %file [1]
  read %file
;   "1^/"
```

red/environment/functions.red/(line 392):
`data: either all [mold/all/only :value][mold/only :value]`
Not sure why it's using `/only` refinement.
Is the appended `LF` really needed?



Comments:
--------------------------------------------------------------------------------

On 2016-05-06T05:17:07Z, dockimbel, commented:
<https://github.com/red/red/issues/1846#issuecomment-217350173>

    @qtxie `save` saves a MOLDed version of the value (unlike `write`).

--------------------------------------------------------------------------------

On 2016-06-11T03:52:09Z, qtxie, commented:
<https://github.com/red/red/issues/1846#issuecomment-225335044>

    It is the same as in Rebol3. I don't know why `save` a block is changed in Rebol3. One use case I can think is to save some codes or configuration files. The saved file is more readable when there is no outer bracket and when `load` it back, we still get a block.
    
    ```
    red>> code: [a: 1 b: 2 print a + b]
    == [a: 1 b: 2 print a + b]
    red>> save %redcode.red code
    red>> load %redcode.red
    == [a: 1 b: 2 print a + b]
    ```

--------------------------------------------------------------------------------

On 2016-06-18T15:06:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1846#issuecomment-226947136>

    I think the R3 behavior is fine, as we do get a block back using `load`.

--------------------------------------------------------------------------------

On 2016-06-21T02:19:48Z, x8x, commented:
<https://github.com/red/red/issues/1846#issuecomment-227323150>

    where is the block?
    
    ```
      save %file [1]
    
      read %file
    ;   "1"
      load %file
    ;   1
    ```

--------------------------------------------------------------------------------

On 2016-06-21T07:57:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1846#issuecomment-227367666>

    When LOADing a single value, by default, you get the value directly instead of a block. If you want a block in all cases, use `load/all`. (Same as in R3)
    
    ```
    red>> load "1"
    == 1
    red>> load "1 2"
    == [1 2]
    red>> load/all "1"
    == [1]
    ```

--------------------------------------------------------------------------------

On 2016-06-21T20:18:59Z, x8x, commented:
<https://github.com/red/red/issues/1846#issuecomment-227558980>

    I'm sorry to bother you with this one..
    I understand the behaviour has changed from rebol2 to rebol3 and red follows r3.
    I understand the human readable POV, but if I want an external app to read blocks saved by red,
    now I have to write logic to make it work.. So then it is more convenient to convert and save to ex: JSON which is prof that new behaviour is not friendly as data interchange format.
    Maybe it's because currently `save/all` doesn't save the block either.
    By logic, I suppose anyone would expect saving a block with any value in it, would be a block when looked at.

--------------------------------------------------------------------------------

On 2016-06-22T05:13:07Z, dockimbel, commented:
<https://github.com/red/red/issues/1846#issuecomment-227645411>

    If you absolutely need to have the square brackets in the file for sake of interoperability with R2 or existing code, you can then just use:
    
    ```
    red>> write %file mold [1]
    red>> load %file
    == [1]
    ```

--------------------------------------------------------------------------------

On 2016-06-22T05:59:30Z, greggirwin, commented:
<https://github.com/red/red/issues/1846#issuecomment-227651132>

    Things to ponder:
    1) What is the primary use case for `save` and `load`? 
    2) Are `save` and `load` expected to be mirror images of each other? I expect that of `read` and `write`.
    3) Does `/all` mean the same thing for both funcs?
    4) Is `/header` necessary, or is there a better way to serve that need*(see note), like a `save-script` wrapper?
    5) What about an `/only` refinement for `save`?
    
    I love when Red magically does the right thing, and making files more readable is wonderful, but I think `save/load` are unfocused, and a lossy `save` function...is that really OK?
    - I have never used `/header` with R2. YMMV. And if you know you need to use `/header`, you'll still get it as data.
    - `Load` working on a single value is sometimes useful (rarely for me, but that's not _never_)
    - `Save/only` puts the writer in control, as it should be. `/only` would have the same meaning as with `mold` not `insert`. i.e., save **only** the contents.
    - `Map!` is one of the main things to consider when it comes to user accessible data. I save and load a lot of data in R2. For user-facing data it is _almost always_ spec block format, without brackets.
    
    ```
    key: value
    key: value
    ...
    ```
    
    And _almost always_, because they're spec blocks, they are really meant to be, and came from objects (because we have no `map!` in R2). I do also have a lib for just dealing with spec blocks, but Red will save me from that tiny Hell. So what does Red do in this case? It saves a molded `map!` of course. And when I open that in Windows Notepad, I see this: `#(a: 1b: 2)` Yes, newlines are in the data, and Notepad is stupid. Yes, I could use `enline` in the future. All valid points. But it _looks_ like 1 and b are adjacent.
    
    For a moment, imagine that some user, far-fetched as this may be, opens a file like that, in Notepad. They want to dupe the record, so they copy and paste the line. They load it and, yay! 2 records. So they add a new line and _type_ in the data exactly as they see it. Bam! won't load. Syntax error. But I digress. Of course users will mangle data in lots of ways and make it unloadable. I know. 
    
    My point here (and I'm sorry this got so long) is _not_ that Red is broken. It's not. But I do think this is an opportunity, and it's worth asking questions. e.g. should `mold/only` on a map or an object return just the contents (== `mold/only body-of ...`)? And could `load/as` then support map and object as types? How will `save/load` be used most of the time, because they will get used _a lot_?
    
    *(`/header`)
    
    ```
    red>> save/header %temp.txt [1] [header]
    red>> load %temp.txt
    == [Red [
        header none
    ]
        1
    ]
    ```

