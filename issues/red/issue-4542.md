
#4542: An endless regression: `input` & `ask` won't compile
================================================================================
Issue is open, was reported by hiiamboris and has 66 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4542>

**Describe the bug**

Given simple script:
```
Red []
#include %environment/console/CLI/input.red
input
```
Compilation with `-c -u` fails with:
```
*** Compilation Error: undefined symbol: root                      
*** in file: %/D/devel/red/common/environment/console/CLI/input.red
*** in function: exec/terminal/init-globals                        
*** at line: 356                                                   
*** near: [root 1]                                                 
```

**Expected behavior**

Compiles.

Before closing this ticket we should make a regression test for it, as this is a quite common use case and it often breaks in my experience.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-24T07:27:37Z, qtxie, commented:
<https://github.com/red/red/issues/4542#issuecomment-648646473>

    `root` has never been exported in libRedRT. There is a fix on GTK branch: https://github.com/red/red/blob/GTK/system/utils/libRedRT-exports.r#L423

--------------------------------------------------------------------------------

On 2021-01-24T08:35:02Z, Jose-Moreno, commented:
<https://github.com/red/red/issues/4542#issuecomment-766311460>

    Hi. I have the same issue but a different error with a recent build:
    
    **Error**
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling e:\Downloads\Software\Programming\Red\test.red ...
    ...using libRedRT built on 11-Jan-2021/2:25:31
    *** Compilation Error: undefined word input
    *** in file: e:\Downloads\Software\Programming\Red\test.red
    *** near: [
        input
    ]
    ```
    
    **Script**
    ```
    Red[title:"Greeting"]
    print "Hello World"
    input
    ```
    
    However It works when I run the same code in the REPL. Cheers.

--------------------------------------------------------------------------------

On 2021-01-24T09:22:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-766316865>

    `input` is part of the console environment, not of the language runtime. So if you didn't `#include` it your message is expected.

--------------------------------------------------------------------------------

On 2021-01-24T23:49:10Z, Jose-Moreno, commented:
<https://github.com/red/red/issues/4542#issuecomment-766462444>

    @hiiamboris Ah, I'm sorry I forgot I had to include it, I'll make sure not to reply at 3AM next time 😓 Thank you for noticing that, although after I setup the include I get a different error than yours. 
    
    Setting up the test file I got now two different errors along the way, one of them I'm still not sure if it's a problem with Windows (unsurprisingly) or with Red since seems to be related with the length of the path 🤔 
    
    So for the "strange" error, I got it while including the file using an absolute path...
    ```
    Red[]
    #include %/e/src/LangDev/red/environment/console/CLI/input.red
    print "Hello World"
    input
    ```
    But I got an error regarding `auto-complete.red` 
    
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling e:\src\LangDev\test.red ...
    ...using libRedRT built on 11-Jan-2021/2:25:31
    *** Compilation Error: include file not found: ../auto-complete.red 
    *** in file: e:\src\LangDev\test.red
    *** near: [
    ```
    
    <details>
        <summary>; Long error traceback</summary>
    
    ```
    #include %../auto-complete.red
    #system [
        terminal: context [
            #enum special-key! [
                    KEY_UNSET: -1
                    KEY_NONE: 0
                    KEY_UP: -20
                    KEY_DOWN: -21
                    KEY_RIGHT: -22
                    KEY_LEFT: -23
                    KEY_END: -24
                    KEY_HOME: -25
                    KEY_INSERT: -26
                    KEY_DELETE: -27
                    KEY_PAGE_UP: -28
                    KEY_PAGE_DOWN: -29
                    KEY_ESC: -30
                    KEY_CTRL_A: 1
                    KEY_CTRL_B: 2
                    KEY_CTRL_C: 3
                    KEY_CTRL_D: 4
                    KEY_CTRL_E: 5
                    KEY_CTRL_F: 6
                    KEY_CTRL_H: 8
                    KEY_TAB: 9
                    KEY_CTRL_K: 11
                    KEY_CTRL_L: 12
                    KEY_ENTER: 13
                    KEY_CTRL_N: 14
                    KEY_CTRL_P: 16
                    KEY_CTRL_T: 20
                    KEY_CTRL_U: 21
                    KEY_CTRL_W: 23
                    KEY_ESCAPE: 27
                    KEY_BACKSPACE: 127
                ]
                #include %wcwidth.reds
                #either OS = 'Windows [
                    #include %win32.reds
                ] [
                    #include %POSIX.reds
                ]
                console?: yes
                buffer: declare byte-ptr!
                pbuffer: declare byte-ptr!
                input-line: declare red-string!
                prompt: declare red-string!
                history: declare red-block!
                saved-line: as red-string! 0
                buf-size: 128
                columns: -1
                rows: -1
                output?: yes
                pasting?: no
                hide-input?: no
                init-globals: func [] [
                    saved-line: string/rs-make-at ALLOC_TAIL (root) 1
                ]
                widechar?: func [
                    str [red-string!]
                    return: [logic!]
                    /local
                    cp [integer!]
                    unit [integer!]
                    s [series!]
                    offset [byte-ptr!]
                ] [
                    s: GET_BUFFER (str)
                    unit: GET_UNIT (s)
                    offset: (as byte-ptr! s/offset) + (str/head << (log-b unit))
                    cp: 0
                    if offset < as byte-ptr! s/tail [cp: string/get-char offset unit]
                    cp > 255
                ]
                on-resize: func [[cdecl] sig [integer!]] [
                    get-window-size
                    refresh
                ]
                complete-line: func [
                    str [red-string!]
                    return: [integer!]
                    /local
                    line [red-string!]
                    result [red-block!]
                    num [integer!]
                    str2 [red-string!]
                    head [integer!]
                ] [
                    #call [red-complete-ctx/complete-input str yes]
                    stack/top: stack/arguments + 2
                    result: as red-block! stack/top
                    num: block/rs-length? result
                    unless zero? num [
                        head: str/head
                        str/head: 0
                        _series/copy
                        as red-series! str
                        as red-series! saved-line
                        stack/arguments
                        yes
                        stack/arguments
                        saved-line/head: head
                        line: input-line
                        string/rs-reset line
                        str2: as red-string! block/rs-head result
                        head: str2/head
                        str2/head: 0
                        either num = 1 [
                            string/concatenate line str2 -1 0 yes no
                            line/head: head
                        ] [
                            string/rs-reset saved-line
                            string/concatenate saved-line str2 -1 0 yes no
                            saved-line/head: head
                            block/rs-next result 
                            until [
                                string/concatenate line as red-string! block/rs-head result -1 0 yes no
                                string/append-char GET_BUFFER (line) 32
                                block/rs-next result
                                block/rs-tail? result
                            ]
                            line/head: string/rs-abs-length? line
                        ]
                        refresh
                    ]
                    num
                ]
                add-history: func [
                    str [red-string!]
                ] [
                    str/head: 0
                    if hide-input? [exit]
                    unless any [
                        zero? string/rs-length? str
                        all [
                            0 < block/rs-length? history
                            zero? string/equal? str as red-string! block/rs-abs-at history 0 COMP_STRICT_EQUAL no
                        ]
                    ] [
                        history/head: 0
                        block/insert-value history as red-value! str
                    ]
                ]
                fetch-history: does [
                    string/rs-reset input-line
                    string/concatenate input-line as red-string! block/rs-head history -1 0 yes no
                    input-line/head: string/rs-abs-length? input-line
                ]
                init-buffer: func [
                    str [red-string!]
                    prompt [red-string!]
                    /local
                    unit [integer!]
                    s [series!]
                    size [integer!]
                ] [
                    s: GET_BUFFER (str)
                    unit: GET_UNIT (s)
                    if unit < 2 [unit: 2]
                    size: (string/rs-abs-length? str) << (log-b unit)
                    size: size + (string/rs-abs-length? prompt) << (log-b unit)
                    if size > buf-size [
                        buf-size: size
                        free buffer
                        buffer: allocate size
                    ]
                    pbuffer: buffer
                ]
                process-ansi-sequence: func [
                    str [byte-ptr!]
                    tail [byte-ptr!]
                    unit [integer!]
                    print? [logic!]
                    return: [integer!]
                    /local
                    cp [integer!]
                    bytes [integer!]
                    state [integer!]
                ] [
                    cp: string/get-char str unit
                    if all [
                        cp <> as-integer #'0000005B
                        cp <> as-integer #'00000028
                    ] [return 0]
                    if print? [emit-red-char cp]
                    str: str + unit
                    bytes: unit
                    state: 1
                    while [all [state > 0 str < tail]] [
                        cp: string/get-char str unit
                        if print? [emit-red-char cp]
                        str: str + unit
                        bytes: bytes + unit
                        switch state [
                            1 [
                                unless any [
                                    cp = as-integer #'0000003B
                                    all [cp >= as-integer #'00000030 cp <= as-integer #'00000039]
                                ] [state: -1]
                            ]
                            2 [
                                case [
                                    all [cp >= as-integer #'00000030 cp <= as-integer #'00000039] [0]
                                    cp = as-integer #'0000003B [state: 3]
                                    true [state: -1]
                                ]
                            ]
                            3 [
                                case [
                                    all [cp >= as-integer #'00000030 cp <= as-integer #'00000039] [state: 4]
                                    cp = as-integer #'0000003B [0]
                                    true [state: -1]
                                ]
                            ] 
                            4 [
                                case [
                                    all [cp >= as-integer #'00000030 cp <= as-integer #'00000039] [0]
                                    cp = as-integer #'0000003B [state: 1]
                                    true [state: -1]
                                ]
                            ]
                        ]
                    ]
                    bytes
                ]
                emit-red-string: func [
                    str [red-string!]
                    size [integer!]
                    head-as-tail? [logic!]
                    return: [integer!]
                    /local
                    series [series!]
                    offset [byte-ptr!]
                    tail [byte-ptr!]
                    unit [integer!]
                    cp [integer!]
                    bytes [integer!]
                    cnt [integer!]
                    x [integer!]
                    w [integer!]
                    sn [integer!]
                ] [
                    x: 0
                    w: 0
                    cnt: 0
                    bytes: 0
                    series: GET_BUFFER (str)
                    unit: GET_UNIT (series)
                    offset: (as byte-ptr! series/offset) + (str/head << (log-b unit))
                    tail: as byte-ptr! series/tail
                    if head-as-tail? [
                        tail: offset
                        offset: as byte-ptr! series/offset
                    ]
                    sn: 0
                    until [
                        while [
                            all [offset < tail cnt < size]
                        ] [
                            either zero? sn [
                                cp: string/get-char offset unit
                                if cp = 9 [
                                    offset: offset - unit
                                    cp: 32
                                    sn: 3
                                ]
                                emit-red-char cp
                                offset: offset + unit
                                if cp = as-integer #'0000001B [
                                    cnt: cnt - 1
                                    offset: offset + process-ansi-sequence offset tail unit yes
                                ]
                            ] [
                                emit-red-char cp
                                sn: sn - 1
                                if zero? sn [offset: offset + unit]
                            ]
                            w: either all [127744 <= cp cp <= 128511] [2] [wcwidth? cp]
                            cnt: switch w [
                                1 [cnt + 1]
                                2 [either size - cnt = 1 [x: 2 cnt + 3] [cnt + 2]]
                                default [0]
                            ]
                        ]
                        bytes: bytes + cnt
                        size: columns - x
                        x: 0
                        cnt: 0
                        offset >= tail
                    ]
                    bytes
                ]
                refresh: func [
                    /local
                    line [red-string!]
                    offset [integer!]
                    bytes [integer!]
                    psize [integer!]
                    hide? [logic!]
                ] [
                    line: input-line
                    either output? [
                        reset-cursor-pos
                        erase-to-bottom
                    ] [
                        #if OS <> 'Windows [reset-cursor-pos] [0]
                    ]
                    init-buffer line prompt
                    hide?: hide-input?
                    hide-input?: no
                    bytes: emit-red-string prompt columns no
                    hide-input?: hide?
                    psize: bytes // columns
                    offset: bytes + (emit-red-string line columns - psize yes)
                    psize: offset // columns
                    bytes: offset + (emit-red-string line columns - psize no)
                    either output? [
                        output-to-screen
                    ] [
                        #if OS <> 'Windows [
                            if all [
                                bytes > columns
                                positive? (bytes // columns)
                            ] [
                                psize: bytes / columns
                                emit-string-int "^[[" psize #'00000042
                            ]
                        ] [0]
                    ]
                    set-cursor-pos line offset bytes
                ]
                console-edit: func [
                    prompt-str [red-string!]
                    /local
                    line [red-string!]
                    head [integer!]
                    c [integer!]
                    n [integer!]
                    pos [integer!]
                    max [integer!]
                ] [
                    line: input-line
                    copy-cell as red-value! prompt-str as red-value! prompt
                    history/head: 0
                    pos: -1
                    max: block/rs-length? history
                    get-window-size
                    if null? saved-line [init-globals]
                    unless zero? string/rs-abs-length? saved-line [
                        head: saved-line/head
                        saved-line/head: 0
                        string/concatenate line saved-line -1 0 yes no
                        line/head: head
                    ]
                    refresh
                    while [true] [
                        output?: yes
                        c: fd-read
                        n: 0
                        if all [c = KEY_TAB not pasting?] [
                            n: complete-line line
                            if n > 1 [
                                string/rs-reset line
                                exit
                            ]
                            if n = 1 [c: -1]
                        ]
                        #if OS <> 'Windows [if c = 27 [c: check-special]]
                        switch c [
                            KEY_ENTER [
                                add-history line
                                max: max + 1
                                string/rs-reset saved-line
                                exit
                            ]
                            KEY_CTRL_H
                            KEY_BACKSPACE [
                                unless zero? line/head [
                                    line/head: line/head - 1
                                    string/remove-char line line/head
                                    if string/rs-tail? line [output?: no]
                                    refresh
                                    unless output? [erase-to-bottom]
                                ]
                            ]
                            KEY_CTRL_B
                            KEY_LEFT [
                                unless zero? line/head [
                                    line/head: line/head - 1
                                    output?: no
                                    refresh
                                ]
                            ]
                            KEY_CTRL_F
                            KEY_RIGHT [
                                if 0 < string/rs-length? line [
                                    line/head: line/head + 1
                                    output?: no
                                    refresh
                                ]
                            ]
                            KEY_CTRL_N
                            KEY_DOWN [
                                either pos < 0 [
                                    string/rs-reset line
                                ] [
                                    history/head: pos
                                    fetch-history
                                    pos: pos - 1
                                ]
                                refresh
                            ]
                            KEY_CTRL_P
                            KEY_UP [
                                either pos >= (max - 1) [
                                    string/rs-reset line
                                ] [
                                    pos: pos + 1
                                    history/head: pos 
                                    fetch-history
                                ]
                                refresh
                            ]
                            KEY_CTRL_A
                            KEY_HOME [
                                line/head: 0
                                refresh
                            ]
                            KEY_CTRL_E
                            KEY_END [
                                line/head: string/rs-abs-length? line
                                refresh
                            ]
                            KEY_DELETE [
                                unless string/rs-tail? line [
                                    string/remove-char line line/head
                                    refresh
                                ]
                            ]
                            KEY_CTRL_K [
                                unless string/rs-tail? line [
                                    string/remove-part line line/head string/rs-length? line
                                    refresh
                                ]
                            ]
                            KEY_CTRL_D [
                                either string/rs-tail? line [
                                    if zero? line/head [
                                        string/rs-reset line
                                        string/append-char GET_BUFFER (line) as-integer #'00000071
                                        exit
                                    ]
                                ] [
                                    string/remove-char line line/head
                                    refresh
                                ]
                            ]
                            KEY_CTRL_C [
                                string/rs-reset line
                                string/append-char GET_BUFFER (line) as-integer #'00000071
                                exit
                            ]
                            KEY_ESCAPE [
                                string/append-char GET_BUFFER (line) c
                                exit
                            ]
                            default [
                                if any [c > 31 c = KEY_TAB] [
                                    #if OS = 'Windows [
                                        if all [55296 <= c c <= 57088] [
                                            c: c and 1023 << 10
                                            c: (1023 and fd-read) or c + 65536
                                        ]
                                    ]
                                    either string/rs-tail? line [
                                        string/append-char GET_BUFFER (line) c
                                        #if OS = 'Windows [
                                            pbuffer: buffer
                                            emit-red-char c
                                            output-to-screen
                                            pbuffer: buffer
                                            output?: no
                                        ]
                                    ] [
                                        string/insert-char GET_BUFFER (line) line/head c
                                    ]
                                    line/head: line/head + 1
                                    refresh
                                ]
                            ]
                        ]
                    ]
                    line/head: 0
                ]
                stdin-readline: func [
                    in-line [red-string!]
                    /local
                    c [integer!]
                    s [series!]
                ] [
                    s: GET_BUFFER (in-line)
                    while [true] [
                        #either OS = 'Windows [
                            c: stdin-read
                        ] [
                            c: fd-read
                        ]
                        either any [c = -1 c = as-integer lf] [exit] [
                            s: string/append-char s c
                        ]
                    ]
                ]
                edit: func [
                    prompt-str [red-string!] 
                    hidden? [logic!]
                ] [
                    either console? [
                        hide-input?: hidden?
                        console-edit prompt-str
                        restore
                        print-line ""
                    ] [
                        hide-input?: no
                        stdin-readline input-line
                    ]
                ]
                setup: func [
                    line [red-string!]
                    hist [red-block!]
                ] [
                    copy-cell as red-value! line as red-value! input-line
                    copy-cell as red-value! hist as red-value! history
                    init-console
                ]
            ]
        ]
        _set-buffer-history: routine ["Internal Use Only" line [string!] hist [block!]] [
            terminal/setup line hist
        ]
    ]
    ```
    
    </details>
    
    
    After that since I saved the file outside the red lang source folder, I used a relative (and shorter) path. With that the first issue was strangely bypassed:
    
    ```
    Red[]
    #include %red/environment/console/CLI/input.red
    print "Hello World"
    input
    ```
    
    But then I got an error regarding utf-16 on `win32.reds` . I tried with new files that had both UTF-8 and ANSI encoding (I even switched between CRLF and LF in case I was missing something) with no avail:
    
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling e:\src\LangDev\test.red ...
    ...using libRedRT built on 11-Jan-2021/2:25:31
    ...compilation time : 267 ms
    
    Target: MSDOS
    
    Compiling to native code...
    *** Compilation Error: undefined symbol: red/unicode/cp-to-utf16
    *** in file: %/e/src/LangDev/red/environment/console/CLI/win32.reds
    *** in function: exec/terminal/emit-red-char
    *** at line: 284
    *** near: [unicode/cp-to-utf16 cp pbuffer
        pbuffer: pbuffer + n
    ]
    ```
    
    Despite not having the same errors, I still consider this to be on topic since the inclusion of the `input` file is still not allowing me to compile a very simple script. however If you think it's necessary would you recommend me to open a new thread for this? If I find something else during testing i'll update the replies, thanks again! 👍 

--------------------------------------------------------------------------------

On 2021-01-25T08:52:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-766657020>

    Does release (`-r`) mode work for you or the same error?

--------------------------------------------------------------------------------

On 2021-01-25T15:52:45Z, Jose-Moreno, commented:
<https://github.com/red/red/issues/4542#issuecomment-766913101>

    @hiiamboris Hey. Sorry for the late reply. At first compiling with the release flag doesn't work and it brings the following error:
    
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling e:\src\LangDev\test_ansi.red ...
    *** Compilation Error: Windows target requires View module (`Needs: View` in the header)
    *** in file: e:\src\LangDev\test_ansi.red
    ```
    This is quite strange since i'm not using any view components but at least once I add the view header it compiles... though the program doesn't do anything.
    
    **Sample code**
    ```
    Red[Needs: 'View]
    #include %red/environment/console/CLI/input.red
    print "Hello World"
    input
    ```
    Unfortunately after doing this, the program doesn't show a console when executed via explorer and it doesn't show output when executed from either command console and powershell. 
    
    What's worse is that the app keeps running indefinitely so I have to kill it through the task manager.  Seems like the input command keeps it running even though I have no way to interacting with it 🤔
    
    ![image](https://user-images.githubusercontent.com/4912907/105727206-da29b980-5ef8-11eb-8ebf-d3b061496b1e.png)
    ![image](https://user-images.githubusercontent.com/4912907/105727332-f88fb500-5ef8-11eb-8c5e-06a5284305f8.png)
    
    After that I tried adding a simple view [text] component to see if it would at least invoke the window.
    
    ```
    Red[Needs: 'View]
    #include %red/environment/console/CLI/input.red
    view [text "Hello World!"]
    print "Hello World"
    input
    ```
    **Execute build**
    Funnily the visual component appears, but there's no way I can use the input and I still can't get the console output.
    
    ![image](https://user-images.githubusercontent.com/4912907/105727794-6cca5880-5ef9-11eb-800b-d566230ea294.png)
    
    **Closed window**
    After closing the window, the process seems to change and keeps running indefinitely and using about 25% cpu. That's about it.
    
    ![image](https://user-images.githubusercontent.com/4912907/105727842-7ce23800-5ef9-11eb-85f2-82de19558867.png)
    
    I'll let you guys know If I notice anything else.
    
    

--------------------------------------------------------------------------------

On 2021-01-25T16:04:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-766921719>

    Thanks for the detailed report ;)
    
    I suggest you try `-t MSDOS` to build a console program. `-t Windows` is for GUI programs, and will require you to include the whole GUI console I'm afraid.
    That CPU load bug is a known one https://github.com/red/red/issues/4241

--------------------------------------------------------------------------------

On 2021-01-27T18:57:08Z, Jose-Moreno, commented:
<https://github.com/red/red/issues/4542#issuecomment-768500529>

    @hiiamboris Actually I should thank you for the patience and assistance. I finally managed to compile by explicitly targeting MSDOS with the release flag. It would probably have taken me weeks to figure out each hurdle.
    
    Now to keep on topic, the exact error you posted about originally, I have not been able to reproduce it recently with the latest automated builds nor with my own compiled builds, so I suppose we just have to wait for the appropriate regression test you asked to close this issue. 
    
    I'm really glad to see there's been plenty of improvements and fixes lately but either way thanks again for everything. Have a wonderful weekend! Cheers 🎉 

--------------------------------------------------------------------------------

On 2022-09-15T11:34:17Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-1247980122>

    This issue can't be reproduced anymore. `root` global is included in libRedRT now.

--------------------------------------------------------------------------------

On 2023-12-22T21:11:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-1868071639>

    It won't compile with `-r -e`:
    ```
    *** Compilation Error: invalid #call function name: none
    *** in file: D:\devel\red\red-src\red\1.red
    *** near: [
        #system [
            terminal: context [
                #enum special-key! [
                    KEY_UNSET: -1
                    KEY_NONE: 0
                    KEY_UP: -20
                    KEY_DOWN: -21
                    KEY_RIGHT: -22
                    KEY_LEFT: -23
                    KEY_END: -24
                    KEY_HOME: -25
                    KEY_INSERT: -26
                    KEY_DELETE: -27
                    KEY_PAGE_UP: -28
                    KEY_PAGE_DOWN: -29
                    KEY_ESC: -30
                    KEY_CTRL_A: 1
                    KEY_CTRL_B: 2
                    KEY_CTRL_C: 3
                    KEY_CTRL_D: 4
                    KEY_CTRL_E: 5
                    KEY_CTRL_F: 6
                    KEY_CTRL_H: 8
                    KEY_TAB: 9
                    KEY_CTRL_K: 11
                    KEY_CTRL_L: 12
                    KEY_ENTER: 13
                    KEY_CTRL_N: 14
                    KEY_CTRL_P: 16
                    KEY_CTRL_T: 20
                    KEY_CTRL_U: 21
                    KEY_CTRL_W: 23
                    KEY_ESCAPE: 27
                    KEY_BACKSPACE: 127
                ]
                #include %/D/devel/red/red-src/red/environment/console/wcwidth.reds #script %/D/devel/red/red-src/red/environment/console/auto-complete.red
                #either OS = 'Windows [
                    #include %/D/devel/red/red-src/red/environment/console/win32.reds #script %/D/devel/red/red-src/red/environment/console/auto-complete.red
                ] [
    ...]
    ```

--------------------------------------------------------------------------------

On 2024-08-30T11:30:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2320925328>

    Just `-r` is broken as well again, using the script from OP and `redc -r 1.red` command on W10:
    ```
    *** Compilation Error: undefined symbol: query-cursor
    *** in file: %/D/devel/red/red-src/red/environment/console/CLI/input.red
    *** in function: exec/terminal/refresh
    *** at line: 343
    *** near: [
        query-cursor :cursor-pos
    ]
    ```

--------------------------------------------------------------------------------

On 2024-08-30T11:42:57Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2320962902>

    I'll have a look at it.

--------------------------------------------------------------------------------

On 2024-08-30T11:43:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2320964965>

    A user reports a different error on Linux, but I haven't double checked:
    ```
    [master¹//red]% rc -r clockin.red (l@lat:~/red/)
    
    -=== Red Compiler 0.6.5 ===- 
    
    Compiling /home/l/red/clockin.red ...
    *** Compilation Error: expected a block for IF-BODY instead of get-word! value 
    *** in file: /home/l/red/clockin.red
    *** near: [:w1 word [set/any 'w1 get/any w1]]
    ```

--------------------------------------------------------------------------------

On 2024-08-30T12:50:38Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321146341>

    That's looks like a legit error from the compiler where it cannot statically analyze an `if` conditional expression as that expression relies on definitions available at run-time only.

--------------------------------------------------------------------------------

On 2024-08-30T12:56:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321164812>

    it comes from %auto-complete.red

--------------------------------------------------------------------------------

On 2024-08-30T13:38:02Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321291157>

    That issue happens only when using the prebuilt binaries. When compiling using a Rebol executable from the sources, it works fine. The encapped toolchain relies on a different logic for fetching included files from the payload than from the disk, so it can result in some cases like this. I'll see if that can be improved.

--------------------------------------------------------------------------------

On 2024-08-30T14:01:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321357137>

    After a few checks, I've got to the bottom of it: the compilation error is caused by a memory corruption in the Rebol process when using Rebol kernel 2.7.6 (used on our servers). Using encapping kernel 2.7.8, the error does not manifest. However, the 2.7.8 version comes with its own set of bugs and instabilities, so we settled since the beginning with 2.7.6. Given that they are both closed-sourced, we can't do anything about this...
    
    The error report is:
    ```
    *** Compilation Error: variable cursor-pos not declared 
    *** in file: %/C/Dev/Red/environment/console/CLI/win32.reds 
    *** in function: exec/terminal/get-window-size
    *** at line: 262 
    *** near: [info/Position 
        0
    ]
    ```
    `info/Position` is the existing current expression in the source code of `get-window-size` function. `cursor-pos` variable does not exist anywhere in the Red codebase, howevrer `set-cursor-pos` and `reset-cursor-pos` symbols do exists in that same source file. The only explanation is a memory corruption (we had encountered many memory corruption cases affecting the input source code content using Rebol2 in the past...).
    
    The Red compiler should be dropped soon hopefully, at which point all the Red source code will be only serialized using our own encapper. The next opportunity to get rid of such issue after that is the full rewrite of the Red toolchain in Red itself.

--------------------------------------------------------------------------------

On 2024-08-30T14:07:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321378662>

    `cursor-pos` is in %input.red. Maybe it wants to include it but hasn't?
    In fact %input.red is designed to include the other files into its `terminal` context. 

--------------------------------------------------------------------------------

On 2024-08-30T14:10:25Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321388376>

    Where is it precisely? My search tool can't find it.

--------------------------------------------------------------------------------

On 2024-08-30T14:11:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321391366>

    https://github.com/red/red/blob/dbc93da47047667023a66c5edf1aa1d63ff6f0d0/environment/console/CLI/input.red#L85

--------------------------------------------------------------------------------

On 2024-08-30T14:14:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321400381>

    Seems my git repo was not at master's head... So back at square one.🙄

--------------------------------------------------------------------------------

On 2024-08-30T14:18:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2321412984>

    🤦‍♂️ `git` is a notorious source of problems for [everyone](https://github.com/red/red/discussions/5531)

--------------------------------------------------------------------------------

On 2024-08-30T21:49:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322385097>

    I did a `git pull` as usual after a `checkout`, but somehow the process didn't go until the end...

--------------------------------------------------------------------------------

On 2024-08-30T22:56:34Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322529774>

    After a proper local repo synchronization with master's head, I can't reproduce the issue at all. Tried with both 2.7.6 and 2.7.8 kernels, locally built toolchain vs latest auto-built online, putting the main source file at different levels of folder nesting... the toolchain always successfully compiles it...

--------------------------------------------------------------------------------

On 2024-08-31T09:11:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322837589>

    You're right, can't reproduce with the mid-august build on W10. However with the latest linux toolchain I'm getting:
    ```
    $ red-toolchain-16aug24-dbc93da47 -r ~/red-master/1.red
    
    -=== Red Compiler 0.6.5 ===-
    
    Compiling /home/test/red-master/1.red ...
    *** Syntax Error: Invalid construction syntax
    *** in file: /home/test/red-master/1.red
    *** line: 73
    *** at: {#()]
    ^-^-none? series [true]
    ^-]
    ]
    
    ??: fun}
    
    $ cat ~/red-master/1.red
    Red []
    #include %environment/console/CLI/input.red
    input
    ```

--------------------------------------------------------------------------------

On 2024-08-31T09:14:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322838284>

    Maybe something's messed up on my drive...

--------------------------------------------------------------------------------

On 2024-08-31T09:20:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322839922>

    OK turns out I can't trust `cp -r` command on WSL unless I first `rm -rf` the destination directory 🤷‍♂️
    `-r` compiles on Linux now, however `-c` doesn't:
    ```
    $ red-toolchain-16aug24-dbc93da47 -c ~/red-master/1.red
    
    -=== Red Compiler 0.6.5 ===-
    
    Compiling /home/test/red-master/1.red ...
    Compiling libRedRT...
    ...compilation time : 3731 ms
    
    Compiling to native code...
    *** libRedRT Error: definition not found for red/OS-image/to-gpbitmap
    ```

--------------------------------------------------------------------------------

On 2024-08-31T09:28:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2322841700>

    On Windows it also doesn't compile:
    ```
    $ redc -c 1.red
    
    -=== Red Compiler 0.6.5 ===-
    
    Compiling D:\devel\red\red-src\red\1.red ...
    Compiling libRedRT...
    ...compilation time : 4874 ms
    
    Compiling to native code...
    ...compilation time : 153259 ms
    ...global words     : 24009 (72.98%)
    ...linking time     : 1119 ms
    ...output file size : 1400320 bytes
    ...output file      : D:\devel\red\red-src\red\libRedRT.dll
    
    ...compilation time : 434 ms
    
    Target: MSDOS
    
    Compiling to native code...
    *** Compilation Error: undefined symbol: red/unicode/cp-to-utf16
    *** in file: %/D/devel/red/red-src/red/environment/console/CLI/win32.reds
    *** in function: exec/terminal/emit-red-char
    *** at line: 267
    *** near: [unicode/cp-to-utf16 cp pbuffer
        pbuffer: pbuffer + n
    ]
    ```

--------------------------------------------------------------------------------

On 2024-09-01T10:28:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2323275024>

    You need to use `-u` ("updated" libRedRT mode) when compiling Red sources with R/S code included when in development mode (`-u` implies `-c`). This will compile a runtime libRedRT with additional exported symbols used by the R/S code. It compiles fine in such case here (W11).

--------------------------------------------------------------------------------

On 2024-09-01T10:40:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2323279900>

    Indeed that worked. But that seems odd to me, as there was no libRedRT before I attempted to compile. How can I update what doesn't exist? :)

--------------------------------------------------------------------------------

On 2024-09-02T09:55:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2324318317>

    The "update" mode does a two-pass compilation. On first pass, it analyzes the needs of the provided source code for R/S dependencies (towards the standard library) and "updates" the default dependencies list generating a `libRedRT-extras.r` file, then on second pass, a normal compilation occurs. Usually, `-c` is first used, failing because of a unresolved R/S dependency, then the user switches to `-u` mode to enable dependency resolution. Once that new updated (extended libRedRT) is available, `-c` can be used again for subsequent compilation jobs, as long as the R/S code does not add new dependencies (which in that case would require a new run with `-u`). You could be using `-u` all the time when your code includes R/S with non-default dependencies, but you would pay the time cost of a double compilation each time.

--------------------------------------------------------------------------------

On 2024-09-02T12:24:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4542#issuecomment-2324631893>

    OK so I guess this is more of a documentation issue then. 
    I still think `-c` could have done the correct dependency detection in the first pass when no `dll` exists, but if you don't plan to improve it in the discardable toolchain, I guess it makes sense to keep this issue open until a new toolchain is out.

--------------------------------------------------------------------------------

On 2024-09-02T15:15:12Z, dockimbel, commented:
<https://github.com/red/red/issues/4542#issuecomment-2324967018>

    > I still think -c could have done the correct dependency detection in the first pass when no dll exists
    
    That means double the time on every first `-c` use... not a great trade-off. And you still have to use `-u` later if you add new R/S dependencies (or delete the libRedRT instance and start over again with an heavy double-time `-c`...).
    
    Anyway, this toolchain will soon be dropped, so no need. 

