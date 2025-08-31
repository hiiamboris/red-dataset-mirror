
#2393: Recursive `print` issue
================================================================================
Issue is closed, was reported by maximvl and has 28 comment(s).
[type.bug] [status.duplicate]
<https://github.com/red/red/issues/2393>

Since `print` reduces it's argument it is possible to use `print` inside, however result is quite strange:
```
red>> print [1 2 print [ 5 ]]
5
```
If it's possible I would like `print` correctly output
```
5
1 2
```


Comments:
--------------------------------------------------------------------------------

On 2017-01-02T00:31:24Z, geekyi, commented:
<https://github.com/red/red/issues/2393#issuecomment-269926615>

    Rebol3:
    ```
    5
    1 2
    ```
    Rebol2:
    ```
    5
    1 2 ?unset?
    ```
    But the actual code from dec 28 red build I'm getting:
    ```
    red>> print [1 2 print [ 5 ]]
    5
     5
    ```
    `print [1 2 print 5 ]` gives *mostly* identical output in all three:
    ```
    red>> print [1 2 print 5 ]
    5
    1 2
    ```
    I think `5
    1 2` is the correct output

--------------------------------------------------------------------------------

On 2017-01-02T09:34:12Z, maximvl, commented:
<https://github.com/red/red/issues/2393#issuecomment-269949585>

    @geekyi thanks for examples, you are right, I changed original post.
    So, since `print` returns `unset!`, and `unset!` seems to be printed as an empty string:
    ```
    red>> print print 5
    5
    
    red>> 
    ```
    
    Correct output should be as in Rebol3:
    ```
    5
    1 2
    ```
    
    Which is actually so if I `reduce` block before printing:
    ```
    red>> print reduce [1 2 print [5]]
    5
    1 2
    ```
    
    Does it mean `print` does something different than `reduce`?

--------------------------------------------------------------------------------

On 2017-01-02T13:37:33Z, endo64, commented:
<https://github.com/red/red/issues/2393#issuecomment-269973476>

    It works as expected on Win8 x64 on both CLI and GUI console (nightly build)
    
    ```
    red>> print reduce [1 2 print [5]]
    5
    1 2
    ```

--------------------------------------------------------------------------------

On 2017-01-02T15:44:31Z, meijeru, commented:
<https://github.com/red/red/issues/2393#issuecomment-269988156>

    And on W10 (recent build).

--------------------------------------------------------------------------------

On 2017-01-02T18:01:42Z, maximvl, commented:
<https://github.com/red/red/issues/2393#issuecomment-270003101>

    On the website latest builds are for December 28, once they update I'll check and close issue.

--------------------------------------------------------------------------------

On 2017-01-03T20:38:18Z, x8x, commented:
<https://github.com/red/red/issues/2393#issuecomment-270218081>

    Related? https://github.com/red/red/issues/2047

--------------------------------------------------------------------------------

On 2017-01-06T09:21:13Z, maximvl, commented:
<https://github.com/red/red/issues/2393#issuecomment-270863443>

    @endo64 problem is still there in Linux builds:
    ```
    red>> print [1 2 print [5]]
    5
    red>> system/build/date
    == "6-Jan-2017/10:12:34+1:00"
    ```

--------------------------------------------------------------------------------

On 2017-02-10T22:16:27Z, geekyi, commented:
<https://github.com/red/red/issues/2393#issuecomment-279081470>

    Just realized @endo64 is using slightly different code, note the **reduce**:
    ```red
    red>> print reduce [1 2 print [5]]
    5
    1 2
    ```
    In this case I get the same output.
    **However**, I still get _different_ output than @maximvl on Win 10:
    ```red
    red>> print [1 2 print [5]]
    5
     5
    ```
    Which doesn't make sense however I look at it 😕 
    ```red
    red>> system/build/config/build-basename
    == %gui-console-2017-1-25-13785
    ```

--------------------------------------------------------------------------------

On 2017-03-29T04:09:51Z, gltewalt, commented:
<https://github.com/red/red/issues/2393#issuecomment-289976760>

    ```
    >> print [1 2 prin 5]
    5
    1 2
    >> prin [1 2 print 5]
    5
    1 2
    ```
    
    `print` really calls `prin` and adds line feed
    
    ```
    print*: func [check? [logic!]][
    		lf?: yes											;@@ get rid of this global state
    		prin* check?
    		lf?: no
    		last-lf?: yes
    	]
    ```
    Maybe?...
    ```
    either prin* check? [lf?: no][lf?: last-lf?: yes]
    ```

--------------------------------------------------------------------------------

On 2017-03-29T17:43:01Z, geekyi, commented:
<https://github.com/red/red/issues/2393#issuecomment-290167010>

    @gltewalt I don't understand what you're trying to say here.
    Understand this part, but not what follows:
    > print really calls prin and adds line feed
    
    ### Edit:
    I [see ](https://github.com/red/red/blob/d48c9ade2e0e639742529cc3a6506da108db2376/runtime/natives.reds#L657)
    
    But still the weird result is there for me in red 0.6.2:
    ```red
    x: 1
    prin[prin[prin[prin[prin[prin[prin[x: x + 1]]]]]]]
    ```
    results in:
    ```
    2 2  2   2    2     2      2
    ```
    Buffer overflow? Or more state like you're suggesting?

--------------------------------------------------------------------------------

On 2017-03-29T19:27:39Z, gltewalt, commented:
<https://github.com/red/red/issues/2393#issuecomment-290199046>

    I was just saying that print doesn't reduce. `prin` calls `reduce`.  `print` uses `prin`, and adds line feed - but the line feed variables are global state according to the source comment.
    In: 
    natives.reds 
    Starting at:
    line 656
    
    I think it's a matter of state and perhaps stack depth?           

--------------------------------------------------------------------------------

On 2017-03-30T23:42:22Z, gltewalt, commented:
<https://github.com/red/red/issues/2393#issuecomment-290575810>

    partial fix....
    ```
    unless any [
    					c = as-integer #"^/"
    					c = as-integer #"^M"
    					c = as-integer #"^-"
    					c = as-integer #" "    ;-- added line
    				][
    ```
    
    ```
    >> x: 1
    == 1
    >> prin[prin[prin[prin[prin[prin[prin[x: x + 1]]]]]]]
    2 2 2 2 2 2 2
    ```
    
    It doesn't fix the other issues, like `print [1 2 print 5 ]` though.

--------------------------------------------------------------------------------

On 2017-04-01T05:42:43Z, greggirwin, commented:
<https://github.com/red/red/issues/2393#issuecomment-290897409>

    Just another example.
    ```
    >> print [1 2 prin [5 6]]
    5 6
    5 6 
    >> print [1 2 prin [5 6] 3]
    5 6
    5 6 3
    ```

--------------------------------------------------------------------------------

On 2017-06-01T14:43:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2393#issuecomment-305515163>

    Duplicate of #2047.

