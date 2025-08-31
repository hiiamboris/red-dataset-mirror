
#4532: Request for more meaningful error messages
================================================================================
Issue is closed, was reported by dsunanda and has 32 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4532>

**Describe the bug**

Rebol offers meaningful, descriptive error messages that help pinpoint the failure. Red's equivalents are often generic and vague. This makes debugging large codebases much easier in Rebol compared to Red

**To reproduce**
The code below simulates a datatype mismatch in a large codebase:
```
write %demo-4532.red {
    Rebol []
    Red []
    mod1: context [var1: none]
    mod2: context [fun1: func [x][x: x + 1]]
    mod2/fun1 mod1/var1
    }
do %demo-4532.red
```
**Expected behavior**
Rebol offers a clear and focused error message - it's WHERE and NEAR info take you right to the failing line with little ambiguity:
```
Script: "Untitled" (none)
** Script Error: Cannot use add on none! value
** Where: fun1
** Near: x: x + 1
```

Red's message is much less helpful:
```
*** Script Error: + does not allow none for its value1 argument
*** Where: do
*** Stack: do-file
```


**Platform version**
```
Red 0.6.4 for Windows built 15-Jun-2020/19:16:50+01:00 commit #7509ffd
Rebol 2.7.8.3.1 1-Jan-2011/16:39:07-8:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-19T14:44:24Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4532#issuecomment-646676545>

    +1 For this request. On large codebase, frustration mounts easily and it is very difficult to find the error position. 
    

--------------------------------------------------------------------------------

On 2020-12-09T18:43:02Z, zwortex, commented:
<https://github.com/red/red/issues/4532#issuecomment-741971663>

    Another use case : cryptic errors when loading a script that has a function without body argument
    
    The following scripts have the same error : the body function of function b was missed.
    
    ```
    ; simple script (1)
    script1: {
            a: function [] [ print "a" ]
            b: function []
            c: function [] [ print "c" ]
    }
    code1: load script1
    do code1 ;
    
    ; within an object (2)
    script2: {
        obj: context [
            a: function [] [ print "a" ]
            b: function []
            c: function [] [ print "c" ]
        ]
        obj/a
    }
    code2: load script2
    do code2 ;
    
    ; loaded as a script (3)
    save/header %test-code1.red code1 []
    do %test-code1.red
    ```
    
    However the output does not provide useful information as to where this happens. If the script is big, it is just a nightmare. 
    
    (1)
    *** Script Error: catch does not allow function! for its body argument
    *** Where: function
    *** Stack:
    
    (2) 
    *** Script Error: catch does not allow function! for its body argument
    *** Where: function
    *** Stack: context
    
    (3)
    *** Script Error: function does not allow function! for its body argument
    *** Where: do
    *** Stack: do-file  
    
    The same in rebol 2 will output meaningful errors
    
    (1) 
    ** Script Error: function expected body argument of type: block
    ** Near: a: function [] [print "a"]
    b:
    
    (2)
    ** Script Error: function expected body argument of type: block
    ** Where: context
    ** Near: a: function [] [print "a"]
    b:
    
    (3)
    Script: "Untitled" (none)
    ** Script Error: function expected body argument of type: block
    ** Near: a: function [] [print "a"]
    b:

--------------------------------------------------------------------------------

On 2021-04-30T11:48:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-830039465>

    One more example of nonsensical error message:
    ```
    >> obj: object [data: [] f: does [data/value]]      ;) `f` is a BIG function that uses `data/value`
    >> obj/data: ""                                     ;) mistakenly data gets set to a string
    >> obj/f
    *** Script Error: word! type is not allowed here    ;) go figure where is that "here"
    *** Where: f
    *** Stack: f  
    ```
    R2 does much better - nails it down to a specific path (hopefully it's unique in that function):
    ```
    ** Script Error: Invalid path value: value
    ** Where: f
    ** Near: data/value
    ```

--------------------------------------------------------------------------------

On 2021-06-22T14:46:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-866047730>

    This ticket is a mess because it is overloaded with various reports that are only apparently related. Each report should be a separate ticket. There is no need for a "request" on better error messages, they are unfinished work, we know about that.
    
    @dsunanda For the WHERE field, it should report `fun1`, so I consider the result as a bug. For the NEAR field, it's not implemented yet because it is waiting for additional research to implement something more accurate than what Rebol provides. If we can't design anything better, we'll fall back on same NEAR as Rebol.
    
    > Red's message is much less helpful
    
    Actually Red's message is more accurate than Rebol's one, as it tells you which argument is at fault (`value1`). You should be more precise in the issue description.
    
    
    
    

--------------------------------------------------------------------------------

On 2021-06-22T14:47:43Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-866049098>

    @zwortex 
    ```
    (1)
    *** Script Error: catch does not allow function! for its body argument
    *** Where: function
    *** Stack:
    
    (2)
    *** Script Error: catch does not allow function! for its body argument
    *** Where: function
    *** Stack: context
    ```
    
    Those looks like bugs to me.
    
    ```
    (3)
    *** Script Error: function does not allow function! for its body argument
    *** Where: do
    *** Stack: do-file
    ```
    The error message is correct here, though the WHERE field is not accurate enough.

--------------------------------------------------------------------------------

On 2021-06-22T14:50:39Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-866051682>

    @hiiamboris 
    ```
    >> obj: object [data: [] f: does [data/value]]      ;) `f` is a BIG function that uses `data/value`
    >> obj/data: ""                                     ;) mistakenly data gets set to a string
    >> obj/f
    *** Script Error: word! type is not allowed here    ;) go figure where is that "here"
    *** Where: f
    *** Stack: f 
    ```
    I can't say anything about the error message as you didn't provide the contextual code to reproduce it. For the WHERE field, the report is too high in the call stack, it should be more accurate indeed. That case looks similar to the `fun1` case above.

--------------------------------------------------------------------------------

On 2021-06-22T15:18:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-866076134>

    > contextual code to reproduce it.
    
    What I provided is the simplified code. In real case a dozens of LOC function can have many paths in it, and once some path becomes invalid, I get this message and have to first figure out that it's actually a path that produces an error, then figure out what path exactly. 

--------------------------------------------------------------------------------

On 2021-06-22T16:01:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-866116914>

    I've pushed a fix to improve the path error message:
    ```
    >> obj/f
    *** Script Error: cannot access value in path data/value
    *** Where: f
    *** Stack: f  
    ```

--------------------------------------------------------------------------------

On 2021-06-23T15:12:55Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-866924682>

    For the record, the poor error message when running a script using `do` has been documented since a while [here](https://github.com/red/red/issues/3246#issuecomment-378870526).
    
    I don't see any way so far to have a fix for #3246 and support more accurate error reporting when running a script with `do`, it's either one or the other. A more accurate error reporting requires reading the stack state at the exact moment when the error occurs. Fixing #3246 (plus resetting the working path afterwards) requires catching the error then activating it again later, resulting in a changed stack state and a poorer error report due to lost stack context.
    
    Personally, I think that proper error reports on `do` are more important, so I would revert the fix for #3246 and try to find another way to solve the "silent `return`" issue.

--------------------------------------------------------------------------------

On 2021-06-23T17:55:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-867042474>

    > Personally, I think that proper error reports on do are more important, so I would revert the fix for #3246 and try to find another way to solve the "silent return" issue.
    
    I support that. Though should mention that having the exact filename reported is just as important. When you're including ~30 files, which also may include some files, and then somewhere in Red happens a regression, trying to find where the error is becomes a boring undertaking. I'm redefining `#include` to print the filename as a workaround.

--------------------------------------------------------------------------------

On 2021-06-24T11:24:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-867557626>

    > I'm redefining #include to print the filename as a workaround.
    
    That's the right way to do it. Once files are loaded in memory, there is no contextual "filename" left that we could print on error. 
    
    @hiiamboris On a special note about this, larger cell! slots would allow us to insert a _debug_ node! in every single slot when compiling/running in debug mode, with all the needed contextual information attached for very accurate error reporting. ;-)

--------------------------------------------------------------------------------

On 2021-06-24T11:32:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-867563190>

    In that case I suppose cell will be bigger only in debug builds, which is perfectly fine.

--------------------------------------------------------------------------------

On 2021-06-29T14:58:36Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-870675295>

    Now you will get:
    ```
    >> do %demo-4532.red
    *** Script Error: + does not allow none! for its value1 argument
    *** Where: +
    *** Stack: do-file fun1 
    ```
    Which is much more helpful. For the NEAR field, that's waiting for some global error handling design decision.

--------------------------------------------------------------------------------

On 2021-06-29T15:05:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4532#issuecomment-870680990>

    @zwortex I have fixed case (3) to report a more accurate `where:` info. Though, as I said above, NEAR field is not supported, so you can't get a better error location for now.

--------------------------------------------------------------------------------

On 2021-06-29T15:25:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-870696991>

    What about his (1) and (2)? Should a separate issue be opened?

--------------------------------------------------------------------------------

On 2023-01-28T13:04:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4532#issuecomment-1407394700>

    linking more error message related stuff here: https://github.com/red/red/issues/4516 https://github.com/red/red/issues/4627 https://github.com/red/red/issues/5177 https://github.com/red/red/issues/5274

