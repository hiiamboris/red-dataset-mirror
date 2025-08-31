
#3959: Compiling -r fails while -c succeeds
================================================================================
Issue is closed, was reported by ralfwenske and has 14 comment(s).
<https://github.com/red/red/issues/3959>





Comments:
--------------------------------------------------------------------------------

On 2019-08-01T05:36:37Z, ralfwenske, commented:
<https://github.com/red/red/issues/3959#issuecomment-517127132>

    A view app containing a reactor impacts the compiler in varying ways:
    - interpreted: it works (shows a view, on button click does some processing )
    - compiled -c: it works (shows a view, on button click does some processing )
    - compile -t macOS -r: compiler error
    ```
    *** Compilation Error: word with not defined in react/with 
    *** in file: /Users/ralfwenske/Dropbox/red-test/test-objects.red
    *** near: [react/with blk ctx]
    ```
    after removing all react stmts:
    compiled -t maOS -r: it works partly (shows view but does not respond to button click)
    putting back in two lines:
    ```
    win-size: 1200x800
    react: make reactor! [w-size: win-size]
    ```
    compile -t macOS -r: results in:
    same compiler error as above.
    
    **To reproduce**
    copy following code and run those three variations (interpreter, -c, -t)
    then search for and comment out all `react` -statements
    and repeat
    finally uncomment the first `react` statement
    and repeat
    Note: the button click works now (reduced version)
    
    **Expected behaviour**
    Compiler should behave identical between `-c` and `-r` mode
    
    **Platform**
    Red 0.6.4 for macOS built 24-Jul-2019/5:51:39+10:00 commit #613d71c
    
    **Code**
    ```
    Red [ needs: 'view ]
    
    win-size: 1200x800
    react: make reactor! [w-size: win-size]     ;comment this and -t compiles
    so: ""
    win: layout compose [
        title "Compiler Tests with red-lang"
        size win-size backdrop yellow
        below
        h2 "Red Compiler Tests"
        w-panel: panel red   [        
            below
            b: button "Run Tests" [      
                area1/text:  "test area1 after button click"
                area2/text: rejoin ["test area2 after button click" newline]
            ]
        ]  react [face/size: as-pair react/w-size/x - 20 50]
        w-tab-panel: tab-panel [
            "First" [
                area1: area 580x250 font-name "courier" font-size 12 
                react [face/size: face/parent/parent/size - 40x80]
            ]
            "Second" [
                area2: area 580x250 font-name "courier" font-size 12  
                react [face/size: face/parent/parent/size - 40x80]
            ]
        ] react [face/size: as-pair react/w-size/x - 10 react/w-size/y - w-tab-panel/offset/y - 20 ]
    ]
    
    view/flags/no-wait win 'resize
    insert-event-func [
        case [
            event/type = 'close [
                quit
            ]
            event/type = 'resizing [
               react/w-size: win/size
            ]
        ]
    ]
    win/size: win/size + 0 ;trigger a first resize
    do-events
    ```

--------------------------------------------------------------------------------

On 2019-08-01T07:50:03Z, endo64, commented:
<https://github.com/red/red/issues/3959#issuecomment-517166450>

    I confirm that compiling with `-r` fails on Win10 too.
    ```
    D:\Projects\Red\red\build\bin>red -r test.red
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling D:\Projects\Red\red\build\bin\test.red ...
    *** Compilation Error: word with not defined in react/with
    *** in file: D:\Projects\Red\red\build\bin\test.red
    *** near: [react/with blk ctx]
    ```

--------------------------------------------------------------------------------

On 2019-08-01T18:45:57Z, dander, commented:
<https://github.com/red/red/issues/3959#issuecomment-517411110>

    Is overriding the `react` function intentional? It seems like that could cause problems, and have differing compilation/interpretation behavior.

--------------------------------------------------------------------------------

On 2019-08-01T19:13:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3959#issuecomment-517420242>

    I think @dander may have nailed it. See https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#compiled-versus-interpreted-behaviors for some basic notes on differences when compiling and overriding functions. e.g., something in Red is calling `react/with`, but you've made it an object, not a function, so that code is broken by your override.

--------------------------------------------------------------------------------

On 2019-08-02T00:20:54Z, ralfwenske, commented:
<https://github.com/red/red/issues/3959#issuecomment-517502196>

    I had followed @greggirwin 's help ☝️ July 29, 2019 2:48 PM
    but now I realise that for my purpose (view resizing) I don't need the `reactor!` at all.
    In the above source I removed the reactor, replaced all `react/w-size` with `face/parent` and it works in `-r` mode. Great.
    Should I close this issue? 
    The questions if `-c` and `-r` compilations may differ seems still open.

--------------------------------------------------------------------------------

On 2019-08-02T05:09:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3959#issuecomment-517551178>

    I think this ticket can be closed.

--------------------------------------------------------------------------------

On 2019-08-02T05:30:51Z, ralfwenske, commented:
<https://github.com/red/red/issues/3959#issuecomment-517556017>

    Closed
    
    ⁣Sent from BlueMail ​
    
    On 2 Aug 2019 3:10 pm, at 3:10 pm, Gregg Irwin <notifications@github.com> wrote:
    >I think this ticket can be closed.
    >
    >-- 
    >You are receiving this because you authored the thread.
    >Reply to this email directly or view it on GitHub:
    >https://github.com/red/red/issues/3959#issuecomment-517551178

