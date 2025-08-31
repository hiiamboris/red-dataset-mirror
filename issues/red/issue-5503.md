
#5503: value? fails
================================================================================
Issue is closed, was reported by TimeSeriesLord and has 16 comment(s).
<https://github.com/red/red/issues/5503>

**The Bug**

value? fails to return true for words having values

**Bug in Action**

```
>> n: 23
== 23
>> value? n
*** Script Error: value? does not allow integer! for its value argument
*** Where: value?
*** Near : value? n
*** Stack:  

>> s: "string"
== "string"
>> value? s
*** Script Error: value? does not allow string! for its value argument
*** Where: value?
*** Near : value? s
*** Stack:  

>> b: copy [ ]
== []
>> value? b
*** Script Error: value? does not allow block! for its value argument
*** Where: value?
*** Near : value? b
*** Stack:  

```
**Expected behavior**

```
? value?
USAGE:
     VALUE? value

DESCRIPTION: 
     Returns TRUE if the word has a value. 
     VALUE? is a native! value.

ARGUMENTS:
     value        [word!] 

RETURNS:
     [logic!]

>> n: 23
== 23
>> value? n
== true
>> s: "string"
== "string"
>> value? s
== true
>> b: copy [] 
== []
>> value? b
== true

```


**Platform version**

----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 38 date: 6-Apr-2024/0:45:40 commit: #36adc615a99a9b5678b7b323dac572ef1c0543ea ]
PLATFORM: [ name: "Debian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'x86_64 version: 6.1.42 build: {#1 SMP PREEMPT_DYNAMIC Mon Jul 31 18:30:05 EEST 2023} ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2024-05-06T04:01:00Z, greggirwin, commented:
<https://github.com/red/red/issues/5503#issuecomment-2095157808>

    `value?` is fine, and correctly throwing an error. You need to pass a `word!` to it, where the errors clearly tell you that you aren't. Try `n: 23   value? 'n`. You need to understand evaluation. Just as important, please use Gitter to ask if things are bugs, after you've seen if there's already a ticket for them, before opening tickets.

--------------------------------------------------------------------------------

On 2024-05-06T04:17:25Z, TimeSeriesLord, commented:
<https://github.com/red/red/issues/5503#issuecomment-2095171193>

    So this is Reddish behavior? It differs from REBOL 2.7.8 and Rebol 3
    
    REBOL 2.7.8
    
    ```
     >> value? 12
    == true
    >> value? #{0A6B14728C4DBEF5} 
    == true
    ```
    Rebol 3  
    ```
    >> value? 12
    == true
    
    >> value? #{0A6B14728C4DBEF5} 
    == true
    
    
    ```
    
    But in Red 0.6.5
    
    ```
    >> value? 12
    *** Script Error: value? does not allow integer! for its value argument
    *** Where: value?
    *** Near : value? 12
    *** Stack:  
    
    >> type? #{0A6B14728C4DBEF5} 
    == binary!
    >> value? #{0A6B14728C4DBEF5} 
    *** Script Error: value? does not allow binary! for its value argument
    *** Where: value?
    *** Near : value? #{0A6B14728C4DBEF5}
    *** Stack:  
    
    ```
    Isn't ` value? 'n` merely asking the interpreter if a literal value is an irreducible value, i.e., a symbol of itself?
    
     

--------------------------------------------------------------------------------

On 2024-05-06T04:25:13Z, TimeSeriesLord, commented:
<https://github.com/red/red/issues/5503#issuecomment-2095176637>

    Your answer seems to be wrong, unless it a design decision for Red. Here is why:
    
    ```
    >> value? 'zzz
    == true
    >> ?? zzz
    zzz: unset!
    >> get zzz
    *** Script Error: zzz has no value
    *** Where: get
    *** Near : get zzz
    *** Stack:  
    ```
    

--------------------------------------------------------------------------------

On 2024-05-06T08:40:56Z, qtxie, commented:
<https://github.com/red/red/issues/5503#issuecomment-2095467048>

    @TimeSeriesLord Seems you are using an old version of Red.
    ```
    >> value? 'zzz
    == false
    >> ?? zzz
    zzz: unset!
    >> about
    Red 0.6.5 for Windows built 6-Apr-2024/8:45:40+08:00  commit #36adc61
    ```

--------------------------------------------------------------------------------

On 2024-05-06T16:01:18Z, greggirwin, commented:
<https://github.com/red/red/issues/5503#issuecomment-2096393547>

    @TimeSeriesLord noted that it was a recent build in their first message. Hmmm.

--------------------------------------------------------------------------------

On 2024-05-06T16:17:39Z, greggirwin, commented:
<https://github.com/red/red/issues/5503#issuecomment-2096424362>

    > Isn't  value? 'n merely asking the interpreter if a literal value is an irreducible value, i.e., a symbol of itself?
    
    No, because `value?` uses a "normal" argument, so when you call it, the argument is evaluated and `value?` only takes `word!` values. So you need to pass a `lit-word!` or `value? first [...]` to pass the word itself. Then `value?` can see if that word is set.
    This is by design because *everything* in Redbol langs is a value so that's sort of meaningless. The doc string also makes it clear that we're talking about what a word refers to. It's still a little confusing and should be improved when we do the red specs project to clearly define more details. That is, everything is a value, but `unset!` is special in that it's sort of a non-value that exists largely for implementation reasons. The confusing part is that `unset!` is truthy (only `false` and `none` are falsy).
    
    I thought it was discussed, but can't find it now, to use `set?` instead of `value?` as the name, and deprecate the former. That would make it much clearer.
    
    e.g. in R2 you get this, because `none!` is a value, even though the doc string said "Returns TRUE if the word has been set.". 
    ```
    >> value? pick [] 1
    == true
    ```
    Which makes no sense.

--------------------------------------------------------------------------------

On 2024-05-06T17:04:59Z, TimeSeriesLord, commented:
<https://github.com/red/red/issues/5503#issuecomment-2096513220>

    Well thanks, Gregg! So in Red, value? functions differently than in REBOL 2.7.8 or Rebol 3.
    
    In the latter two, value? sort of meant "has value" or "reducible to value". 
    
    In Red 0.6.5, it means "only if a word is set to another word, which might or might not be set to a value of some kind, e.g., an irreducible value, a function."
    

--------------------------------------------------------------------------------

On 2024-05-07T21:09:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5503#issuecomment-2099315116>

    Not set to another word, but referring to anything other than `unset`. Here is the actual source code: https://github.com/red/red/blob/master/runtime/natives.reds#L2022
    
    In Red it works roughly like this
    ```
    set?: func [val [word!]][not unset? get/any :val]
    ```
    Now, if we add some debug logic, it should be even more clear.
    ```
    set?: func [
        val [word!]
    ][
        print [mold type? :val  :val  mold type? get/any :val]
        not unset? get/any :val
    ]
    ```
    And some examples:
    ```
    >> set? 'xxx
    word! xxx unset!
    == false
    >> set? 'pi
    word! pi float!
    == true
    >> my-word: 'xxx
    == xxx
    >> set? 'my-word
    word! my-word word!
    == true
    >> set? my-word
    word! xxx unset!
    == false
    ```

