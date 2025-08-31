
#3215: WISH: scientific notation for INTEGER!s
================================================================================
Issue is closed, was reported by 9214 and has 12 comment(s).
<https://github.com/red/red/issues/3215>

I wish I could use E-notation to write large integers more shortly, say, `10e8` vs `1'000'000'000`. However, currently Red supports this notation only for `float!`s.
```Red
>> 10e8
== 1000000000.0
```

What I propose is to use uppercase `E` for integers and lowercase for floats, i.e.:
```Red
>> 10e8
== 1000000000.0
>> 10E8
== 1000000000
```
Or, since Red is case-insensitive, make `integer!` case the default one and write `float!`s explicitly as `10.0e8`?


Comments:
--------------------------------------------------------------------------------

On 2018-01-28T10:35:23Z, ghost, commented:
<https://github.com/red/red/issues/3215#issuecomment-361053069>

    👎 from me. 
    > What I propose is to use uppercase E for integers and lowercase for floats
      
    and
      
    > Or, since Red is case-insensitive, make integer! case the default one and write float!s explicitly as 10.0e8
      
    In both cases it is pretty easy to get confused or make mistake.
    
    Also, i don't think there are going to be many use cases where you would need to use something like `10e8` for int, so supporting this use case does not seem a good idea considering the fact that it would be pretty easy to make mistake especially for a newcomer for whom this change would be IMHO an unwelcome surprise.

--------------------------------------------------------------------------------

On 2018-01-28T16:11:50Z, 9214, commented:
<https://github.com/red/red/issues/3215#issuecomment-361074180>

    And typing 9 zeros by hand is less error-prone? Either this or explicit `to` conversion.
    
    Use-cases? Any non-trivial computation or math problem, profiling loop with large number of iterations.
    
    How is it confusing when in `10e8` left-hand side is an integer, hence the result is an integer, and in `10.0e8` left-hand side is float, so as the result? I can't see any reason (aside from R2 compatability) why existent syntax should produce float in both cases.

--------------------------------------------------------------------------------

On 2018-01-28T16:17:14Z, 9214, commented:
<https://github.com/red/red/issues/3215#issuecomment-361074584>

    And how newcomer can be surprised with a change if he is, by definition, a newcomer who doesn't even know syntactic rules and can't compare two things about which he's not yet aware?

--------------------------------------------------------------------------------

On 2018-01-28T21:29:20Z, endo64, commented:
<https://github.com/red/red/issues/3215#issuecomment-361097678>

    But please do not make scientific notation  default for results:
    
    ```
    >> form 1 / 70.0
    == "0.01428571428571429" ; red
    == "1.42857142857143E-2" ; rebol
    ```
    I always had to use `format-number` function to "fix" this unwanted scientific format for all numbers, it is very time consuming task when we have thousands of numbers

--------------------------------------------------------------------------------

On 2018-02-04T19:04:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3215#issuecomment-362930824>

    > Use-cases? Any non-trivial computation or math problem, profiling loop with large number of iterations.
    
    For non-trivial math problems, what is the win with making the result an integer? There may be non-trivial integral math problems, but I'd hazard a guess that they're the exception, and this notation would lead to more internal type conversions, or requiring the use of 1.0e8 notation for floats. Being explicit there may not be all bad though.
    
    I don't see the benefit in loop counting, but then we've never had it to use and get accustomed to. My first thought when seeing E notation is that calculations are involved, not just a value that is never used in a computation.

--------------------------------------------------------------------------------

On 2018-02-04T19:25:06Z, 9214, commented:
<https://github.com/red/red/issues/3215#issuecomment-362932275>

    Well, since it introduces overhead and confuses everyone, I'll retract my wish. On a side note, whenever I use E-notation in Red, I somehow expect `integer!` instead of `float!`, but don't mind to use explicit conversion.
    
    My confusion comes from the fact that `10e8` is a shortcut for `10 * (10 ** 8)`, which, surprisingly...
    ```Red
    >> 10e8
    == 1000000000.0
    >> 10 * (10 ** 8)
    == 1000000000.0
    ```
    ... produces a `float!` too. Well, it doesn't make much sense to ask for this change then, as it will also introduce incompatibility with R2.

