# Archived messages from: [gitter.im/red/red/vector-datatype](/gitter.im/red/red/vector-datatype/) from year: 2015

## Thursday 4th June, 2015

PeterWAWood

[00:20](#msg556f99da27d2203776cc84e9)The compiler supports using both '+ and 'ADD on vectors but the interpreter only supports '+.

This code demonstrates the issue:

```
Red[]

va-v1: make vector! [10 20 30 40 50]
va-v2: make vector! [2 3 4 5 6]

probe add va-v1 va-v2

do [
	vb-v1: make vector! [10 20 30 40 50]
	vb-v2: make vector! [2 3 4 5 6]

	probe add vb-v1 vb-v2
]
```

The output is:

```
mbp:Red peter$ ./test
make vector! [12 23 34 45 56]
*** Script error: add does not allow vector for its value1 argument
*** Where: add
*** Stack: do probe add
```

[00:38](#msg556f9de805c872ce6ac7d647)I'm not clear on what to expect when you add two vectors whose

```
index <> 1
```

.

This codes shows the issue:

```
Red[]

va-v1: make vector! [10 20 30 40 50]
va-v2: make vector! [2 3 4 5 6]

print "both indices = 1"
v: add va-v1 va-v2
print "expected     [12 23 34 45 56]"
probe head v

print " index of first = 2, index of second = 1"
v: add next va-v1 va-v2
print "expected     [10 22 33 44 55 6]"
probe head v

print " index of first = 2, index of second = 2"
v: add next va-v1 next va-v2
print "expected     [10 23 34 45 56]"
probe head v

print " index of first = 2, index of second = 3"
v: add next va-v1 next next va-v2
print "expected     [10 24 35 46 50]"
probe head v
```

Here are the results:

```
both indices = 1
expected     [12 23 34 45 56]
make vector! [12 23 34 45 56]
 index of first = 2, index of second = 1
expected     [10 22 33 44 55 6]
make vector! [22 33 44 55 6]
 index of first = 2, index of second = 2
expected     [10 23 34 45 56]
make vector! [23 34 45 56]
 index of first = 2, index of second = 3
expected     [10 24 35 46 50]
make vector! [24 35 46 50]
```

qtxie

[03:19](#msg556fc3b0813c577e1cf53547)@PeterWAWood 'ADD action's type-checking does not allow vector!, I'll update it's spec.

dockimbel

[03:34](#msg556fc73c1261f8032f547eff):point\_up: \[June 4 2015 11:19 AM](https://gitter.im/red/red/vector-datatype?at=556fc3b0813c577e1cf53547) Don't forget to add vector! to: and, or, xor, remainder and modulo.

[03:34](#msg556fc7551261f8032f547f00)Also, you should move the `modulo` definition from actions.red to functions.red.

[03:38](#msg556fc82fa04a95aa5966a140):point\_up: \[June 4 2015 8:38 AM](https://gitter.im/red/red/vector-datatype?at=556f9de805c872ce6ac7d647) The current results are correct.

[03:38](#msg556fc83cc031e8121ba9ca06)

```
red>> va-v1: make vector! [10 20 30 40 50]
== make vector! [10 20 30 40 50]
red>> va-v2: make vector! [2 3 4 5 6]
== make vector! [2 3 4 5 6]
red>> va-v1: next va-v1
== make vector! [20 30 40 50]
red>> va-v1 + va-v2
== make vector! [22 33 44 55 6]
```

[03:40](#msg556fc8b9c031e8121ba9ca07) `va-v1` and `next va-va1` are different vectors which share the same buffer (same as with all other series).

[03:42](#msg556fc9151261f8032f547f01)`length? next "hi"` does not return 2, but 1. `append "a" next "bc"` does not return `"abc"`, but `"ac"`.

PeterWAWood

[04:03](#msg556fce01777c17d06a13dd5d)But doesn't the underlying buffer still include the values before the current index?

```
red>> b: [1 2 3 4]
== [1 2 3 4]
red>> c: next b
== [2 3 4]
red>> index? c
== 2
red>> head c
== [1 2 3 4]
red>> v: make vector! [1 2 3 4]
== make vector! [1 2 3 4]
red>> w: next v
== make vector! [2 3 4]
red>> index? w
== 2
red>> head w
== make vector! [1 2 3 4]
```

qtxie

[04:14](#msg556fd0a3f40a067d1c9b60eb):point\_up: \[June 4 2015 11:34 AM](https://gitter.im/red/red/vector-datatype?at=556fc73c1261f8032f547eff) When I move `modulo` to funcions.red, will cause compiling error.  
`#load set-word! "//" make op! :modulo`  
In boot.red, operators.red is before functions.red, should I move it after functions.red ?

PeterWAWood

[04:29](#msg556fd43f05c872ce6ac7d9b5):point\_up: \[June 4 2015 12:03 PM](https://gitter.im/red/red/vector-datatype?at=556fce01777c17d06a13dd5d)

So in the case of the mathematics operators, does the vector! returned have a new underlying buffer?

[04:34](#msg556fd53b777c17d06a13dde6)Is it planned to allow use of a scalar value in vector! arithmetic, e.g.

```
>v: make vector! [3 6 9]
>v / 3
>v 
 == make vector! [1 2 3]
```

dockimbel

[04:47](#msg556fd8591261f8032f547f0b):point\_up: \[June 4 2015 12:14 PM](https://gitter.im/red/red/vector-datatype?at=556fd0a3f40a067d1c9b60eb) Yes, move it after functions.red.

[04:50](#msg556fd923a04a95aa5966a147):point\_up: \[June 4 2015 12:29 PM](https://gitter.im/red/red/vector-datatype?at=556fd43f05c872ce6ac7d9b5) Math operations between two vectors will return a new vector (with new underlying buffer). Operations between a vector and a scalar value apply to the same vector.

[04:52](#msg556fd97c1261f8032f547f0c)If you want to preserve a vector from being modified by a math op with a scalar value, you can always `copy` it before the operation.

PeterWAWood

[05:11](#msg556fdde5813c577e1cf53737)Thanks for the clarification.

[09:46](#msg55701e91813c577e1cf53c3a)The rounding doesn't seem quite correct when adding a float! scalar to an integer! vector:

```
red>> add make vector! [1 2 3] 0.4
== make vector! [1 2 3]
red>> add make vector! [1 2 3] 0.5
== make vector! [1 2 3]
red>> add make vector! [1 2 3] 0.6
== make vector! [2 3 4]
```

[10:03](#msg5570225c463d0c7c066e047d):point\_up: \[June 4 2015 5:46 PM](https://gitter.im/red/red/vector-datatype?at=55701e91813c577e1cf53c3a)  
It only seems to be an issue with absolute values less than one:

```
red>> v: make vector! [1 2 3 4]
== make vector! [1 2 3 4]
red>> add copy v 0.5
== make vector! [1 2 3 4]
red>> add copy v 1.5
== make vector! [3 4 5 6]
red>> add copy v -0.5
== make vector! [1 2 3 4]
red>> add copy v -1.5
== make vector! [-1 0 1 2]
```

qtxie

[10:05](#msg557022ddf40a067d1c9b676c):point\_up: \[June 4 2015 5:46 PM](https://gitter.im/red/red/vector-datatype?at=55701e91813c577e1cf53c3a) Yeah, the rounding does not correct. I'll fix it. :smile:

PeterWAWood

[10:06](#msg5570232a27d2203776cc8ec1)Thanks :-)

[10:21](#msg5570269df40a067d1c9b67ce)@qtxie I've uploaded some vector addition tests to the master branch. One is failing, it's the one adding 0.5 to a vector.

qtxie

[10:24](#msg55702771777c17d06a13e4d9)@PeterWAWood OK. Thanks.

PeterWAWood

[11:08](#msg557031c1813c577e1cf53e54)@qtxie There seems to be a sign problem with vector! subtract:

```
red>> v1: make vector! [10 20 30 40 50]
== make vector! [10 20 30 40 50]
red>> v2: make vector! [2 3 4 5 6]
== make vector! [2 3 4 5 6]
red>> v1 - v2
== make vector! [-8 -17 -26 -35 -44]
```

qtxie

[11:26](#msg557035e605c872ce6ac7e231):point\_up: \[June 4 2015 7:08 PM](https://gitter.im/red/red/vector-datatype?at=557031c1813c577e1cf53e54) Ah, another bug. ;-)

PeterWAWood

[13:07](#msg55704da105c872ce6ac7e53f)@qtxie I had to write over 100 tests before I found a bug so no need to get worried :-)

qtxie

[13:46](#msg557056ad813c577e1cf5432a):point\_up: \[June 4 2015 7:08 PM](https://gitter.im/red/red/vector-datatype?at=557031c1813c577e1cf53e54) Fixed it. :smile:

PeterWAWood

[21:58](#msg5570ca16463d0c7c066e1a96)@qtxie 1.5 is now getting rounded down when being added to a vector!

I would have expected .5 to round up rather than down:

```
red>> v: make vector! [10 20 30 40 50]
== make vector! [10 20 30 40 50]
red>> v + 1.5
== make vector! [11 21 31 41 51]
red>> v: make vector! [10 20 30 40 50]
== make vector! [10 20 30 40 50]
red>> v + 1.6
== make vector! [11 21 31 41 51]
```

## Friday 5th June, 2015

qtxie

[00:43](#msg5570f0b905c872ce6ac7f99f):point\_up: \[June 5 2015 5:58 AM](https://gitter.im/red/red/vector-datatype?at=5570ca16463d0c7c066e1a96) It is the same rounding rule as `to integer!`.

[00:44](#msg5570f0e1463d0c7c066e1e55)

```
red>> to integer! 1.5
== 1
red>> to integer! 1.6
== 1
red>> to integer! 0.6
== 0
red>> to integer! 0.5
== 0
```

PeterWAWood

[00:48](#msg5570f1e7463d0c7c066e1e6e)

to integer! truncates the decimal part (as does integer divide). The vector arithmetic is now doing the same. I didn't notice that 1.6 was now being truncated to 1 which is the correct behaviour.

I'll update the tests.

Thanks&gt;

[00:51](#msg5570f29ef40a067d1c9b816c)I've corrected the tests :-)

[09:27](#msg55716b70813c577e1cf55f8e)@dockimbel @qtxie There is an inconsistency when multiplying vectors of unequal length in how the additional digits are handled. So a x b gives a different result to b x a.

```
red>> v1: make vector! [10 20 30 40 50]
== make vector! [10 20 30 40 50]
red>> v2: make vector! [2 3 4 5 6]
== make vector! [2 3 4 5 6]
red>> v1: make vector! [20 30 40 50]
== make vector! [20 30 40 50]
red>> v2: make vector! [2 3 4 5 6]
== make vector! [2 3 4 5 6]
red>> v1 * v2
== make vector! [40 90 160 250 0]
red>> v2 * v1
== make vector! [40 90 160 250 6]
```

I believe that a * b = b * a is an axiom of maths so the question is which one is correct?

I thought I'd try the calculation using R and got these results:

```
> v = c(20, 30, 40, 50)
> w = c(2, 3, 4, 5, 6)
> v * w
[1]  40  90 160 250 120
Warning message:
In v * w : longer object length is not a multiple of shorter object length
> w * v
[1]  40  90 160 250 120
Warning message:
In w * v : longer object length is not a multiple of shorter object length
>
```

So R did give the same answer for v * w and w * v applying what it's docs call the recycling rule.

[10:45](#msg55717dd9813c577e1cf561ad)I am trying, unsuccessfully so far, to find a reference on how to calculate the cross product of two vectors of different length. In addition to R, I tried Wolfram which wouldn't provide the cross product unless the vectors were the same length. (Though it could be that I don't know enough Wolfram).

[10:57](#msg55718091463d0c7c066e29c2)It also seems that Matlab also will only perform an element by element multiplication if the vectors are of the same length.

[11:09](#msg5571836105c872ce6ac80565)Though I have learned that multiply two vectors (element by element) gives the matrix product not the cross product (which an algebraic concept).

[11:20](#msg557185eef40a067d1c9b8d11)Haskell just returns just ignores the elements of the longer vector that have no match:

```
λ zipWith (*) [1,2,3] [2,3,4]
[2,6,12]:: Num c => [c]
λ zipWith (*) [1,2,3] [2,3,4,6]
[2,6,12]:: Num c => [c]
λ zipWith (*) [1,2,3,4] [2,3,4,6]
[2,6,12,24]:: Num c => [c]
λ zipWith (*) [1,2,3,4] [2,3,4]
[2,6,12]:: Num c => [c]
```

dockimbel

[15:49](#msg5571c524463d0c7c066e328f)@peterwawood Thanks for digging that up. At first look, Haskell way seems the right one to me. For matrix operations, we'll have a matrix type in the future.

iArnold

[19:09](#msg5571f3ee463d0c7c066e383d)Vector multiplication is odd when unequal length vectors are involved. (same for addition and subtraction) Matrix multiplication of a nxm and a mxn matrix is defined. Multiply 2 vectors could be a nx1 * 1xn or 1xn * nx1 matrix multiplication but then perhaps a vertical or horizontal orientation should be added to the vector ( it is a suggestion I do not think that is a serious option ).

PeterWAWood

[23:24](#msg55722fb027d2203776ccc89b)I can also see some benefit in the R recycling approach. I've added a \[proposal](https://github.com/red/red/wiki/Vector-Element-by-Element-Arithmetic) to the Wiki.

## Saturday 6th June, 2015

PeterWAWood

[03:27](#msg5572688e813c577e1cf576a5)This seems like a bug to me:

```
red>> v1: make vector! [integer! 8 [253 254 255]]
== make vector! [integer! 8 [253 254 255]]
red>> v2: make vector! [integer! 8 [3 2 1]]
== make vector! [integer! 8 [3 2 1]]
red>> v1 + v2
== make vector! [integer! 8 [0 0 0]]
```

I would have expected the result to be a 16-bit vector containing \[256 256 256].

dockimbel

[04:41](#msg55727a1705c872ce6ac81b2f):point\_up: \[June 6 2015 11:27 AM](https://gitter.im/red/red/vector-datatype?at=5572688e813c577e1cf576a5) Vector!'s purpose is to provide a compact storage format, so we don't want to have auto-scaling that would suddenly multiply its size by 2, 4 or 8.

[04:45](#msg55727ada05c872ce6ac81b3f):point\_up: \[June 6 2015 3:09 AM](https://gitter.im/red/red/vector-datatype?at=5571f3ee463d0c7c066e383d) Vector! is not a matrix datatype, we will have a true matrix! datatype at some point that will support the matrix algebra.

iArnold

[06:26](#msg557292a805c872ce6ac81c08):point\_up: I know :)

qtxie

[07:32](#msg5572a21927d2203776cccbd5):point\_up: \[June 5 2015 7:20 PM](https://gitter.im/red/red/vector-datatype?at=557185eef40a067d1c9b8d11) I'll change vector!'s arithmatic behave as Haskell.

PeterWAWood

[11:00](#msg5572d2c427d2203776cccd7d)I've completed the set of basic tests for vector!. All 19 tests involving vectors of different lengths fail at the moment. They expect the "Haskell" behaviour.

dockimbel

[11:10](#msg5572d532777c17d06a14234b):point\_up: \[June 6 2015 7:00 PM](https://gitter.im/red/red/vector-datatype?at=5572d2c427d2203776cccd7d) Ok, noted, @qtxie will take care of that in a few hours.

PeterWAWood

[13:24](#msg5572f49df40a067d1c9ba570)@qtxie Quick work with the vector arithmetic changes :+1:

Thanks for correcting my mistake in the tests.

qtxie

[14:09](#msg5572ff25777c17d06a1424cd):point\_up: \[June 6 2015 9:24 PM](https://gitter.im/red/red/vector-datatype?at=5572f49df40a067d1c9ba570) Thanks. :smile:

greggirwin

[23:24](#msg5573812e27d2203776ccd62b)Have to say, it's always exciting to see such fast and positive progress from the Red team.

## Friday 12nd June, 2015

PeterWAWood

[23:06](#msg557b6602873bcf056fb4ec1d)Will the vector! be extended to allow vectors of pair! and percent! ?

[23:07](#msg557b664e630346ab3b03d94f)... and even tuple! ?

## Saturday 13th June, 2015

dockimbel

[03:32](#msg557ba4682a2e056960196e80):point\_up: \[June 13 2015 7:06 AM](https://gitter.im/red/red/vector-datatype?at=557b6602873bcf056fb4ec1d) It would be a natural extension of vector! over new scalar types, so yes. Please open a wish on the tracker, so we don't miss it.

PeterWAWood

[04:27](#msg557bb12734b840066f5dcce3)#1242

## Wednesday 8th July, 2015

meijeru

[16:54](#msg559d55c821e1d6761f2a387f)Should there not be an action `negate` on vectors? At least on vectors of integers and floats. And why not round either? Also, why is swap not defined on vectors?

## Friday 10th July, 2015

dockimbel

[04:45](#msg559f4dd9846f9d040c525e2a)@meijeru `negate` is a math action, so meant to work on scalar values, vector being a series, we don't allow math operations on series. Also, I think it would be confusing if `negate` could be applied on some vectors and not others. OTOH, `swap` is a series action, so it is legitimate to have it working on vector! too, please open a ticket for that so we can keep track of it.

PeterWAWood

[04:47](#msg559f4e7699f62be05c574e07)Wasn't @meijeru asking about

```
negate
```

on an element by element basis?

```
>>negate make vector! [1 2 3]
== make vector! [-1 -2 -3]
```

dockimbel

[05:32](#msg559f58f2c67809ab30635bb7)@PeterWAWood You're right, I actually forgot the semantics of vector! (too many context switching today)... Please ignore my wrong post above.

[05:39](#msg559f5a9099f62be05c574ecd)@meijeru `negate` should be allowed on vector!, `round`could be allowed too.

## Wednesday 16th December, 2015

papamarkou

[09:14](#msg56712b6f187e75ea0e48de74)Hi, this is the first time I try to write to and chat with the Red community. Being a researcher, I use programming languages in the context of scientific computing. I wanted to kindly ask if 1) Red has been designed with the prospect of being used for crunching numbers too in the future. More specifically, there are very mature libraries for matrix algebra and linear algebra. Is there a possibility to either access these libraries via a foreign function interface (FFI) or to build equivalent Red libraries (the latter of course being a non-trivial endeavour)? 2) A second question is whether Red is going to be used in the future for parallel computing; if so, would message passing be similar to one of the existing prototypes?

Oldes

[09:18](#msg56712c593078c07476516bae)@scidom I guess that @dockimbel will answer yes to your question, but not sure when it will happen. Red is still very young, you know? But using existing C libs should be quite easy even now.

## Thursday 17th December, 2015

dockimbel

[05:18](#msg567245bff99ceb846ae65c91)@scidom Welcome! About your questions:  
1\. We certainly would like to use Red for heavy computations in the future. You can easily \[import](http://static.red-lang.org/red-system-specs-light.html#section-15.1) C libraries from Red/System (the low level DSL of Red) and expose the features to Red layer. Do you have suggestions about the best matrix/linear algebra libs which could be used for Red? We should provide some built-in matrix algebra support in post 1.0 version of Red.  
2\. Red, like most other programming tools, will support parallel computing to some extent. I am not sure what you mean by \*would message passing be similar to one of the existing prototypes?* (Why do you think \*message passing* is the only option? Which \*prototypes* are you referring to?)

## Friday 18th December, 2015

papamarkou

[10:50](#msg5673e4ebf99ceb846ae6930d)Thank you @dockimbel. About the points under discussion:

[10:51](#msg5673e5175155bfb75b173578)1) OpenBLAS is perhaps one of the most popular and liberal (in terms of license) options. Here is a link to it: https://github.com/xianyi/OpenBLAS

[10:52](#msg5673e56537169e856a7571f4)2) You are right, message passing is not the only way to do parallel computing. In fact, there is Hadoop's map-reduce paradigm, as well as Spark's approach, so which option would be the best may take some thinking.

dockimbel

[11:00](#msg5673e73e69a89a8f552f2380)@scidom Our plan so far is to use the Actor model (so message-passing) for concurrency handling, though, we might adapt it to our needs and implementation constraints.

papamarkou

[12:28](#msg5673fbf9f31bbe91555b28c5)@dockimbel I haven't used the Actor model myself, but I have heard positive comments about it from members of the Scala community.

dockimbel

[12:34](#msg5673fd49b5777fb85ba49740)The Akka framework in Scala or Erlang's actors are good examples.
