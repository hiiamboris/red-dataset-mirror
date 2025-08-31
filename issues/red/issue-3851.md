
#3851: Comparison operator returns incorrect value.
================================================================================
Issue is closed, was reported by BeardPower and has 48 comment(s).
[status.dismissed] [type.bug]
<https://github.com/red/red/issues/3851>

**Describe the bug**
The comparison operator returns an incorrect value in several cases.

**To reproduce**
Type the following into the REPL:
```
reduce collect [repeat i 10 [keep reduce ['lesser? 'to-percent 3499 + divide i - 1 10.0 '/ 34990 + i - 1 10%]]]
```
Result:
```
== [false true true false false false true true false false]
```

**Expected behavior**
It should return false for every comparison.
```
== [false false false false false false false false false false]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Apr-2019/16:17:51+02:00 commit #64ead34
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-19T17:56:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3851#issuecomment-484971169>

    @BeardPower I don't see why this should be `false` always. You're comparing floating point values near `0.1` (not always rounded up) to an actual constant `0.1`. This result is to be expected.

--------------------------------------------------------------------------------

On 2019-04-19T18:00:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3851#issuecomment-484972380>

    @BeardPower I'll just add that it's *really* hard to tease that expression apart to see what the basic problem is. 

--------------------------------------------------------------------------------

On 2019-04-19T19:35:04Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-484994601>

    > @BeardPower I don't see why this should be `false` always. You're comparing floating point values near `0.1` (not always rounded up) to an actual constant `0.1`. This result is to be expected.
    
    Regardless of comparing floating point near `0.1` or not, it needs to compare correctly, which it does not so how is this result expected?
    

--------------------------------------------------------------------------------

On 2019-04-19T19:37:08Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-484995055>

    > @BeardPower I'll just add that it's _really_ hard to tease that expression apart to see what the basic problem is.
    
    The result of the division combined with a comparison leads to an incorrect result.
    
    ```
    >> 3199.2 < (31992 * 0.1)
    == true
    
    >> 3199.2 < 3199.2
    == false
    >> a
    == 3199.2
    >> b
    == 3199.2
    >> a < b
    == true
    ```
    is `false` not `true`.

--------------------------------------------------------------------------------

On 2019-04-19T19:41:21Z, dockimbel, commented:
<https://github.com/red/red/issues/3851#issuecomment-484995963>

    Indeed, it's a floating point accuracy issue when the value is close to _epsilon_:
    ```
    >> to-binary 3199.2
    == #{40A8FE6666666666}
    >> to-binary 31992 * 0.1
    == #{40A8FE6666666667}
    ```

--------------------------------------------------------------------------------

On 2019-04-19T19:43:02Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-484996337>

    > 
    > 
    > Indeed, it's a floating point accuracy issue when the value is close to _epsilon_:
    > 
    > ```
    > >> to-binary 3199.2
    > == #{40A8FE6666666666}
    > >> to-binary 31992 * 0.1
    > == #{40A8FE6666666667}
    > ```
    
    Any explanation regarding this (there is no division involved, so the accuracy comes from the lexer)?
    
    ```
    >> 3199.2 < 3199.2
    == false
    >> a
    == 3199.2
    >> b
    == 3199.2
    >> a < b
    == true
    ```
    
    

--------------------------------------------------------------------------------

On 2019-04-19T19:45:08Z, dockimbel, commented:
<https://github.com/red/red/issues/3851#issuecomment-484996802>

    @BeardPower Good point. @qtxie ^---

--------------------------------------------------------------------------------

On 2019-04-19T19:45:49Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-484996949>

    > 
    > 
    > @BeardPower Good point. @qtxie ^---
    
    ```
    >> a: 3199.2
    == 3199.2
    >> b: 31992 * 0.1
    == 3199.2
    >> a
    == 3199.2
    >> to binary! a
    == #{40A8FE6666666666}
    >> b
    == 3199.2
    >> to binary! b
    == #{40A8FE6666666667}
    ```

--------------------------------------------------------------------------------

On 2019-04-19T19:48:36Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-484997555>

    > 
    > 
    > On W10:
    > 
    > ```
    > >> a: 3199.2
    > == 3199.2
    > >> b: 3199.2
    > == 3199.2
    > >> to-binary a
    > == #{40A8FE6666666666}
    > >> to-binary b
    > == #{40A8FE6666666666}
    > >> a < b
    > == false
    > ```
    
    I amended my last comment. It's also occurring when multiplied by a fractional number.

--------------------------------------------------------------------------------

On 2019-04-19T19:49:06Z, dockimbel, commented:
<https://github.com/red/red/issues/3851#issuecomment-484997671>

    The lexer is fine, it's the multiplication causing the accuracy issue.

--------------------------------------------------------------------------------

On 2019-04-19T19:57:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3851#issuecomment-484999437>

    Ah, floats. Abandon all hope, ye who enter here.

--------------------------------------------------------------------------------

On 2019-04-19T19:59:47Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-485000013>

    > Ah, floats. Abandon all hope, ye who enter here.
    ```
    >> a: to money! 3199.2
    == $3199.2
    >> b: to money! 31992 * 0.1
    == $3199.2
    >> a < b
    == false
    ```

--------------------------------------------------------------------------------

On 2019-04-19T20:11:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/3851#issuecomment-485002496>

    GCC:
    ```
    #include <stdio.h>
    
    int main()
    {
    	double
    		x = 3199.2L,
    		y = 0.1L,
    		z = 0.1L * 31992;
      	y = y * 31992;
    	puts ( (x < y) ? "x < y" : "x >= y" );
    	puts ( (x < z) ? "x < z" : "x >= z" );
    	return 0;
    }
    ```
    Output:
    ```
    x < y 
    x >= z
    ```

--------------------------------------------------------------------------------

On 2019-04-19T20:24:57Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-485005462>

    > GCC:
    > 
    > ```
    > #include <stdio.h>
    > 
    > int main()
    > {
    > 	double
    > 		x = 3199.2L,
    > 		y = 0.1L,
    > 		z = 0.1L * 31992;
    >   	y = y * 31992;
    > 	puts ( (x < y) ? "x < y" : "x >= y" );
    > 	puts ( (x < z) ? "x < z" : "x >= z" );
    > 	return 0;
    > }
    > ```
    > 
    > Output:
    > 
    > ```
    > x < y 
    > x >= z
    > ```
    
    Nim (vcc):
    ```
    let x:float64 = 3199.2
    var y:float64 = 0.1
    let z:float64 = 0.1 * 31992
    
    y = y * 31992
    
    echo(if x < y: "x < y" else: "x >= y")
    echo(if x < z: "x < y" else: "x >= z")
    ```
    
    Output:
    ```
    x < y
    x < y
    ```
    With float32:
    ```
    x >= y
    x >= z
    ```

--------------------------------------------------------------------------------

On 2019-07-09T10:09:44Z, qtxie, commented:
<https://github.com/red/red/issues/3851#issuecomment-509581259>

    So it's an issue of the IEEE-754 Floating Point?

--------------------------------------------------------------------------------

On 2019-07-09T11:31:55Z, BeardPower, commented:
<https://github.com/red/red/issues/3851#issuecomment-509605384>

    Yes, the usual precision issues with (32-bit) floats.

--------------------------------------------------------------------------------

On 2019-07-10T15:37:19Z, dockimbel, commented:
<https://github.com/red/red/issues/3851#issuecomment-510114267>

    There is no silver bullet for floats comparisons: https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/

--------------------------------------------------------------------------------

On 2019-07-10T15:47:50Z, qtxie, commented:
<https://github.com/red/red/issues/3851#issuecomment-510118431>

    Nim (vcc):
    
    ```
    let x:float64 = 3199.2
    var y:float64 = 0.1
    let z:float64 = 0.1 * 31992
    
    y = y * 31992
    
    echo(if x < y: "x < y" else: "x >= y")
    echo(if x < z: "x < y" else: "x >= z")
    ```
    Here is the C code generated by nim (only copy parts of the code):
    https://repl.it/languages/nim
    ```
    nimfr_("main", "main.nim");
    nimln_(1, "main.nim");
    x_jph5kXQxRKebnRgQXgttaQ = 3.1991999999999998e+03;
    nimln_(2, "main.nim");
    y_tRiEnb9bDvXeTgJ0vrgULEA = 1.0000000000000001e-01;
    nimln_(3, "main.nim");
    z_dncZLlhZqt8zbE4XfA2Tqg = 3.1992000000000003e+03;
    nimln_(5, "main.nim");
    y_tRiEnb9bDvXeTgJ0vrgULEA = ((NF)(y_tRiEnb9bDvXeTgJ0vrgULEA) * (NF)(3.1992000000000000e+04));
    ```
    The literal form of the floating point changed. I'm not sure if the Nim compiler did some tricks or not.

--------------------------------------------------------------------------------

On 2019-07-10T15:49:18Z, qtxie, commented:
<https://github.com/red/red/issues/3851#issuecomment-510119047>

    Let's try to use the same literal form in Red:
    ```
    >> x: 3.1991999999999998e+03
    == 3199.2
    >> y: 1.0000000000000001e-01
    == 0.1
    >> z: 3.1992000000000003e+03
    == 3199.2
    >> y: y * 3.1992000000000000e+04
    == 3199.2
    >> x < y
    == true
    >> x < z
    == true
    ```
    Yeah! Works! ;-)

--------------------------------------------------------------------------------

On 2019-07-10T16:23:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3851#issuecomment-510132392>

    Fantastic that it works, but will it work for all cases? What do other langs, like Julia, R, and Wolfram do? 
    
    I've floated the idea, pun intended, to use a leading `~` for literal float forms, to denote their inexactness. 
    
    The bigger picture, and I know why we have floats, is what Red should use as its standard numeric implementation. I'm all for hardware and performance, don't get me wrong, but if the answers are incorrect...I think that's *much* worse than being slow. If we offer a numeric type that is correct, but also allow people to use float *explicitly* (it's also needed for interop, so has to be supported somehow), I think that's a big win. Really big.

--------------------------------------------------------------------------------

On 2019-07-10T18:29:13Z, qtxie, commented:
<https://github.com/red/red/issues/3851#issuecomment-510176403>

    I think it's just a coincidence that the code works in Nim.
    
    If we have a proper decimal! datatype, using DEC64 (we have a DEC32 implementation, it's a bit limited) or [Unum](https://en.wikipedia.org/wiki/Unum_(number_format)). I vote for making it as the default decimal number in Red. 

--------------------------------------------------------------------------------

On 2019-07-10T18:57:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3851#issuecomment-510186351>

    I was going to mention unum, but thought it wasn't feasible until hardware supported it. I love the concept though. We do need real Dec64, but I think it's also worth (though Harald did a lot of work), you or @dockimbel looking at if we could link Crockford's ASM version, because then it would be fast, and done.

--------------------------------------------------------------------------------

On 2022-08-24T19:45:52Z, dockimbel, commented:
<https://github.com/red/red/issues/3851#issuecomment-1226179348>

    > I think it's just a coincidence that the code works in Nim.
    
    You're correct, here's a bad float handling case from Nim:
    ```
    echo(0.1 + 0.2 == 0.3)
    echo(0.1 + 0.2 > 0.3)
    ```
    gives:
    ```
    false
    true
    ```
    while in Red:
    ```
    >> 0.1 + 0.2 = 0.3
    == true
    >> 0.1 + 0.2 > 0.3
    == true
    ```
    At least, we got a working equality by default (strict equality `==` would return `false`).
    
    In conclusion, there's nothing wrong in Red about float handling, those edge cases comparisons are inherent to the IEEE754 floating point format, so I'll close this ticket.

--------------------------------------------------------------------------------

On 2022-08-24T20:15:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3851#issuecomment-1226240866>

    Should `>` map to the semantics of `=`? We don't have strict versions of greater/lesser, so it could be argued either way. It's just confusing, at a glance, to see `=` and `>` return the same result. `<` returns the opposite so it leaks out floating point behavior in a way that may be hard for people to reason about, because you have to `mold` to see the full value.

