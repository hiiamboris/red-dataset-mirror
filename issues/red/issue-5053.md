
#5053: Integer overflow in modulo (ex-#1515)
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5053>

**Describe the bug**
```
>> modulo 7FFFFFFFh 100
*** Math Error: math or number overflow
*** Where: +
*** Stack: modulo mod  

>> mod 7FFFFFFFh 100
*** Math Error: math or number overflow
*** Where: +
*** Stack: mod 

>> mod 7F000000h F000000h
*** Math Error: math or number overflow
*** Where: +
*** Stack: mod  

>> 7F000000h // 1000000h
*** Math Error: math or number overflow
*** Where: +
*** Stack: mod  
```
etcetera

**To reproduce**

```
modulo 7FFFFFFFh 100
mod 7FFFFFFFh 100
mod 7F000000h F000000h
7F000000h // 1000000h
```

**Expected behavior**

In my modulo [implementation](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/modulo.red) works as follows:
```
>> modulo 7F000000h 1000000h
== 0
>> modulo/trunc 7F000000h 1000000h
== 0
>> modulo/floor 7F000000h 1000000h
== 0
>> to-hex modulo 7F000000h F000000h
== #07000000
>> to-hex modulo/trunc 7F000000h F000000h
== #07000000
>> to-hex modulo/floor 7F000000h F000000h
== #07000000
>> to-hex modulo 7FFFFFFFh F000000h
== #07FFFFFF
>> to-hex modulo/trunc 7FFFFFFFh F000000h
== #07FFFFFF
>> to-hex modulo/floor 7FFFFFFFh F000000h
== #07FFFFFF
```

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-03T22:37:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5053#issuecomment-1029466651>

    @greggirwin @qtxie What do you think about @hiiamboris implementation of `modulo` above? 

--------------------------------------------------------------------------------

On 2022-02-04T01:10:19Z, greggirwin, commented:
<https://github.com/red/red/issues/5053#issuecomment-1029547645>

    There's a lot of related chat in https://github.com/red/red/issues/2433 as well.
    
    - No problem with his logic. Well researched and documented. We are in tradeoff and design choice territory here.
    - I think I noted his clever `|b|` naming in another bit of code, which I'm OK with in specific cases. Fine here, but I'd like a comment about them too, to highlight that Red gives you this kind of flexibility in domain use, even when not using full blown dialects. 
    - It's nice not to get errors for values that seem sensible (e.g. 100), though using 100.0 solves the problem in the examples. 
    - Q. @hiiamboris what code made you hit these errors?
    - Refinement options puts things in advanced user's hands, since there's no single, right answer.
    - The big question for me is whether it needs to support `[char! tuple!]`. What are the practical use cases for those? Without those, the `positives!` logic goes away.
    - Q. @hiiamboris did you use `/round` rather than making that the default because naming its negation was tricky?
    
    What we gain here, and something to think about for Red in general, is more thorough and robust design compared to what may have been simplistic and convenient implementations in Rebol, in return for more code and performance hits. I think that's a good tradeoff in this case.

--------------------------------------------------------------------------------

On 2022-02-04T12:55:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/5053#issuecomment-1029961274>

    > Q. @hiiamboris what code made you hit these errors?
    
    Well that was more than 3 years ago so ask something simpler :)
    
    > The big question for me is whether it needs to support [char! tuple!]. What are the practical use cases for those? Without those, the positives! logic goes away.
    
    Note that it's just an error reporting logic, telling us that we can't have that result correct.
    Practical use cases? For example `#"Z" % 32 = 26` gives you case-insensitive alphabet letter number. Though `#"Z" and 31` does the same so it's not important. For tuples, idk. It's hard to imagine what use one might find for such a general operation as modulo. I don't think these are important beyond PoC.
    
    > Q. @hiiamboris did you use /round rather than making that the default because naming its negation was tricky?
    
    - Yes, that too but
    - `%` (CPU operation) causes minimum distortion. It even preserves values such as:
    ```
    >> mold/all modulo/trunc 1e-200 1.0
    == "1.0e-200"
    ```
    I aim to preserve as much as possible by default. `/round` is more destructive. Though it also more artifact-resistant.
    - `/round` lowers performance
    
    Red current behavior is weirdly mixed: `%` does not round, `//` does. So I cannot say "compatibility".
    
    > in return for more code and performance hits
    
    Not that huge, this hit, and if we care we can make a routine:
    ```
    >> clock/times [modulo 1000.0 10] 1000000
    2.39 μs	[modulo 1000.0 10]
    == 0.0
    >> clock/times [modulo/round 1000.0 10] 1000000
    4.63 μs	[modulo/round 1000.0 10]
    == 0.0
    
    >> clock/times [modulo-old 1000.0 10] 1000000
    3.12 μs	[modulo-old 1000.0 10]
    == 0
    ```

