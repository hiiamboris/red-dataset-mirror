
#2487: WISH: dump REPL session in a *.red file
================================================================================
Issue is open, was reported by 9214 and has 38 comment(s).
[status.contribution] [type.task.wish]
<https://github.com/red/red/issues/2487>

Suppose I'm tinkering with Red in a console and want to save current session in a separate file to start prototyping. So, this one:
```
>> 1 + 2
== 3
>> foo: func [a b] [a - b]
== func [a b][a - b]
>> foo 1 2
== -1
>> 1 / foo 1 1
*** Math Error: attempt to divide by zero
*** Where: /
>> 
```

Should turn into _(timestump or custom name).red_ file with following content:
```
1 + 2
foo: func [a b] [a - b]
foo 1 2
1 / foo 1 1 ; *** optional comment about zero division error ***
```

One could use either `dump` command with refinements or menu button in a GUI console. We can go even further and append code from console to existing scripts/files.


Comments:
--------------------------------------------------------------------------------

On 2017-03-18T22:40:53Z, meijeru, commented:
<https://github.com/red/red/issues/2487#issuecomment-287580196>

    Looks like a very useful feature! My preference is for a menu item in the console (Save as).

--------------------------------------------------------------------------------

On 2017-03-18T23:05:52Z, geekyi, commented:
<https://github.com/red/red/issues/2487#issuecomment-287581473>

    I also prefer menu. You can simply `save` it
    One way to do a rough prototype of this is by dumping what's changed from the global context.
    Before @gltewalt 's `? object` fix #2455, that command did dump everything, including what the user added to the global context (is that right? @9214 is more of a context expert than me now I believe 😉  ).
    How do you get it now?

--------------------------------------------------------------------------------

On 2017-03-18T23:07:05Z, geekyi, commented:
<https://github.com/red/red/issues/2487#issuecomment-287581538>

    This won't be as useful for those who use IDEs I think (VS code for ex)

--------------------------------------------------------------------------------

On 2017-03-18T23:42:49Z, 9214, commented:
<https://github.com/red/red/issues/2487#issuecomment-287583207>

    @geekyi 
    I'm also for menu option, but what about CLI? 
    And yes, basic file interaction like `save` or `append-to-file` (if that exists :P) will do.
    
    Dumping changes from global context is too rough imo:
    - Not every user action changes something in global context (self-evaluating expressions and primitives).
    - What about comments?
    ```
    >> ; this is a comment
    >> 
    ````
    - And how we should keep origin global context to diff with changed one (if I understand you correctly)?  
    
    
    **I see it like:**
    1. Somehow get text from REPL;
    2. Somehow parse it to omit `>>` and `==` stuff, comment out errors if possible;
    3. Write/append everything to file.
    
    Or simply create log-file at every start and write in it every typed expression, but that's too much overhead.
    
    **Some caveats:**
    -  What if user wants to save some portion of session, not everything he typed? `Ctrl+C` works for small expressions, but not with big chunks... `Select with cursor --> Dump`? What about keyboard-only purists?
    - This won't work with R/S code :(
    - One wonder how Lisp adepts solved this issue in SLIME (I bet they did!).
     - We want to skip `>>` and `==` at the start of typed expressions, what if user changed console prompt to, say, `λ>` and `~~` ? `(づ｡◕‿‿◕｡)づ` and `(☞ﾟヮﾟ)☞` (jeez that's actually a cute idea!) ?

--------------------------------------------------------------------------------

On 2017-03-19T03:45:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2487#issuecomment-287592190>

    Such feature could be easily contributed using `system/console/history` as input for a serializing function. Adding it to the console's menu looks like a good idea.

--------------------------------------------------------------------------------

On 2017-03-19T04:07:13Z, x8x, commented:
<https://github.com/red/red/issues/2487#issuecomment-287592933>

    A quick go at console with persistent history for macOS and Linux:
    - download `%console/` folder from red git (it's in `%environment/`)
    - comment out `system/console/launch` in `%console/console.red`
    - compile this:
    ```
    Red []
    
    #include %console/console.red
    
    system/options/home: join to-file get-env "HOME" %/
    
    history: object [
    	f: append copy system/options/home %.red/.red_history
    	start: does [
    		if exists? f [
    			system/console/history: load f
    		]
    		exit
    	]
    	set 'quit does [
    		save f reverse copy/part union
    			reverse system/console/history
    			reverse any [
    				all[
    					exists? f
    					load f
    				]
    				[]
    			]
    			500
    		quit-return 0
    	]
    	set 'q :quit
    	clear: does [
    		delete f
    		system/words/clear system/console/history
    		exit
    	]
    ]
    history/start
    
    ;put your init stuff in ~/.red/user.red
    either exists? f: append copy system/options/home %.red/user.red [
    	do f
    ][
    	write f {Red []^/^/;put your init stuff here^/}
    ]
    
    system/console/launch
    ```
    
    make sure you have a `%.red/` folder in your HOME dir

--------------------------------------------------------------------------------

On 2017-04-04T15:14:25Z, geekyi, commented:
<https://github.com/red/red/issues/2487#issuecomment-291532171>

    I didn't know rebol2 already had such a feature using `port!`s:
    ```rebol
    >> ?? echo
    echo: func [
        "Copies console output to a file."
        [catch]
        target [file! none! logic!]
    ][
        if port? system/ports/echo [
            close system/ports/echo
            system/ports/echo: none
        ]
        if target = true [target: %rebol-echo.txt]
        if file? target [
            system/ports/echo: throw-on-error [open/write/new/direct target]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-10-25T18:48:44Z, akavel, commented:
<https://github.com/red/red/issues/2487#issuecomment-339432332>

    I'm very interested in such a feature. Based mostly on something I saw in Matlab quite long time ago, and never since seen anywhere in similarly useful variant, what I personally want is:
    
    - the 'history'/'log' file should be updated "on-line"/immediately &mdash; not just after the session finished, or on explicit request. Advantages: doesn't lose work in case of crash; I can browse the stuff in separate editor if I need, or grep, etc., also easily copy some snippets, while still keeping the REPL open.
    - a new REPL session should write a comment with a timestamp to the file (and an empty line above it, maybe also below)
    - [optionally] if a period of console inactivity is detected by the REPL, an empty line could be appended to the file (potentially also a line with a timestamp)
    - I'd much prefer if only successful commands and comments were written to log; syntactically invalid ones should not be stored; failed ones (error/exception/...) are debatable. If one really needs to log some drafts, one can always prepend a comment mark. But the failed stuff usually generates too much noise when experimenting in a REPL.
    
    *edit:*
    - could be disabled by default, enabled only via some console special command (like `help`)

--------------------------------------------------------------------------------

On 2017-10-25T19:08:02Z, greggirwin, commented:
<https://github.com/red/red/issues/2487#issuecomment-339438167>

    I use `echo` in R2 all the time. Any script that wants to easily log output just needs to echo to a timestamped file on startup. Having a few extra features would be great, though, so you could filter what gets echoed, and pause/resume echoing easily, without losing data.

--------------------------------------------------------------------------------

On 2017-10-25T19:39:06Z, akavel, commented:
<https://github.com/red/red/issues/2487#issuecomment-339446890>

    @greggirwin What I'm interested in (and this issue seems to be about IIUC), is more about saving the *commands* I typed into the console, than their *output* (this one is much less important and interesting &mdash; at least for me). The `echo` from your description seems to me more about saving some output? Or did I misunderstand something?

--------------------------------------------------------------------------------

On 2017-10-25T20:36:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2487#issuecomment-339463131>

    @akavel, I noted an earlier comment about `echo`, and meant to tie that in to yours as well, regarding extra features. The idea being that if we can hook the console, we can do what we want.

--------------------------------------------------------------------------------

On 2017-10-27T22:29:19Z, geekyi, commented:
<https://github.com/red/red/issues/2487#issuecomment-340112324>

    @akavel I'm not sure what feature you're talking about in Matlab.
    From what I remember, you can use a special type of comment to delineate sections. And you have the granularity of executing the entire file, that section, or even the current line the cursor is on. The most innovative version of this I've seen is in the smalltalk family.
    I think this is called a notebook interface. Wolfram alpha has the same thing. Python has Jupyter. Is this what you're talking about?
    IPython (the precursor to Jupyter) has a similar feature:
    ```
    In  [1]: 1 + 1
    Out [1]: 2
    In  [2]:
    ...
    ```
    This is almost exactly what `echo` provides in rebol2 (without the [numbers]).
    A similar thing can already be done using the existing vs-code plugin (currently, executing specific blocks of code isn't yet implemented, but you can execute files)

--------------------------------------------------------------------------------

On 2017-10-27T22:32:01Z, geekyi, commented:
<https://github.com/red/red/issues/2487#issuecomment-340112724>

    In fact, vs-code is currently how I work in Red. SO even though there is a prototype coded: https://github.com/red/red/issues/2487#issuecomment-287592933 I've not found much use for it since it doesn't fit my workflow (yet 😉)

--------------------------------------------------------------------------------

On 2018-03-06T21:32:21Z, lepinekong, commented:
<https://github.com/red/red/issues/2487#issuecomment-370935777>

    I'd like to have an option to also get the results of console execution to memorize tests done.

--------------------------------------------------------------------------------

On 2018-03-06T21:35:16Z, lepinekong, commented:
<https://github.com/red/red/issues/2487#issuecomment-370936644>

    It shouldn't be a redirect of console output because I'd still like to see what's happening in console. It's more like what Powershell has : a transcript https://technet.microsoft.com/en-us/library/ff687007.aspx

--------------------------------------------------------------------------------

On 2020-03-17T18:16:21Z, 9214, commented:
<https://github.com/red/red/issues/2487#issuecomment-600223283>

    ```red
    write/lines %dump.txt reverse copy system/console/history
    ```
    Personally I am satisfied with the above one-liner. Unless there are any objections, I'm gonna mark this wish as "granted" and close the ticket.

--------------------------------------------------------------------------------

On 2020-03-17T20:18:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2487#issuecomment-600277248>

    @9214, there was support for a menu option. Should we add that logic in a Save menu item, with a file requester and a default filename? Though sessions carry over, so you don't know where the current one started. In any case, it's your wish so you can consider it granted. :^) The other ideas mentioned here are worth remembering for the future.

--------------------------------------------------------------------------------

On 2020-03-17T20:23:37Z, 9214, commented:
<https://github.com/red/red/issues/2487#issuecomment-600279300>

    > you don't know where the current one started
    
    You can mark the tail of console history and work with it instead. Good point about menu item though.

--------------------------------------------------------------------------------

On 2020-03-17T20:58:49Z, greggirwin, commented:
<https://github.com/red/red/issues/2487#issuecomment-600297874>

    If the console handles this, it can set that marker in the history for saving purposes.

