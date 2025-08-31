
#1934: get-word in a path does not work 
================================================================================
Issue is closed, was reported by philipyi and has 20 comment(s).
<https://github.com/red/red/issues/1934>

test: context [hello: does [print "Hello"]]
test/:hello
**\* Script error: :hello has no value
**\* Where: catch



Comments:
--------------------------------------------------------------------------------

On 2016-05-25T15:25:18Z, ghost, commented:
<https://github.com/red/red/issues/1934#issuecomment-221611823>

    Also, this (and other some invalid paths) closes the console -
    
    ```
    red>> test/:'
    *** Script error: tail? does not allow none! for its series argument
    *** Where: tail?
    ```
    
    Will it be possible for the console to not crash itself?

--------------------------------------------------------------------------------

On 2016-05-25T15:28:25Z, ghost, commented:
<https://github.com/red/red/issues/1934#issuecomment-221612742>

    Well, I am not good enough at Red/Rebol to give an appropriate answer but @philipyi your code errors out even in Rebol 2. 

--------------------------------------------------------------------------------

On 2016-05-25T16:09:04Z, philipyi, commented:
<https://github.com/red/red/issues/1934#issuecomment-221625332>

    I now realize that Red/Rebol don't support full first class functions.  With Red/Rebol you can get global functions and store them in global variables and then call them.  However you cannot 
    1) get functions from within objects
    2) pass functions to to other functions
    My workaround is to create what I call "function objects" which are objects containing a single function as a member. for example:
    func-obj: object [call: func does [print "Hello func-obj"]]
    I can then use func-obj as I would a first class function, with the provisor that I need to write func-obj/call to call the function.

--------------------------------------------------------------------------------

On 2016-05-25T16:48:29Z, meijeru, commented:
<https://github.com/red/red/issues/1934#issuecomment-221636344>

    Have you tried (in your first example) `test/hello` to execute the function, and `:test/hello` to obtain the function as a first class value?

--------------------------------------------------------------------------------

On 2016-05-25T16:49:10Z, meijeru, commented:
<https://github.com/red/red/issues/1934#issuecomment-221636524>

    Your second example that crashes the console merits a real issue.

--------------------------------------------------------------------------------

On 2016-05-25T17:10:09Z, philipyi, commented:
<https://github.com/red/red/issues/1934#issuecomment-221642321>

    test/hello works
    f1: :test/hello works
    f2: func [f [function!]][f]
    f2 :test/hello works
    f2 f1 crashes the console

--------------------------------------------------------------------------------

On 2016-05-25T18:43:17Z, meijeru, commented:
<https://github.com/red/red/issues/1934#issuecomment-221668516>

    Again, it should be `f2 :f1` and that works. More documentation on the `get` native would be useful.
    
    Also again, the fact that `f2 f1` crashes the console merits a separate (true) issue.

--------------------------------------------------------------------------------

On 2016-05-25T18:44:24Z, meijeru, commented:
<https://github.com/red/red/issues/1934#issuecomment-221668847>

    Will YOU put up the real issues or shall I?

--------------------------------------------------------------------------------

On 2016-05-25T23:57:33Z, philipyi, commented:
<https://github.com/red/red/issues/1934#issuecomment-221742114>

    The correct syntax is :test/hello
    issue closed.

--------------------------------------------------------------------------------

On 2016-05-26T07:14:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1934#issuecomment-221795197>

    For the record, this is how to read values from contexts without trigerring their evaluation:
    
    ```
    red>> test: context [hello: does [print "Hello"]]
    == make object! [
        hello: func [][print "Hello"]
    ]
    red>> get in test 'hello
    == func [][print "Hello"]
    red>> :test/hello
    == func [][print "Hello"]
    ```
    
    _I now realize that Red/Rebol don't support full first class functions._ That is not correct. Functions are first class datatypes in Red/Rebol (though the Red's compiler support for that is currently limited, the interpreter should support it fully already).
    
    _1) get functions from within objects_
    Works fine when the right syntax is used, as above.
    
    _2) pass functions to to other functions_
    Here is a simple example:
    
    ```
    red>> foo: function [action [any-function!]][action 1 2]
    == func [action [any-function!]][action 1 2]
    red>> foo :add
    == 3
    ```

