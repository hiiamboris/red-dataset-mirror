
#1342: Inconsistent behavior executing blocks
================================================================================
Issue is closed, was reported by arno-lee and has 10 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1342>

In Red:
    **blk: [print 1 + 2]
    if 10 > 5 [blk]**
yields 3 whereas in REBOL3 it is just 
    **if 10 > 5 blk**
no brackets around **blk**, while **[blk]** in REBOL3 is not executed at all



Comments:
--------------------------------------------------------------------------------

On 2015-09-06T21:56:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1342#issuecomment-138129080>

    Please could you let us know which operating system and which version of Red you are using.
    
    Using the latest code from the Master branch, the inner block is not evaluated:
    
    ```
    red>> system/version
    == "0.5.4"
    red>> blk: [print 1 + 2]
    == [print 1 + 2]
    red>> if 10 > 5 [blk]
    == [print 1 + 2]
    red>> if 10 > 5 blk
    3
    ```

--------------------------------------------------------------------------------

On 2015-09-07T17:37:16Z, arno-lee, commented:
<https://github.com/red/red/issues/1342#issuecomment-138346965>

    well, after re-checking I couldn't reproduce this issue in the REPL, but still found and inconsistency regarding the same code running as a script. I've made a script **bt.r**
    
    ```
    Red [ Title: "block in brackets test" ]
    blk: [print 1 + 2]
    print "Executing [blk]: "
    if 10 > 5 [blk]
    print "Executing blk: "
    if 10 > 5 blk
    ```
    
    which yields a compilation error in Red (v. 0.5.4)
    
    ```
    $ red-054 -c bt.r
    ...
    *** Compilation Error: expected a block for IF-BODY instead of word! value 
    *** in file: %/home/yari/Projects/Misc/r3r/bt.r
    *** near: [blk]
    ```
    
    while running the same script with REBOL3 goes nicely and yields
    
    ```
    $ r3 -s bt.r
    Executing [blk]: 
    Executing blk: 
    3
    ```
    
    Re-writing the last line to **do [if 10 > 5 blk]** fixes this though, and the outputs from Red and REBOL3 look the same again. 
    
    The issue here might be that REBOL3 considers script code to be put into **do [ ... ]** while Red compiler seems to fail to do so for some reason
    
    Operating system: Ubuntu Linux 15.04, Red version 0.5.4 (downloaded as a binary from www.red-lang.org) and REBOL3

--------------------------------------------------------------------------------

On 2015-09-07T22:42:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1342#issuecomment-138387759>

    Thanks for following up. I can confirm the compiler will not compile the script as the if function requires a block as its argument.
    
    I am not certain whether this is the intended behaviour or not and so will keep the  issue maked as "review" for now.
    
    By the way, when I run your script in the Red console, I get the same behaviour as Rebol:
    
    ```
    mbp:Red peter$ ./test-console ../../Code/Red/test.red
    Executing [blk]: 
    Executing blk: 
    3
    ```
    
    NOTE for @dockimbel & @qtxie:
    
    Changing the word! containing a block! to a get-word! stilll gives the same compilation error. Whilst it is logical that a word! cannot be supplied as the argument to IF, there is some justification to say that the compiler should cope with a get-word! that refers to a block. (On the basis that the argument should be evaluated prior to being passed to the function). Though I realise that this would be much more complicated to handle and might even have to be handled at runtime.
    
    This code:
    
    ```
    Red [ Title: "block in brackets test" ]
    blk: [print 1 + 2]
    print "Executing [blk]: "
    if 10 > 5 [blk]
    print "Executing blk: "
    if 10 > 5 :blk
    ```
    
    currently gives this error:
    
    ```
    Compiling /Users/peter/VMShare/Code/Red/test.red ...
    *** Compilation Error: expected a block for IF-BODY instead of get-word! value 
    *** in file: %/Users/peter/VMShare/Code/Red/test.red
    *** near: [:blk]
    ```

--------------------------------------------------------------------------------

On 2015-09-08T01:25:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1342#issuecomment-138402663>

    @dockimbel @qtxie Please ignore the note in my previous comment. It was far too early in the morning when I wrote it :-(

--------------------------------------------------------------------------------

On 2018-03-27T08:10:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1342#issuecomment-376435481>

    The compiler does not support such construct, nor will it support it in close future. The alternative is to use the encapping mode when compiling (`-e` option instead of `-c`), that will ensure that your code runs through the interpreter, fully preserving the semantics you experience in the REPL.

