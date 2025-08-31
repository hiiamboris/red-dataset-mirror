# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2015

## Sunday 13th September, 2015

PeterWAWood

[04:54](#msg55f5017f1470fcda04fe55a6)I'm having a little trouble with array literals. The results from this short program are not what I expected:

Code

```
Red/System []

a: as float32! 1.0
b: as float32! 2.0

arr: [1.0 2.0]
print ["Float   1.0 = " arr/0 " 2.0 = " arr/1 lf]

arr2: [a b]
print ["Float32 1.0 = " arr2/0 " 2.0 = " arr2/1 lf]
```

Result

```
Float 1.0   = 9.881312916824931e-324 2.0 = 1
Float32 1.0 = 9.881312916824931e-324 2.0 = 1
```

[05:00](#msg55f502ec1d2400ca275a262c)When I try to typecast float1 literals to float32! inside the "literal array", the compiler crashes:

Code

```
Red/System []

arr: [(as float32! 1.0) (as float32! 2.0)]
print ["Float 1.0   = " arr/0 " 2.0 = " arr/1 lf]
```

Compiler Output

```
-=== Red Compiler 0.5.4 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: get-type-id 
*** Near:  [pick [int-ptr! byte-ptr!] type/2/1 = 'integer!]
```

[05:01](#msg55f5030e73ecb93f5cdce656)Both on OS X on gui branch.

[22:49](#msg55f5fd5eda7f753c6b510d74)@dockimbel @qtxie I have worked out, after a night's sleep, that arrays created with block syntax are actually 1-based with the number of elements stored at the 0 position.

## Monday 14th September, 2015

PeterWAWood

[09:05](#msg55f68de3b76e1ce503f79bd6)I also managed to forget the "path" notation for pointers were 1-based :-(

dockimbel

[09:44](#msg55f696f37742b5c02d97b161)@PeterWAWood Literal arrays are documented \[here](http://static.red-lang.org/red-system-specs-light.html#section-4.8.6).

PeterWAWood

[11:28](#msg55f6af54f5b168df6ebbab7b)@dockimbel Thanks

## Tuesday 15th September, 2015

dockimbel

[05:44](#msg55f7b05a8cc5f90a4fb6e736)R/S only supports \*literal arrays* for now, so it means that only strict literal values can be used in the block, no type casting, no variables.

PeterWAWood

[05:56](#msg55f7b31cf66d320b4fbd8fd7)@dockimbel Thanks. As there is not a literal value format for float32! should I change this line in the language specification?

```
<items>    : is a non-empty list of integer!, byte!, float! or float32! values.
```

perhaps to:

```
<items>    : is a non-empty list of integer!, byte!, or float! literal values.
```

dockimbel

[06:14](#msg55f7b74afe4ca46810e1b0a7)@PeterWAWood Right.

[06:16](#msg55f7b7a38cc5f90a4fb6e7be)I was thinking lately about using a prefix for forcing literal numbers to a different format. I'm using `#u16` prefix already for forcing R/S compiler to encode a literal c-string in UTF-16 format.

[06:19](#msg55f7b872a2c7aa6b1086865a)But I'm not entirely satisfied with the extra verbosity.

PeterWAWood

[06:19](#msg55f7b88b8cc5f90a4fb6e7d4)I guess it would be necessary to swap the alpha and number for numeric literals.

[06:20](#msg55f7b899f66d320b4fbd9030)eg. #32f1.0

dockimbel

[06:22](#msg55f7b928a2c7aa6b10868670)Maybe a suffix would read better: `1.0#32`, `123#16`, `40#8`, `123#64`.

PeterWAWood

[06:23](#msg55f7b9798cc5f90a4fb6e7eb)The suffix looks easier on the eye and the # nicely separates the size from the number.

[06:24](#msg55f7b9aefe4ca46810e1b0e6)40#8 is certainly less verbose than #"^(40)" :-)

dockimbel

[06:26](#msg55f7ba1618e0111d7e4ee24b)In the case of the float32! array a global prefix could be used: `#f32 [1.0 2.0 3.0]`.

[06:27](#msg55f7ba3a8cc5f90a4fb6e7fa)Or `#float32 [1.0 2.0 3.0]`.

PeterWAWood

[06:27](#msg55f7ba45fe4ca46810e1b0fe)I think Oldes asked for that in the Red channel

[06:28](#msg55f7ba888cc5f90a4fb6e801)I think

```
#float32
```

would be better, it is clearer and whilst a little longer you only write it one for a whole array.

dockimbel

[06:28](#msg55f7baa8f66d320b4fbd906e)These are R/S extensions worth considering, especially when we'll add support for integer16! (in the next months).

PeterWAWood

[06:29](#msg55f7bad08cc5f90a4fb6e804)Would it make be easier to handle if it was

```
#type! [1.0 2.0 3.0]
```

?

dockimbel

[06:30](#msg55f7baef18e0111d7e4ee257)I was thinking about `#f32` for consistency with `#u16`, which is already in use.

PeterWAWood

[06:30](#msg55f7bb0d18e0111d7e4ee260)eg

```
#float32! [1.0 2.0 3.0]
```

or

```
#integer16! [1 2 3]
```

dockimbel

[06:31](#msg55f7bb4018e0111d7e4ee26a)@PeterWAWood For the compiler, it doesn't matter how you write the prefix.

PeterWAWood

[06:31](#msg55f7bb4bf66d320b4fbd908e)When I first saw

```
#u16
```

I thought of uint16

dockimbel

[06:31](#msg55f7bb5ffe4ca46810e1b11e)It's used before c-strings only.

[06:32](#msg55f7bb728cc5f90a4fb6e827)`u` refers to Unicode or UTF.

PeterWAWood

[06:34](#msg55f7bbe78cc5f90a4fb6e837)When I first read your note, I thought but should u16 be used for unsigned integers?

[06:35](#msg55f7bc4aa2c7aa6b108686d2)Could 1234#u16 still be used for unsigned 16-bit integer literal values if they are needed in the future?

[06:36](#msg55f7bc6b18e0111d7e4ee28a)Should I write this conversation up as a proposal on the Wiki?

[06:41](#msg55f7bdb618e0111d7e4ee2b2)By the way, would there be any complication with the lexer handling #float32 due to the fact it is a valid issue! even whether the "body" of the issue is a string! or a word! ?

dockimbel

[10:24](#msg55f7f1f2fe4ca46810e1b817)I'm not sure we need to support unsigned integers. In case we add them at some point in the future, we can use the `1234#u16` syntax, no problem with that (just needs to extend the lexer for that to load it as \[1234 #u16] so it can be easily processed by the compiler).

[10:25](#msg55f7f20df66d320b4fbd9780)You can make a wiki entry about this topic, yes.

[10:27](#msg55f7f277f66d320b4fbd9792)The lexer has no problem with issue values, I'm not aware of any problem for such use-cases.

[10:28](#msg55f7f2c9a2c7aa6b10868dd8)BTW, my assistant didn't send the tablet to you as it seems that the regulations forbid sending devices including lithium batteries overseas by plane. So we are looking for a way to ship it by ground or sea instead.

[12:10](#msg55f80ad3a2c7aa6b10869134)Oops, wrong channel. :-)

PeterWAWood

[23:04](#msg55f8a41018e0111d7e4f0b0d)@dockimbel Two last questions on the proposed additional Red/System literal values.

The first is confirmation of my understanding of the lexer, it will be happy with both of the following

```
Red/System []
    utf16-str: #u16 "my Window widestring"
    my-arr: #float32 [1.0 2.0 3.0]
```

```
Red[]
    f: func [iss1 iss2 blk] [ ....]
    f #u16 #float32 [1.0 2.0 3.0]
```

[23:19](#msg55f8a79f78514db1064f3c82)The second is endianness of UTF-16 string literals. Currently this isn't an issue as Red targets are all little endian. At some stage, I can foresee demand for PowerPC support as surely Red would be a great embedded scripting tools in games.

Whilst considering endianness for numbers can be delayed as numeric literals are the same whatever the endianness of the processor (as long as we stick to UTF-8 source), the same is not true of UTF-16 string literals. If support for big-endian processors is added, there will be the need to identify the endianness of "wide-strings" to retain source portability.

I'm sure that you have a plan for this as how could you ever get IBM to adopt Red if it doesn't run on their big machines? ;-)

## Wednesday 16th September, 2015

dockimbel

[04:19](#msg55f8edd918e0111d7e4f10e4)The UTF-16 version we support for now is UTF-16LE (so little endian variant). That encoding is not necessarily dependent on the platform's endianness.

[04:22](#msg55f8ee7e78514db1064f4226)`#u16` is for R/S only, Red strings don't require that, as they have their own Unicode encoding and can be (auto-)converted to the right encoding on I/O. Also, `#float32` is premature for Red as we don't have float32! support there. If we had it, we would need to prefix every float value, we cannot prefix the block, as it can contain any kind of datatype.

[04:32](#msg55f8f0e1f66d320b4fbdbde4)Moreover, the #u16 prefix is supposed to be used in platform-specific code only, not in cross-platform parts.

## Thursday 17th September, 2015

PeterWAWood

[03:48](#msg55fa382918e0111d7e4f445b)Thanks for the explanation. Let me rephrase my question about the lexer. Will a user still be able to the values #u16 and #float32 as issues in their Red program. (I know that it is very unlikely that anybody would ever want to do so).

dockimbel

[03:56](#msg55fa39ea18e0111d7e4f447c)@PeterWAWood In Red, yes, you can use any issue value. Some might eventually be processed by the compiler/interpreter depending on where you use them (as "code" or as data).

PeterWAWood

[03:59](#msg55fa3a8f0ed44a00046ea20a)Thanks for the clarification.

[05:08](#msg55fa4ac6c588a0de6edeead5)I've created a PR for the update to the Red/System docs ... just in case you don't want to change them.

## Friday 13th November, 2015

PeterWAWood

[08:40](#msg5645a20daca9bb7c6e503b74)@dockimbel What is the correct result from casting an empty c-string! ("") to logic! - true or false ?

dockimbel

[08:42](#msg5645a271fc923f4438d43dc6)It should raise an error IIRC, let me check in the docs... Ah, we have allowed it. In such case, the result should be `true`, as only a `null` c-string! pointer should return `false`.

PeterWAWood

[08:54](#msg5645a52c8b242470793d56ff)Thanks.

## Sunday 22nd November, 2015

PeterWAWood

[22:45](#msg5652457c1a00e4f00803e728)@dockimbel @qtxie

This test is failing in float32-test, there is a comment that it is a rounding error:

```
(as float32! 0.0) = (as float32! sin pi64)
```

Is the rounding error significant?

If not, I'll change the test to be approximately equal.

## Monday 23th November, 2015

PeterWAWood

[01:23](#msg56526a82ce18827866f5200e)

```
Spider Monkey
js> Math.sin(3.14159265358979323846);
1.2246467991473532e-16
```

```
JavaScript Core
>>> Math.sin(3.14159265358979323846);
1.2246467991473532e-16
```

A got a similar result from R (but lower precision):

```
> sin(3.14159265358979323846)
[1] 1.224647e-16
```

&gt;

[01:31](#msg56526c58a051fea342433899)Just to check I performed the same calculation on Windows:

```
PS E:\Code\Red\View> [System.Math]::Sin(3.14159265358979323846)
1.22460635382238E-16
```

[01:31](#msg56526c8fa051fea3424338a1)I propose to change the tests to something like:

```
1.22464679914735E-16 = sin pi64
(as float32! 1.22464679914735E-16) = (as float32! sin pi64)
```

I'll use a value that is appropriate for windows, linux and OS X.

[01:59](#msg56527309a051fea342433994)In the end I changed to test for 0.0 with a tolerance. It was easier than trying to find a high precision number that would work on all three platforms.

dockimbel

[02:39](#msg56527c4906a214f1080b335c)@PeterWAWood Looks ok to me. @qtxie, what do you think?

qtxie

[04:29](#msg5652963f0da2846a2bd2d265)I'm ok with that.

PeterWAWood

[04:48](#msg56529a9ca051fea342433fe4)Thanks

## Thursday 3th December, 2015

Oldes

[14:57](#msg56605870480c6db205177b88)@dockimbel Was trying to fix https://github.com/red/red/issues/1472 and found this line: https://github.com/red/red/blob/master/runtime/natives.reds#L1073 where

```
cased
```

can be

```
-1
```

or

```
1
```

. Which means, that value

```
2
```

is converted to

```
logic!
```

and than it's not possible to negate such a value.

[15:06](#msg56605a6722df37d14f93b593)In other words... when I add this probes after the line:

```
probe cased
probe case?
probe not case?
```

I get this output when not using

```
/case
```

:

```
-1
false
true
```

but this with it:

```
1
true
true
```

[15:09](#msg56605b326ddbc1b327481e98)@dockimbel In simplified R/S case:

```
Red/System []

i: 1
case?: as logic! i + 1
probe i
probe case?
probe not case?

i: 2
case?: as logic! i
probe i
probe case?
probe not case?
```

will output:

```
1
true
true
2
true
false
```

[15:10](#msg56605b499a969fd24f3c5650)Any idea what is wrong? https://github.com/red/red/issues/1481

## Friday 4th December, 2015

dockimbel

[02:18](#msg5660f80c1ab838e56dae08c9)@Oldes I think the type casting is not coercing the integer value to a 0 or 1 value internally for a proper logic representation.

PeterWAWood

[04:00](#msg56610ff0d2a5a7813cd42947)@dockimbel Other type casts do not coerce the underlying value, are you going to make an exception for

```
as logic!
```

?

dockimbel

[04:17](#msg566113e71ab838e56dae0b95)@PeterWAWood It is already the case for `as logic!` and `as byte!`.

Oldes

[08:23](#msg56614d941da31ad605a8d1a1)@dockimbel what makes the difference between

```
2
```

and

```
i + 1
```

? Because there seems not to be problem with converting value

```
2
```

to proper logic, but when used as expression, than it's somehow invalid (that it has proper value, but it's not possible to negate it)

dockimbel

[08:43](#msg566152211da31ad605a8d225)@Oldes Might be an issue with how `not` is handled by the R/S compiler.

Oldes

[08:48](#msg5661534f10eeaf6220870abc)https://github.com/red/red/blob/gui/system/targets/IA-32.r#L452

[08:49](#msg5661538610eeaf6220870ac0)But if I'm not wrong, the casting is already changing the values to

```
0/1
```

https://github.com/red/red/blob/gui/system/compiler.r#L850

[08:50](#msg566153e61ab838e56dae10da)So there is something different in the expression handling in the casting.

[08:52](#msg5661544110eeaf6220870ad6)Hm.. never mind.. I don't want to take your time for more important things.. it's just my short diving into deep internals :)

[08:55](#msg5661550c5057376520db823d)@dockimbel Maybe one more thing... using the verbose mode durring compilation, I can locate this:

```
expr: [i: 1]
expr: [case?: make object! [
        action: 'type-cast
        type: [logic!]
        data: [+ i 1]
    ]]
>>>calling: + [i 1]
>>>inlining integer op: + [i 1]
a: ref
b: imm
>>>loading i
>>>storing case? <last>
```

versus:

```
expr: [i: 2]
>>>loading 2
>>>storing i 2
expr: [case?: make object! [
        action: 'type-cast
        type: [logic!]
        data: 'i
    ]]
>>>loading make object! [
    action: 'type-cast
    type: [logic!]
    data: 'i
]
>>>loading i
>>>converting from integer! to logic! ;<----------------------- maybe this is the missing part?
>>>storing case? i
```

Is there some way how to get such a traces without need to see other, not related code? Maybe using some directive which would enable verbose mode level changes in code.

dockimbel

[09:04](#msg566157331da31ad605a8d2cb)@Oldes Yes, just wrap the code parts you want to inspect into a pair of `#verbose` directives:

```
#verbose 9
<code>
#verbose 0
```

[09:10](#msg566158751da31ad605a8d2fc)@Oldes Yes, it's possible that there's a missing low-level casting, `not` is an \*intrinsic* function in the R/S compiler, so they are processed differently. IIRC, I have made a fix for `log-b` for a similar issue a few months ago, and similar fix/improvement should be mode for `not` too.

Oldes

[15:08](#msg5661ac8b77d271e66db1f218)@dockimbel is it this one? https://github.com/red/red/commit/b5cebea7c7101a2845f69617956820bf432ba0c7 I would probably need explanation:)

dockimbel

[15:39](#msg5661b3a91ab838e56dae21c3)@Oldes It's that commit. As the comment in the code says, we might need another internal function type. But, the issue might just be a bug unrelated to that, I didn't have the time yet to investigate that issue. Is that a show-stopper for your Red code?

Oldes

[15:45](#msg5661b519c15bca7e3c961833)No, it's not... I actually don't do any Red code yet.. just diving in internals:)

[15:46](#msg5661b54c1da31ad605a8e34f)Actually I was wondering if I could see some pattern which could be used in function inlining in an easy way.

dockimbel

[15:50](#msg5661b6465057376520db9338)Function inlining in R/S can't be done easily in Red 1.0 as it requires a totally different way to manage arguments passing in the native code emitter.

## Tuesday 8th December, 2015

Oldes

[10:30](#msg5666b136835961e946e1db0e)@dockimbel than I'm looking forward to Red 2.x... you know, inlining is the key for good performance, which will be needed soon or later.

dockimbel

[11:00](#msg5666b84cc4b3d2a52a6ae51b)@Oldes It's just one possible optimization among many others. I expect a much bigger gain from a new backend with good registers allocation algorithm + fastcall convention support.

Oldes

[11:09](#msg5666ba5f1af293de46968b74)Whatever.. just have it and have it well documented:)

## Monday 21st December, 2015

PeterWAWood

[05:01](#msg567787bf69a89a8f552f73d2)@dockimbel @qtxie The // and % operators in the Float Auto tests were commented out. The comment said not yet implemented. When I removed the comment, made the float-auto tests and ran them. I got a runtime crash:

```
*** Runtime Error 8: float inexact result
*** at: 0002EAC8h
```

I'll try to isolate which test is crashing.

[05:12](#msg56778a2837169e856a75c421)Have they been implemented yet?

dockimbel

[05:46](#msg5677923df31bbe91555b76c1)@PeterWAWood There is currently a CPU-dependent implementation of those operations.

PeterWAWood

[06:03](#msg5677963437169e856a75c4a7)@dockimbel should I exclude the tests for now?

dockimbel

[08:13](#msg5677b4a5b5777fb85ba4e6f5)@PeterWAWood Yes, please.
