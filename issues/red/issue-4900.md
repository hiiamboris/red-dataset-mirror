
#4900: `fmod` platform discrepancy leads to modulo ambiguity
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/4900>

**Describe the bug**
```
Red/System []
probe fmod 123.0 1.0 / 0.0
```
Result on Windows:
```
-1.#IND.0
```
On Linux:
```
123.0
```

So it gets carried into Red code:
```
>> 123 % 1.#inf
== 1.#NaN        ;) Windows
== 123.0         ;) Linux
```

**Expected behavior**

I think Linux result makes more sense. Whatever the dividend is, infinite divisor is still bigger than it, so the remainder should be the dividend.

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
Red 0.6.4 for Linux built 11-May-2021/6:20:25+03:00  commit #81d0416
```



Comments:
--------------------------------------------------------------------------------

On 2021-05-15T09:18:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4900#issuecomment-841628308>

    Mac's libc also returns `123.0`, as well as GCC-compiled exe on Windows.
    
    The only related info I could find: https://math.stackexchange.com/questions/1920333/modulo-and-infinity-why-is-x-bmod-infty-equal-to-x-for-binary-operations-on/1920338#1920338

--------------------------------------------------------------------------------

On 2021-07-03T11:24:43Z, dockimbel, commented:
<https://github.com/red/red/issues/4900#issuecomment-873392811>

    AFAIK, modulo operation in maths (congruence) is defined only for integer numbers > 1. The fact that programming languages allow it for negative and decimal numbers too is resulting in many competing interpretations with [no common standard](https://en.wikipedia.org/wiki/Modulo_operation#In_programming_languages).
    
    We used to rely on the CPU built-in floating-point modulo, but results were inconsistent across CPU. Then someone proposed to use the "standard" `fmod()` from libc, which does not seem better, at least in edge cases like above where even the definition is breaking down, unless IEEE754 standard is defining what should happen there (IIRC, there's no modulo in IEEE754). 
    
    So we either live with such inconsistent edge cases that should never happen in proper code, or we remove modulos on floats. Which one do you prefer?

--------------------------------------------------------------------------------

On 2021-07-03T11:32:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4900#issuecomment-873393605>

    I propose a special case made *only for Red modulo*, to have a consistent result.
    
    And this ticket should also link to https://github.com/red/red/issues/2433.

--------------------------------------------------------------------------------

On 2021-07-03T17:29:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4900#issuecomment-873441587>

    Whatever we choose (consistency is nice, but _sometimes_ pragmatism wins), we can doc it. That is, limiting to positive integers wins for correctness, but someone can always enforce that in their code if they need to.

