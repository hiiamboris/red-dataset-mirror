
#4819: change/part stops parse
================================================================================
Issue is closed, was reported by qtxie and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/4819>

**To reproduce**
Run the following code in Red.
```
REBOL []
Red []

src: [
    "switch" OS [
        Windows  ["define" LIBREDRT-file "libRedRT.dll"]
        macOS    ["define" LIBREDRT-file "libRedRT.dylib"]
    ]
    print LIBREDRT-file
]

rule-blk: [
    some [
        s: "define" set name word! (args: none) [
            set args paren! set value [block! | paren!]
            | set value skip
          ] e: (
            print [mold name #":" mold value]
            remove/part s e
        ) :s
        | s: "switch" set name word! set cases block! e: (
            change/part s ["define" LIBREDRT-file "libRedRT.dll"] e
        ) :s
        | skip
    ]
]

probe parse/case src rule-blk
probe src
```
Output:
```
false
["define" LIBREDRT-file "libRedRT.dll"
    print LIBREDRT-file
]
```
**Expected behavior**
Output:
```
LIBREDRT-file : "libRedRT.dll"
true
[
    print LIBREDRT-file
]
```

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.
All platforms. Tests with commit: 6440af53301c09ea21166d320b1045d9548e0469



Comments:
--------------------------------------------------------------------------------

On 2021-02-09T10:20:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4819#issuecomment-775830168>

    You can't use `some` while not advancing the source position (`s: ... :s`). `while` is the proper loop for that.

--------------------------------------------------------------------------------

On 2021-02-10T07:20:17Z, qtxie, commented:
<https://github.com/red/red/issues/4819#issuecomment-776501722>

    @hiiamboris Thanks. `while` can make it work. But if I use `remove/part s e` instead of `change/part`, it works as expected.
    ```
    src: [
    	"define" a 1
    	"define" b 2
    	"define" c 3
    ]
    
    rule-blk: [
        while [
            s: "define" set name word! (args: none) [
                set args paren! set value [block! | paren!]
                | set value skip
              ] e: (
                print [mold name #":" mold value]
                remove/part s e
            ) :s
            | skip
        ]
    ]
    
    probe parse/case src rule-blk
    probe src
    ```

--------------------------------------------------------------------------------

On 2021-02-10T09:04:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4819#issuecomment-776553801>

    I think it's smarter than just index check - it seems like it checks the length between loop iterations, and if length get smaller, it continues. If you change 3 items to another 3 items, it thinks it's stalled and abandons the loop. That's the difference between change and remove as I see it.

--------------------------------------------------------------------------------

On 2021-02-10T09:05:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4819#issuecomment-776554965>

    ```
    probe parse [1 2 3 4 5 6] [any [s: change skip 'x  :s (?? s)]]
    probe parse [1 2 3 4 5 6] [any [s: remove skip     :s (?? s)]]
    ```
    ```
    s: ['x 2 3 4 5 6]
    false
    s: [2 3 4 5 6]
    s: [3 4 5 6]
    s: [4 5 6]
    s: [5 6]
    s: [6]
    s: []
    true
    ```
    
    Changing 1 item with 2 and advancing by 1 deadlocks it: `probe parse [1 2 3 4 5 6] [any [change [skip s:] [x x] :s (?? s)]]`

--------------------------------------------------------------------------------

On 2021-08-24T17:59:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4819#issuecomment-904856855>

    > If you change 3 items to another 3 items, it thinks it's stalled and abandons the loop.
    
    That's the correct explanation. If you use `any` or `some`, the loop will be internally forced to end if the input does not advance (infinite loops detection). In order to disable that check, use `while`.
    

