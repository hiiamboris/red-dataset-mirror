
#2671: Char in numeric form is not supported for values from 0 to 9
================================================================================
Issue is closed, was reported by Oldes and has 24 comment(s).
[status.waiting] [status.built] [type.review] [type.documentation] [test.written] [type.compiler]
<https://github.com/red/red/issues/2671>

```
>> print "^(0)"
(0)
>> print "^(10)"

>> to-char #"^(10)"
== #"^P"
>> to-char #"^(0)"
*** Syntax Error: invalid char! at {#"^^(0)"}
*** Where: do
```

Just for comparison, in Rebol:
```
>> to-char #"^(0)"
== #"^@"
```


Comments:
--------------------------------------------------------------------------------

On 2017-05-10T18:52:35Z, meijeru, commented:
<https://github.com/red/red/issues/2671#issuecomment-300579033>

    The lexer requires an *even* number of hex digits inside the parentheses. That is all. The rest is the quality of the error/warning messages. Apart from those, inside a string (where more than one character may occur), `^(` is seen as escaped `(`, due to the general escaping function of `^`. Inside a character literal, `^(` is not accepted (that may in itself be an issue) , but even if it were, it would be rejected since it is followed by more characters.

--------------------------------------------------------------------------------

On 2020-03-21T19:36:41Z, 9214, commented:
<https://github.com/red/red/issues/2671#issuecomment-602092918>

    Fixed in `fast-lexer` branch:
    ```red
    >> {^(0) ^(1) ^(2) ^(3) ^(4) ^(5)}
    == "^@ ^A ^B ^C ^D ^E"
    ```

--------------------------------------------------------------------------------

On 2020-07-09T18:57:52Z, meijeru, commented:
<https://github.com/red/red/issues/2671#issuecomment-656295989>

    May be closed now!

--------------------------------------------------------------------------------

On 2020-07-09T19:00:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/2671#issuecomment-656297312>

    Let's write some tests before closing.

--------------------------------------------------------------------------------

On 2020-07-21T03:53:50Z, theSherwood, commented:
<https://github.com/red/red/issues/2671#issuecomment-661616250>

    Just want to double-check before I write tests for this...
    
    Is this expected behavior?
    ```
    >> {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
    == "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P"
    >> print {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
            
    >> print "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P"
            
    ```
    `print` appears to be printing a quantity of spaces in the above cases.
    
    `Red 0.6.4 for macOS built 17-Jul-2020/12:48:27-06:00 commit #ea1d139`

--------------------------------------------------------------------------------

On 2020-07-21T09:25:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/2671#issuecomment-661743952>

    I suggest you test the string vs expected only. We can't test `print` anyway. That it prints spaces instead of control chars in GUI console is probably OK.
    In CLI console:
    ```
    >> print {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
      ☺ ☻ ♥ ♦ ♣ ♠    ►                                                
    ```

--------------------------------------------------------------------------------

On 2020-07-25T06:31:39Z, theSherwood, commented:
<https://github.com/red/red/issues/2671#issuecomment-663817502>

    So the following test currently fails on master:
    
    ```
    	--test-- "#2671"
    		t2671: form {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
    		--assert equal? "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P" t2671
    ```
    
    If you `probe` out `t2671` you get:
    
    ```
    "(0) (1) (2) (3) (4) (5) (6) (7) (8) (9) ^P"
    ```
    
    This is in contrast to the latest build of the console in which you have this:
    
    ```
    >> probe form {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
    "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P"
    == "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P"
    ```
    
    Why would we be having different behavior between the source of master (which I believe is used to run the tests) and the latest build of that source?
    
    **EDIT:** (for the sake of clarity)
    This test passes:
    ```
    	--test-- "#2671"
    		t2671: form {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
    		--assert equal? "(0) (1) (2) (3) (4) (5) (6) (7) (8) (9) ^P" t2671
    ```

--------------------------------------------------------------------------------

On 2020-07-25T13:46:58Z, 9214, commented:
<https://github.com/red/red/issues/2671#issuecomment-663857486>

    @theSherwood Red is both compiled and interpreted language, and the behavior of compiler and interpreter usually differ between each other, esp. in processing literal forms.
    
    ```red
    probe {^(0) ^(1) ^(2) ^(3) ^(4) ^(5) ^(6) ^(7) ^(8) ^(9) ^(10)}
    ```
    Compiled:
    ```red
    "(0) (1) (2) (3) (4) (5) (6) (7) (8) (9) ^P"
    ```
    Interpreted:
    ```red
    "^@ ^A ^B ^C ^D ^E ^F ^G ^H ^- ^P"
    ```
    
    So the compiler's lexer needs to be updated too. 

--------------------------------------------------------------------------------

On 2020-07-27T17:26:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2671#issuecomment-664531510>

    > the behavior of compiler and interpreter usually differ between each other
    
    To clarify, they _may_ differ, being out of sync or because of compiler limitations, but the _goal_ is for them to match.

--------------------------------------------------------------------------------

On 2020-07-27T17:27:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2671#issuecomment-664531812>

    Hence, we need to run tests both interpreted and compiled.

--------------------------------------------------------------------------------

On 2020-08-06T03:31:17Z, theSherwood, commented:
<https://github.com/red/red/issues/2671#issuecomment-669662311>

    So just to clarify, this issue requires work to be done to make the behavior of the compiler consistent with the behavior of the interpreter before any more testing makes sense.

--------------------------------------------------------------------------------

On 2020-08-06T05:52:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/2671#issuecomment-669717248>

    That should be the best course of action, yes.

