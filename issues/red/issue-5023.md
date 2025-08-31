
#5023: [Lexer] BC (and far AD) dates don't round trip
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5023>

**Describe the bug**
```
>> 02/03/-4
*** Syntax Error: (line 1) invalid date at 02/03/-4
*** Where: set
*** Stack: load 
>> 02/03/-04
*** Syntax Error: (line 1) invalid date at 02/03/-04
*** Where: set
*** Stack: load 
>> 02/03/-004
== 2/Mar/-4
>> 02/03/-0004
== 2/Mar/-4
>> load mold 02/03/-0004
*** Syntax Error: (line 1) invalid date at 2/Mar/-4
*** Where: transcode
*** Stack: load  
```

**Expected behavior**

`load mold` should work

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-03T17:24:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5023#issuecomment-1004240535>

    Addendum:
    ```
    >> d: 1/1/1
    == 1-Jan-2001
    >> d/year: 15000
    == 15000
    >> d
    == 1-Jan-15000
    >> load mold d
    *** Syntax Error: (line 1) invalid date at 1-Jan-15000
    *** Where: transcode
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2022-01-08T16:13:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5023#issuecomment-1008045003>

    Compiler's treatment of these date is even worse:
    ```
    Red ["run me"]
    
    save/all %2.red [
    	Red ["compile me"]
    	probe b: [1/2/-0003/4:5:6.7]
    	probe length? b
    ]
    ```
    `red -c 2.red & 2.exe`:
    ```
    [1 /Feb /-3 /4:05:06.7]
    4
    ```
    (expected: single date! value)

--------------------------------------------------------------------------------

On 2022-02-03T17:20:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5023#issuecomment-1029219066>

    About your addendum, the [documentation](https://github.com/red/docs/blob/master/en/datatypes/date.adoc#abstract) states it clearly:
    
    > Supported dates range from 1/Jan/-16384 to 31/Dec/16383, wrapping around on overflowing math operations. On input, that range is reduced from 1/Jan/-9999 to 31/Dec/9999 for practical reasons.
    
    So `load` cannot accept such dates (but you can build them dynamically if really needed).
    
    For the original issue, `mold` is not accurately serializing those negative date values.

--------------------------------------------------------------------------------

On 2022-02-03T17:37:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5023#issuecomment-1029235217>

    > >> 02/03/-04
    > *** Syntax Error: (line 1) invalid date at 02/03/-04
    > *** Where: set
    > *** Stack: load 
    
    I cannot reproduce that. 
    
    ```
    >> 2/03/-04
    == 2-Mar-1996
    ```

--------------------------------------------------------------------------------

On 2022-02-03T17:39:54Z, dockimbel, commented:
<https://github.com/red/red/issues/5023#issuecomment-1029236879>

    > Compiler's treatment of these date is even worse:
    
    That's a separate issue, should have gone in a separate ticket.

--------------------------------------------------------------------------------

On 2022-02-03T17:49:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5023#issuecomment-1029244581>

    > > > > 02/03/-04
    > > > > *** Syntax Error: (line 1) invalid date at 02/03/-04
    > > > > *** Where: set
    > > > > *** Stack: load
    > 
    > I cannot reproduce that.
    > 
    > ```
    > >> 2/03/-04
    > == 2-Mar-1996
    > ```
    
    You missed zero.

--------------------------------------------------------------------------------

On 2022-02-09T16:35:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5023#issuecomment-1033958494>

    I cannot reproduce the above mentioned compiler issue. I get:
    
    ```
    > 2.exe
    [1/Feb/-3/4:05:06.7]
    1
    ```

--------------------------------------------------------------------------------

On 2022-02-09T16:57:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5023#issuecomment-1033980857>

    File generated before the last commit looks like this:
    ```
        Red ["compile me"]
        probe b: [1/Feb/-3/4:05:06.7]
        probe length? b
    ```
    After the last commit like this:
    ```
        Red ["compile me"]
        probe b: [1/Feb/-0003/4:05:06.7]
        probe length? b
    ```

--------------------------------------------------------------------------------

On 2022-02-09T16:59:19Z, dockimbel, commented:
<https://github.com/red/red/issues/5023#issuecomment-1033983167>

    I've made a note about new molding for years < 100 in the commit log.
    
    I've stashed the changes made by that commit when I tried to reproduce the compiler issues.

