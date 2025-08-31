
#1515: // function gives script error when called with "edge case" values
================================================================================
Issue is closed, was reported by PeterWAWood and has 18 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/1515>

Calling // with extreme values produces a script error:

``` Red
red>> 1.222090944E+33 // -2147483648.0 
*** Script error: < does not allow logic for its value1 argument
*** Where: <
```

(The expected result is 0.0)

Also % also produces an unexpected result with the same data

``` Red
red>> 1.222090944E+33 % -2147483648.0 
== 8.646911284551352e17
```

Again the expected result is 0.0 (but Rebol returns 2147483648.0).



Comments:
--------------------------------------------------------------------------------

On 2016-09-02T13:21:09Z, rebolek, commented:
<https://github.com/red/red/issues/1515#issuecomment-244372803>

    When compiled, it throws different error:
    
    ```
    *** Script Error: + does not allow logic! for its value1 argument
    *** Where: +
    *** Stack: // either all - +
    ```

--------------------------------------------------------------------------------

On 2017-02-21T08:03:17Z, qtxie, commented:
<https://github.com/red/red/issues/1515#issuecomment-281271564>

    It's the float backend's issue.
    Similiar issues: #847, #2184.

--------------------------------------------------------------------------------

On 2017-02-21T08:26:41Z, qtxie, commented:
<https://github.com/red/red/issues/1515#issuecomment-281276046>

    It produces strange result on ARM backend too.

--------------------------------------------------------------------------------

On 2017-07-25T09:42:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1515#issuecomment-317685761>

    It does not error out on compilation anymore. The result is now correct for `//`:
    ```
    >> 1.222090944E+33 // -2147483648.0 
    == 0
    ```
    But still not correct for the other one. Nor is it correct in Red/System. We should probably write soft routines for floating point modulo/remainder support and not use the provided FPU instructions.

--------------------------------------------------------------------------------

On 2018-11-23T22:51:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/1515#issuecomment-441326846>

    Though mod and modulo should be rewritten completely (see https://github.com/red/red/issues/2997 https://github.com/red/red/issues/2674), here are some other problematic cases (an eager overflow caused by addition of operand 1 to operand 2):
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
    and so on...
    
    Red/System does not have this issue btw.

--------------------------------------------------------------------------------

On 2018-12-04T19:15:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/1515#issuecomment-444222062>

    Regarding the initial issue, where the lack of FP precision leads to a wrong result...
    
    Here's an R/S script:
    ```
    Red/System []
    x: 1e20
    loop 21 [
    	print-line [x " -> " x // 1e10]
    	x: x * 10
    ]
    ```
    Results:
    ```
    1e+020 -> 0.0
    1e+021 -> 0.0
    1e+022 -> 0.0
    1e+023 -> 9.99161e+009
    1e+024 -> 9.98322e+009
    1e+025 -> 8.75849e+009
    1e+026 -> 7.58486e+009
    1e+027 -> 5.8486e+009
    1e+028 -> 3.11974e+009
    1e+029 -> 3.15086e+009
    1e+030 -> 1.66198e+019
    1e+031 -> 3.73488e+019
    1e+032 -> 2.98927e+019
    1e+033 -> 4.13014e+019
    1e+034 -> 2.64671e+019
    1e+035 -> 9.27851e+018
    1e+036 -> 1.89981e+019
    1e+037 -> 2.91818e+019
    1e+038 -> 3.6217e+019
    1e+039 -> 7.88637e+028
    1e+040 -> 5.07673e+028
    ```
    As you can see the returned value of `//` and `%` is way bigger than the divisor.
    Same script written in C:
    ```
    #include <stdio.h>
    #include <math.h>
    
    int main()
    {
    	double x = 1e20;
    	int i;
    	for (i = 21; i --;) printf("%le -> %le\n", x, (double)fmod(x,1e10L)), x *= 10;
    	return 0;
    }
    ```
    never produces a result bigger than the divisor:
    ```
    1.000000e+20 -> 0.000000e+00
    1.000000e+21 -> 0.000000e+00
    1.000000e+22 -> 0.000000e+00
    1.000000e+23 -> 9.991611e+09
    1.000000e+24 -> 9.983223e+09
    1.000000e+25 -> 8.758486e+09
    1.000000e+26 -> 7.584860e+09
    1.000000e+27 -> 5.848602e+09
    1.000000e+28 -> 3.119737e+09
    1.000000e+29 -> 3.150857e+09
    1.000000e+30 -> 7.136483e+09
    1.000000e+31 -> 6.388123e+09
    1.000000e+32 -> 3.694911e+09
    1.000000e+33 -> 9.870428e+08
    1.000000e+34 -> 9.870428e+09
    1.000000e+35 -> 7.917976e+09
    1.000000e+36 -> 4.341549e+09
    1.000000e+37 -> 4.709839e+09
    1.000000e+38 -> 7.453175e+09
    1.000000e+39 -> 4.531748e+09
    1.000000e+40 -> 5.317478e+09
    ```
    I think we should strive to fare no worse than C does.

--------------------------------------------------------------------------------

On 2022-01-24T22:32:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1515#issuecomment-1020617755>

    I'll close this ticket as the original issue has been fixed. Feel free to open new tickets for other issues mentioned.

--------------------------------------------------------------------------------

On 2022-01-25T14:01:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/1515#issuecomment-1021211299>

    It's still a bit weird:
    ```
    >> 1.222090944E+33  % -2147483648.0
    == 0.0
    >> 1.222090944E+33 // -2147483648.0
    == 0
    ```
    why one returns integer, but another - float?
    (in my modulo implementation, both return float)

--------------------------------------------------------------------------------

On 2022-01-25T14:52:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/1515#issuecomment-1021264056>

    opened #5053 and #5055

