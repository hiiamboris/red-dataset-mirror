
#5185: Curious results of lexer
================================================================================
Issue is closed, was reported by meijeru and has 28 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5185>

```
>> type? '+
== word!
>> type? '+1
== integer!
>> '+1
== 2511
```
Not only is `'+1` lexed as an integer literal where one would expect a (lit-)word at most, but its value is intriguing to say the least.

Further experimenting:
```
>> to-word "'+1"
*** Script Error: contains invalid characters
*** Where: to
*** Near : "'+1"
*** Stack: to-word  

>> to-integer '+1
== 2511

>> to-integer "'+1"
*** Script Error: cannot MAKE/TO integer! from: "'+1"
*** Where: to
*** Near : "'+1"
*** Stack: to-integer  

```



Comments:
--------------------------------------------------------------------------------

On 2022-08-25T17:51:43Z, greggirwin, commented:
<https://github.com/red/red/issues/5185#issuecomment-1227586708>

    Reproduced. Nice catch! Happens for all digits, and with a minus sign as well as plus.

--------------------------------------------------------------------------------

On 2022-08-25T17:53:35Z, greggirwin, commented:
<https://github.com/red/red/issues/5185#issuecomment-1227588270>

    ```
    >> '+0
    == 2510
    >> '+00
    == 25100
    >> '+000
    == 251000
    >> '+0001
    == 2510001
    
    >> '+1
    == 2511
    >> '+12
    == 25112
    >> '+123
    == 251123
    
    >> '-9
    == 2539
    >> '-98
    == 25398
    >> '-987
    == 253987
    ```

--------------------------------------------------------------------------------

On 2022-08-25T17:56:38Z, greggirwin, commented:
<https://github.com/red/red/issues/5185#issuecomment-1227591132>

    So for positive you get 251 followed by the scanned digits. For negative it's 253. That result is converted to an integer.
    
    ```
    >> '-9876543
    *** Syntax Error: (line 1) invalid float at -9876543
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '-987654
    == 253987654
    
    >> '+9876543
    *** Syntax Error: (line 1) invalid float at +9876543
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '+987654
    == 251987654
    ```

--------------------------------------------------------------------------------

On 2022-08-25T17:56:44Z, meijeru, commented:
<https://github.com/red/red/issues/5185#issuecomment-1227591316>

    Looks to me like a combination of missing/erroneous entries in the lexical scanning state machine, and a fluke in calculating the value of an integer (but that might go away once the combination of characters is forbidden or interpreted otherwise).

--------------------------------------------------------------------------------

On 2022-08-25T18:01:11Z, greggirwin, commented:
<https://github.com/red/red/issues/5185#issuecomment-1227595318>

    Yes, any alpha char sets it back to word mode. Others are more interesting:
    ```
    >> '+9_
    *** Syntax Error: (line 1) invalid integer at '+9_
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '+9-
    *** Syntax Error: (line 1) invalid date at '+9-
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '+9@
    == '+9@
    >> '+9$
    *** Syntax Error: (line 1) invalid integer at '+9$
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '+9:
    *** Syntax Error: (line 1) invalid time at '+9:
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    >> '+9%
    *** Syntax Error: (line 1) invalid float at +9%%   ; Note the doubled sigil
    *** Where: set
    *** Near : :delimiter-lex
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2022-08-26T10:37:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228337175>

    This issue is broader:
    ```
    >> '+1
    == 2511
    >> '-1
    == 2531
    >> :+1
    == 3511
    >> :-1
    == 3531
    >> =1
    == 131
    ```
    
    For literals starting with quote and colon, those are just wrong entries in the lexer table, so an easy fix. OTOH, equal character is rather problematic, as it has special meaning in conjuction with `<`.

--------------------------------------------------------------------------------

On 2022-08-26T10:42:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228341667>

    `=` should just start a word/set-word/path/set-path, why is it problematic?

--------------------------------------------------------------------------------

On 2022-08-26T11:24:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228375254>

    Because we are allowing those words: https://github.com/red/red/blob/master/tests/source/units/lexer-test.red#L1488
    
    And you're the one who requested such support: https://github.com/red/red/issues/4562#issuecomment-841802031

--------------------------------------------------------------------------------

On 2022-08-26T11:28:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228378554>

    IMO it shouldn't be any different from e.g. `a<a` which I also expect to be a word, but it opens a tag ;) But OK, sticking rules come into play.
    But those are still words, `=` shouldn't start a number in any circumstances.

--------------------------------------------------------------------------------

On 2022-08-26T11:31:18Z, dockimbel, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228381247>

    `a<a` is not a word, because there's an "unsticking" rule for words preceding immediatly `<`, so it's `a` and opening tag `<a`. OTOH, `=`  is allowed to stick to `<`, so it needs its own row in the lexer table now in order to satisfy all the constraints.
    

--------------------------------------------------------------------------------

On 2022-08-26T11:37:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228386290>

    By the way, do we need this tag unsticking in practice? Because I have a feeling it's a huge lexing troublemaker, and a very rarely used datatype. Also email is near useless datatype with huge lexical collisions.

--------------------------------------------------------------------------------

On 2022-08-26T11:38:15Z, dockimbel, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228386951>

    We can reexamine those choices when working on the Red language specs. The unsticking rule is for avoiding wrong lexing of mixed tags with words inputs:
    ```
    >> load {<b><i>Hello</i></b>}
    == [<b> <i> Hello </i> </b>]
    >> [<b><i>Hello</i></b>]
    == [<b> <i> Hello </i> </b>]
    ```

--------------------------------------------------------------------------------

On 2022-08-26T11:43:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228390829>

    Noted. But it looks like a contrived example, as it's not generally loadable anyway, e.g. `{<b><i>Hello, world</i></b>}`.

--------------------------------------------------------------------------------

On 2022-08-26T11:45:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5185#issuecomment-1228392136>

    ```
    >> name: "Bob"
    == "Bob"
    >> to-string reduce [<b><i>name</i></b>]
    == "<b><i>Bob</i></b>"
    ```
    
    Not sure it's worth supporting anymore though, given the cost in increased lexer rules complexity.

