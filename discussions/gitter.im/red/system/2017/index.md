# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2017

## Wednesday 4th January, 2017

Zamlox

[08:59](#msg586cb97c058ca96737c731d4)How do I get the address of a

```
struct!
```

member as a

```
pointer!
```

type ?:

```
t: declare struct! [
    a    [integer!]
]
```

I want to get the address of

```
t/a
```

and store it in a

```
int-ptr!
```

data type

[09:05](#msg586cbae27a3f79ef5dd451af)For

```
integer!
```

type, if I prefix the data with

```
:
```

I can get its address. Is there an analogue construct for

```
struct!
```

members ?

rebolek

[09:06](#msg586cbb19db9cafe9183b551f)You’ve probably tried, but `:t/a` doesn’t work?

PeterWAWood

[09:11](#msg586cbc497a3f79ef5dd45850)@Zamlox For your specific example, you simply need to cast

```
t
```

to an

```
int-ptr!
```

.

[09:12](#msg586cbc719d4cc4fc53747d7f)Here is an example:

```
Red/System []
t: declare struct! [
    a    [integer!]
	b	 [integer!]
]

t/a: 1
t/b: 2

ap: as int-ptr! t
bp: ap + 1
print ["a via pointer is " ap/value lf]
print ["b via pointer is " bp/value lf]
```

which outputs:

```
../../Code/Red-System/test
a via pointer is 1
b via pointer is 2
```

Zamlox

[09:20](#msg586cbe61058ca96737c752aa)@rebolek YesI tried, but doesn't work.

[09:21](#msg586cbe9b7a3f79ef5dd46231)@PeterWAWood This is basically based on pointer math calculation. I would like to avoid it because my

```
struct!
```

has several fields of different types. But if it'snot possible otherwise then I will do it like that.

PeterWAWood

[09:51](#msg586cc5beaa6be0472f06479f)@Zamlox I don't think that there is any other way with the current compiler.

Zamlox

[10:02](#msg586cc82d9e6f00e74af5611d)ok, thanks.

## Thursday 5th January, 2017

Zamlox

[18:26](#msg586e8fe9c02c1a3959ef190f)I'm trying to create an

```
image!
```

in R/S by delegating the creation to Red layer:

```
#call [ make image! compose [ (size) 255.255.255.255 ] ]
```

but it fails with error:

```
*** Compilation Error: invalid #call function name: make
```

What word should I use instead of

```
make
```

?

[18:29](#msg586e90995ffdeea7230db556)Or how else can I create a

```
red-image!
```

in R/S with a transparent background ?

[19:01](#msg586e97f45ffdeea7230dec1e)I got it. I will check

```
image.reds
```

.

## Thursday 12nd January, 2017

dockimbel

[07:54](#msg5877364be836bf70103306cd)@Zamlox You can't use arbitrary Red code in a `#call` directive, you can only call a single Red function (passing Red values pointers as arguments).

[07:57](#msg58773704300f220a66d9df8c)&gt; How do I get the address of a struct! member as a pointer! type ?

We don't have that feature, though it is worth adding, so you can open a wish ticket for that. In the meantime, you need to do manual pointer arithmetic to get the right address.

Zamlox

[08:01](#msg587737f211e7a7f61d86d782)@dockimbel thanks for explanation regarding

```
#call
```

. I will add a wish ticket later for taking address of struct data members.

## Friday 13th January, 2017

meijeru

[14:05](#msg5878dea2dec171b811e4f413)Observation: Red/System `print` called with an argument which is not a simple value (number, logic or string) will print the pointer value (32 bit address) in hexadecimal. If, as I suppose, this is a feature rather than a bug :smile: , it should be documented. It occurred to me that the Red/Systen documentation says nothing about `print`.

## Saturday 14th January, 2017

dockimbel

[03:43](#msg58799e4b873d96e16d674189)@meijeru The current Red/System documentation only documents the R/S language and semantics, not its runtime library. That should be the topic of another document.

## Wednesday 1st February, 2017

Oldes

[23:19](#msg58926d1ac0f28dd8627203e0)What is the best way to convert

```
red-float!
```

value to

```
red-integer!
```

or even better get the

```
integer!
```

value from it?

## Thursday 2nd February, 2017

PeterWAWood

[00:49](#msg58928210e836bf7010bde81b)@Oldes Take a look at the to func in integer.reds in the red runtime. You can probably use it or workout what you need.

[00:53](#msg589282f9c0f28dd862727871)You can get the integer contained in the red-integer structure. It's defined in structures.reds in red/runtime/datatypes

[01:33](#msg58928c531e4d4bd962c2c309)@dockimbel and @qtxie will no doubt no easier ways but are not around at the moment.

Zamlox

[07:03](#msg5892d9a4c0f28dd86273eb0a)@Oldes if you want to get

```
integer!
```

out of

```
red-float!
```

you can try:

```
as integer! a/value
```

where

```
a
```

is of type

```
red-float!
```

PeterWAWood

[07:55](#msg5892e5d9e836bf7010bf654e)@zamlox

```
as integer!
```

will not convert the value from float to integer.

Zamlox

[08:27](#msg5892ed6a1e4d4bd962c467c7)it does for me:

```
Red/System [
]

a: 2.345
b: as integer! a
print ["a: " a " b: " b lf]
```

will output:

```
a: 2.345 b: 2
```

PeterWAWood

[08:31](#msg5892ee5ae836bf7010bf8ed6)@Zamlox Thanks. I didn't know (or couldn't remember) that

```
as
```

has been updated from type-casting to datatype conversion.

Zamlox

[08:31](#msg5892ee6f1e4d4bd962c46db6);)

## Monday 6th February, 2017

WiseGenius

[06:10](#msg58981350147a0f67563c46f2)Is there no equivalent to C's `union` in Red/System?

geekyi

[07:08](#msg5898210121d548df2ccfa4c3)@WiseGenius you mean a \[Union type](https://en.wikipedia.org/wiki/Union\_type#C.2FC.2B.2B) ?

[07:09](#msg58982124147a0f67563c9664)Any use-cases?

[07:12](#msg589821f66018ccd652763bcd)It seems `typeset!`s are `union`ed in `%red/environment/datatypes.red`

WiseGenius

[07:41](#msg589828bb6018ccd652766447)@geekyi Yes, I mean a union type. The same link you give says, “The primary use of a union is allowing access to a common location by different data types...”  
I'm porting some old C code to Red/System. It contains many unions, and I'm trying to think of the best way to go about getting around the fact they don't seem to exist Red/System.

PeterWAWood

[08:07](#msg58982eb1f045df0a220fd5d8)There is no

```
union
```

in Red/System yet. As far as I can remember there is an existing wish to add one somewhere in the issues list. (I couldn't find it today though.)

You will need to define multiple structures to duplicate C unions at the moment.

[08:09](#msg58982f2b6b2d8dd552084cf1)@geekyi

```
union
```

is a Red function which performs a union operation, https://en.wikipedia.org/wiki/Union\_(set\_theory), on two sets.

[08:25](#msg5898330e6018ccd65276ade8)@WiseGenius May be this simple example will help:

```
Red/System []
union: alias struct! [
	a 		[integer!]
	b		[integer!]
]
overlay: alias struct! [
	a		[float32!]
	b		[float32!]
]
int: declare union
f32: as overlay int
int/a: 32
f32/b: as float32! 123.456
print [int/a " " f32/b lf]
print [int/b " " f32/a lf]   ;; Note this prints "rubbish"
```

geekyi

[10:35](#msg5898518400c00c3d4f005662)How hard would it be to write a program to automatically port C code to R/S ? Would it be easier to write a C compiler in Red or Red/System ?

rebolek

[10:39](#msg58985244fef1d2de52a9261e)Well, it's possible, but not exactly easy. It depends on what subset of C you want to cover.

geekyi

[10:54](#msg589855e36018ccd65277a7a5)@PeterWAWood Sorry, wrong file: `%red/environment/scalars.red`.  
I was thinking a `union`ed `typeset!` is kinda the same thing

[10:54](#msg589855eb6018ccd65277a7d3) But I realize Red `union` is irrelevant here, but `typeset!` is what I think is similar to a C `union`

[10:55](#msg589856071465c46a562a5fc5)

```
number!:		make typeset! [integer! float! percent!]
```

[10:56](#msg58985645aa800ee52c5ae8f9)Probably not useful here

WiseGenius

[11:03](#msg589857efde5049082291dbfc)@PeterWAWood Thanks. I don't see any way to dynamically allocate an array of pointers or structs, is there?

PeterWAWood

[13:41](#msg58987cf91465c46a562b4f5b)@WiseGenius It is possible but you would have to allocate and manage the memory yourself using

```
allocate
```

and

```
free
```

.

[13:41](#msg58987d09aa800ee52c5bd430)A simple example:

```
Red/System []
simple!: alias struct! [
	a 		[integer!]
	b		[integer!]
]
mem: allocate 800
ar: as simple! mem
ar/a: 1
ar/b: 2
print [ar/a " " ar/b lf]
ar: ar + 1
ar/a: 3
ar/b: 4
print [ar/a " " ar/b lf]
ar: ar - 1
print [ar/a " " ar/b lf]
free mem
```

[13:45](#msg58987dea00c00c3d4f016eb0)It is not possible to use "path" notation with an array of structures at the moment.

```
ar/1/a
```

will give a compile error.

WiseGenius

[23:56](#msg58990d471465c46a562eda93)@PeterWAWood Thanks heaps. It's so easy with such a simple example!

[23:57](#msg58990d55f045df0a22152fa8)`%docs/red-system-specs.txt` doesn't seem to mention `allocate` or `free`. Is that because they're not implemented natively yet?

## Tuesday 7th February, 2017

PeterWAWood

[03:33](#msg5899400821d548df2cd69457)@WiseGenius I think that it is correct that they are not included in the Red/System Language Specification as they are both functions in the run-time library rather than language features. It would be good to have a simple API document for the Red/System runtime. (When somebody has time to write one.)

meijeru

[09:24](#msg5899924921d548df2cd81c24)As a starter, one could look at `%libRedRT-include.red` which defines the R/S runtime entry points that are to be exposed. At least the names of these can be automatically extracted.

PeterWAWood

[10:30](#msg5899a1acaa800ee52c623343)@meijeru Doesn't that define the entry points to the Red runtime rather than the Red/System runtime?

[10:39](#msg5899a3c46018ccd6527f1512)The Red/System runtime is much smaller and at a much lower level, e.g. stack initialisation. However, it does include many #defs (e.g.

```
zero?
```

,

```
positive?
```

, and even

```
pi
```

) and a few functions (

```
length?
```

,

```
allocate
```

,

```
free
```

,

```
log10
```

). These could well be useful to somebody write "application" level Red/System.

meijeru

[11:07](#msg5899aa6a00c00c3d4f07e13b)@PeterWAWood Yes to your question, but are they not more interesting than the ones you refer to, especially for writing "application" level code?

geekyi

[11:12](#msg5899abb51465c46a5631e92c)I need a primer on the difference between \[`libred`](https://doc.red-lang.org/en/libred.html), `libredRT`, and any other concepts like the `R/S runtime`

[11:13](#msg5899abde6b2d8dd552110897)That should probably be a link I can come back to refer to again

[11:17](#msg5899accc6018ccd6527f4b27)Also what's missing is probably who would be using which (intended audience)

[12:04](#msg5899b7b61465c46a56322a97)Well, a summary:

[12:04](#msg5899b7bb00c00c3d4f082e76)Initial question: what is libred? :point\_left: \[September 9, 2016 11:13 PM](https://gitter.im/red/red?at=57d2fbc48cd0681e7bfc083f)

[12:04](#msg5899b7cbaa800ee52c62b456)Doc answers :point\_left: \[September 10, 2016 10:30 AM](https://gitter.im/red/red?at=57d39a67d274dbdf3505a719)

[12:04](#msg5899b7e221d548df2cd8ea78)Libred is split into `libred` and `libredRT` :point\_left: \[October 5, 2016 4:48 PM](https://gitter.im/red/red?at=57f4e89c43b5aeb0099b953f)

[12:05](#msg5899b7f3f045df0a22186014)Commit: red/red@bb387ad2a815c13a738e98f785a3a1d2dbeaeabe

[12:06](#msg5899b82821d548df2cd8ec28)Doc explains `libredRt` and how the compilation works now :point\_left: \[October 10, 2016 5:16 PM](https://gitter.im/red/red?at=57fb868370fcb5db0c444edf)

[12:07](#msg5899b87121d548df2cd8edf6)Also: Jacob wants a jit (or R/S in repl) :point\_left: \[October 6, 2016 6:15 PM](https://gitter.im/red/red?at=57f64e684fde720314143344)

[12:07](#msg5899b89ade50490822994992)@rebolek offers a way:  
&gt; You must compile REPL with `call` support, so you can run Rebol from Red.

[12:12](#msg5899b99af045df0a221867f8)Do you have working code for this @rebolek ?

rebolek

[12:12](#msg5899b9b99eb1bd81481bded6)@geekyi call support?

geekyi

[12:12](#msg5899b9c7aa800ee52c62c0be)A R/S repl. I can point it to where my sources are. The rebol compiler will then compile sample `R/S` code to a tmp file, and I can dynamically load it?

rebolek

[12:15](#msg5899ba644150746b1512e2d4)Red console, there are currently three of them. Just add include for call and then you can run Red compiler.

geekyi

[12:16](#msg5899bab9de50490822995460)@rebolek I know 2 of the consoles.. `gui-console`, old `console` and do you mean from the `console` branch from qtxie?

rebolek

[12:17](#msg5899baec567b0fc8138c93b3)yes, the `red-console` done in View is the third one

greggirwin

[18:23](#msg589a109b1465c46a56346f23)Thanks for the research @geekyi. Now, how do we keep that from getting lost as chat scrolls? No way to bookmark messages in Gitter. In 1-to-1 chats, I'm not in the list, so I can't post to myself as a reminder.

Oldes

[21:35](#msg589a3dbfaa800ee52c663822)@dockimbel is it possible to do something like:

```
Red/System []

#define MAGICK_VERSION 7

#either MAGICK_VERSION = 7 [
	#define MAGICK_LIBRARY "CORE_RL_wand_.dll"
][
	#define MAGICK_LIBRARY "CORE_RL_MagickWand_.dll"
]
```

Above is not working.

[21:42](#msg589a3f40f045df0a221bd347)Hm.. ok.. I understand, that `MAGICK_VERSION` must be passed as compilation argument, but it is not possible.

## Wednesday 8th February, 2017

PeterWAWood

[11:18](#msg589afea21465c46a56397544)@meijeru "Yes to your question, but are they not more interesting than the ones you refer to, especially for writing "application" level code?"

You are correct. I'm pretty sure that @dockimbel already has plans to document the Red Runtime API. I'm not sure of when but imagine it will be before Red 1.0.

When I wrote "application" level code, I was a little lazy. My intention would have been clearer had I written "somebody writing Red/System code at the application level rather than the systems programming level"&gt;

## Friday 10th February, 2017

dockimbel

[10:54](#msg589d9be7aa800ee52c789c0c)@Oldes The R/S preprocessor does not support such expression yet. But yes, if you define a word in the config file (or anywhere else where the compiler config options can be specified), you can test it that way.

[10:57](#msg589d9cad6b2d8dd55226b07a)@PeterWAWood `as integer!` and `as float!` are doing conversions now (master branch only).

[11:01](#msg589d9d9caa800ee52c78a618)@geekyi  
&gt; How hard would it be to write a program to automatically port C code to R/S ?

I think it should be pretty easy, though you would need to take special care for:  
\* passing struct by value, not supported yet by R/S, but should be added soon.  
\* splitting C unions into several structs as R/S does not have a union-like construct yet.  
\* handling 16-bit and 64-bit integers, as R/S does not support them yet.  
\* using macro names in preprocessor conditional expressions.

Oldes

[11:12](#msg589da01700c00c3d4f1def5d)@dockimbel yes.. .but you probably don't want us to mess config file, which is part of Red, when writing just a library which is part of Red/Code.

dockimbel

[11:20](#msg589da21ade50490822ae16a5)@Oldes You can create a custom config file: `%custom-config.r` which the toolchain will use automatically if found. You can also use the `Config:` entry in the script header for that. IIRC, it is also supported from command-line since recently.

Oldes

[11:23](#msg589da2b7872fc8ce62196dd6)Still don't know, where it should be included in my Library code.. also it smells with complications.. I will probably stay with commented code until there will not be better way - like code above.

dockimbel

[11:25](#msg589da30d21d548df2ceeb9d9)`Red [config: [MAGICK_VERSION: 7]]` should work fine, just put it in the main script.

Oldes

[11:25](#msg589da32daa800ee52c78c610)ah... if this is possible, than it is something different of course.. I will do it:) thanks.

dockimbel

[11:25](#msg589da341f045df0a222d4b12)(untested, but should work)

Oldes

[11:27](#msg589da3931465c46a5648043f)It does not works.. at least in Red/System where I need it.

## Wednesday 15th February, 2017

Oldes

[12:55](#msg58a44fabaa800ee52c9b4c15)@dockimbel I wonder if you have some plan to create a `handle!` datatype which would be immutable `integer!`. I still have bad feeling when using `integer!` where `handle!` should be used instead.

[17:03](#msg58a489edde50490822d0ad19)What is the best way how to handle struct like this one in Red/System, when we don't have `short!` type yet?

```
typedef struct FMOD_ADVANCEDSETTINGS
{   
	...
    unsigned int        defaultDecodeBufferSize;
    unsigned short      profilePort;               
    unsigned int        geometryMaxFadeTime;  
    ...
} FMOD_ADVANCEDSETTINGS;
```

[17:10](#msg58a48b73872fc8ce623d2166)I guess that so far I must split `profilePort` into two `byte!` values and work with them, am I right?

greggirwin

[17:12](#msg58a48beb00c00c3d4f424414)That would be my guess as well.

Oldes

[17:40](#msg58a49281de50490822d0e4f3)and what about this in struct?

```
float rmslevel[32];
```

[17:48](#msg58a4948100c00c3d4f428315)never mind.. I will skip above and pass the struct just as a handle.. but it would not be possible to do automatic conversion yet :/

## Thursday 16th February, 2017

Oldes

[11:41](#msg58a58ffbde50490822d6236c)What is the best way to deal with `long long` values? Using struct to hold it?

PeterWAWood

[13:02](#msg58a5a2d80ad50ac315235434)@Oldes I believe that a structure would be best. I'm not sure if there are any 64-bit arithmetic routines in the Red runtime yet. There may be. I wrote some \[simple 64 bit integer arithmetic functions](https://github.com/PeterWAWood/Red-System-Libs/tree/master/I64) a while back and used a struct.

Oldes

[13:06](#msg58a5a3d800c00c3d4f483ab3)I will probably ignore it until I will need it:)

[13:07](#msg58a5a40f21d548df2c18f6cd)The struct is passed by reference, isn't it?

PeterWAWood

[13:11](#msg58a5a4f400c00c3d4f48401d)In Red/System yes. I think that it is normal to pass a struct by value in C though. You'll need to check the C API.

Oldes

[13:25](#msg58a5a83ade50490822d6b5bd)My problem is, that this code is not correct: https://github.com/Oldes/code/blob/83c2866e389596ecf2570505e37c5421c1c4ae01/Library/FMOD/FMOD.reds#L2059

[13:26](#msg58a5a86ade50490822d6b72b)I could use this trick in struct definition, but not in function call :/

[13:33](#msg58a5aa1cf045df0a22560e31)I guess I must wait on this to be implemented:

```
struct [
   [by-value]                  ;-- 'by-value keyword would force passing it
   <members>                   ;-- by value.
]
```

as mentioned here: http://static.red-lang.org/red-system-specs.html#section-19.3

[13:34](#msg58a5aa5dde50490822d6c167)@dockimbel will it be difficult to implement above functionality? Would it be easier that adding `int64!` datatype?

[13:47](#msg58a5ad570ad50ac315239cdb)Maybe I could use `float!` where `long long` is needed.

## Friday 17th February, 2017

dockimbel

[09:11](#msg58a6be41f045df0a225be765)@Oldes Yes, we plan to add a `handle!` type in Red. Though, it's pretty low-priority for now.

Oldes

[09:13](#msg58a6bea31465c46a5678476f)Maybe I could try to implement `handle!` for you... but you have usually quite high requirements:)

dockimbel

[09:13](#msg58a6bec721d548df2c1f402b)OTOH, "struct by value" is very high on our todo-list.

[09:16](#msg58a6bf6c872fc8ce624942c9)For `handle!`, it needs to be displayable, so FORM should return its value, while MOLD should just display `handle!`. I don't remember any other special requirement for it beyond that. COMPARE action could be supported by inheritance from TYPE\_INTEGER.

Oldes

[09:22](#msg58a6c0ce1465c46a567852ef)Maybe the `handle!` could keep also special `type` as a word, so one could test if it is `sound`, `fmod-system` etc. It would be more useful than just immutable integer, but I'm not sure how much it could complicate things.

dockimbel

[10:26](#msg58a6cfcc872fc8ce62499f4c)The `handle!` slot could contain a symbol ID, though, in practice, I'm not sure how useful that would be. Just for debugging purposes?

greggirwin

[19:47](#msg58a75336872fc8ce624ca713)Depends on how you could use it. A handle with that kind of metadata could be useful if you have memory mapped files or shared memory, yes?

## Monday 20th February, 2017

Oldes

[11:59](#msg58aada15f045df0a226ee008)@dockimbel the `handle!` datatype implementation seems to be more difficult than I thought... I'm having naming conflict with this definition https://github.com/red/red/blob/master/modules/view/backends/windows/win32.reds#L504 so I give up.

dockimbel

[13:20](#msg58aaed2e00c00c3d4f62566e)But that's R/S realm...why do you use `handle!` symbol in your implementation of that datatype? It should be `red-handle!` for the related structure.

Oldes

[14:33](#msg58aafe29de50490822f0469d)Right... I found meanwhile that I don't have to define the `handle!` word here: https://github.com/red/red/blob/master/runtime/datatypes/common.reds#L446 which was causing the error.

[14:34](#msg58aafe85de50490822f048cd)Now I'm a little bit closer.. but only when compiling for `MSDOS` target.. once it is `Windows`, it crashes.. probably because of the optional type definitions for `image!`.

[14:37](#msg58aaff1721d548df2c339bc6)It was also quite tricky (for me) to find the proper position of my new `TYPE_HANDLE` in the `#enum datatypes!`

[14:56](#msg58ab03a400c00c3d4f62e6a4)@dockimbel would be this result ok? Note that `test-handle` is just my temporary native:

```
red>> test-handle 3
== #[handle! 00000003h]
red>> form test-handle 3
== "00000003h"
```

[14:58](#msg58ab041cf045df0a226ff0bf)I still think, that it would be good to support type as well... so it could look like:

```
#[handle! 00000003h sound]
```

[15:00](#msg58ab048f00c00c3d4f62ee0e)Imho, I think that loading such a serialized `handle!` should not be allowed.

[15:24](#msg58ab0a221465c46a568cf0fc)Or maybe loading serialized `handle!` could init it as `null`?

dockimbel

[15:50](#msg58ab102b21d548df2c34190c)Handle! is supposed to be an opaque value, so you should have:

```
red>> test-handle 3
== handle!
```

[15:51](#msg58ab107621d548df2c341a82)Only FORM should reveal its value (for debugging purpose).

[15:53](#msg58ab1115de50490822f0c0a5)The position of a new datatype ID in the enumeration is at the end, but before the types which are not implemented.

Oldes

[15:55](#msg58ab11777ceae5376a155b9f)Ok... I will modify it.. do you want to create also some tests?

[15:58](#msg58ab1237aa800ee52cbe0216)But still am not sure if I understand your requirement, what should reveal `form` as usually it is the `mold` which is revealing more info - based on `form`

[16:01](#msg58ab12eb21d548df2c342a9c)Also for debugging purpose while working in console, my version seems to be more friendly

[16:02](#msg58ab1331f045df0a227059b5)I have to end now.. here is my current version without the test native function - https://github.com/red/red/pull/2446

## Friday 24th February, 2017

Oldes

[16:16](#msg58b05c64f1a33b627544cd2c)@dockimbel can I use `_pad` value in the `red-integer!` slot to store additional hidden info since there is no `handle!` type yet? I mean, is it guaranteed that if I define such a `red-integer!`, the `_pad` value will be unchanged by other Red or Red/System actions?

## Saturday 25th February, 2017

dockimbel

[09:17](#msg58b14bb721d548df2c57ae0d)@Oldes It should stay unchanged as long as that value keeps his `TYPE_INTEGER` type.

Oldes

[10:13](#msg58b158bf872fc8ce628141a6)@dockimbel What is the best way to throw custom errors?

dockimbel

[11:27](#msg58b16a38872fc8ce62818e7a)@Oldes Red or R/S errors?

Oldes

[11:32](#msg58b16b5d7ceae5376a39464b)R/S - we are in Red/Red/System chat:)

dockimbel

[11:33](#msg58b16b7d1465c46a56b11409)There's no custom errors in R/S, so you can just print a message and use `quit`.

Oldes

[11:34](#msg58b16bbb7ceae5376a3947cc)So far I'm using this:

```
fire [TO_ERROR(script invalid-data) cmds]
```

dockimbel

[11:34](#msg58b16bcd21d548df2c5838ed)Ah, so a Red error. ;-)

Oldes

[11:34](#msg58b16bd81465c46a56b115dd)So... it is Red error from R/S

[11:35](#msg58b16c1fe961e53c7f6649f7)But I somehow feel limited with the actual options

dockimbel

[11:36](#msg58b16c38872fc8ce628195c9)You need to extend `system/catalog/errors`. As `extend` is not yet working on objects, you need to replace them with cloned versions.

[11:37](#msg58b16c607ceae5376a394b70)If you want to add specific errors for your library, add a new object to `system/catalog`. See `%environment/system.red` file.

[11:38](#msg58b16c9e872fc8ce6281970d)You can do those changes at runtime, from your library.

Oldes

[11:39](#msg58b16cf57ceae5376a394da2)How? `system/catalog` is also object.

dockimbel

[11:46](#msg58b16e7cde5049082213071d)`system/catalog: make system/catalog [my-errors: object [...]]`

Oldes

[11:48](#msg58b16f131465c46a56b124a9)but will the `fire` function be ok? isn't the `system/catalog/errors` object bind somewhere?

[11:49](#msg58b16f6100c00c3d4f872519)When I have my library already as a context, I can store the errors there, cannot I?

dockimbel

[11:54](#msg58b17084f1a33b627549ddb7)`fire` and `TO_ERROR` are just handy wrappers to `error/create`. If you define errors dynamically, you cannot use `TO_ERROR` macro for them (as it relies on `#in` directive which is resolved at compile-time), but `fire` should be fine as long as you provide the required arguments for `error/create`:  
1\. a word indicating the error class name  
2\. a word indicating the error name

[11:55](#msg58b170b3de50490822130f95)You should have a quick look at `fire`, `TO_ERROR` and `error/create` definitions to see how it works. `fire` is just a variable-arguments wrapper over `error/create`.

Oldes

[12:03](#msg58b172a11465c46a56b138a4)Thanks.. I will give it a try.

## Monday 27th February, 2017

Oldes

[14:26](#msg58b43711de504908221fff10)@qtxie I guess there is no documentation how to use the COM from R/S except the source, right?

qtxie

[14:35](#msg58b4394a7ceae5376a46cdc5)@Oldes Yes. No document for it. The interface return from COM is a pointer point to a struct. To use the interface, we just need to define the struct in R/S and cast pointer's value to it.

Oldes

[14:38](#msg58b439ed00c00c3d4f94adc9)Let's say I have the struct like:

```
IOleInPlaceFrameVtbl: alias struct! [
	QueryInterface       [QueryInterface!]
	AddRef               [AddRef!]
	Release              [Release!]
	GetWindow            [Frame_GetWindow!]
	ContextSensitiveHelp [Frame_ContextSensitiveHelp!]
	GetBorder            [Frame_GetBorder!]
	RequestBorderSpace   [Frame_RequestBorderSpace!]
	SetBorderSpace       [Frame_SetBorderSpace!]
	SetActiveObject      [Frame_SetActiveObject!]
	InsertMenus          [Frame_InsertMenus!]
	SetMenu              [Frame_SetMenu!]
	RemoveMenus          [Frame_RemoveMenus!]
	SetStatusText        [Frame_SetStatusText!]
	EnableModeless       [Frame_EnableModeless!]
	TranslateAccelerator [Frame_TranslateAccelerator!]
]
```

But how I get the pointer for the `IOleInPlaceFrame` uuid(00000116-0000-0000-c000-000000000046)?

qtxie

[14:42](#msg58b43ae07ceae5376a46d8b3)Usually you get the interface by create it, or from a query function.

[14:46](#msg58b43bc87ceae5376a46df3b)You can check simple-io.reds, \[here](https://github.com/red/red/blob/master/runtime/simple-io.reds#L1270) is how to create a COM object using UUID.

Oldes

[15:13](#msg58b4421a00c00c3d4f94e678)And is it correct, that when I for example take specification for `IClassFactory` https://msdn.microsoft.com/en-us/library/windows/desktop/ms694364(v=vs.85).aspx the VTBL would be:

```
IClassFactoryVtbl: alias struct! [
	QueryInterface       [QueryInterface!]
	AddRef               [AddRef!]
	Release              [Release!]
	CreateInstance       [function! ...]
	LockServer           [function! ...]
]
```

?

[15:35](#msg58b44733872fc8ce628f56bf)Hm.. I think that above is correct, just I cannot trust the MSDN specification from the page as the order of methods may be different (in this case it is ok by accident)

[16:18](#msg58b45173f1a33b627557a9bf)When I want to create extended struct.. is there better way than using this:

```
#define METHODS [
	a [integer!]
	b [integer!]
]
st: alias struct! [
	METHODS
]
stEx: alias struct! [
	METHODS
	c [integer!]
]
```

dockimbel

[18:00](#msg58b4692a872fc8ce62904bd5)I don't recall any better way.

## Tuesday 28th February, 2017

qtxie

[01:05](#msg58b4ccdf00c00c3d4f988b65)@Oldes I use Visual Studio to jump to the struct definition. If you don't want to install it, you can find the C include files in MinGW.

Oldes

[09:35](#msg58b5446800c00c3d4f9af2c5)@dockimbel is this a bug?

```
stru!: alias struct! [
	a [integer!]
	b [integer!]
	f [function! [i [integer!] return: [integer!]]]
]

test: func[i [integer!] return: [integer!]][i * 3]

ptr: GlobalAlloc 0 size? stru!
ptr: [1 2 :test]
print-line ["ptr: " ptr/2 " " ptr/3] ;-- ptr/3 is 0!
```

[09:36](#msg58b5448ef1a33b62755d0ab1)I was expecting `ptr/3` holding pointer to the `test` function.

[09:38](#msg58b5451b1465c46a56c4ecf1)Is there any easy way how to define array of functions?

[09:39](#msg58b5454500c00c3d4f9af935)I'm able to do it using struct casting and setting one by one, but maybe there is more clean way.

dockimbel

[09:41](#msg58b545af00c00c3d4f9afb7a)`: [...]` syntax is used to create a \[literal array](http://static.red-lang.org/red-system-specs-light.html#section-4.8.6), as its name implies, it can only contain literal values (and of same type). Moreover, the second `ptr` assignment shadows the first one.

[09:42](#msg58b545f421d548df2c6c5991)Array of functions: no easy way, you need to build an array and fill it.

Oldes

[09:44](#msg58b5466700c00c3d4f9b005f)This is what works.. but the real struct may be huge:)

```
s: as stru! ptr
s/b: 22
s/f: :test
print-line ["ptr: " ptr/2 " " ptr/3]
print-line ["test: " s/f 33]
```

[09:45](#msg58b546a1de50490822261499)Can you please explain what you mean with: \_the second ptr assignment shadows the first one.\_?

dockimbel

[09:45](#msg58b546c3f1a33b62755d1ae2)The same thing as in:

```
a: 1
a: 2
```

[09:46](#msg58b546fe7ceae5376a4d3c96)Your first call to `GlobalAlloc` is useless, as its return value gets overwritten in the next line. A literal array is a static allocation.

Oldes

[09:49](#msg58b547ac1465c46a56c50339)Understand.. so I will use the struct casting.

[09:51](#msg58b5480521d548df2c6c6b2d)If there is no other simple way.

## Wednesday 1st March, 2017

WiseGenius

[09:53](#msg58b69a0f21d548df2c748d14)Speaking of literal arrays, say I have this function in Red/System:

```
f: func [
	a [byte-ptr!]
][
	probe a/2
]
```

Then this works:

```
dummy: [#"a" #"b" #"c"]
f dummy
```

But this doesn't:

```
f [#"a" #"b" #"c"]
```

I get:

```
*** Red/System Compiler Internal Error: Script Error : emit-push expected value argument of type: char logic integer word block string tag path get-word object decimal
*** Where: emit-argument
*** Near:  [forall list [
expr: list/1
if block? unbox expr [comp-expression expr yes]
if object? expr [cast expr]
if type <> 'inline [
emitter/target/emit-argument expr functions/:name
]
]]
```

Is this a bug? If not, is there any way I can avoid a `dummy` word?

dockimbel

[10:33](#msg58b6a378f1a33b62756510c2)Literal arrays are not first-class types, so you cannot pass them as arguments. The compiler should catch this case and report a proper error message.

## Thursday 2nd March, 2017

Oldes

[13:35](#msg58b81f9800c00c3d4face4e4)is there any debug function to probe struct?

dockimbel

[16:54](#msg58b84e4a00c00c3d4fae3ffd)@Oldes There are `dump4` and `dump1` for dumping memory (using respectively 32-bit or 8-bit words). You can pass them any valid pointer (including structs).

Oldes

[21:38](#msg58b890e721d548df2c8173cb)I know.. I was thinking about something which would pretty print the structure with values.

[21:40](#msg58b89137e961e53c7f8f56f6)@dockimbel is there difference between using:

```
ptr: GlobalAlloc 0 size? IOleClientSiteImpl!
iOleClientSiteImpl: as IOleClientSiteImpl! ptr
```

and plain:

```
iOleClientSiteImpl: declare IOleClientSiteImpl!
```

?

## Friday 3th March, 2017

dockimbel

[02:52](#msg58b8da5cf1a33b62757288d1)@Oldes The struct member names exist only at compile-time (same as variable names), they don't exist at runtime anymore. It could be possible to extend the compiler in debug mode to store metadata about structs and build a runtime function for pretty printing that, though that's a couple of days of work at least.

[02:54](#msg58b8dad51465c46a56dbb370)@Oldes A big difference: the first one will allocate memory dynamically using the special global allocator from Windows API, the second one will statically allocate the memory in the data segment of the final executable (such memory cannot be freed, nor extended).

## Sunday 5th March, 2017

Oldes

[16:29](#msg58bc3cdf1465c46a56ec4211)@dockimbel Is it possible that `debug-memory` function does something nasty? While experimenting with COM in R/S, I found, that my script is (partially) working, but fails (crashes) once I use functions which prints memory content. The crash is happening later.. not in the R/S context.

## Monday 6th March, 2017

dockimbel

[07:19](#msg58bd0d727ceae5376a787577)I doubt it, I don't remember ever seeing any side-effect from `debug-memory`. If you can make a short script that shows such side-effect, please post it in a new ticket.

Oldes

[08:37](#msg58bd1fdc872fc8ce62c07fa6)I'm not sure how short it can be... I can make it a single script.

WiseGenius

[13:43](#msg58bd677ee961e53c7fa79bed)@dockimbel Since you appear to be currently working on a `fix-args` branch, I thought I'd ask about something which might be somewhat related:  
Say I have the following C code:

```
#include <stdio.h>

int main (int argc, char *argv[]) {
	for(int argi = 0; argi < argc; argi++) {
		printf("%d: %s\n", argi + 1, argv[argi]);
	}
	return 0;
}
```

I compile it to `show-argv.exe` on Windows and run as follows:

```
>show-argv "a b" "c "d e"
1: show-argv
2: a b
3: c d
4: e
```

The quotes are used for grouping the arguments to include their spaces, but are then automatically removed.  
Now, running \[the equivalent example for Red/System's args-list from the spec](http://static.red-lang.org/red-system-specs.html#section-13.2) has this behaviour:

```
>show-args "a b" "c "d e"
count: 4
1: show-args
2: "a b"
3: "c "d
4: e"
```

The quotes still group the arguments to include their spaces, but they are not automatically removed, meaning they have to be dealt with later in other places (eg. \[here](https://github.com/red/red/commit/3d99d8ca05ff2637c260a6c4eb79f8254c2c38a7)).  
So my question is: Are there any plans to remove the quotes earlier as C does, or is the plan to keep the current behaviour?

Oldes

[14:19](#msg58bd6fd8e961e53c7fa7d4e3)@dockimbel I know it is not a priority, but I consider quite confusing, that the Red repository structure does not have `imports` in own location. I mean... for example `#import` from `"kernel32.dll"` is in more than 10 files (don't know exact number, as I have many own files with it too - total 17 files now under Red folder in my case). Most of the time the content is same... wouldn't it be better to have it in folder like `imports` and file `kernel32.reds` - all the scripts which need some import could include this file and not need to rewrite all the single imports from it.

dockimbel

[14:40](#msg58bd74cbf1a33b6275886c17)@WiseGenius Yes, that can be improved, and it's the right time for that, thanks.

[14:47](#msg58bd768500c00c3d4fc8cdfe)@Oldes Imports are not free, they are context-sensitive in R/S (C does not have contexts), so it means that if we have one include file for, e.g., `kernel32.dll`, with a hundred imported functions, every context where it will be used will have an hundred more functions definitions in it, even if it needs just a few. Now multiply that by a dozen similar include files... I am not sure how much it would impact the compiler's performances, but it would probably increase its memory usage (so more GC passes). That said, maybe we could organize the code to avoid, or at least reduce those impacts (but we would need to use the `platform/` or even `red/platform/` prefixes everywhere in the runtime library, an alternative could be to put everything in global space, but all the API names will then become reserved). So, it would need careful analysis first, to see how it could be improved.

Oldes

[14:48](#msg58bd76d5872fc8ce62c2a4c9)ok... maybe at least have it as a source from where to copy it:)

[14:53](#msg58bd77d900c00c3d4fc8d6c7)or implement something like:

```
#import-from %kernel32.dll [LoadLibraryA GetProcAddress]
```

instead writing:

```
#import [
"kernel32.dll" stdcall [
	LoadLibraryA: "LoadLibraryA" [
		lpFileName	[c-string!]
		return:		[integer!]
	]
	GetProcAddress: "GetProcAddress" [
		hModule		[integer!]
		lpProcName	[c-string!]
		return:		[integer!]
	]
]]
```

like is in `dotnet\bridge.red`

[14:54](#msg58bd781900c00c3d4fc8d876)Never mind.. just brain storming. I understand that it is more for the new compiler.

dockimbel

[14:58](#msg58bd792a1465c46a56f2e35d)@Oldes That's an interesting suggestion, you can open a wish ticket for it. Anyway, that's low-priority for now.

Oldes

[15:00](#msg58bd79a9f1a33b6275888d49)Problem would be, what to do with struct arguments, when used.. it is really for the new compiler.

greggirwin

[17:54](#msg58bda24100c00c3d4fca0d06)It's an important question and decision, if PitL is a consideration for R/S. We don't want bloat, but we also want the simplest thing for humans to maintain that will work correctly.

rebolek

[17:56](#msg58bda2b2567b0fc8138f80bb)R/S is C-level language so (at least some) people will eventually use it for same things as C. I think this answers your question.

greggirwin

[18:11](#msg58bda66821d548df2c9bba9a)Not sure it answers my question. Things written in C's early days were small by today's standards, yes? Maybe I could ask my question as "Should we view R/S as C, which wasn't designed for writing large systems (large by today's standards), or is it a C-level language with modern features for building larger systems?"

rebolek

[18:13](#msg58bda6dc4150746b1515e58e)What I wanted to say is that people will eventually try to use it to write larger programs, so any feature that will improve the experience is welcomed. OTOH resources are limited and Red is totally a priority right now.

greggirwin

[18:14](#msg58bda6f5872fc8ce62c409b9)Agreed.

[18:15](#msg58bda740de5049082252996b)Managing expectations is important, when describing the langauge(s). e.g., the K&amp;R C book sets the context for the language very well in the introduction.

rebolek

[18:16](#msg58bda76afef1d2de52ac5dc7)Maybe the best strategy right now is to point out that R/S is here for time critical code and not for general programming. But there is already one huge project done in R/S, so that's not entirely true...

greggirwin

[18:16](#msg58bda795e961e53c7fa96dac):^) "Huge" is relative.

rebolek

[18:17](#msg58bda7c04150746b1515e59f)Yes, Red is no SAP, but that's not bad thing ;)

greggirwin

[18:20](#msg58bda866872fc8ce62c411ca)Right, which is the "then and now" aspect of large. Unix was ~13KLOC of C (per the K&amp;R book).

[18:21](#msg58bda8bd21d548df2c9bcb99)Maybe the sweet spot is somewhere between super minimalist systems and modern systems.

[18:24](#msg58bda96ef1a33b627589e41c)Some time back @endo64 posted links to articles about writing games 30 years ago, making it hard to remember and imagine how little we used to work with. This is one of the things I think makes Red so widely applicable. We have R/S as the standard system's level language, but that doesn't mean people can't create different alternatives.

Oldes

[20:36](#msg58bdc83021d548df2c9cbe78)@rebolek what you mean with \_time critical code\_?

rebolek

[20:36](#msg58bdc84cfef1d2de52ac6114)@Oldes code that needs to run fast, math loops basically

[20:36](#msg58bdc85e567b0fc8138f83f0)you don’t need to use R/S for GUI

Oldes

[20:37](#msg58bdc88df1a33b62758abe9d)Without R/S you cannot communicate with OS, so you need R/S even for GUI.

rebolek

[20:38](#msg58bdc8d3567b0fc8138f83f8)@Oldes yes, whole Red is written in R/S, I know.

[20:39](#msg58bdc8f5567b0fc8138f83fc)but you don write your GUI handling code in R/S. Red/View does that for you.

[20:40](#msg58bdc921fef1d2de52ac6139)But if you want to i.e. display 3D stuff or synthetize sound, you will use R/S for speed.

Oldes

[20:43](#msg58bdc9e8f1a33b62758ac6ea)I know.. my initial point after spending few days inside R/S is, that there is a lot of space where it should be improved.. but of course.. I see that R/S is at the state to have Red done as soon as possible, not to be perfect tool yet.

rebolek

[20:44](#msg58bdca1e9eb1bd81481eeda3)I agree, I do not see much room for improvement before rewriting compiler to Red.

Oldes

[22:43](#msg58bde60a21d548df2c9d8578)@dockimbel I wonder what happened to possible doc strings in import definitions... I guess @ldci 's \[code like this](https://github.com/ldci/glfw-red/blob/master/glfw.reds#L324-L326) was working before. Now it isn't.

[22:49](#msg58bde775f1a33b62758b8ded)Although I understand, that the string cannot be used in R/S directly .. remember, that code is data in Redbol. So it could be still supported.

## Tuesday 7th March, 2017

dockimbel

[04:24](#msg58be35ed7ceae5376a7fe330)@Oldes  
&gt; Without R/S you cannot communicate with OS, so you need R/S even for GUI.

That will change in 0.6.3, Red will gain an FFI interface similar to R2, so going down to R/S for FFI will not be mandatory anymore.

[04:25](#msg58be363c872fc8ce62c77196)&gt; But if you want to i.e. display 3D stuff or synthetize sound, you will use R/S for speed.

We will have higher-level frameworks for Red users to cover those domains, so for most of the needs, it should be fast enough.

[04:26](#msg58be367621d548df2c9f11be)&gt; @dockimbel I wonder what happened to possible doc strings in import definitions... I guess @ldci 's \[code like this](https://github.com/ldci/glfw-red/blob/master/glfw.reds#L324-L326) was working before. Now it isn't.

If it's not compiling anymore, please open a ticket.

rebolek

[06:28](#msg58be5319567b0fc8138f8bd5)&gt; We will have higher-level frameworks for Red users to cover those domains, so for most of the needs, it should be fast enough.

Of course, I was thinking more about situations where you want to write that stuff yourself, not use some existing framework.

## Wednesday 8th March, 2017

Oldes

[11:19](#msg58bfe8c1e961e53c7fb6cbfc)@dockimbel So I have stand alone R/S script, which opens window with web browser area inside and displays a web page... any clue what must be done so I could use this widget inside View? I mean.. if you will not want it in default distribution, how to do it as an extension?

[11:21](#msg58bfe91ede504908225f75f0)Doing it as an extension would require a lot of code to be duplicated.

dockimbel

[12:46](#msg58bffd28dd08b4b8599fd935)Have you tried using `register-class` as I told you before?

[12:47](#msg58bffd6ddd08b4b8599fda90)You probably need anyway to write a custom `WndProc()` for it, so I don't think it would make a big difference if it's merged inside View code or not.

## Thursday 9th March, 2017

Oldes

[15:09](#msg58c1703b7ceae5376a93fdd5)@dockimbel I'm having problem to include it:/ Let's say, I want to enhance `gui-console`, where I should include my file?

dockimbel

[15:12](#msg58c170da872fc8ce62db9f32)@Oldes In `%gui-console.red` I guess.

Oldes

[15:12](#msg58c170e021d548df2cb30ef5)I tried to include it \[at this line](https://github.com/red/red/blob/master/environment/console/gui-console.red#L23), but than I'm having compilation error:

```
*** Compilation Error: redeclaration of definition this 
*** in file: %/x/GIT/Red/modules/view/backends/windows/direct2d.reds 
*** in function: exec/gui/draw-text-d2d
*** at line: 781 
*** near: [
    this: as this! create-text-format font 
    format: as IDWriteTextFormat
]
```

[15:13](#msg58c171047ceae5376a940427)I'm not redefining this `this` value.

dockimbel

[15:14](#msg58c171577ceae5376a940657)If your code includes COM.reds, you are redeclaring it.

Oldes

[15:14](#msg58c17169dd08b4b859a92cb4)it is not

dockimbel

[15:15](#msg58c1717de961e53c7fc0e241)@qtxie ^---

Oldes

[15:20](#msg58c172acdd08b4b859a9354b)My code is here: https://github.com/Oldes/Red/commit/c69176df5ebc8a57a100f691b0010204f197ef5d

[15:22](#msg58c173231465c46a560bc66b)And I'm using `#either modules contains 'View [` to include \[all the definitions, which are normally part of Red and View](https://github.com/Oldes/Red/commit/c69176df5ebc8a57a100f691b0010204f197ef5d#diff-55697114c93ebb2eee4d0fa8d03ef100) when compiling it as a stand alone R/S app.

dockimbel

[15:41](#msg58c1779921d548df2cb33b8a)@Oldes You are redeclaring `this!` here: https://github.com/Oldes/Red/commit/c69176df5ebc8a57a100f691b0010204f197ef5d#diff-55697114c93ebb2eee4d0fa8d03ef100R92

Oldes

[16:07](#msg58c17dd9e961e53c7fc144af)@dockimbel no. I'm not... as I said, this file is \[imported ONLY when compiling in stand alone version](https://github.com/Oldes/Red/commit/c69176df5ebc8a57a100f691b0010204f197ef5d#diff-dd7638599d610a5fa51034dd4037dc69R205) (without View module)

## Friday 10th March, 2017

sergeantWilson

[01:43](#msg58c204b0872fc8ce62df4fd5)Hello, I am new to Red and need a little help.  
How do I use functions from a Red/System script, in Red or Red view ?  
I compiled the Win "user32.dll" call from here no problems:  
https://github.com/red/red/wiki/Red-tutorial-for-newcomers-English-version  
But how do I make use of the alert function from that Red/system script, in Red and Red View ?

Also are there any examples of other API calls.  
Thanks.

qtxie

[02:11](#msg58c20b3a1465c46a560f7045)@Oldes @dockimbel I can reproduce this error with the following code:

```
Red/System []

this!:  alias struct! [vtbl [integer!]]
#define THIS(obj) [as this! obj/ptr]

fff: func [/local this [this!]][
	this: as this! 0
]
```

greggirwin

[02:22](#msg58c20dcbde504908226c773b)@sergeantWilson, that same tutorial page has examples. Do they not work?

[02:25](#msg58c20e9c7ceae5376a97cf19)If you look at the Red sources, e.g. %runtime/platforms/win32.reds or %modules/view/backends/windows/win32.reds, there are a lot of calls mapped.

dockimbel

[04:20](#msg58c229a800c00c3d4fe641a6)@qtxie @Oldes Like Red, R/S is case-insensitive, which means `THIS` and `this` definitions will collide, that is why the compiler is erroring out.

[04:22](#msg58c229ed872fc8ce62e00554)@sergeantWilson `routine` is the way to interconnect Red and Red/System code, you have an example on the page you linked.

rebolek

[06:22](#msg58c2460a9eb1bd81481f4f45)@sergeantWilson see also http://red.qyz.cz/red-system-from-red.html

Oldes

[08:50](#msg58c268c2e961e53c7fc679bb)@dockimbel but I don't have `THIS` macro anywhere in my code.

[08:51](#msg58c269141465c46a56112065)Ah.. sorry I have!

[10:43](#msg58c283657ceae5376a9a2887)@dockimbel in my browser widget I'm using: `SetWindowLong hwnd GWL_USERDATA as integer! browserObject` .... I should change it when I want to use the widget under View, right? I found \[this](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L13-L30). So maybe `SetWindowLong hwnd wc-offset - 4 browserObject` where `wc-offset` is `-60`?

dockimbel

[10:47](#msg58c28451872fc8ce62e1e547)Why do you need it?

Oldes

[10:48](#msg58c28465de504908226ec4d6)to store the handle which OLE object calls require

dockimbel

[10:49](#msg58c2849e1465c46a5611cfe4)"where wc-offset is -60?" No, "wc-offset: 60"

[10:49](#msg58c284c1dd08b4b859af34c1)What is `hwnd` referring to in your line above?

Oldes

[10:50](#msg58c284f7de504908226ec7bc)result from `CreateWindowEx` in the stand alone version

dockimbel

[10:51](#msg58c285167ceae5376a9a358c)Creating which window? The top window or the browser window?

Oldes

[10:58](#msg58c286d800c00c3d4fe83981)Top window.. but my top window is probably browser window when stand alone... I don't know:) https://github.com/Oldes/Red/blob/browser/modules/browser/backends/windows/browser.reds#L1187

[11:01](#msg58c28787de504908226edc85)But I see that I use the `GetWindowLong` in functions like `DisplayHTMLPage` so maybe I could obtain the object differently.

[11:02](#msg58c287aae961e53c7fc73828)I must first find out, how one can call method on custom `face!`

dockimbel

[11:02](#msg58c287b1dd08b4b859af4d30)In View, each widget handle is stored in the face object, not in parent windows.

geekyi

[12:26](#msg58c29b73872fc8ce62e278e5)I posted some links to software that may be useful for debugging low level code in red/help channel :point\_left: \[March 10, 2017 5:04 PM](https://gitter.im/red/help?at=58c29643dd08b4b859afa282)

[12:27](#msg58c29b9a7ceae5376a9ac304)Check out apimonitor in particular, very featureful, best I've used so far!

sergeantWilson

[14:02](#msg58c2b1dbe961e53c7fc84517)@greggirwin @dockimbel @rebolek Yes got it. Thanks for the help.

Oldes

[14:02](#msg58c2b1f67ceae5376a9b666f)@dockimbel ok.. so now I can do: `view layout [b: browser 800x600]`. How I can control it?

dockimbel

[14:11](#msg58c2b42700c00c3d4fe95349)@Oldes What do you mean? It's up to you to define the interface to the component.

Oldes

[14:13](#msg58c2b47f872fc8ce62e31d77)I mean, what if I want to \[display web page](https://github.com/Oldes/Red/blob/browser/modules/browser/backends/windows/browser.reds#L902)? How I get the internal object from the face?

dockimbel

[14:33](#msg58c2b944de50490822701c5c)The handle to the underlying object is stored in face/state/1. For the rest, it's up to you to define how the component's features should be exposed to the user.

Oldes

[14:40](#msg58c2baf3e961e53c7fc883d8)Thanks. I will experiment with it. I was not using Red's view yet. Maybe the on-change actor?

dockimbel

[15:14](#msg58c2c2bb00c00c3d4fe9c5d9)You should read the code for some simple components to get an idea of how we interface them with their respective face objects.

Oldes

[16:08](#msg58c2cf61e961e53c7fc9199a)I will, but problem is that all components are deep integrated. I don't know any View extension.

dockimbel

[16:43](#msg58c2d795e961e53c7fc958b7)Indeed, I think it should be possible in the future to modularize the way graphic objects are integrated in View, so that adding new ones can be done without touching the View engine code.

rebolek

[16:43](#msg58c2d7cc7ceae5376a9c7707)Well, there's `stylize` already, waiting to be accepted... ;)

dockimbel

[16:46](#msg58c2d87ae961e53c7fc95f4a)That's just VID. ;-)

Oldes

[16:47](#msg58c2d8addd08b4b859b15720)@dockimbel I think it is not possible to do View extension yet... see for example this line: https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L418

rebolek

[16:48](#msg58c2d8c51465c46a56140cfc)Yes, it's a start :smile:

Oldes

[16:48](#msg58c2d8d8dd08b4b859b15814)I'm for example not able to release my object and so View crashes when I close window with it.

dockimbel

[16:50](#msg58c2d96c21d548df2cbb6037)Yes, the support for custom components is not fully complete yet. You can make a function to manually release your resources when the window is closed.

Oldes

[16:53](#msg58c2d9eee961e53c7fc968e5)But how to catch the moment?

dockimbel

[16:56](#msg58c2dad8872fc8ce62e436dd)`on-close` actor.

Oldes

[17:05](#msg58c2dcd97ceae5376a9c9a54)It crashes before `on-close` is evaluated.

[17:07](#msg58c2dd4521d548df2cbb7922)Also it would not be very user friendly if user would be responsible to unload every browser widget manually.

[19:29](#msg58c2fe8021d548df2cbc668d)@dockimbel is this by design?

```
red>> layout [button http://google.com]
*** Access Error: invalid UTF-8 encoding: #{ED72E16E}
*** Where: to
```

rebolek

[19:30](#msg58c2fed3872fc8ce62e52ee4)@Oldes

```
red>> b: read/binary http://www.google.com
== #{
3C21646F63747970652068746D6C3E3C68746D6C206974656D73636F70653D2...
red>> to string! b
*** Access Error: invalid UTF-8 encoding: #{ED72E16E}
*** Where: to
```

[19:31](#msg58c2fef4e961e53c7fca6de6)This problem that Google's page is not valid UTF-8.

Oldes

[19:31](#msg58c2fefa7ceae5376a9d8f66)I mean.. why the url is being loaded in the layout block?

rebolek

[19:32](#msg58c2ff36dd08b4b859b257cf)I see.

## Saturday 11st March, 2017

dockimbel

[05:08](#msg58c38642de50490822748112)It is loaded because it represents a remote resource you want to use for your GUI.

## Thursday 16th March, 2017

Zamlox

[10:46](#msg58ca6cfb1c040b8e04018782)what is the syntax for defining a function inside a

```
struct!
```

?

dockimbel

[10:54](#msg58ca6ee805a31d5a4a62f491)`struct! [ [function! []]]`

Zamlox

[10:55](#msg58ca6f0cfe6a638b1acf855e)can you give me an example ?

[10:58](#msg58ca6fbdfe6a638b1acf8917)I don't know what to put in

```
[<spec>]
```

dockimbel

[10:58](#msg58ca6fe605a31d5a4a62f9ae)It depends on the function you will be assigning that function pointer to.

[11:00](#msg58ca7045ac314c8a1a558353)See: https://github.com/red/red/blob/master/runtime/platform/COM.reds#L211

Zamlox

[11:00](#msg58ca7058590d72c864d33007)How do I specify following function inside

```
struct!
```

:

```
f1: func [a [integer!] /ref1 /local b][ b: a + 1]
```

dockimbel

[11:01](#msg58ca70722215a08f0490fc39)That is not a R/S function, but a Red one... The following one could do:

```
f1: func [a [integer!] /local b][ b: a + 1]

s: declare struct! [p [function! [a [integer!]]]]
s/p: :f1
```

Zamlox

[11:03](#msg58ca70f00b2625d06485ab56)all right. thanks.

Oldes

[12:17](#msg58ca825305a31d5a4a636868)@Zamlox if the function is used as a callback, than you should use:

```
s: declare struct! [p [function! [[callback] a [integer!]]]]
```

Else you can get issues like me: https://github.com/red/red/issues/2466

Zamlox

[12:29](#msg58ca850fa84f611959af510f)@Oldes good to know. I try to modify R/S compiler (just for fun) to see if I can implement #2412 and I didn't know how to specify

```
function!
```

inside

```
struct!
```

. I didn't find an example for this situation on http://static.red-lang.org/red-system-specs.html#section-4.7 and I was lazy to look into source code :)

dockimbel

[14:18](#msg58ca9ea22215a08f049211a1)@Oldes Only if your function is called by \*external* code, if the function pointer is passed to a R/S function to be dereferenced, then such attribute is not required.

Oldes

[16:12](#msg58cab956fe6a638b1ad14b1f)I know... \_callback_ is what I imagine under \_called by external code\_. In most cases it will be from external code, I guess.

## Thursday 23th March, 2017

Oldes

[22:05](#msg58d446a5f7f7d481044bd682)@dockimbel is it possible to prevent some word to be recognized as macro and so modified? I mean... there is defined macro `zero?`, but I need to have it in my code for zero native used without conversion to `0 =`

[22:09](#msg58d447872215a08f04ba2771)Ah.. now I see that you have already \[special cases defined in](https://github.com/red/red/blob/master/compiler.r#L3737-L3750) `process-typecheck-directive`

[22:13](#msg58d44881b809ca5f4a7701de)I wonder if it would not be better to use `lit-word!` in cases like this: https://github.com/red/red/blob/master/runtime/natives.reds#L72

[22:43](#msg58d44fa5caf143ab6654fce7)With my recent changes I've got this in the test:

```
This test started at 23-Mar-2017/23:28:23.186+1:00
Red Test Suite

ok - lexer...........................................29 / 29
ok - lexer-auto......................................18 / 18
ok - unicode.........................................67 / 67
ok - preprocessor tests..............................22 / 22
ok - run-all-comp1.red.............................4534 / 4534
** - run-all-comp2*red********************************0 / 1 **
ok - run-all-interp.red............................8961 / 8961
ok - tools............................................7 / 7
ok - Red print........................................9 / 9
ok - Red run time errors..............................8 / 8
ok - Red compile errors...............................1 / 1
```

but when I compile just the file `run-all-comp2.red`, I see no problem:

```
c:\dev\GIT\Red>run-all-comp2.exe
~~~started test~~~ run-all-comp2


~~~finished test~~~  run-all-comp2
  Number of Tests Performed:      2620
  Number of Assertions Performed: 4599
  Number of Assertions Passed:    4599
  Number of Assertions Failed:    0
```

@dockimbel how do you locate what rule fails?

[22:52](#msg58d451cab809ca5f4a772842)I suspect that the fail is because `libRedRT` was not updated.. I wonder what I'm supposed to do when I add native or remove some inbuilt function?

[22:56](#msg58d45283590d72c864fc3fdf)@PeterWAWood could you please help me locate the problem? Thanks.

[23:17](#msg58d4576c58ad4eb0284716bc)When I run the `run-all.r` script, in the log I can see:

```
*** Compilation Error: undefined symbol: red/natives/zero?* 
*** in file: %/C/dev/GIT/Red/tests/source/units/auto-tests/run-all/loop-test.red 
*** at line: 332 
*** near: [
    natives/zero?* true 
    stack/unwind 
    logic/true?
]
```

[23:17](#msg58d4579db809ca5f4a773dcd)But in my custom console everything seems to be ok:

```
>> zero? 0
== true
>> zero? 0.0
== true
>> zero? #"^@"
== true
>> zero? 0:0
== true
>> zero? 0x0
== true
>> zero? "a"
*** Script Error: zero? does not allow string! for its value argument
*** Where: zero?
>> ? zero?

USAGE:
      zero? value

DESCRIPTION:
      Returns TRUE if the value is zero.
      zero? is of type: native!

ARGUMENTS:
     value   [number! pair! time! char!]

REFINEMENTS:
```

[23:19](#msg58d45814a84f611959d8c11b)I also noticed, that the error line numbering is completely useless once there are some includes used, as it does not correspond with lines in the single file.

## Friday 24th March, 2017

PeterWAWood

[01:17](#msg58d4739a2215a08f04bacb77)@Oldes

```
run-all.r
```

has an

```
--each
```

argument which compiles and runs each test file separately. It should help to focus in on the source of the error.

dockimbel

[03:07](#msg58d48d5f6701410e586cf233)@Oldes Yes, there is a special escaping rule used for `#typecheck` arguments to avoid conflicts with the preprocessor. I don't remember if I tried lit-words for escaping, it that works, then it would be a better solution that the current method.

For the testing error, now the unit tests use development mode for compilation (so libRedRT), if you add a new native, or action, you need to also add it to `%system/utils/libRedRT-exports.r`.

[03:08](#msg58d48d947b3f37e7542ca895)For debugging other unit tests errors, the "each" mode mentioned by @PeterWAWood is the way to go for investigating it.

Oldes

[06:02](#msg58d4b6935917e26076ca5023)@dockimbel thanks... `%system/utils/libRedRT-exports.r` is exactly what I could not find.. now it is passing again. https://github.com/red/red/pull/2490

[06:05](#msg58d4b72da84f611959d9ff9b)The `lit-word!`in `#typecheck` would work... you just would have to convert it to `word!` in `process-typecheck-directive` (instead of the custom list). Just let me know if you want me to do it. So far I used the old method for `zero?`

## Saturday 25th March, 2017

dockimbel

[11:46](#msg58d6588241a045e94dc6d016)@Oldes Let's use the lit-word encoding then, it's a better way, and remove the old special encoding. Yes, you can do it.

## Monday 27th March, 2017

Oldes

[13:28](#msg58d9137ef22385553ddf367f)@dockimbel ok.. I will. Meanwhile... is this expected behavior for compiled R/S script?

```
Red/System []
test1: func[
	/local
	f [float!]
	i [integer!]
][
	f: 1000.0
	i: either true [
		as-integer (f / 2.0)
	][ 0 ]
	print-line ["result1: " f " --> " i]
]

test2: func[
	/local
	f [float!]
	i [integer!]
][
	f: 1000.0
	either true [
		i: as-integer (f / 2.0)
	][  i: 0 ]
	print-line ["result2: " f " --> " i]
]

test1
test2
```

is now:

```
result1: 1000.0 --> 1
result2: 1000.0 --> 500
```

[13:31](#msg58d91426ad849bcf42232013)I guess it will be another not yet implemented feature, right? If so.. there should be a compiler error.

[13:44](#msg58d9173808c00c092a1e1f86)Can be simplified to:

```
i: declare integer!
i: as-integer either true [2.0][ 3.0 ]
f: either true [2.0][ 3.0 ]
print-line ["result==> i: " i " f: " f]
```

with:

```
result==> i: 1 f: 2.0
```

[13:48](#msg58d918468fcce56b20a1ab22)

```
i: declare integer!
i: either true [as integer! 2.0][ 3 ] ;== -2147483648
```

qtxie

[14:06](#msg58d91c59b52518ed4db0d85a)@Oldes Yes. There are some cases the conversion is not working properly. You can open a ticket for it.

[14:07](#msg58d91c888fcce56b20a1c0cc)I think this code will work:

```
i: either true [as-integer 2.0][as-integer 3.0]
```

Oldes

[14:08](#msg58d91ce27ea420cc420da6df)It does not work either. Don't know how to describe the bug in English correctly

qtxie

[14:12](#msg58d91db50e4137042ab62ce5)Ah, sorry, I want to say this one:

```
either true [i: as-integer 2.0][i: as-integer 3.0]
```

Oldes

[15:25](#msg58d92f038bb56c2d114a5154)Right... that is visible in my `test2`, where it is correct.

dockimbel

[15:49](#msg58d934918bb56c2d114a6de1)@Oldes Using `either` as an expression + typecasting is not reliable.

Oldes

[15:51](#msg58d93508ad849bcf4223d29b)I know now.

dockimbel

[15:53](#msg58d93571ad849bcf4223d435)The issue is that `either` was never meant to be used as an expression, but statement only. Later, I relaxed it a bit, but the compiler cannot handle it properly anyway, so it will generate wrong code for that (especially on ARM). It's about the registers allocation handling, so it is not something that can be fixed simply, it would need a re-design of the whole code emitter, so that's for R/S 2.0. In the meantime, avoid typecastings on returned value from `either`.

Oldes

[15:55](#msg58d935e7f22385553ddff33b)Ok.. I logged the issue anyway: https://github.com/red/red/issues/2504 so you can post this explanation there.

dockimbel

[15:55](#msg58d93604b52518ed4db1649c)There was an issue for that in the past and we moved it out to the wiki, on a R/S page IIRC. Because it is not an issue we can fix before 1.0.

Oldes

[15:56](#msg58d93642408f90be665f5870)Ah.. Isn't it enough to have it open with comment?

dockimbel

[15:57](#msg58d93668b52518ed4db1666d)The issue tracker is not there for permanent tickets, it's not a wiki, tickets have to be processed and closed.

Oldes

[15:57](#msg58d9367b08c00c092a1ebf8d)Ah.. Isn't it enough to have it open with comment?

dockimbel

[15:58](#msg58d936a68bb56c2d114a7788)I prefer not, as it would make a precedent and others will start using the tracker as an alternative to the wiki, for documenting things...

[15:59](#msg58d936c68fcce56b20a2518b)I think it would be better to document that issue in the R/S documentation directly.

Oldes

[15:59](#msg58d936f28bb56c2d114a799e)I closed it.

dockimbel

[16:02](#msg58d937a308c00c092a1ec5b0)Ah, too quick. I need a way to remember to document it in the R/S spec doc. :smile:

## Thursday 30th March, 2017

Oldes

[19:37](#msg58dd5e6f408f90be66716cfe)@dockimbel regarding the `system/console/limit` rename, what name you recommend? `width` or `columns`?

[19:38](#msg58dd5ebc4cb8d09173421c2d)We could also provide info about height, so it could be `system/console/size` with a `pair!` value.

greggirwin

[22:07](#msg58dd819d0e4137042ac9d162)+1 for size.

## Friday 31st March, 2017

dockimbel

[12:18](#msg58de48f88fcce56b20b7db72)`size` is fine if the height is filled too. Though, we won't spend time implementing that, as we have a new console coming to 0.6.3 where we might change that. Moreover, such field is temporary and will be removed when the console:// port will be introduced. So, we should stick only the features we really need in the console.

Oldes

[12:33](#msg58de4caf408f90be66752374)I already implemented it https://github.com/red/red/pull/2514

[12:35](#msg58de4cf7f22385553df5d550)I wanted to try the new console, but it is not possible to compile it from the latest sources.

[14:25](#msg58de66ecb402a53211d03563)Any idea why the `AppVeyor build` test fails all the time recently?

dander

[16:47](#msg58de882fb402a53211d0db06)@Oldes looks like the test suite is randomly hanging, since the build times out after an hour. It doesn't look connected to any particular tests, and has happened at least once in both red and red/system tests

greggirwin

[16:54](#msg58de89b44cb8d09173470bb5)Peter is working on some issues with tests right now. That may be related.

## Saturday 1st April, 2017

PeterWAWood

[00:08](#msg58deef618bb56c2d11630f76)There are problems running the tests on Windows/10. Sometimes they hang, sometimes they complete. It seems that the issue is related to

```
call
```

in Rebol. I hope to have time to remove the Rebol dependancy from the tests now that we have sufficient IO capabilities to do so.

## Sunday 2nd April, 2017

Oldes

[19:38](#msg58e15343bc370d964edfc4e2)@dockimbel I wanted to ask you... how will Red handle situations with external callbacks? I mean... if I would for example used \[timer callback](https://goo.gl/ebSVAW), it could pretty well corrupt evaluation in the main Red task, couldn't it?

[19:44](#msg58e154a74cb8d09173508d6d)The timer function above is just an example.. the callback can come \_any time_ from any external library.

## Tuesday 4th April, 2017

dockimbel

[15:10](#msg58e3b753ad849bcf424e713c)I also experience more tests sessions freezing than usual. `call` is most probably the cause, though it was running fine until recently...

[15:13](#msg58e3b80d8e4b63533d960f31)@Oldes  
&gt; The timer function above is just an example.. the callback can come \_any time_ from any external library.

No, Red is for now single-threaded, and you can only have one Red session per process, so you cannot corrupt the Red stack(s) that way. Once Red is able to work in separate threads from the host (I guess you are asking in the context of libRed usage), then we'll need to de-couple the calls into libRed and probably use an internal message queue.

## Wednesday 5th April, 2017

Oldes

[09:44](#msg58e4bc8ead849bcf4252bd24)Red is in single thread now but the external function is running on own thread so I'm not so sure if it is safe. The true is, that I really have no clue how OS handle such situations internally. I was experiencing issues when playing with Fmod binding using callbacks and did many traces (which may be also related to the know problem with recursive printing), so I was asking. I guess the work on IO should cover this situations, right?

dockimbel

[10:11](#msg58e4c2b84cb8d091735e790e)&gt; Red is in single thread now but the external function is running on own thread so I'm not so sure if it is safe.

libRed is mono-instance for now, so it is fine as long as you call it from a single thread. If you are calling it now from more than one thread, you will have troubles. ;-)

Oldes

[10:17](#msg58e4c429b52518ed4ddfc20f)Almost every bigger external binding will have own thread.

dockimbel

[10:21](#msg58e4c53fad849bcf4252e26b)@Oldes libRed runs in the caller's thread, so "own thread" is fine as long it's the only one using libRed API.

## Friday 7th April, 2017

Oldes

[13:45](#msg58e79814f22385553d1aad09)@dockimbel what would be correct import definition for C function defined as:

```
SQLITE_API void sqlite3_log(int iErrCode, const char *zFormat, ...);
```

?  
I know there is `[variadic]` argument, but is it possible to specify the arguments? In the doc is: \_no need to specify any argument here_

dockimbel

[14:47](#msg58e7a6814cb8d091736a95fa)@Oldes Correct import spec would be: `[[variadic]]`. R/S does not support arguments naming in variadic cases.

## Monday 10th April, 2017

Oldes

[14:50](#msg58eb9bc668bee3091f2b3121)@dockimbel `[[variadic] return: [integer!]]` is also valid?

[14:52](#msg58eb9c19bdf4acc112466743)Btw... would it be possible to fix compiler to provide better information on line numbers for errors? In my cases it is totally off most of the time.

[14:54](#msg58eb9c9768bee3091f2b33f6)But I'm not sure why.. as on simple test cases it is correct.

[15:10](#msg58eba066f22385553d290688)Maybe because my source has almost 10000 lines:)

dockimbel

[16:08](#msg58ebae108e4b63533db53eac)@Oldes Yes, that's valid.

[16:10](#msg58ebae638bb56c2d1193dce2)Usually, the preprocessor is messing up the line numbers, I am not sure if that's easily fixable or not, as R/S code is LOADed before being compiled (unlike C or other static languages). This makes it a big challenge to map back a position in code with a line number in original source code in text form.

[16:13](#msg58ebaf118bb56c2d1193e089)If the compiler was written in Red, we could add a new datatype to solve that elegantly, but with Rebol, options are limited.

[16:15](#msg58ebaf92bdf4acc11246cc05)Maybe the preprocessor could adjust the hidden line numbers in block headers during the processing, that would probably solve most cases.

Oldes

[17:38](#msg58ebc30ef22385553d29b79e)Ok.. no problem.. I understand that it is to be lost work so I don't need it that much.. I can find error even in really large files with little afford.

[17:41](#msg58ebc3de8bb56c2d11944f67)Btw... \[here is the file I was working on](https://gist.github.com/Oldes/a806110a64a0b44a136cdd3a25af1671). It is complete Red/System SQLite3 binding... without testing so far.. it is automatically converted with human partial review so far. Work in progress:)

greggirwin

[17:48](#msg58ebc557b52518ed4dfadc83)Fantastic Oldes! How did you generate it? Generating from %.h?

## Tuesday 11st April, 2017

Oldes

[08:56](#msg58ec9a20408f90be66ac3d8c)Yes... parsing a header file.

## Tuesday 18th April, 2017

raton3062015

[06:44](#msg58f5b5e78bb56c2d11ba6100)P: declare pointer! \[Integer!] a: 50 how I get the address of a to assign to p

iArnold

[07:05](#msg58f5baa9bdf4acc1126d6191)P points to http://static.red-lang.org/red-system-specs.html#section-4.8 now.

dockimbel

[07:08](#msg58f5bb7a8fcce56b20114a31)@raton3062015 You can avoid the declaration part (the compiler will infer it in that case), just use:

```
a: 50
p: :a
```

raton3062015

[07:10](#msg58f5bbd1ad849bcf42953f45)Thanks

[08:57](#msg58f5d4f38bb56c2d11bae5fc)negative?: func \[a \[integer!]]\[print a]

[08:57](#msg58f5d50c08c00c092a8fa5b7)is not printing

dockimbel

[08:58](#msg58f5d53f8e4b63533ddc7ed3)@raton3062015 `negative?` is a pre-defined macro: https://github.com/red/red/blob/master/system/runtime/common.reds#L15

raton3062015

[09:10](#msg58f5d7f2881b89e1015fa85d)OK now I understand

## Wednesday 19th April, 2017

Oldes

[21:27](#msg58f7d62d08c00c092a983f57)What would be Red/System import for C export with this source?

```
S_API void SteamAPI_ISteamMatchmakingPingResponse_ServerResponded(intptr_t instancePtr, class gameserveritem_t & server);
```

[21:28](#msg58f7d66abdf4acc112766cf5)The second (`class gameserveritem_t & server`) argument is the one I'm not sure how to deal with. And I know struct definition of `gameserveritem_t`

## Thursday 20th April, 2017

dockimbel

[03:12](#msg58f8271bcfec919272579c93)@Oldes What is `class`?

Oldes

[05:19](#msg58f844f78fcce56b201b9413)It may be representet as a struct I guess. It is just that it is the only one export using `&`.

[05:23](#msg58f845eb881b89e10169a7a3)But Steam API is mainly made for C++ and providing \_flat_ C API for other languages... the header file is autogenerated so it may be the reason.

## Wednesday 26th April, 2017

Oldes

[17:04](#msg5900d31e587a245e244ef6af)@dockimbel sorry to disturb again... but is this routine correct?

```
file-exists?: routine [
	"Determines if a file exists on Steam Cloud"
	file [file!]
	return: [logic!]
	/local
		c-file [c-string!]
		len    [integer!]
		val    [logic!]
][
	len: -1
	c-file: unicode/to-utf8 file :len
	val: Steam/file-exists? c-file
	print-line ["ex? " val]
	val
]
```

[17:05](#msg5900d3648e4b63533d07f95d)I'm getting `ex? true` in the log, but when I use it in \*Red* code, it seems not to be recognized as `true`

[17:38](#msg5900daf9c1d3b50154228e94)This version does not work for me either:

```
file-exists?: routine [
	"Determines if a file exists on Steam Cloud"
	file [file!]
	/local
		c-file [c-string!]
		len    [integer!]
][
	len: -1
	c-file: unicode/to-utf8 file :len
	logic/box Steam/file-exists? c-file
]
```

When I use this routine like:

```
ex2:  Steam/file-exists? file
print ["???ex2: " ex2 " " type? ex2]
if ex2 [
	print to string! Steam/file-read file
]
```

The debug print gives: `???ex2: true logic` but the read inside `if` is not evaluated.

[17:38](#msg5900db15f22385553d7bf812)So I really don't know what is going on.

[18:00](#msg5900e04e881b89e1018b2664)Hm... I think I've found the reason... when I change the imported DLL function result (which is defined in C as `bool`) from `logic!` to `integer!`, I can see that it returns `35332353` for true and `35332352` for false result.

[18:02](#msg5900e0bc881b89e1018b2821)hm.. actually it returns always different numbers.. just false is smaller.

[18:03](#msg5900e0d912d24099359f61a1)@dockimbel is it possible that it is result from the `struct-by-value`changes?

[18:08](#msg5900e22912d24099359f6879)Hm... or maybe I should just do `01h and` on the returned result. Or even better Red/System should do this if return type is `logic!`

[18:20](#msg5900e4f3c1d3b5015422c0f7)So I've solved it with this ugly workaround:

```
file-exists?: func[
	file [c-string!]
	return: [logic!]
][
	;@@ steam returns ballast in the higher bits so we must clear them manually!
	as logic! 01h and as integer! SteamAPI_ISteamRemoteStorage_FileExists ISteamRemoteStorage file
]
```

[18:21](#msg5900e535c1d3b5015422c214)But maybe it would be better to change the `red-logic!` datatype to ignore the higher bits. What do you think @dockimbel ?

greggirwin

[19:18](#msg5900f28c881b89e1018b7ccc)If they're returning junk in the rest of the bits, that's really bad.

## Thursday 27th April, 2017

dockimbel

[11:13](#msg5901d24f12d2409935a31876)@Oldes Could you test it with a Red version before struct-by-value support was merged into master, just to see if that's related?

Oldes

[11:14](#msg5901d2b3d32c6f2f09467bc3)I will try.. but I must made some minimal version first because I depend on `struct-by-value` in the full one.

dockimbel

[11:15](#msg5901d2bed32c6f2f09467bdb)If it's confirmed that it's not an R/S issue, then it means that Steam uses bit 0 only to signify the boolean state. In such case, your last code is correct.

Oldes

[11:15](#msg5901d2de08c00c092abec069)Anyway.. should not Red sanitize its logic value?

dockimbel

[11:17](#msg5901d33ef22385553d7feb85)It does when you create it by converting it from an integer value. When used in an imported function return spec, it expects 1 for True and 0 for False. R/S is already implementing the most used binary representation for boolean values. If your function is using a different convention, it's up to you to provide proper conversion code (R/S compiler cannot guess it). Steam should do a better job as providing an external API which respects \[the standards](http://stackoverflow.com/questions/19351483/how-is-a-bool-represented-in-memory).

Oldes

[11:24](#msg5901d4d4d32c6f2f094682b1)It is same with the version from 26.3.

dockimbel

[11:24](#msg5901d4efd32c6f2f094682fd)So your code is right, and you can rant on Steam forums about silly API return values. ;-)

Oldes

[11:28](#msg5901d5f2f22385553d7ff83a)I'm using their flat C API... most people use ordinary C++ sources and C++ compiler probably don't complain on it... I think it would be just lost of time trying to contact Steam because something like that.

[11:29](#msg5901d628587a245e245323c4)What fooled me is like Red says that value is `true` but `if` and `either` find it as `false`.

dockimbel

[11:35](#msg5901d78d8bb56c2d11ea305e)@Oldes Can you reproduce that with minimal code? Such thing should not happen.

Oldes

[12:25](#msg5901e32a8bb56c2d11ea65b0)Hardly... without using the external library... it really looks that `as-logic!` is doing proper conversion even when passing big integer.

[12:25](#msg5901e34b8bb56c2d11ea66b9)@dockimbel why just not change this line: https://github.com/red/red/blob/master/runtime/datatypes/logic.reds#L38

[12:26](#msg5901e374d32c6f2f0946cafd)using `cell/value: 1 and value` instead just `cell/value: value`?

dockimbel

[12:26](#msg5901e38112d2409935a3684d)Why should we do that? `value` is defined as `logic!`, so this function does not need to do any bit hacking...

Oldes

[12:27](#msg5901e3a38bb56c2d11ea68a3)to get proper value when passed something different than `0` or `1`?

dockimbel

[12:28](#msg5901e3ed587a245e2453612e)It's not up to this function to ensure that the value representation is correct in memory. That should be done at the position where the value is produced, otherwise it's just an adhoc hack.

Oldes

[12:33](#msg5901e5178bb56c2d11ea7108)@dockimbel here is the minimal code:

```
Red []

test: routine [
	/local
		i [integer!]
][
	i: 35332353
	logic/box as logic! i
]

b: test
print ["b is:" b "of type:" type? b]
print either b ["ok"]["ko"]
```

will output:

```
b is: true of type: logic
ko
```

meijeru

[12:38](#msg5901e654587a245e24536bf5)Should you not put the result of the routine on the stack?

Oldes

[12:40](#msg5901e6d4cfec9192727dcf82)I originally asked what is the right way:) It is true, that this works:

```
test: routine [
	/local
		i [integer!]
][
	i: 35332353
	as logic! i
]
```

[12:47](#msg5901e8498fcce56b2040ef5a)The question now is, if one should use `logic!` as a return type for imported functions, because the `as logic!` does the proper bit cleaning, but the import itself not.

[12:50](#msg5901e917c1d3b5015426d323)Hm.. `as logic!` is not doing bit cleaning because `35332352` converts to `true`. Any not zero value seems to be `true`.

[13:16](#msg5901ef3508c00c092abf47b3)What if I have routine, which just prints some info... how to make it to return none?

[13:37](#msg5901f40ec1d3b50154270d42)This seems to do what I wanted, is it correct?

```
info: routine ["Prints some SteamAPI related info" return: [unset!]][
	Steam/info
	unset/push-last
]
```

[13:52](#msg5901f788587a245e2453bffe)Regarding the `logic!` topic.. I think that Steam has `bool` defined as a `char` (for the flat C api) so I think, I will just not use `logic!` in the binding and use `byte!` instead and casting it to `logic!` afterwards. If @dockimbel will not come with a better way.

[14:14](#msg5901fce1c1d3b50154273671)Here is visible how many functions are affected with it https://github.com/Oldes/Red-Steam/commit/eb3d1f8e86f21a22fc65cfb100bd509faf44638c . :)

dockimbel

[15:24](#msg59020d338bb56c2d11eb454e)If you specify a `return: [logic!]` in a routine, it will do the conversion to a `red-logic!` value automatically and put on the Red stack.

[15:26](#msg59020db98e4b63533d0d17e5)`Any not zero value seems to be true.`That is in the \[docs](http://static.red-lang.org/red-system-specs-light.html#section-4.9), see the conversion matrix.

Oldes

[15:32](#msg59020f008bb56c2d11eb4f9e)@dockimbel could you please review this routine? https://github.com/Oldes/Red-Steam/blob/master/Steam.red#L58-L80

[15:32](#msg59020f236aea30763d4a6518)If use `return: [binary!]`, I have error during compilation.

[15:34](#msg59020f7a12d2409935a44ea6)

```
Compiling to native code...
*** Compilation Error: wrong return type in function: exec/ctx293~file-read 
*** expected: [struct! [
        header [integer!] 
        head [integer!] 
        node [pointer! [integer!]] 
        _pad [integer!]
    ]], found: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]] 
*** in file: %/C/dev/GIT/Red-Steam/Steam-test.red 
*** in function: exec/ctx293~file-read
*** at line: 155 
*** near: []
```

When I does not specify it, it works ok, but I'm not sure if I'm not using it wrong again.

[15:38](#msg590210938fcce56b2041b6c8)Ah... I've got it, I must use: `as red-binary! SET_RETURN(bin)` if `return: [binary!]` is used.

dockimbel

[16:03](#msg590216348e4b63533d0d43c7)Yes, that's correct.

Zamlox

[16:39](#msg59021ed88e4b63533d0d7565)@dockimbel how do I pass correctly from R/S a parameter of

```
char**
```

to a C++ function ?

dockimbel

[16:45](#msg5902200f587a245e24549a3c)@Zamlox You can pass an `int-ptr!`. (You mean C function I guess, C++ functions can't be accessed from R/S.)

Zamlox

[16:48](#msg590220e0c1d3b5015427f0d3)yes, C function. actually it's about

```
strtod
```

, second parameter is defined as

```
char**
```

, it is imported as

```
byte-ptr!
```

but when I pass such a value, the result is not as expected.

dockimbel

[16:50](#msg5902216c12d2409935a4a5d2)`char**` means you need to pass a pointer on a c-string! pointer. The declared type does not matter as much as passing a correctly allocated double pointer. You can change the second argument type in the import declaration of `strtod()`, as it should not affect the existing code.

Zamlox

[16:52](#msg590221e96aea30763d4ac30a)ok, thanks.

dockimbel

[16:53](#msg590222018e4b63533d0d868f)A way to achieve that can be to pass a `struct [p [c-string!]]` by reference.

Zamlox

[16:54](#msg590222286aea30763d4ac407)ok.

## Wednesday 3th May, 2017

Oldes

[11:16](#msg5909bbfd8bb56c2d1107dac1)@dockimbel Is there any way how to construct variadic argument from `red-block!`?  
Let's say, that I have imported function defined as:

```
sqlite3_mprintf: "sqlite3_mprintf" [[variadic]
	return: [c-string!]
]
```

I can use it in Red/System like:

```
str: sqlite3_mprintf ["INSERT INTO table VALUES(%Q, %d)" "Fo'o" 42]
```

but now I don't know how to deal with it from Red level :/

dockimbel

[11:21](#msg5909bd2712d2409935c09b8a)The same way Red deals with `printf()`: it does not use it at all. That's too low-level for Red, such API is meant for C-level code only.

[11:23](#msg5909bd9a08c00c092adc7d39)Proper parameters interpolation in SQL queries needs to be handled by Red code only, no need to use any API. You can get some inspiration from my MySQL driver code.

Oldes

[11:43](#msg5909c2595e61bd94342b8562)I know it is not needed, just wanted to know if it is doable or not.

dockimbel

[11:48](#msg5909c37108c00c092adc9796)You can't deal with it from Red level, because Red deals with Red values on the Red stack, while this C function expects a list of C-level types pushed on the native stack.... It's not even apples and oranges, it's apples and the planets in our solar system. ;-)

[11:51](#msg5909c43a881b89e101ac7956)You could write code for converting some Red types (just a few actually) into low-level values, and manually push them on the native stack. Though, that's quite complex, error-prone (you have to deal with low-level ABI constraints, like proper arguments alignment on stack), and would not be an elegant solution.

Oldes

[12:02](#msg5909c6e8d32c6f2f09641ad2)Ok.. no problem.

[12:04](#msg5909c73812d2409935c0c9bb)I was just asking if it is possible to use just a struct with value count at the beginning or something like that.. if it is so low level and complex as you say, than I can easily not use it from Red.

dockimbel

[12:07](#msg5909c7e85e61bd94342b9fd4)C language has no knowledge or understanding about 128-bit Red cells. There is no way that copying `red-*` cells on the native stack could work (if that's what you had in mind). Moreover, it's unsafe to have Red cells outside of Red-allocated memory regions, as they would escape from the GC. The `[variadic]` attribut does not do anything other than telling the R/S compiler that such imported function can handle a variable number of arguments. Arguments are still C-level values.

Oldes

[12:09](#msg5909c87412d2409935c0cf4d)I'm dealing with it on the Red/System side... so convert `red-string!` to `c-string!` is not a problem. I know I cannot pass direct `red-value!` there.

## Thursday 4th May, 2017

Oldes

[10:48](#msg590b070508c00c092ae1c944)@dockimbel lets say, that I have `red-block!` value, and add `c-string` to it using:

```
string/load-in 
	c-string
	length? c-string
	my-block
	UTF-8
```

What is the best way to mark such an inserted value with the `flag-new-line`?

[11:15](#msg590b0d54d32c6f2f09695c98)Ok... problem solved... I'm giving the flag on the first value (row number) using:

```
val: as red-value! integer/make-in blk data/value
val/header: val/header or flag-new-line
```

When I was trying to give it on the last value in the row (and so in the block), I've got a crash, so I was asking... anyway.. now I have result as I wanted.

## Thursday 11st May, 2017

rebolek

[07:05](#msg59140d209d90dc7a1c693731)I have this line:

```
pos/value and (as-byte 128 >> (bit and 7) xor 255)
```

that used to compile, but now throws error:

```
*** Compilation Error: more than one expression found in parentheses
```

I've tried putting addition parenthesis there, but cannot make it to compile.  
Anybody knows, how to rewrite it, so it will compile?

dockimbel

[10:09](#msg59143859c4d73f445a967a9b)@rebolek Maybe worth a ticket to examine it more deeply.

rebolek

[10:09](#msg591438760a783b6c0a885cce)@dockimbel thanks, I will make a ticket for it.

Oldes

[11:30](#msg59144b59c4d73f445a96ca31)@dockimbel how to do something like this `#either target = 'MSDOS [` in Red/System file?

[11:33](#msg59144c0c0a783b6c0a88b3ab)sorry my fault... I was including `reds` file in `red` out of `#system []`.

## Tuesday 16th May, 2017

rebolek

[06:33](#msg591a9d3233e9ee771caf9573)I am really getting lost here... what exactly is a `handle!` ?

[06:34](#msg591a9d76631b8e4e61dddd60)I thought it should be `pointer! [integer!]]`, but then how an I get this error?

```
*** Compilation Error: argument type mismatch on calling: exec/SendMessage
*** expected: [pointer! [integer!]], found: [struct! [
        header [integer!]
        padding [integer!]
        value [integer!]
        _pad [integer!]
    ]]
```

dockimbel

[07:09](#msg591aa58f83cb5db07336a1cb)`handle!` is a Red datatype, so it has a cell struct (`red-handle!`). A `handle!` is a boxed representation of a low-level handle, pointer, or any other 32-bit value.

rebolek

[07:10](#msg591aa5d08a05641b11886f48)I see. So I need to do `as [pointer! [integer!]]` to use it on R/S side?

dockimbel

[07:11](#msg591aa60e33e9ee771cafbdc3)No, a 128-bit struct is not the same as a `int-ptr!`. You need to extract the value stored inside the `red-handle!` struct, in the `value` field.

rebolek

[07:12](#msg591aa66083cb5db07336a3b8)There is also `#define handle! [pointer! [integer!]]` in Red/System, which is probably the main source of my confusion.

dockimbel

[07:13](#msg591aa69f0a783b6c0aa1e23a)Names in Red and R/S are in different realms. `handle!` word in Red and `handle!` macro in R/S are two totally different things. There is a high-level boxed representation for handles, and a low-level, unboxed one.

rebolek

[07:15](#msg591aa70a83cb5db07336a5d7)I see. There must be some stricter checking in compiler, because the code was able to compile. I am trying to get it working again.

[07:15](#msg591aa716c4d73f445aafafec)So how do I extract the handle's value?

dockimbel

[07:16](#msg591aa737c4d73f445aafb039)The same way you extract values from any other Red value in R/S. If `handle` is of type `red-handle!`, then `handle/value` gives you the stored handle value.

rebolek

[07:18](#msg591aa7cf00efc2bb3e70a215)Thanks. Once I've got this working again, I will document it to save others from same mistakes :)

## Wednesday 17th May, 2017

rebolek

[05:24](#msg591bde9d0a783b6c0aa76eb8)@dockimbel Considering that `handle!` is basically `integer!` value, wouldn't it make sense to unbox it automatically, just like `integer!`?

dockimbel

[06:42](#msg591bf0ce8a05641b118e23fb)You mean for routines?

rebolek

[06:42](#msg591bf0d7f3001cd3422cd246)Yes.

dockimbel

[06:48](#msg591bf2519f4f4ab05bd136a6)Maybe, unless we add extra info to it, like a symbol for marking the domain of origin (for debugging purpose).

rebolek

[08:00](#msg591c032e9f4f4ab05bd17c6a)@dockimbel When trying to call a function in `#call` block with `red-handle!` as arg, I get following error:

```
*** Red/System Compiler Internal Error: Script Error : handle! has no value
*** Where: process-call-directive
*** Near:  [to word! form get type]
```

It is probably missing somewhere in compiler.r (I am looking where, but I am not that familiar with compiler).

[08:01](#msg591c033c9f4f4ab05bd17cc6)Should I fill an issue for it?

Oldes

[08:52](#msg591c0f6283cb5db0733d0f22)@rebolek I'm already using the extra info in `red-handle!` so I am against it. Also into what type you would like to unbox it? To `integer!` and lost possibility of type check?

rebolek

[08:53](#msg591c0f909f4f4ab05bd1b1a4)to `handle!`

Oldes

[08:56](#msg591c102592217cca5885230a)On the other side I'm not passing `red-handle!` anywhere directly... as I'm using DSLs and pass commands and values in a block.

rebolek

[08:57](#msg591c107b8a05641b118eacd9)I can live without it, it was just a thought.

[08:57](#msg591c108983cb5db0733d142d)What I am really interested is a solution to above problem.

Oldes

[08:59](#msg591c10d80a783b6c0aa84a6a)Also `handle!` in R/S is not `integer!` but `[pointer! [integer!]]`

rebolek

[08:59](#msg591c10e50a783b6c0aa84a8f)I know.

Oldes

[09:00](#msg591c11202b926f8a676382ef)I was not using `#call` yet, so you must wait for @dockimbel ... and maybe also provide simple code, not just error.

rebolek

[09:00](#msg591c113d83cb5db0733d17f4)Hm, it seems I've got a solution to my `#call` problem.

[09:01](#msg591c1165d1a7716a0ad5501f)@Oldes code is simple, something like `red-handle: handle/box value #[call some-func red-handle]`

[09:03](#msg591c11e22b926f8a6763877f)There are two problems:  
1\) Rebol doesn't know `handle!`. I've added `handle!: 'handle` as a workaround  
2\) Red's `%datatypes/handle.reds` is missing `push`, so I've added that also  
It now compiles without error, but it's my first modification of compiler, so who knows what I've missed ;)

dockimbel

[09:04](#msg591c1221c4d73f445ab602e1)@rebolek Those are the right changes to support it.

rebolek

[09:04](#msg591c1231c4d73f445ab6035f)@dockimbel Cool, I'll make a PR for it.

dockimbel

[09:05](#msg591c123f0a783b6c0aa85134)See line 73 in %red/compiler.r, the new definition should be added there, and in the same way as the other one.

rebolek

[09:06](#msg591c129383cb5db0733d1ee8)I see, like `float!`, thanks!

dockimbel

[09:08](#msg591c12fe83cb5db0733d20b3)The PR is welcome.

rebolek

[09:25](#msg591c172700efc2bb3e7724df)@dockimbel Should I add `handle!` also to `scalar?` function? I think I should..

Oldes

[09:26](#msg591c173992217cca588549fc)I don't think so.

rebolek

[09:26](#msg591c1752f3001cd3422d8d7c)That's why I ask :)

dockimbel

[09:28](#msg591c17cf8a05641b118ecef6)For what purpose? `scalar?` function is used only when compiling literals and `handle!` does not have a literal representation.

rebolek

[09:29](#msg591c17e933e9ee771cb64db9)Ok, I was just looking around compiler source :)

[09:29](#msg591c17fc5e34568d5e620517)Will do just those two changes described above.

[09:47](#msg591c1c418a05641b118ee6cd)https://github.com/red/red/pull/2692

dockimbel

[10:31](#msg591c266633e9ee771cb69017)@rebolek Did you run the unit tests on your changes? It seems you introduced a regression: https://travis-ci.org/red/red/jobs/233176354

rebolek

[10:34](#msg591c271a2b926f8a6763f2c9)Hm, strange...let me recheck it.

[10:43](#msg591c296df3001cd3422de5e3)No, still the same, no errors... can it be Linux specific? I tested it on Windows.

dockimbel

[10:45](#msg591c29ae2b926f8a6763ff83)Tests are failing on both Linux and macOS.

rebolek

[10:45](#msg591c29daf3001cd3422de7f4)http://i.imgur.com/pXofZY3.png

dockimbel

[10:50](#msg591c2b0200efc2bb3e778372)The issue is not on Windows.

rebolek

[10:52](#msg591c2b579f4f4ab05bd23473)Hm, I see. I've tested only on Windows.

[10:53](#msg591c2ba05e34568d5e6262ba)I have troubles running the test suite on macOS, it still complains about missing rebol.

dockimbel

[11:00](#msg591c2d448a05641b118f37f4)

```
lisp
*** Compilation Error: invalid definition for function red/handle/push: [
    value [handle!] 
    return: [red-handle!] 
    /local 
    hndl [red-handle!]
] 
*** in file: %/home/dk/Desktop/red/runtime/datatypes/handle.reds 
*** at line: 43 
*** near: [func [
        value [handle!] 
        return: [red-handle!] 
        /local 
        hndl [red-handle!]
    ] [
        hndl: as red-handle! stack/push* 
        hndl/header: TYPE_HANDLE 
        hndl/value: as integer! value 
        hndl
    ]
```

rebolek

[11:01](#msg591c2d7b9f4f4ab05bd23dba)Hm, what's wrong with it?

[11:03](#msg591c2e055e34568d5e626cca)I used code from `%datatypes/integer.reds` and just changed few things.

dockimbel

[11:06](#msg591c2ecc2b926f8a676416a4)Seems the R/S compiler has troubles with `[handle!]`, I can't investigate that now as I'm working on some other code.

rebolek

[11:07](#msg591c2f0283cb5db0733db0ea)Ok, thanks, I will check it on macOS, maybe I will find the problem.

[11:08](#msg591c2f1e83cb5db0733db153)I will let you know, once I find something.

Oldes

[11:36](#msg591c35c2631b8e4e61e50d40)@dockimbel is there any easy way how to detect, if R/S script is being included with Red runtime? So I could include files to have the script working even without runtime?

dockimbel

[11:37](#msg591c36165e34568d5e629093)I don't understand the question. How "R/S script" and "Red runtime" are related? Red runtime has static dependencies.

Oldes

[11:44](#msg591c379292217cca5885e7b1)For example... I want to have Red script, which by default can use content of the `simple-io.reds` (I know it is temporary)... and this script is including R/S script... but I still want to be able compile this R/S script as separate app... which I'm able when I include own simplified `simple-io.reds`.

dockimbel

[11:45](#msg591c37df9f4f4ab05bd26e81)&gt; I want to have Red script, which by default can use content of the simple-io.reds

`simple-io.reds` is part of Red runtime, so it's already available in all Red scripts.

Oldes

[11:45](#msg591c37e6631b8e4e61e51578)I know.

[11:46](#msg591c37fc5e34568d5e629bca)But not in my R/S script, which I want to use in Red, but also as separate one.

[11:46](#msg591c382ff3001cd3422e2be7)Actually I have `simple-io-minimal.reds`, which does not depend on Red runtime and which I want to use when not compiling for Red.

dockimbel

[11:47](#msg591c38560a783b6c0aa90813)Ok, so the question is: "How to detect, from R/S, if Red runtime is embedded?" right?

Oldes

[11:47](#msg591c3860631b8e4e61e517cf)Probably:)

[11:48](#msg591c388e631b8e4e61e51889)Or maybe even better, if it is possible to detect, if for example `simple-io` context already exists. If not, I can include file which defines it.

dockimbel

[11:48](#msg591c38a3f3001cd3422e2d86)No available ways to do that.

Oldes

[11:49](#msg591c38dfc4d73f445ab6bc21)Ok.. never mind.. I can make a third file, which includes it with the core R/S script, which is supposed to be for both, Red and R/S

dockimbel

[11:50](#msg591c391f92217cca5885eeae)From R/S, you can use `#if red-pass? = yes [...]` to detect is Red runtime is embedded.

Oldes

[11:51](#msg591c393283cb5db0733dded2)That should be enough.

[11:51](#msg591c393592217cca5885ef34)thanks

[11:51](#msg591c394883cb5db0733ddf20)A little bit cryptic imho

dockimbel

[11:53](#msg591c39bf9f4f4ab05bd277d0)That compilation option is used internally by the R/S compiler to detect if Red compiler has passed before it. It's an indirect way to detect if Red runtime is embedded, as there is no other way.

Oldes

[11:56](#msg591c3a7e83cb5db0733de4c3)Main reason is that it is much more faster to do tests just on R/S files. :)

[11:57](#msg591c3aa09f4f4ab05bd27a95)And of course a chance to create a tiny one purpose utility just with R/S but still be able to share code with Red.

rebolek

[14:47](#msg591c627392217cca5886c8be)@dockimbel So I've added `'handle!` to `type-syntax` in `%system/compiler.r` and `handle 4 unsigned` to `datatypes` in `%system/emitter.r`. There's also `datatype-ID`, but I don't know what to add there. Anyway, it now compiles on macOS and all tests pass on macOS and Windows (I haven't tested on Linux).

[14:47](#msg591c62908a05641b119048e5)I wonder, why the first version worked on Windows without these changes.

dockimbel

[15:04](#msg591c666133e9ee771cb7d546)@rebolek That's not the correct fix, you have created a pseudo-datatype doing that, while it should just be a #define.

[15:31](#msg591c6ccc9f4f4ab05bd38595)It seems the define is not resolved by the preprocessor, I'm investigating why.

[15:34](#msg591c6d805e34568d5e63b896)It's defined only for Windows OS... that's why...

[15:36](#msg591c6dfb33e9ee771cb7fff1)`handle!` was used only in the View module code, then we migrated many definitions to a external include file.

[15:38](#msg591c6e7e8a05641b1190839f)I pushed a fix.

rebolek

[18:29](#msg591c96a55e34568d5e64807b)I see, thanks for the help!

AlexanderBaggett

[20:44](#msg591cb6472b926f8a6766b22d)@dockimbel , Would you say Red/System is more complete as a language than Red itself?

geekyi

[22:25](#msg591ccdbd92217cca5888c30e)@AlexanderBaggett that's a somewhat subjective question.. But you may be interested to know most of red/system was written and specced before starting on red runtime proper.. At least that's how I felt it has been

[22:26](#msg591cce02f3001cd3423116fe)Check the earliest tutorials and blogposts, and the roadmap

## Thursday 18th May, 2017

dockimbel

[05:44](#msg591d34d52b926f8a67687c5e)@AlexanderBaggett Red software stack is built bottom-up, so the work started with R/S first. R/S is a smaller and much simpler language than Red itself, it has also a much more specific field of use. We haven't put in R/S all the features we want yet, because R/S just need to be good enough for building Red on top of it until 1.0. So, you could say it is more complete than Red, but that would be a bit like comparing apples with oranges.

Oldes

[14:13](#msg591dabf80a783b6c0aaf7473)@dockimbel would it be possible to somehow improve this compiler's error:

```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : get-function-spec expected name argument of type: word 
*** Where: get-type 
*** Near:  [either 'op = second get-function-spec]
```

It is really hard to find, where the problem is, when working on larger code:/

[14:15](#msg591dac9733e9ee771cbd43b5)Ah... I found it... it is because set expression in either:

```
either 255 > i: readUI8 [
```

Porting from Rebol to R/S :)

## Friday 19th May, 2017

dockimbel

[05:45](#msg591e86889f4f4ab05bdc1dd7)@Oldes I pushed a fix for the R/S compiler to better detect and report such cases.

Oldes

[08:34](#msg591eae1400efc2bb3e822064)Thank you, I'm pretty sure it will help someone in the future.

## Wednesday 24th May, 2017

rebolek

[05:13](#msg592516825e34568d5e85d2ca)@dockimbel `handle!` is now boxed automatically when passed from R/S to Red in `#call`?

dockimbel

[05:33](#msg59251b2afcbbe1891c3c0279)@rebolek Yes.

rebolek

[05:37](#msg59251bfc0a783b6c0acc2e02)@dockimbel Cool! I was wondering why I have compilation error ;)

dockimbel

[05:37](#msg59251c2f2b926f8a67884dd8)You can use `-v 2` compilation option to check the R/S output of your Red code.

rebolek

[05:39](#msg59251c942b926f8a67884f69)I know, thanks. But the code is bit large. Anyway, I need it in just 4 or so places, I've fixed it already.

Oldes

[16:06](#msg5925af8e05e3326c670576bc)@dockimbel Can we add `realloc` into \[this file](https://github.com/red/red/blob/master/system/runtime/libc.reds)?

dockimbel

[16:09](#msg5925b0219f4f4ab05bf840c4)@Oldes We don't need it in the Red runtime so far, not sure if we'll ever need it. Even malloc/free are temporary, we should not need them once we finish the memory manager.

Oldes

[16:09](#msg5925b042eec422e415e53616)You don't need it, but it is useful when writing pure R/S code.

[16:10](#msg5925b079c4d73f445add1d3a)I can import it in every file where it is needed, but as there is `allocate`, there could be also `reallocate`

[16:13](#msg5925b13b2b926f8a678b13d7)I would simply appreciate, if these basic imports would not be needed in low level code (not counting Red runtime): https://github.com/red/code/blob/master/Library/ZLib/zlib.reds#L146-L189

[16:17](#msg5925b21eeec422e415e53dd6)Or even better, if we could do these imports in simplified way. Like:

```
#import-from [ LIBC-file cdecl [realloc fopen fclose]]
```

[16:18](#msg5925b246fa63ba2f7676e495)Of course, there would need to be a database with import definitions, which compiler would use.

[16:18](#msg5925b26c0a783b6c0acf01f2)But maybe it is just a brain storming:)

dockimbel

[16:22](#msg5925b33600efc2bb3e9e4b90)You can make an include file for those and submit it to the system/runtime folder if you want, but we won't include it by default in the runtime library. Up to the R/S user to include it if/when he needs them.

[16:24](#msg5925b3b300efc2bb3e9e4eef)Once full I/O will be done, we will do a clean-up and refactoring of all those imports anyway.

Oldes

[16:46](#msg5925b8e1eec422e415e55c4a)Above was just an example... there are import definitions on many places. And most of them could be simplified as demonstrated above.

[16:46](#msg5925b902631b8e4e610bb629)Simply instead of writing:

```
#import [
	"kernel32.dll" stdcall [
		GlobalAlloc: "GlobalAlloc" [
			flags		[integer!]
			size		[integer!]
			return:		[handle!]
		]
		GlobalFree: "GlobalFree" [
			hMem		[handle!]
			return:		[integer!]
		]
		GlobalLock: "GlobalLock" [
			hMem		[handle!]
			return:		[byte-ptr!]
		]
	]
]
```

we could just write:

```
#import-from [
	"kernel32.dll" stdcall [
		GlobalAlloc
		GlobalFree
		global-lock: :GlobalLock ;for case we want different name
	]
]
```

[16:47](#msg5925b91a05e3326c6705a927)`#import-from` is probably not the best name.

[16:47](#msg5925b92c5e34568d5e88b8dc)Never mind... we can keep it for Red 2.0 :)

rebolek

[16:51](#msg5925ba1a2b926f8a678b42dd)@Oldes how does it parse specs?

Oldes

[16:52](#msg5925ba47631b8e4e610bbc68)Specs would be in some defined format so compiler would be able to find them.

[16:54](#msg5925bae2c4d73f445add520a)For example above `GlobalAlloc` is now imported in these files just under Red repository:

```
Red\modules\view\backends\windows\win32.reds
Red\runtime\clipboard.reds
Red\runtime\platform\image-gdiplus.reds
```

[16:59](#msg5925bc03eec422e415e56d9c)Makes sense probably only for system libs.

greggirwin

[21:08](#msg5925f6372b926f8a678cb626)@oldes,

&gt; And of course a chance to create a tiny one purpose utility just with R/S but still be able to share code with Red.

Maybe we can make a shortcut dialect into libRed, giving new meaning to "metacircular"?

## Friday 26th May, 2017

Oldes

[11:22](#msg59280ffe2b926f8a679514f1)@dockimbel there is probably no way how to get size of concrete `struct!` without using hardcoded value, is there?

dockimbel

[11:43](#msg592814fc5e34568d5e9286bc)@Oldes What is a "concrete struct!"? Isn't `size?` working for you?

Oldes

[11:44](#msg5928152e5e34568d5e9287ae)Ach.. `size?` is what I was searching for. It works, thanks.

```
strm: allocate size? lzma_stream!
```

[11:46](#msg592815a1fcbbe1891c48f60d)Maybe it would be fine to have it mentioned \[here](http://static.red-lang.org/red-system-specs.html#section-4.7)

dockimbel

[11:47](#msg592815bb0a783b6c0ad8de30)`size?` should be in the doc already.

[11:47](#msg592815db0ba4d59763e27951)http://static.red-lang.org/red-system-specs.html#section-4.10

[11:48](#msg59281602631b8e4e6115b56d)@Oldes No, `size?`is not specific to structs.

Oldes

[11:48](#msg5928160f5e34568d5e928c05)I see. I overlooked it.

[12:12](#msg59281bb7c4d73f445ae74a78)@dockimbel also... could you please improve this compiler's error message?

```
*** Red/System Compiler Internal Error: Script Error : find-aliased expected type argument of type: word 
*** Where: get-type-id 
*** Near:  [either alias: find-aliased/position type/1 [
get-alias-id alias
]]
```

[12:16](#msg59281cb4eec422e415ef1f99)If I very simplify, it is thrown in cases like:

```
#import [LIB stdcall [test: "test" []]]
print-line test
```

dockimbel

[12:42](#msg592822cdeec422e415ef3afe)Please open a ticket for it.

## Thursday 1st June, 2017

Oldes

[14:52](#msg59302a2effbba8565b07c9a2)@dockimbel is it possible in Red/System to create global function from context? Something like this in Red:

```
>> c: context [set 'test func[][print "global"]] 
== make object! [] 
>> test
global
```

[14:57](#msg59302b6df3001cd3427e3473)Or how you would solve, that there cannot be R/S function with the same name as routine defined in Red?

[15:04](#msg59302ce8e0120ef9092d5d38)Maybe using macro:

```
#either red-pass? = no [time-elapsed:][_time-elapsed:] func [
```

dockimbel

[16:27](#msg59304077cf9c13503c4367ef)&gt; is it possible in Red/System to create global function from context?

Nope, namespaces are fully static in Red/System.

[16:29](#msg593040da6462d8493cce1157)&gt; Or how you would solve, that there cannot be R/S function with the same name as routine defined in Red?

The same way as solving two function names in Red/System having the same name. ;-)

[16:29](#msg59304101142826e97272de08)A routine is compiled to a R/S function, and the name is retained, so that such routine could be invoked from R/S directly.

[16:30](#msg59304137c9f048c84f2f7527)Maybe one thing we could do, is introducing a generated naming convention for routines, with a fixed prefix, so that common names would not collide easily. Though, I don't remember if there are some hard constraints in the current compiled code on routines forcing them to keep their original name or not.

[16:32](#msg593041bb7503e2b706ff79d2)For example: `as-color` routine would generate a `r_as-color` R/S name.

Oldes

[19:39](#msg59306d7f142826e97273cfaf)I want to use the routine directly with the same name as in stand alone r/s code. I think that my solution with diferent internal function naming using the compiler macro is fine.

[19:41](#msg59306e036462d8493cceff7d)Maybe there could be pretier code instead of `red-pass? = no`. But it is just a detail.

## Friday 2nd June, 2017

dockimbel

[01:59](#msg5930c68531f589c64f675690)@Oldes You should be able to write a macro to hide `#either red-pass? = no`.

Oldes

[05:14](#msg5930f45331f589c64f67e188)But than I would have to define it in each script so it would be even longer.. you could provide somthing

[05:15](#msg5930f476f2dd2dba065f7af1)Something in Red so everybody could use

[05:16](#msg5930f494167d046a7d5e56f6)Sorry. Gitter on phone is really terrible

dockimbel

[05:17](#msg5930f4e07503e2b7060228b0)Just use put your common definitions in an include file, it costs you then just one line per project.

[05:18](#msg5930f51beb257a8725cddead)The Red runtime is not meant to be the sum of all the possible macros/definitions/functions that all R/S would ever need.

[05:18](#msg5930f5427503e2b7060229b2)Making a bigger runtime for standalone R/S apps is not in our Red 1.0 goals.

Oldes

[05:19](#msg5930f5676462d8493cd0f1ca)I don't have a good naming anyway.. and I don't know how not to define macro multiple times.

dockimbel

[05:20](#msg5930f590142826e97275b7bd)Just write them once in a common include file.

Oldes

[05:32](#msg5930f85ff31c8ced0cf5f0d4)My goal is not to create another runtime so there is not a place for common include.. and if I include this file from multiple scripts, I will get redefinition again. The solution would be to have something like #include-once

dockimbel

[05:33](#msg5930f89e31f589c64f67f015)A given file is only included once by the R/S compiler.

Oldes

[05:36](#msg5930f94bf31c8ced0cf5f36a)Really? I will try it when I will be with a computer:)

dockimbel

[05:51](#msg5930fcd6167d046a7d5e7246)@Oldes https://github.com/red/red/blob/master/system/loader.r#L323

## Monday 5th June, 2017

Oldes

[17:02](#msg59358e8c6549436c7d1b0e95)@dockimbel any idea why this line does not work https://github.com/Oldes/code/blob/master/Library/Stream-IO/examples/Stream-IO-test.reds#L87 ? I must use `print-line` for each \`read call to have correct order :-/

## Tuesday 6th June, 2017

dockimbel

[03:07](#msg59361c796549436c7d1d48b6)@Oldes `;this does not work as expected!` What does it output?

Oldes

[08:23](#msg59366695f2dd2dba067341d4)@dockimbel When I use:

```
print-line [readString " " readString readUI8]
```

the result is:

```
ending? ello Red72
```

While when I use:

```
print-line readString
print-line readString
print-line readUI8
```

the result is:

```
Hello Red
ending?
10
```

[08:25](#msg593666e0f2dd2dba0673434c)Using the latest current official Red version (I had to check it it is not in some of my experimental local versions)

[08:27](#msg593667616549436c7d1e51c3)I also tried to simulate it with this code:

```
a: func[return: [c-string!]]["a"]
b: func[return: [c-string!]]["b"]
print-line [a " " b]
```

but it provides expected result: `a b`

[08:34](#msg59366930ca6d4ae80ce6d869)Ok... here is simple code which has same problem:

```
ab: "ab"
pos: 1
char: func[return: [byte!] /local b][
	b: ab/pos
	pos: pos + 1
	b
]

print-line [char " " char]
```

Will output: `b a`

[09:02](#msg59366f8a02c480e672180b4d)@dockimbel and one more question... would it be possible for routine to accept multiple value types? For example now I can use only `file!` or `string!` but not both or `any-string!`.

dockimbel

[09:03](#msg59366fe86549436c7d1e7dcc)I don't think that's possible, but you can always use `any-type!` (I think no type spec should also be accepted, but can't remember).

meijeru

[09:04](#msg5936701b7503e2b706161389)On that last point, see my recent question in red/bugs!!!

dockimbel

[09:04](#msg59367032e531dbc905b5fa63)About your reverse order calls, R/S is following the C semantics there:

```
#include <stdio.h>

char *ab = "ab";
int pos = 0;

char foo() {
    char b;
    b = ab[pos];
    pos++;
    return(b);
}

int main()
{
    printf("%c %c\n", foo(), foo());
    return 0;
}
```

```
sh-4.2$ main
b a
```

Oldes

[09:05](#msg593670727503e2b70616163f)Hm... but it is very inconsistent:/

dockimbel

[09:06](#msg5936707bf31c8ced0c0a2c3f)Try it online: https://goo.gl/4F0NNK

[09:06](#msg5936709a02c480e672180f77)It's very consistent with C.

Oldes

[09:06](#msg593670af167d046a7d7211d8)The question is: \_why\_?

dockimbel

[09:11](#msg593671d4142826e97289f13a)Arguments are pushed in reverse order in the C calling convention for IA-32, as it's the simplest way when the stack grows down.

Oldes

[09:13](#msg5936724d6462d8493ce522b3)So bye-bye coding like used to do in Rebol and Red when in Red/System :/

dockimbel

[09:14](#msg5936727ecf9c13503c5a8bc9)Why do you expect extremely high-level languages like Redbol to have the same semantics as very low-level languages like C or Red/System? This makes no sense to me. There are some semantics we can preserve (very few actually), but most will be very different. It's not the same worlds.

Oldes

[09:16](#msg593672d2142826e97289f5bb)I expect reverse:) to be able code in Red/System using logical way of high level languages.

dockimbel

[09:16](#msg593672e86549436c7d1e8984)Ask Intel to implement a Red CPU then. ;-)

Oldes

[09:18](#msg59367365cf9c13503c5a9077)Still interesting that when using code like:

```
char foo_a() {
    char a = (char)97;
    return a;
}
char foo_b() {
    char b = (char)98;
    return b;
}

int main()
{
    printf("%c %c\n", foo_a(), foo_b());
    return 0;
}
```

The result is logical: `a b` so no reverse order here... but ok.. I can live with it once I know there are such a strange behaviors normal.

dockimbel

[09:19](#msg593673b8e531dbc905b60c54)The issue is mostly caused by the variadic call and the fact that your `char` function result has a side-effect. `foo_a` and `foo_b` result does not change according to their calling order.

Oldes

[09:20](#msg593673f902c480e672181e29)Ok... so at least it is not mysterious Red bug. Problem solved.

dockimbel

[09:21](#msg59367428cf9c13503c5a966f)You need to be careful about such pitfalls of C / R/S.

Oldes

[10:09](#msg59367f56142826e9728a2fa6)@dockimbel is there any reason why `unused` and `unused32` variables are used there: https://github.com/red/red/blob/master/system/runtime/utils.reds#L79-L80 ?

dockimbel

[10:12](#msg59367ffde531dbc905b64364)Yes, workaround a potential stack leak on the x87 FPU, that the R/S compiler can't detect for now. That code will be removed in the future, once we switch to SSE for floats.

meijeru

[10:52](#msg59368980e531dbc905b66c1c)I am about to launch an issue for which I have put a preliminary question in red/bugs. It has relevance to Oldes' question of this morning concerning argument types of routines. Sorry to insist....

## Wednesday 7th June, 2017

meijeru

[15:52](#msg593821466549436c7d25dac7)Question answered, issue launched.

## Friday 9th June, 2017

Oldes

[09:38](#msg593a6c9bca6d4ae80cf7e3bd)@dockimbel if in c header file is this:

```
extern JL_DLLEXPORT jl_datatype_t *jl_string_type;
```

How to import it in Red/System?

dockimbel

[11:17](#msg593a83d7cf9c13503c6c0410)@Oldes See "variable name" importing there: http://static.red-lang.org/red-system-specs-light.html#section-15.1

Oldes

[11:21](#msg593a84d66462d8493cf64ea0)Hm... but when I use: `jl_string_type: "jl_string_type" [int-ptr!]` and than:

```
print-line ["string-type: " jl_string_type]
```

Compiler tells me:

```
*** Compilation Error: julia/jl_string_type is missing an argument
```

dockimbel

[11:25](#msg593a858df2dd2dba0684891c)I've never seen such issue before. If you can make a short version, open a ticket for it.

[11:28](#msg593a8654f2dd2dba06848d25)Are you sure you didn't declare `jl_string_type` as a function somewhere?

Oldes

[11:43](#msg593a89ce6549436c7d2f56b4)@dockimbel I'm sure.. I'm using \[this code](https://gist.github.com/Oldes/61444afa55a0395fde60002a5b345518) ... just with the above line added.

[11:43](#msg593a89ee6462d8493cf6666f)When I use: `print-line jl_string_type` I get:

```
*** Red/System Compiler Internal Error: Script Error : find-aliased expected type argument of type: word 
*** Where: get-type-id 
*** Near:  [either alias: find-aliased/position type/1 [
get-alias-id alias
]]
```

[11:49](#msg593a8b53436860af4ceedb04)@dockimbel it works with: `jl_string_type: "jl_string_type" [integer!]`

dockimbel

[11:50](#msg593a8b9302c480e6722950cd)Then try without using the macro for the type spec: `[pointer! [integer!]]`.

[11:51](#msg593a8bb6f31c8ced0c1ba9f7)Though, it's strange, as it works with macros in libRedRT...

Oldes

[11:55](#msg593a8ca7f2dd2dba0684a7a1)`jl_string_type: "jl_string_type" [pointer! [integer!]]` same error.

dockimbel

[11:55](#msg593a8cc7f31c8ced0c1bad9e)Odd...

[11:57](#msg593a8d3c436860af4ceee3e5)Oh, I think I remember now, it needs to be a single-word, otherwise it's considered a function import!. The type checker there can be made a little smarter to accept a primitive type name + a block.

Oldes

[11:59](#msg593a8d93f2dd2dba0684aa5a)You have it there: https://github.com/red/red/issues/2771 than:)

## Monday 12nd June, 2017

Oldes

[17:33](#msg593ed072ca6d4ae80c082405)@dockimbel is it possible to have `variadic` Red/System function, use some args and with the rest call `variadic` imported function like `sprintf`?

[17:36](#msg593ed11231f589c64f9d7840)I'm not sure if it is clear enough.. I would like to use `sprintf`, but would like to wrap it inside Red/System function, which would take care about the buffer used. I can do it easily as a normal function, like Red is already using, but would like to use advantage of the variadic arguments in the R/S function too.

qtxie

[23:15](#msg593f20a4f6a78eab484173da)@Oldes Yes. You can. Please check R/S spec \[section 6.3.4](http://static.red-lang.org/red-system-specs.html#section-6.3).

## Tuesday 13th June, 2017

dockimbel

[07:06](#msg593f8f09f6a78eab4842e5d4)@Oldes No direct support for that. Though, using `[custom]` attribute and/or native stack manipulations, it should be possible to achieve (but then you need to implement also proper support for platform-specific ABI, especially stack alignments).

Oldes

[07:26](#msg593f93b36549436c7d41a66b)@dockimbel that is that I though.. I will find some other way.

## Tuesday 20th June, 2017

Oldes

[08:51](#msg5948e2075bf0bef94cc37e4c)@dockimbel I have such a routine:

```
parse-tag: routine [
		"Extracts data from single tag from opened SWF."
		offset [integer!] "tag position received from previous parse query"
		result [string!] "Optional string, where result will be stored"
		return: [string!]
		/local
			cstr [c-string!]
	][
		cstr: swf/parse-tag offset
		either TYPE_OF(result) = TYPE_STRING [
			string/concatenate-literal result cstr
		][
			string/load-at cstr length? cstr as red-value! result UTF-8 
		]
		stack/set-last as red-value! result
		result
	]
```

Which works in console when I do:

```
>> result: "" swf/parse-tag 26 result
== "At: 0000001Ah Tag: 12^-size: 343^-;DoActionTag^/"
>> print result
At: 0000001Ah Tag: 12    size: 343    ;DoActionTag
```

but when I try to use it with View:

```
swf-test2: func[
	/local tag-line offset list detail
][
	swf/open %main.swf
	tags: swf/query/tags/verbose 2
	tags: split tags #"^/"

	view main: layout [
		list: text-list 450x600 data :tags font fixed-font [
			swf/set-verbose 4
			offset: load/part pick tags face/selected 9
			clear detail/text
			swf/parse-tag offset detail/text
			show detail
		]
		detail: area 600x600 ""
	]
]
```

the content in the `area` is not updated... is it normal?

[08:53](#msg5948e2866462d8493c2ed0d1)It seems to be visible only when I close the window and show the `main` again.

[08:56](#msg5948e323e59e74be0a98b94b)Hm... when I add `detail/text: detail/text` it seems to work. I wonder if there is some chance how to notify that value was changed from routine.

dockimbel

[09:14](#msg5948e786bf1bfe6770cdb3c3)@Oldes You are by-passing the internal auto-updating handling of View engine, that's why it is not refreshed.

Oldes

[09:15](#msg5948e7a8c98bc6d5638736c2)I know... but should not the `show detail` work either?

dockimbel

[09:16](#msg5948e7f7bf1bfe6770cdb6a6)No, it cannot know that you changed something in `detail` because you by-passed the face object events which are used to keep track of changes.

Oldes

[09:17](#msg5948e844746f1fd6631fd1a2)Ok.. I can live with my workaround:) I hope it does not copy internally because that is what I'm trying to avoid:)

dockimbel

[09:18](#msg5948e85688348abd0aac6ffd)The best way would be to do the appending/setting of the new string at Red level and not in the routine. Something like:

```
append clear detail/text swf/parse-tag offset
```

Oldes

[09:19](#msg5948e88a6462d8493c2eedb0)I don't thing so when we don't have GC yet:]

dockimbel

[09:20](#msg5948e8cdbf1bfe6770cdbbd1)It has nothing to do with the GC, it's about code organization. Some actions are best done at Red level.

Oldes

[09:20](#msg5948e8ea746f1fd6631fd554)The thing is, that I can have hundreds tags in the list and you can use just cursor to list through all of them and each line in the list would create another strings, which could be large.

[09:23](#msg5948e98ccf9c13503ca44db0)Plus I'm using the R/S code, which is working also without Red runtime.

dockimbel

[09:23](#msg5948e999c98bc6d563874202)Then use a permanent string buffer rather:

```
swf/parse-tag offset detail/text buffer
append clear detail/text buffer
```

Oldes

[09:25](#msg5948ea0be59e74be0a98df0c)So far I'm using:

```
clear detail/text
			swf/parse-tag offset detail/text
			detail/text: detail/text ;forcing update
```

dockimbel

[09:25](#msg5948ea1f02c480e672617133)That works, but it's hackish.

Oldes

[09:26](#msg5948ea36c98bc6d56387447e)That is fine... all the thing is very hackish;-)

dockimbel

[09:27](#msg5948ea8c746f1fd6631fddde)If you use a permanent intermediary buffer as suggested, it would be cleaner.

Oldes

[09:28](#msg5948eac6746f1fd6631fdfa1)I would have to clear the buffer too.. I can already use such a buffer but it appends by default.

[09:29](#msg5948eae988348abd0aac7b60)Never mind... it is just a detail.

dockimbel

[09:29](#msg5948eb0aa44c60fa4c43681f)@Oldes How's your progress on the Red Flash dialect by the way?

Oldes

[09:32](#msg5948ebad17a306667082e2f4)I'm not working on it:) I'm not using such a dialect, but will be able to produce Red readable data from SWF files, which is what I used last years to get animations in format I needed.

[09:33](#msg5948ebf16462d8493c2f0003)I like to write it in Red/System... it is much more bigger fun than it was with Rebol.

dockimbel

[09:57](#msg5948f18c6462d8493c2f1b03)@Oldes Sure it is. ;-) Remember you can use libRedRT with Red + R/S code also.

## Saturday 8th July, 2017

geekyi

[02:54](#msg596049826ae41d5d33c97dec)Mentioning :point\_left: \[July 8, 2017 question about r/s](https://gitter.im/red/red/welcome?at=596003a16ae41d5d33c8acdb) by @rokf here so it doesn't get lost

[03:24](#msg5960506f0de4d2545e065cee)

```
#import [
  "libtermbox.so.1" cdecl [
    tb-init: "tb_init" [
      return: [integer!]
    ]
    tb-shutdown: "tb_shutdown" [
      return: [integer!]
    ]
  ]
]

print tb-init
tb-shutdown
```

[03:24](#msg59605089f5b3458e302535e1)&gt; The `tb_init` function should return a integer but when I want to print it it doesn't do anything.

[03:27](#msg59605111bf7e6af22cb7c289)@rokf just to confirm, `file libtermbox.so.1` shows that it's 32 bit right? And `ltrace` give you any info? (also `strace`, etc)

dockimbel

[03:51](#msg596056c41c8697534a011e85)Also check if all dependencies are met using `ldd libtermbox.so.1`.

rokf

[05:09](#msg596068f0bf7e6af22cb8060b)

```
linux-gate.so.1 =>  (0xf77e5000)
libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf75fd000)
/lib/ld-linux.so.2 (0x565e2000)
```

[05:09](#msg596068f789aea4761d785bb8)Dependencies seem to be alright.

[05:12](#msg596069d16ae41d5d33c9dc0d)`ltrace` on the produced executable gives only `+++ exited (status 0) +++`

[06:09](#msg5960771e6ae41d5d33ca0240)Ah, it actually works. It just doesn't print anything because the library takes over the terminal and can only be drawn to via its own functions.

[06:11](#msg5960777b2723db8d5eecea1e):relieved:

greggirwin

[16:10](#msg596103d9c101bc4e3a656688)Glad I'm not the only one who had working code I thought was broken. :^)

geekyi

[16:35](#msg596109d076a757f808edd911)Kind of like when you are testing an error and you forget that it's not actually failing, but it's \*supposed to fail*

[16:35](#msg596109e8c101bc4e3a657f63)Wish we had a name for self-referential situations like this..

iArnold

[18:45](#msg596128573230e14f3a3baeb4)serefsi's

## Sunday 9th July, 2017

rokf

[09:34](#msg5961f8c24bcd78af569032a8)How should an import for `int tb_poll_event(struct tb_event *event);` look like?

[09:35](#msg5961f8e90de4d2545e0bdbe5)I've defined the tb\_event struct like:

[09:35](#msg5961f8ef4bcd78af569032f1)

```
tb-event: alias struct! [
  type [integer!]
  mod [integer!]
  key [integer!]
  ch [integer!]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]
```

[09:36](#msg5961f91ebc46472974cf720b)In the C header it looks like:

[09:37](#msg5961f958bf7e6af22cbd1dce)

```
struct tb_event {
	uint8_t type;
	uint8_t mod; /* modifiers to either 'key' or 'ch' below */
	uint16_t key; /* one of the TB_KEY_* constants */
	uint32_t ch; /* unicode character */
	int32_t w;
	int32_t h;
	int32_t x;
	int32_t y;
};
```

[09:37](#msg5961f96f329651f46e6bd1f2)I've tried this:

[09:38](#msg5961f980f5b3458e302aace8)

```
tb-poll-event: "tb_poll_event" [
      event [tb-event]
      return: [integer!]
]
```

[09:42](#msg5961fa7fbc46472974cf77e6)The thing is that the `tb-event` instance doesn't seem to change.

[09:43](#msg5961facf2723db8d5ef1ee27)I have to make it a reference somehow right?

PeterWAWood

[09:45](#msg5961fb220de4d2545e0be210)I don't think so. The fields are being passed by value. `integer!` is the equivalent of `int32_t`.

[09:46](#msg5961fb5dbf7e6af22cbd251d)You need to use `byte!` for `uint8_t`.

[09:47](#msg5961fba41c8697534a069a1f)Use `int-pointer!` for `uint32-t`. (This is a trick as under the surface pointers are 32-bit unsigned integers).

rokf

[09:48](#msg5961fbe80de4d2545e0be41d)Alright.

[09:48](#msg5961fbf3bc46472974cf7bdf)It changed now as i changed it to byte!

[09:48](#msg5961fbf43230e14f3a3e492e):D

PeterWAWood

[09:49](#msg5961fc242723db8d5ef1f0fa)You need to define a `struct!` to handle `uint16_t` something like:

```
uint16!: alias struct! [
  least-significant [byte!]
  most-significant [byte!]
]
```

dockimbel

[09:52](#msg5961fcc6f5b3458e302ab7a9)@PeterWAWood Can work but it needs to use a `[uint16! value]` spec, so that the struct is inlined properly instead of a pointer to the struct.

[09:52](#msg5961fcfaf5b3458e302ab874)@rokf So for `uint16_t key;` field, you can use `key [uint16! value]`. Altenatively, you can also define two fields of 1 byte each.

PeterWAWood

[09:53](#msg5961fd1df5b3458e302ab8e3)Thanks @dockimbel

rokf

[16:39](#msg59625c3789aea4761d7ef356)Both `tb-cell` and `tb-event` use the same types so I'll give the shorter example:

[16:39](#msg59625c4689aea4761d7ef3a0)

```
#define int-pointer! [pointer! [integer!]]

uint16!: alias struct! [
  lsb [byte!]
  msb [byte!]
]

tb-cell: alias struct! [
  ch [int-pointer!]
  fg [uint16! value]
  bg [uint16! value]
]
```

[16:41](#msg59625cb776a757f808f23f72)This doesn't compile and says `invalid struct syntax`. If I remove the `value` words from the struct it compiles.

[16:52](#msg59625f450de4d2545e0d4dd4)If I print a value of the type `uint16!` it seems to work correctly as I get `00610000` for the `key` field on a press of `a` key.

[17:06](#msg5962629d0de4d2545e0d59fe)Actually if I replace each `uint16!` with two `byte!` fields it works like it is supposed to. Correct values in the correct struct fields.

[17:13](#msg5962641dbc46472974d104cd)In case the `tb-event` struct is defined as

[17:13](#msg596264231c8697534a0817f8)

```
tb-event: alias struct! [
  type [byte!]
  mod [byte!]
  key1 [byte!]
  key2 [byte!]
  ch [int-pointer!]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]
```

[17:17](#msg5962651bf5b3458e302c358d)the `key1` and `key2` fields are `0` on normal characters and the value is contained inside the `ch` field. So for an `a` press `ch` contains `00000061` and both key fields contain 0.

[17:25](#msg5962670b76a757f808f2684a)So this now really is correct, however now I have to join the two key fields to get a normal integer/short that I can compare against the 'special' key constants defined with `#define`. Example: On ESC `key1` contains 27 and `key2` contains 0. I then have `#define tb-key-esc 1Bh` where 1Bh equals to 27.

[19:13](#msg5962805f3230e14f3a401df6)

```
shortify: function [
  v1 [byte!]
  v2 [byte!]
  return: [integer!]
][
  return ((as integer! v1)) or ((as integer! v2) << 8)
]
```

If I use this I can finally convert it into a short. This feels so 'hacky' all together now :worried:.

Oldes

[20:31](#msg596292a50de4d2545e0e0a15)We will get `int16` and `int64` one day.

rokf

[20:32](#msg596292e21c8697534a08cd12)hope so yeah :smile:

## Monday 10th July, 2017

rokf

[11:14](#msg596361830de4d2545e112911)The best equivalent to the C `size_t` type would be an `int-pointer!` right?

[12:24](#msg596371fd76a757f808f66295)And another question, how do I append strings in `Red/System`? I need to use `C` functions?

dockimbel

[16:19](#msg5963a923bc46472974d62854)@rokf  
&gt; The best equivalent to the C `size_t` type would be an `int-pointer!` right?

\[Seems to be](https://stackoverflow.com/questions/2550774/what-is-size-t-in-c) an integer value, not a pointer.

[16:22](#msg5963a9b82723db8d5ef88258)@rokf Right, no C strings manipulation functions provided in the R/S runtime library (except for `length?` which returns the size in bytes of a C string), so if you need some, you can either write them in R/S (usually trivial), or import C ones.

rokf

[17:38](#msg5963bba1329651f46e72d524)@dockimbel :+1:

Oldes

[18:31](#msg5963c7f8c101bc4e3a6fa7b2)@dockimbel let's say, that I have `TYPE_OF(para) = TYPE_OBJECT`, how to get value (like `wrap?`) from it?  
I know I can use `object/rs-select`, but how to make `red-value` from the required `word` elegantly?

[18:36](#msg5963c913bc46472974d6cce8)`object/rs-select para as red-value! word/load "wrap?"`?

[18:52](#msg5963ccf10de4d2545e135eff)Ok.. above works.

## Tuesday 11st July, 2017

dockimbel

[03:47](#msg59644a371c8697534a100d2a)@Oldes

```
bool: as red-logic! (object/get-values para) + PARA_OBJ_WRAP?
wrap?: any [
    TYPE_OF(bool) = TYPE_NONE
    all [TYPE_OF(bool) = TYPE_LOGIC not bool/value]
]
```

[03:47](#msg59644a61bc46472974d8ca88)That's the best way to access it.

Oldes

[05:23](#msg596460eac101bc4e3a71f4fe)So wrap should be default? And what if user defines para manualy with different value order?

dockimbel

[05:29](#msg59646226bc46472974d92300)@Oldes Wrapped by default, yes. What do you mean by `different value order`?

rokf

[06:23](#msg59646ef32723db8d5efb9a95)&gt; @rokf So for `uint16_t key;` field, you can use `key [uint16! value]`. Altenatively, you can also define two fields of 1 byte each.

I still have a question about this.

[06:25](#msg59646f70329651f46e759a11)@dockimbel How do I extract the combined value of those `byte!`s?

[06:25](#msg59646f754bcd78af5699fa45)Here's a short example:

[06:26](#msg59646f8489aea4761d878933)

```
Red/System []

uint16!: alias struct! [
  lsb [byte!]
  msb [byte!]
]

xpos!: alias struct! [
  x [uint16! value]
]

coord: declare xpos!
coord/x: as uint16! 1

print ["x: " coord/x newline]
print ["x lsb: " as integer! coord/x/lsb newline]
print ["x msb: " as integer! coord/x/msb newline]
```

[06:27](#msg59646fea4bcd78af5699fdc3)The first `print` gives me `0804A364`. I'd like to get the combined value out of it, that I've set with `coord/x: as uint16! 1`. The following prints seem to work alright as they give a 1 and a 0.

Oldes

[06:28](#msg596470102723db8d5efb9e74)@dockimbel I mean, that current implementation depends on fixed value order in the `para` object. One can do ugly things like:

```
w: layout [a: area] a/para: make object! [a: b: c: none d: 'right parent: none] view w
```

[06:35](#msg596471bd89aea4761d8792e5)@rokf the first `print` gives you address of the x struct.

dockimbel

[06:36](#msg596471fd2723db8d5efba6a3)@rokf `coord/x` is a struct!, so `coord/x: as uint16! 1` will be writing an address (32-bit) into `x` field, probably corrupting memory (this is an edge case that I think is not handled by the compiler yet, though I need to check).

The combined value should be obtained using:

```
(coord/x/msb << 8) or coord/x/lsb
```

Setting a value needs a splitting:

```
coord/x/lsb: as-byte value and FFh
coord/x/msb: as-byte value >> 8 and FFh
```

[06:39](#msg596472932723db8d5efba92e)@Oldes Yes, you can break it if you want currently. We have options for solving that through a new datatype, though, that's not for the near future, so I won't start a discussion about it.

Oldes

[06:42](#msg596473614bcd78af569a0dde)&gt; @Oldes Wrapped by default, yes. What do you mean by `different value order`?

@dockimbel so should I modify it? Because currently it is not wrapped by default.

dockimbel

[06:44](#msg596473bef5b3458e3034a96c)@Oldes Well, I forgot to document it, so now I'm not sure which one should be the default.

## Wednesday 12nd July, 2017

rokf

[05:23](#msg5965b2652723db8d5e011495)@Oldes @dockimbel Ohh, thanks! So the process stays roughly the same as having two separated `byte!` fields.

## Monday 24th July, 2017

rokf

[18:41](#msg59763f55714ea96f781ad250)If an instance of this struct

```
tb-event-original: alias struct! [
  type [byte!]
  mod [byte!]
  key [uint16! value]
  ch [integer!] ; supposed to be uint32
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]
```

is being changed by a C function and the `ch` field gets the value of the `w` field which is the next one, does this happen because of the incompatible type of the `ch` field? The first 3 fields (type, mod and key) are correct, `ch` is replaced by `w` and everything else is shifted up (`y` is garbage in the end, its correct value is contained inside `x`).

Oldes

[22:20](#msg59767291f5b3458e307ba37f)Q

[22:20](#msg597672a51c8697534a57bb89)Is it same if you use just `integer!` to hold type, mod and key?

## Tuesday 25th July, 2017

rokf

[11:46](#msg59772fa71c8697534a5a7874)The original `C` struct is:

```
struct tb_event {
	uint8_t type;
	uint8_t mod; /* modifiers to either 'key' or 'ch' below */
	uint16_t key; /* one of the TB_KEY_* constants */
	uint32_t ch; /* unicode character */
	int32_t w;
	int32_t h;
	int32_t x;
	int32_t y;
};
```

The sizes have to be correct otherwise it doesn't work.

dockimbel

[12:32](#msg59773a69329651f46ebf1436)@rokf You should try what @Oldes is suggesting, as it's most probaby cause by a wrong usage of the `uint16!` struct.

rokf

[16:34](#msg597773121c8697534a5bb97f)@dockimbel @Oldes I've tried to make the first 3 to `integer!`. It's even worse :smile:. They have to be `byte!` `byte!` and `uint16!` otherwise the issue just moves up the ladder and the result is wrong all together.

[20:14](#msg5977a68d45fc670746c792e1)I noticed something weird

```
Red/System []

uint16!: alias struct! [
  lsb [byte!]
  msb [byte!]
]

uint32!: alias struct! [
  b1 [byte!]
  b2 [byte!]
  b3 [byte!]
  b4 [byte!]
]

tb-event-original: alias struct! [
  type [byte!]
  mod [byte!]
  key [uint16! value]
  ch [uint32! value]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]

print size? tb-event-original
```

The size here should be 24 but is 28 and that must be causing my issue.

[20:20](#msg5977a8061c8697534a5cb3c1)uint16! has a size of 4 for some reason.

meijeru

[20:31](#msg5977aab41c8697534a5cbf34)From the Red/System documentation:  
\_Implementation note: Struct! values members are padded in memory in order to preserve optimal alignment for each target (for example, it is aligned to 4 bytes for IA32 target). Size? function will return the size of the struct! value in memory including the padding bytes._

rokf

[20:47](#msg5977ae6dbc46472974257503)@meijeru Oh snap, I've missed that. Thanks a lot.

Oldes

[20:59](#msg5977b126bc46472974257f74)@rokf i mean not using integers for all 3 values but one integer which holds them and use bit logic to get the 3 values from it.. sorry.. I'm on mobile only so hard to provide details.

rokf

[21:00](#msg5977b177c101bc4e3abdd9df)Ohh :) If I split the `uint16!` key into 2x `byte!` (key1, key2) it works. :clap:

Oldes

[21:03](#msg5977b20a1c8697534a5cdeb5)That is another way:)

rokf

[21:04](#msg5977b257329651f46ec139b5)If I'd have found the implementation note about the struct padding before it would've been a no brainer &gt;\_&lt; I should really take time and slowly read through the whole Red/System spec.

## Saturday 29th July, 2017

greggirwin

[16:27](#msg597cb78a329651f46ed2e019)@feetdust, sounds like you want to do something like this?

```
#system [
	#import [
	    "kernel32.dll" stdcall [
	        os-get-ver: "GetVersion" [
	            return: [integer!]
	        ]
	    ]
	]
]

get-version: routine [return: [integer!]] [
    os-get-ver
]

print get-version
```

## Friday 4th August, 2017

munael

[17:51](#msg5984b4191c8697534a8b5e5c)Any docs on integrating Red and Red/System?

9214

[17:52](#msg5984b46e1c8697534a8b5f49)@rebolek :O where is your article about R/S routines in Red?

greggirwin

[17:54](#msg5984b4e5f5b3458e30af2b56)@Enamex, you can start with http://static.red-lang.org/red-system-specs.html , some info in https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version, and some example work referenced in https://gitter.im/red/julia.

rebolek

[17:54](#msg5984b4ef2723db8d5e75ce51)@9214 ouch :hurtrealbad:

greggirwin

[17:55](#msg5984b501c101bc4e3aebcc67)i.e., we have bits and pieces, but not an official doc yet.

munael

[18:29](#msg5984bd0a329651f46eeef4d4)@greggirwin | This's surprising O.O I'd thought I'd be passing .red and .reds alike to red.  
But I need to download REBOL and use rsc.r?!

greggirwin

[19:45](#msg5984cee8c101bc4e3aec2f5a)No, you do not need Rebol at all. Only if you want to build Red from source.

[19:46](#msg5984cf00f5b3458e30af9439)Once you have Red on your system, that's all you need.

munael

[20:13](#msg5984d57c1c8697534a8bdf5c)OK, so I'm probably doing something quite stupid.

[20:14](#msg5984d590c101bc4e3aec47aa)The wiki link says to use some `do/args` thing directly from a Rebol script

[20:15](#msg5984d5c51c8697534a8bdff6)What I'm doing now is `#include`ing a `.reds` into a `main.red` and doing `red -c main.red` (can't remember the exact command now but it worked and is in a makefile so always the same)

## Saturday 5th August, 2017

dockimbel

[05:01](#msg598551114bcd78af56160817)@Enamex That does not work, as #include is just pasting the R/S code in the middle of the Red code. R/S code can be embedded in Red scripts, but using either `#system [...]` directive, or using routines.

munael

[11:04](#msg5985a652f5b3458e30b1d59f)@dockimbel Yup :) That became clear when some trial code worked but it balked on `alias struct!`.

[11:05](#msg5985a697c101bc4e3aee8f28)I'm not at all clear what `#system` means :T  
So, including something within `#system` doesn't make the symbols available outside the `#system` block.

[11:09](#msg5985a775bc46472974567a3b)Is \[this](http://www.red-lang.org/search/label/routine) the only available docs on `routine` (and `routine!`(?)) ?

[11:23](#msg5985aaaf614889d4751eb3b6)`#system` and `#system-global` in general I don't get what they do.

geekyi

[11:25](#msg5985ab131c8697534a8e2bc1)@Enamex best way is to read the source ;p

[11:25](#msg5985ab2376a757f808788dcb)Actually, rebolek had a really nice intro

[11:27](#msg5985ab941c8697534a8e2cb2)@Enamex meanwhile, https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version is a similar intro (oh wait, Gregg already mentioned it)

meijeru

[12:16](#msg5985b72176a757f80878b4db)@Enamex The reference you found for routines (`routine!` is the name of the datatype) is correct but one can now add that `float!` values are now also automatically converted.

munael

[13:57](#msg5985ced376a757f80878fa0a)@geekyi | The source for `#system`?  
If you recommend it...

Oldes

[18:46](#msg5986129fbc4647297457d976)What is correct equivalent for `double` c-type in Red/System? I was thinking that `float!` but it gives me trash values when used in returned struct:/

[18:59](#msg5986159845fc670746fa1a5d)Hm... it is `float!`... there is just some strange padding in Red/System or missing value in the c header source file I use.

munael

[19:06](#msg5986172c4bcd78af56186504)There's `float` and `float!`?

Oldes

[19:07](#msg5986178e329651f46ef2ff09)No, just `float!` - fixed in my post.

geekyi

[22:52](#msg59864c4545fc670746fab143)@Enamex did you find it? https://github.com/red/red/blob/master/compiler.r#L4081 I meant the source in general, but that works too ;)

[22:58](#msg59864d842723db8d5e7a9d3a)red/red@9382c756268554332b32a96fc0b37d1fc77ab291

## Monday 7th August, 2017

dockimbel

[04:59](#msg5987f3b476a757f8087f21c1)@Enamex `#system` includes the argument block of Red/System code at current position in the generetad R/S source code resulting from Red code compilation. `#system-global` works similarly, but places the argument code in the global space, outside of the Red runtime and user code contexts. Usually, you would rather use routines to interface Red and R/S code, though those directives can come \[handy](https://github.com/red/red/blob/master/environment/system.red#L359) in \[some](https://github.com/red/red/blob/master/libRed/libRed.red#L16) \[cases](https://github.com/red/red/blob/master/environment/functions.red#L914).

munael

[18:05](#msg5988abfb614889d475283751)So it's like a dialect keyword, like view (except for the whole invoking compiler and separate namespaces thing).

## Tuesday 8th August, 2017

dockimbel

[03:55](#msg59893643210ac26920626f71)@Enamex It's a compiler directive, it has no existence at run-time.

## Tuesday 15th August, 2017

Oldes

[16:37](#msg5993234cc101bc4e3a1e2953)@dockimbel would it be difficult to add support for fixed size byte arrays in structs? To be able to port for example this c code without pointers hacking?

```
unsigned char    header[282];
```

munael

[16:41](#msg59932425162adb6d2efa7e74)What do opaque struct pointers correspond to in R/S?  
Guessing for now something like `byte-ptr!`.

Oldes

[16:45](#msg599325131c8697534abe8e89)Yes.. but I need also the next struct values... maybe if I could use some compiler macro which would expand it to :

```
header_1 [byte!]
  header_2 [byte!]
...
  header_282 [byte!]
```

munael

[16:47](#msg5993259a210ac2692086ed34)Oh, I wasn't referring to your problem, sorry!  
The biggest problem in your case it seems to me to be when such arrays are not at the end of the struct.  
How are you handling pointer hacking in that case?

Oldes

[16:47](#msg599325a2c101bc4e3a1e366d)hm... maybe the pointer hacking is necessary when dealing with such a structs from Red :/

[16:50](#msg5993263c76a757f808a8c0e4)I'm not handling it yet... but it looks I will need it... which means to have struct pointer head and add number of bytes needed to get the values after such an array with manual casting.

munael

[16:52](#msg599326d676a757f808a8c3b7)Honestly C interop should be exhaustively supported by any systems language. Doesn't have to be a first class thing (but not painful either) but it should be exhaustive.

Oldes

[16:57](#msg5993280980d90ca024ffba29)Right.. but I guess, that @dockimbel would say that there was no such a need while building Red runtime, so it was not built yet.

[17:02](#msg599329341c8697534abea319)On the other hand, it should not be that hard to implement it as you just need the correct alignment for the next value in the struct. The notation could be something like:

```
header [byte-ptr! 282]
```

munael

[17:06](#msg59932a1dbc46472974871707)http://static.red-lang.org/red-system-specs.html#section-4.8  
`array!` maybe

Oldes

[17:12](#msg59932b671c8697534abeae9f)literal r/s array! stores size information in its head which is not case of c array like used in the struct.

[17:13](#msg59932bbac101bc4e3a1e54d4)But I don't want to disturb Red team in current tasks. :/

munael

[17:27](#msg59932f07210ac26920871ae8)Another one is specific-width integers

[17:28](#msg59932f32a7b406262d8f53d1):point\_up: \[August 15, 2017 7:12 PM](https://gitter.im/red/red/system?at=59932b671c8697534abeae9f) @Oldes | I was referring to mention of a first class `array!` type.  
Perhaps a `c-array!` as well.

[17:31](#msg59933009c101bc4e3a1e6b4c)And signed/unsigned integers

[17:32](#msg5993302f162adb6d2efabaaf)I dunno if I'm just reading in the wrong place http://static.red-lang.org/red-system-specs.html

[19:52](#msg599351029acddb2407930101)Mmm  
One could abuse the alignment decorator to get a static array with a specific size.  
Then use some method to access the elements (`/:i` wouldn't work/you can't overload that syntax).  
`#macro` would help here. Or if there's a way to parameterize structs like templates.

greggirwin

[20:02](#msg59935355c101bc4e3a1f1df4)https://github.com/red/red/wiki/Red-System-v2-Wish-List shows that there are a lot of things to consider for R/S 2.0.

## Thursday 31st August, 2017

moliad

[05:28](#msg59a79e7e9acddb2407e8c2f4)maybe not the perfect place to ask, but is there any official docs on the internals of the Red compiler. I need details on how things works in the runtime, things like the datatatype structures, the actions, etc. there is so little comments, that figuring out just about anything takes a lot of time, and sometimes I can't find the declarations and initialiations of stuff for a long time.... making it pretty rough to "get" a lot of the code, even when it seems it should be simple... a lot of it is implicit knowledge.

[05:32](#msg59a79f598f4427b462b8c9a3)has anyone thought of maintaining a "literate" or heavily commented branch of the source code, if only for posterity and ease of learning ?

Oldes

[07:56](#msg59a7c13db16f264642ee31fd)Unfortunately the info is probably only in @dockimbel 's paper blocks and his head. I agree it is very time consuming to dig into the compiler. To maintain commented branch would be also difficult as the code is quickly changing... and remember that the compiler is going to be rewritten after version 1.0

geekyi

[09:52](#msg59a7dc74c101bc4e3a75f06a)@moliad do you have trouble (1) locating where a particular code is or (2) figuring out how the low-level language works?  
I've mostly figured out (1), but the different semantics and stack have me a bit confused at (2)

[09:53](#msg59a7dc98c101bc4e3a75f18b)So I have trouble why the code is the way it is when reading comments sometimes

9214

[10:00](#msg59a7de4f210ac26920ddf1c7)@geekyi care to share insides on (1)?

geekyi

[10:01](#msg59a7de6e210ac26920ddf286)Alright

moliad

[14:45](#msg59a821258f4427b462bb2004)@geekyi right now both, but having an in-depth knowledge of Rebol (~20 years), having gone over some of the code with Doc in person and having a generally deep knowledge of computing, I'm probably more affected by (1) in the moment, a lot of the code is intuitive to me, most long-term Rebolers share a strange mindlink. As I get more into the details, I guess I'll be more affected by some strange code(to my limited knowledge) ... so like you, I'll shift into (2) more and more

[14:49](#msg59a821f0ee5c9a4c5f1c2f65)I am thinking of building a very coarse wiki about things I discover about the compiler, but its hard to decide where to start and its dangerous to keep it out of date. so I'm not sure yet.

[14:50](#msg59a82227b16f264642f016c6) I don't have time to provide much work on Red for its own sake (I have a lot of work to do without adding a new project to my list), but I will use it and help debug and finalize some things which align with my own.

[15:01](#msg59a824b8210ac26920df510c)I might actually try to help implement some low-level things which Doc won't have use or time to address until v15 of Red, cause some stuff is way down on any roadmap (some things probably aren't even on the roadmap yet) and has a much lower ROI for the language itself, but are essential for commercial users of the language like me. Unfortunately, not all my work is public. some IS subject to patents and IP, so I can't use some parts of Red because I can't plug myself into it without sharing the code itself.

[15:01](#msg59a824e2210ac26920df51ef) @Oldes commented code (in the literate sense, where you explain WHY and HOW code works, in line, is really helpful in allowing a broader audience to help on the code. It also makes coming back to it 5 years later much easier and prevents others from doing the same errors or assumptions you did. Liquid is notorious for this, there is a 50% split of in-line documentation and actual source code . One comment actually has a counter on how many times I tried the same optimization and ignored the documentation which explains why it doesn't work. ;-)

Oldes

[15:09](#msg59a8268ebc46472974e0c14a)@moliad I have nothing against commented code... I'm all for it, but I don't consider myself to be qualified for that... my knowledge and my English are not that great for such an important task. I fully understand your needs..I would like to help in this field too. Like with this PR https://github.com/red/red/pull/3001

[15:10](#msg59a826f7162adb6d2e53516f)Recently I'm mostly writing various library bindings as it is not so much affected with Red design choices, but I'm still limited.. mostly because of missing basic integer types:/

moliad

[15:11](#msg59a8271eee5c9a4c5f1c4d6a)(unsigned and 16 bit sizes I am guessing ;-)

Oldes

[15:11](#msg59a8272766c1c7c477ff5f62)Right.

[15:11](#msg59a8273f9acddb2407eb4607)and 64bit which is widely used now even in 32bit libraries.

moliad

[15:12](#msg59a82765bc46472974e0c514)hehe.. been there ... stone and R2 forced me to be creative

Oldes

[15:13](#msg59a82780ee5c9a4c5f1c4ea2)Actually it is not the compiler which is difficult for me, but emitter, which requires very deep knowledge.

moliad

[15:14](#msg59a827da66c1c7c477ff6445)yes, I am guessing things like the hidden, implicit, platform and cpu-specific gotchas aren't very easy to get.

Oldes

[15:14](#msg59a827dbbac826f054676ee4)Btw... I was thinking about using special func definition, which would log me evaluation tree.

[15:15](#msg59a82816ba0f0f6e38020e4a)While working on the above PR, I was using various `print` and `probe`, but it was not much systematic.

moliad

[15:15](#msg59a8281bb16f264642f033f1)you should look into my vprint code base, which I also implemented in C language, and use a file to trace my app in real time.

[15:16](#msg59a82846210ac26920df6325)I will port Vprint to Red and Red/system very quickly once I start using it for real.

Oldes

[15:16](#msg59a828679acddb2407eb4cd1)The compiler is still written in Rebol imho:)

moliad

[15:19](#msg59a828fbb16f264642f03889)ah yes... true... hmmm ... thing is in R2, vprint does adds slowness (like any debugging tools). but maybe we can do a little fork of /master branch and add vprint support to some stages, if only for learning and tracing of how things work

[15:21](#msg59a82979210ac26920df6a76)to use vprint, you add an entry at the begining and end of any function you want to trace. (vin "myfunc()" ... vout) then whatever is vprinted between them is indented. all code uses the same trace stack, and you can add vin/vout pairs anywhere, like in loops and switch blocks.

[15:22](#msg59a829bfee5c9a4c5f1c5c2f)furthermore, you can opt to dump the trace to disk in real time, if you need, to trace it with a tool like

```
tail
```

in linux (mtail.exe on windows).

[15:25](#msg59a82a7fbc46472974e0d47b)you can also decide to turn vprint on and off at any time in your code, by using von &amp; voff so one of the main features of vprint is that it's not "always on, everywhere" which quickly becomes a flood of data, like the trace function in R2. and since your vprint calls are indented at the same level as the rest, you can VERY quickly trace large pieces of loops...

[15:27](#msg59a82ad9bc46472974e0d622)Its still very useful even in visual studio which has a good debugger... as sometimes, you need the whole trace of 100 loops... the breakpoints don't help much and you loose the "compare in time" feature of an in-depth trace.

[15:28](#msg59a82b209acddb2407eb5a55)sorry all for my short off topic branch (Red/system)

Oldes

[15:42](#msg59a82e5fbac826f0546792d6)right.. but these traces will not help you much without Nenad's reviews.

moliad

[15:43](#msg59a82e85ee5c9a4c5f1c74d1)yes we need to know what the traces mean ;-)

greggirwin

[18:15](#msg59a8522cee5c9a4c5f1d208f)I've mentioned that it would be cool to have a native DTrace-like system in Red. There are also movements like OpenTracing out there.

moliad

[19:49](#msg59a8682fbac826f05468bdad)yes, adding aspect-oriented programming tricks to Red would be REALLY cool, it would actually be pretty easy since the datatype action concept is pretty much already that idea.

[19:49](#msg59a8685abac826f05468be39)it can slow down a run-time though, so it's got to be as lean as possible.

## Monday 4th September, 2017

Oldes

[16:46](#msg59ad8362bac826f0547c6527)Hm... I managed to get Red/System code which halts compiler in some infinite cycle... and cannot find a reason:/

[18:57](#msg59ada233162adb6d2e68a20f)Looks it stays in `expand-block` loader's function.

[18:59](#msg59ada28c9acddb240700dfb2)Btw... I used this trick to show functions names as are evaluated:

```
foreach w words-of loader [
		v: get/any in loader w
		if function? :v [
			insert second :v reduce ['print rejoin ["loader: " mold w]]
		]
	]
```

[19:00](#msg59ada2c89acddb240700e0a9)Now... just debug what is wrong with the function... which contains comments like: `;-- black magic...`

[19:11](#msg59ada570bc46472974f6a94c)Hm... I found the problematic define in my code... some sort on #define on not defined #define... I think I'm not going deeper for now:)

greggirwin

[19:14](#msg59ada608210ac26920f4b85c)Here there be Tygers.

## Wednesday 6th September, 2017

Oldes

[17:52](#msg59b035ca8f4427b462dc54c3)I noticed that I can pass normal `float!` values as argument for function which requires `float32!` without casting. @dockimbel Is it safe?

## Thursday 7th September, 2017

9214

[16:42](#msg59b177074e50cfde2714aaf8)Newbie question about bindings - documentation of the API with which I want to play around says:  
&gt; Applications that use the API simply include `foo.h` and link with platform dependent library files.

I know that I can import external libs from R/S, but how am I suppose to import C header file?

[16:46](#msg59b177e5bac826f0548e9fb8)Hm, I skimmed through some examples written in Python and there's only `.so` and `.dll` imports, so header is not mandatory :confused: ?

greggirwin

[17:17](#msg59b17f2eb16f2646421768bc)You'll have to port %.h to R/S. Oldes or Bolek may have some automated tools for this already. I haven't ported mine from R2 yet.

9214

[17:20](#msg59b17fe0210ac2692005e52b)`%.h` itself includes 11 headers, so I should port the entire API..? Well...

[17:22](#msg59b18040bc46472974088033)though I still don't get why docs imply that I should include this `%.h` if Python scripts they provide as examples just use libraries.

greggirwin

[20:10](#msg59b1a7d266c1c7c477273e04)%.h just docs the interface to the library. You only need to port the parts of the API that you need.

9214

[20:13](#msg59b1a87f9acddb24071352c4)@greggirwin why should I port API if I just want to use the library from Red? :D

greggirwin

[20:14](#msg59b1a8a7ee5c9a4c5f440c2e)The "API" is the interface to the library, that's all. You need to declare those funcs for use in Red, right?

9214

[20:14](#msg59b1a8bdbc46472974095173)@greggirwin yes, I just want to start play around with R/S and get hands dirty with bindings

greggirwin

[20:15](#msg59b1a8f78f4427b462e2bf41)Right. If you look at existing API calls to the OS, in R/S, it's the same thing.

[20:16](#msg59b1a90eee5c9a4c5f440e01)That is, how Red and R/S interact with the OS/platform.

9214

[20:18](#msg59b1a994210ac2692006b110)yes, and usually its a bunch of `#import` directives to some libraries, it's the information about header file that confused me (perhaps it's just plain wrong and I should use libraries as usual, docs quality is quite... meh)

greggirwin

[20:20](#msg59b1aa0866c1c7c4772749f2)You can think of `#import` directives as what would be in an %.h file. Which docs are you looking at?

[20:21](#msg59b1aa3b162adb6d2e7ad0b3)http://static.red-lang.org/red-system-specs.html#section-15 ?

9214

[20:21](#msg59b1aa52162adb6d2e7ad1b8)@greggirwin no no, API docs

greggirwin

[20:21](#msg59b1aa67bc46472974095aff)Ah, for the other lib. Got it.

Oldes

[21:16](#msg59b1b714162adb6d2e7b131d)@9214 what exactly you want to integrate? Maybe I could help... btw.. I just pushed Red/System binding to `libRed` https://github.com/red/code/pull/68 .. but have some issues which only @dockimbel could solve.

9214

[21:18](#msg59b1b7c2c101bc4e3a9f189e)Thanks for offering your help @Oldes ! Your binding examples in `code/Library` is more than enough for now :) I'll try to ask specific questions here once I start working with this API (probably next week if I won't flee)

[21:20](#msg59b1b8354e50cfde2715f134)btw, should I dust off my K&amp;R book when it comes to R/S ?

Oldes

[21:28](#msg59b1b9e1210ac2692006fad3)Hard to say.. it cannot hurt you, I believe.

[21:33](#msg59b1bb28ee5c9a4c5f44618f)Unfortunately... as I was quite active with bindings... I think that R/S lacks basic functionality - be able define byte arrays in structs which I tried to address \[here](https://github.com/red/red/pull/3001) and while playing with more advanced OpenGL examples... I feel very limited without literal notations for `float32!`. Because to write code like this in R/S is very complicated now:

```
const float vertexData[] = {
     0.0f,    0.5f, 0.0f, 1.0f,
     0.5f, -0.366f, 0.0f, 1.0f,
    -0.5f, -0.366f, 0.0f, 1.0f,
     1.0f,    0.0f, 0.0f, 1.0f,
     0.0f,    1.0f, 0.0f, 1.0f,
     0.0f,    0.0f, 1.0f, 1.0f,
};
```

[21:36](#msg59b1bbed4e50cfde27160302)Not mentioning missing `int16` and `int64` which is possible to workaround... but will require quite a lot work already to do it correctly later:/

## Friday 8th September, 2017

Oldes

[15:12](#msg59b2b36abc464729740de658)Ok... I think I found quite elegant solution using \[this code](https://gist.github.com/Oldes/1eeae09c7f940d68badc87cfd3ba2bd9) I can create above data like:

```
vertexData: make-f32-buffer [
     0.0    0.5   0.0   1.0
     0.5 -0.366   0.0   1.0
    -0.5 -0.366   0.0   1.0
     1.0    0.0   0.0   1.0
     0.0    1.0   0.0   1.0
]
print-line vertexData/size
p: as pointer! [float32!] vertexData/head
print-line p/6
```

[15:14](#msg59b2b3df162adb6d2e7f3e3d)If you think that I could use different naming, please let me know.. also where I should place script like that in Red/Code repository? It almost look there could be `system` folder.

greggirwin

[18:48](#msg59b2e5e7162adb6d2e8032eb)Code generation to the rescue. Nice Oldes.

## Wednesday 13th September, 2017

dockimbel

[04:48](#msg59b8b8a71081499f1f25b4a0)@Oldes  
&gt; I noticed that I can pass normal `float!` values as argument for function which requires `float32!` without casting. @dockimbel Is it safe?

Literal `float!` should be allowed, other kind of values should not.

[04:55](#msg59b8ba36bac826f054af109d)&gt; I feel very limited without literal notations for float32!.

We need a literal format to specify numbers in different bit-sizes and with signed/unsigned info in Red. Designing proper formats which play well with the rest of Red's syntax is the hard part.

[04:56](#msg59b8ba71319100804e2b17bd)@Oldes Your `vertexData` buffer is storing 64-bit floats, so it's fine for internal usage, but don't pass a reference to such buffer to an API expecting 32-bit floats.

Oldes

[07:54](#msg59b8e441b59d55b823ed9267)@dockimbel why not use `0.1f` for `float32!`? It should be easy enough for me to implement and works well with rest of the world. For signed/unsigned... do we really need it? Once variable has know type of `uint16!`, than the number itself does not need to have own literal form, does it?

[07:58](#msg59b8e53abac826f054afd71f)Regarding the `vertexData` surprisingly it works as expected. You probably overlooked that although the input is using 64bit floats, the result of the `make-f32-buffer` is byte-array containing float32 values.

[08:00](#msg59b8e5a8319100804e2be2e4)Of course... I would prefer version with direct float32! values :-) Just let me know that you will accept format like `0.1f` and I will make it.

[08:03](#msg59b8e6651081499f1f268948)But so far I would better had proper 16 bit integers as external bindings are full of it and it should be supported asap.

dockimbel

[08:06](#msg59b8e70a319100804e2be8bc)@Oldes  
&gt; why not use 0.1f for float32!?

Because we need to define global syntactic rules, as they are many other kind of numbers which could use some added information.

[08:08](#msg59b8e762614889d475f0820f)&gt; Once variable has know type of uint16!, than the number itself does not need to have own literal form, does it?

R/S has type inference, so it can deduce the type from the first expression assigned to it.

Oldes

[08:08](#msg59b8e774b59d55b823eda13e)I'm not sure if I needed any other kind of numbers :-/

dockimbel

[08:11](#msg59b8e822cfeed2eb65028d8d)I didn't notice the `make-f32-buffer` yes, so if you are converting the values explicitly to `float32!`, no problem.

Oldes

[08:11](#msg59b8e843bc4647297429c763)What is wrong with this:

```
var d = 1.0d; // double
var f = 1.0f; // float
var m = 1.0m; // decimal
var i = 1; // int
var ui = 1U; // uint
var ul = 1UL; // ulong
var l = 1L; // long
```

dockimbel

[08:17](#msg59b8e998c101bc4e3abed641)Many things, but this is not the time for me to work on such feature. If you want to make a proposal, you can write a wiki page about it, or a REP, and let the community comment on it.

Oldes

[08:18](#msg59b8e9bbc101bc4e3abed6c4)Proposal is here: https://msdn.microsoft.com/en-us/library/aa691085(v=VS.71).aspx

dockimbel

[08:18](#msg59b8e9dc319100804e2bf82d)That is not a proposal for Red/Rebol languages. It does not care about our syntactic rules, nor our datatypes.

Oldes

[08:19](#msg59b8ea1b1081499f1f269b18)If we already have `1e1`, I don't see any reason, why not have `1f` too.

[08:20](#msg59b8ea5c1081499f1f269bdf)So when we already have:

```
>> 1e1
== 10.0
>> 1e1f
*** Syntax Error: invalid float! at "1e1f"
*** Where: do
*** Stack: load
```

On the second command I would got float32! value and not just error.

dockimbel

[08:21](#msg59b8ea9b1081499f1f269e02)Those two forms are unrelated. The exponent is part of the IEEE-754 spec for floating point number literal representation. The `f` is just a syntactic convention used by some languages.

[08:22](#msg59b8eaddcfeed2eb65029cd8)You do understand that you cannot add/change a syntax rule arbitrarily without consideration for the rest of the rules and planned future datatypes formats?

Oldes

[08:23](#msg59b8eaebc101bc4e3abedd89)But I see no reason (so far), why we should not follow these conventions too?

[08:24](#msg59b8eb42614889d475f097fe)Maybe because I don't see any future planned datatypes and would like to use code with datatypes which exists there for many years already.

[08:26](#msg59b8eb9c210ac26920262887)And as I was writing lexers for many editors to support Rebol and Red, I see no conflict with above notations.

[08:27](#msg59b8ebfb1081499f1f26a563)But if there is someone who know some better form... just step in.

dockimbel

[08:28](#msg59b8ec3ecfeed2eb6502a3fc)Let me give you a few reasons then:  
1\. We don't have any datatype named `double`, so `d` is meaningless.  
2\. `float!` is only 64-bit in Red for now, so we need to introduce a 32-bit version. So `f` alone is not enough.  
3\. `m` refers to "decimal", but we already have `money!` type for that with a specific syntax (to be implemented).  
4\. Red and R/S do not have unsigned numbers for now, just unsigned pointer values. How unsigned/signed would combine with different number bit sizes is yet to define.  
5\. Your proposed convention offers no definition for 8/16/128-bit literal numbers.  
6\. I'm planning a `unit!` datatype which syntactic form would overlap with such proposed syntax, so both needs to be designed at same time, to make it clean and consistent.

[08:30](#msg59b8ecb8c101bc4e3abee908)This is just from top of my head, there are probably other concerns to take into account, after a deeper study.

[08:31](#msg59b8ecf1b59d55b823edbe1f)7 . Usage of lowercases (d, f, m) and uppercases (U, L) is inconsistent.

[08:34](#msg59b8edad177fb9fe7eb50ac2)Let me repeat it again: \*syntax design is the hardest part in programming languages\*. ;-)

Oldes

[09:08](#msg59b8f5a9bac826f054b02f3c)I was asking just for `1.0f` ... and yes... it is very confusing, that we have `float = float32!` and `decimal = float64!`

[09:27](#msg59b8f9e9210ac26920266d9a)And one more thing... I want it for use in Red/System, not Red.

rebolek

[09:36](#msg59b8fc24b59d55b823ee0f8c)@Oldes do not forget that Red/System is dialect of Red, so they share same syntax

dockimbel

[09:52](#msg59b8ffde177fb9fe7eb56fa1)I agree, C's names for floating point numbers are very confusing. ;-)

Oldes

[10:16](#msg59b90569210ac2692026a6ba)At least I can do \[this change](https://github.com/red/code/pull/71/commits/d977e888d5a597c8bbd84ecacdfabbfc5723e300)

[10:17](#msg59b905c6177fb9fe7eb58ef7)And so take it, that I should not loose time on making `1.0f` available.

[10:18](#msg59b9060bcfeed2eb65032abb)Still my big wish is support for 16bit integers in structs (64bit can be somehow hacked as are not so much used in 32bit libs).

[10:20](#msg59b906751081499f1f273095)And at least \[byte arrays in structs](https://github.com/red/red/pull/3001) so I could play with Windows sockets without ugly hacks too.

[10:27](#msg59b9081cbc464729742a6da0)Although I'm not sure, if it should not be implemented in more general way... so one could define also array of any type, not just bytes. (in structs)

[10:28](#msg59b9084c177fb9fe7eb59bc4)But I'm missing any feedback:/ at least I know what must be done :) And it was hard digging.

dockimbel

[10:47](#msg59b90cb31081499f1f274f06)Will review your PR asap, I'm back on the red/red repo during this week, and probably next one, as we need to advance on 0.6.4 branch.

Oldes

[10:49](#msg59b90d2a319100804e2cb15d)Thanks... I have many toys to play meanwhile ;-)

dockimbel

[10:51](#msg59b90da2c101bc4e3abf9129)`int16!` is desirable, and there is already some space left for it in the IA-32 backend, though for ARM, it might require more work. My plan is to implement both `int16!` and `int64!` at the same time, as they touch the same code parts in the codebase.

## Thursday 14th September, 2017

Oldes

[08:07](#msg59ba38b2614889d475f775a7)@dockimbel is it possible in Red code to define options, which underlying Red/System code could use, so for example use older library API?

[08:37](#msg59ba3fc3b59d55b823f4e1e3)I mean... lets have 1. file as a main app... where user could use something like:

```
Red [
    config: [SQLite-old-trace: true]
]
```

in the 2. file, which is holding Red dialect I could use:

```
#either SQLite-old-trace [
   ;... some code using old API
][
   ;... code using the new API
]
```

[08:37](#msg59ba3fe7210ac269202d0097)Or something like that :-)

[09:05](#msg59ba4659c101bc4e3ac60583)Also... it looks, that on macOS, the function imports are done on runtime, when the function is really going to be executed, while on Windows are loaded on application start, so it is not possible to do any checks on runtime, only during compilation. Isn't it possible to use LAZY loading?

[11:11](#msg59ba63dbb59d55b823f5b3e0)Is it possible to embed binary data into R/S application? I tried in code:

```
data: 64#{some-base64-encoded-data}
```

but compiler seems not to support it, which is a shame:/

[12:43](#msg59ba79787b7d98d30df463ea)Is it possible to call Red function from Red/System?

PeterWAWood

[13:01](#msg59ba7d96c101bc4e3ac74e55)Yes.

[13:01](#msg59ba7da2210ac269202e5f4d)... but I'll have to look up how :-)

[13:02](#msg59ba7e00bc464729743258b6)\[Here](http://static.red-lang.org/red-system-specs.html#section-16.8)

Oldes

[13:40](#msg59ba86d0bac826f054b8c3ac)Thanks.. but it does not work in my case :-/ Wanted to do something like:

```
view/no-wait layout [size 300x200 button "Hello" [print now]]
#system [
	until [
		#call [do-events/no-wait]
		not quit?
	]
]
```

[13:44](#msg59ba87b27b7d98d30df4bb60)I get error:

```
*** Compilation Error: invalid #call function name: none
```

[15:35](#msg59baa1db1081499f1f2fac66)@dockimbel is it granted that struct declared like: `pfd: declare PIXELFORMATDESCRIPTOR!` is filed with zero bytes?

[16:59](#msg59bab5647b7d98d30df5c966)And another question (I promise, this will be the last one for today)... so far I used naming like:

```
binary-ref!:  alias struct! [value [pointer! [byte!]]]  ; same like: void ** in C
```

because that is naming which used Kaj. But in Red code is more common use: `int-ptr!` so shouldn't I change appearances like the above to:

```
binary-ptr!:  alias struct! [value [pointer! [byte!]]]
```

Because better to change it now, than later, when there could be more code with it.

greggirwin

[20:02](#msg59bae067cfeed2eb650d3c10)Coming in late. I know `short, long, etc.` have been common names for a long time, but we need to decide if we want to use names that don't have a specific bit-ness to them.

rebolek

[20:09](#msg59bae1ffb59d55b823f890cf)I would prefer bit size instead of names

Oldes

[20:10](#msg59bae226bac826f054bae3f9)I'm fine with `integer16!` and `integer64!` once it will be there... you can use `#define short! integer16!` anyway.

[20:15](#msg59bae35fb59d55b823f89707)Btw... just noticed, that compiler does not allow this:

```
int16!:  alias struct! [lo [byte!] hi [byte!]]   
f: func[a [int16! value]][0]
```

but is fine with:

```
integer16!:  alias struct! [lo [byte!] hi [byte!]]   
f: func[a [integer16! value]][0]
```

Probably some hardcoded not finished check.

[20:16](#msg59bae3aa177fb9fe7ec00298)The first one throws error:

```
*** Compilation Error: invalid definition for function f: [a [int16! value]]
```

[20:17](#msg59bae3dfbc4647297434c76f)took me some time to find it, because I was using `int64!` struct workaround quite a long time

[20:18](#msg59bae422210ac2692030b6ee)@greggirwin would you like to have also `long-long`?

greggirwin

[22:36](#msg59bb0459b59d55b823f93eac)@Oldes, no, that's what I mean. `Long` has an implicit meaning, which I don't care for in this case. There is a history of meaning for this word, but if someone starts programming today, should they carry this particular legacy naming that doesn't really make sense in today's world, and tomorrow's?

Oldes

[22:43](#msg59bb06137b7d98d30df77702)I don't think so.

## Friday 15th September, 2017

dockimbel

[04:51](#msg59bb5c41cfeed2eb650f5578)&gt; @dockimbel is it granted that struct declared like: `pfd: declare PIXELFORMATDESCRIPTOR!` is filed with zero bytes?

Yes, `declare` allocates storage space from the data segment of the executable, filling it with zeros.

[04:56](#msg59bb5d98177fb9fe7ec2058e)@Oldes For `binary-ptr!`, just keep in mind that we might introduce a `binary!` type in R/S in the future (maybe not first-class). That name is too valuable, so consider it reserved, or be prepared for renaming your type in the future (probably safe for this year).

[04:59](#msg59bb5e4a614889d475fd7594)@greggirwin I learned C in 1992, and I remember finding the types naming already confusing and lacking meaning. Using the bit size in the name makes is totally clear.

Oldes

[07:09](#msg59bb7cad177fb9fe7ec28ce2)My question was if I should not rename `-ref!` to `-ptr!`. The mentioned binary was just an example.

dockimbel

[07:10](#msg59bb7ccccfeed2eb650fe53f)`-ptr!` is preferred then.

Oldes

[07:11](#msg59bb7d09c101bc4e3acc36e7)It will be already big change:)

[13:26](#msg59bbd50c1081499f1f3585d0)&gt; &gt; @dockimbel is it granted that struct declared like: `pfd: declare PIXELFORMATDESCRIPTOR!` is filed with zero bytes?

&gt; Yes, `declare` allocates storage space from the data segment of the executable, filling it with zeros.

It is not true if used in function... look at this:

```
s!: alias struct! [value [integer!]]
f: func[n [integer!] /local v][
	v: declare s!
	print-line [n " v/value: " as byte! v/value]
	v/value: 42
]

f 1
f 2
```

result is:

```
1 v/value:
2 v/value: *
```

dockimbel

[13:27](#msg59bbd557177fb9fe7ec47e34)@Oldes `declare` is a static allocation, not a dynamic one. It always returns the same reference.

Oldes

[13:27](#msg59bbd557cfeed2eb6511c04a)It is filled with zeros, but than the memory may be changed, so one must initialize it in functions.

[13:30](#msg59bbd60a177fb9fe7ec48208)It would be nice to have some way how to initialize values in structs without setting each value using `set-path!`

[13:31](#msg59bbd63fbc46472974393a31)something, what would short code like:

```
pfd: declare PIXELFORMATDESCRIPTOR!

set-memory as byte-ptr! pfd #"^@" size? PIXELFORMATDESCRIPTOR!
pfd/nSize-nVersion: 00280001h
pfd/dwFlags:        PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER
pfd/iPixelType:     as byte! PFD_TYPE_RGBA
pfd/cColorBits:     as byte! 32
pfd/cDepthBits:     as byte! 24
pfd/cStencilBits:   as byte! 8
```

[13:32](#msg59bbd676b59d55b823fd13d0)especially the set-memory line, which starts to be quite used in my code:/

## Monday 18th September, 2017

Oldes

[15:32](#msg59bfe71dbac826f054d21ee2)@dockimbel I'm writing 3D-math functions in Red/System ... should I use for example this:

```
mat4f-scale: func[]...
```

or inside context like:

```
mat4f: context [
    scale: func[]...
]
```

Am I right that both versions would use just function pointer and so the second would have same performance?

[15:59](#msg59bfed63bc464729744c268f)I'm going to use the second.. as it looks more like Red runtime's datatypes.

## Wednesday 20th September, 2017

geekyi

[00:33](#msg59c1b7641081499f1f5099c2)Just to mention here, I think most modern languages (e.g. Rust) use `int64`, so there's consensus already

## Thursday 21st September, 2017

ghost~59be53e5d73408ce4f7618b4

[20:21](#msg59c41f521081499f1f5b44c2)Anyone can say me how I can convert `string!` (argument of a `routine`) to `c-string!` to use in the `routine` and viceversa (return a `c-string!`to use as `string!`in Red???

Oldes

[20:47](#msg59c42557b59d55b823239350)@ejtizado string! to c-string!

```
test: routine [
	message [string!]
	/local c-str len
][
	len: -1
	c-str: unicode/to-utf8 message :len
	print-line ["c-str bytes: " len " => " c-str]
]
```

[20:52](#msg59c426871081499f1f5b6c75)will have to find, how is the reverse :) It is one of things I'm never sure yet.

[21:02](#msg59c428d2cfeed2eb65381c11)The question is, if you really need to convert red-string! to c-string! It is costly conversion... maybe you can work with the series buffer directly.

[21:02](#msg59c42900177fb9fe7eebc008)You just must take care about different encoding types the red-string! can have according its content.

[21:20](#msg59c42d15b59d55b82323bc9b)You may play with this code:

```
test2: routine [
	str [string!]
	/local s unit head size
][
	print-line ["str length: " string/rs-length? str]
	string/concatenate-literal str "boo" ;appends some text
	print-line ["str length: " string/rs-length? str]
	s: GET_BUFFER(str)
	unit: GET_UNIT(s)
	head: (as byte-ptr! s/offset) + (str/head << (log-b unit))
	size: (as-integer s/tail - s/offset) >> (log-b unit) - str/head
	print-line ["string's internal unit: " unit " head: " head " size: " size]
]

probe test2 "foo"
probe test2 "šiška"
```

[21:20](#msg59c42d26210ac269205b616c)output is:

```
str length: 3
str length: 6
string's internal unit: 1 head: 02A4CD18 size: 6
"fooboo"
str length: 5
str length: 8
string's internal unit: 2 head: 02A4CD3C size: 8
"šiškaboo"
```

[21:21](#msg59c42d55b59d55b82323bdd4)You can see, that for the second call the unit is not 1 (latin) but 2 (ucs2)

[21:27](#msg59c42ed7cfeed2eb65383af9)And you should also think about series' index... for:

```
probe head test2 tail "foo"
```

you will get:

```
str length: 0
str length: 3
string's internal unit: 1 head: 029DCBDF size: 3
"fooboo"
```

[21:43](#msg59c4326b1081499f1f5babb6)This routine creates a new red-string! from given c-string!

```
test3: routine [
	/local c-str r-str 
][
	c-str: "hello"
	r-str: string/load c-str length? c-str UTF-8
	SET_RETURN(r-str)
]
probe test3
```

returns:

```
"hello"
```

[21:44](#msg59c432aa7b7d98d30d224958)You may also load `c-string!` into existing red value using \[string/load-at](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L1036)

[21:53](#msg59c434f5c101bc4e3af4bdaa)But I'm not that much experienced in Red &lt;-&gt; Red/System exchange... I'm mostly writing just Red/System code so far. And I think that all binding I did for \[red/code](https://github.com/red/code/tree/master/Library/) are in a form of a dialect, where I don't create new values, but modify existing one.

[21:57](#msg59c435dc7b7d98d30d2259b9)You may check for example this part: https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L342-L356

[22:04](#msg59c43756bc464729746096ab)It is responsible to handle code like:

```
SQLite/do [
	result: exec "SELECT random();"
	result: exec "SELECT hex(randomblob(16));"
]
```

If the `_Exec` symbol finds \[previously defined](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L332-L334) `set-word!`, it \[collects result](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L126-L159) into value which the set word points to. And \[if it is not a block, it first modifies the value to block](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L351-L353). If there is no `set-word!` like doing just `sqlite/do [exec "SELECT random()"]`, it would not collect and \[just prints the result](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.red#L102-L125).

[22:11](#msg59c438f8c101bc4e3af4cd65)I found using such a dialect approach much more user (and performance) friendly, than just writing various routines for each situation.

ghost~59be53e5d73408ce4f7618b4

[23:21](#msg59c44986177fb9fe7eec61e1)@Oldes very thanks, I will digest it slowly!

## Saturday 23th September, 2017

Oldes

[15:58](#msg59c684a1177fb9fe7ef52919)To deal with sockets in Red/System I written `decode-url` function, which converts `c-string!` into `url!` struct, which looks like:

```
url!: alias struct! [
	scheme  [c-string!]
	user    [c-string!]
	pass    [c-string!]
	host    [c-string!]
	port    [integer! ]
	path    [c-string!]
	target  [c-string!]
]
```

But now I'm again not sure, where I should place it in Red/code repository:/

[16:01](#msg59c68556bac826f054ef4f20)Because I also have function `probe-url` and would like to have `validate-url`, I was also thinking, that I could make them all as:

```
url: context [
    decode: func[...
    probe: func[...
    validate: func[...
]
```

but `url` is such a short and common name, that it would cause problems, what do you think?

[16:02](#msg59c68594c101bc4e3afdc435)or maybe I could use `ctx-url: context [...` and add pointers to these functions into `url!` struct.

[16:05](#msg59c68632c101bc4e3afdc5f2)But than one would have to use special struct creation... maybe I will stay with long names... it is Red/System anyway.

## Sunday 24th September, 2017

meijeru

[06:23](#msg59c74f6cc101bc4e3a004652)On url analysis/creation, see also \[this Gist](https://gist.github.com/meijeru/4a44ff148e44182580c79182f61113b0)

## Monday 25th September, 2017

greggirwin

[17:27](#msg59c93c8a7b7d98d30d3580c2)@oldes, maybe Red/Community repo then?

## Friday 29th September, 2017

per\_usir\_twitter

[18:43](#msg59ce9439614889d4755615e6)@Oldes There are two macros in macros.reds: PLATFORM\_TO\_CSTR(cstr str len) and PLATFORM\_LOAD\_STR(str cstr len)

ghost~59be53e5d73408ce4f7618b4

[18:48](#msg59ce956ef7299e8f538b0c63)Anyone working to provide prototype-based programming to Red?

9214

[18:48](#msg59ce9599177fb9fe7e1bda91)@ejtizado it's already prototype-based, but without classes hierarchy

[18:50](#msg59ce960b7b7d98d30d51ce07)I mean without prototype chain or whatever it's called

[18:51](#msg59ce9637177fb9fe7e1bde73)but again, I believe you can simulate this chain with reactors

ghost~59be53e5d73408ce4f7618b4

[18:53](#msg59ce9690b59d55b823531849)@9214 \[I say a prototype based as the wikipedia describes](https://en.wikipedia.org/wiki/Prototype-based\_programming), i.e.,

```
a: make object! [x: 1 y: 2]
b: make object![x: 3] ; ... and a prototype of b
b/x => 2
b/y => 2
```

[18:54](#msg59ce96e3bac826f05415c757)Where do I put the code `_proto: make/symbol "_proto_"` to be accesible in all R/S functions?

9214

[18:54](#msg59ce96f5cfeed2eb6567e4a9)What? How is that what `b` object has `y` field setted to `2` if there's no `y` field in it at all?

[18:55](#msg59ce9719b20c642429a29933)and why you think `b/x` should return `2` if `b/x` is set to `3`?

ghost~59be53e5d73408ce4f7618b4

[18:57](#msg59ce9796cfeed2eb6567e7ab)@9214 Yes but as `a` is a prototype of `b`, `b` respond with the value of `a/y`  
I make it with 4 lines of code and without any penalties to the rest of R/S code

9214

[18:58](#msg59ce97bf32fc8b7e40573f66)`a` is not a prototype of `b` in your example, whey are two completely separate objects

ghost~59be53e5d73408ce4f7618b4

[18:58](#msg59ce97c8cfeed2eb6567e8f5)@9214 sorry `b/x => 3`

9214

[18:58](#msg59ce97edf7299e8f538b1ebf)@ejtizado

```
>> a: object [x: 1 y: 2]
== make object! [
    x: 1
    y: 2
]
>> b: make a [x: 3]
== make object! [
    x: 3
    y: 2
]
```

ghost~59be53e5d73408ce4f7618b4

[19:00](#msg59ce985ab59d55b82353237a)@9214 Ok! but in real prototype-based programming

```
a/y: 20
b/y => 20
```

In your code `b/y => 2` because this is a simple copy of `a` when make `b`

[19:02](#msg59ce98d832fc8b7e4057462b)lol, I'm new in Red: the previos question was : `_proto: symbol/make "_proto_"`

9214

[19:03](#msg59ce98e5614889d47556300f)@ejtizado

```
>> a: make reactor! [x: 1 y: 2]
== make object! [
    x: 1
    y: 2
]
>> b: make a [x: is [a/x] y: is [a/y]]
== make object! [
    x: 1
    y: 2
]
>> a/y: 20
== 20
>> b/y
== 20
>> a/x: 100
== 100
>> b/x
== 100
```

ghost~59be53e5d73408ce4f7618b4

[19:07](#msg59ce9a0acfeed2eb6567f45e)@9214 version? it don't work to me!

9214

[19:09](#msg59ce9a4dbac826f05415da75)@ejtizado

```
>> about
Red for Windows version 0.6.3 built 27-Sep-2017/20:48:45+05:00
```

ghost~59be53e5d73408ce4f7618b4

[19:12](#msg59ce9b0ab20c642429a2b391)@9214 I has the `Red for macOS version 0.6.3 built 29-Sep-2017` and don't work!

[19:13](#msg59ce9b47177fb9fe7e1bfa3f)29-Sep because I built today with Rebol

9214

[19:13](#msg59ce9b5332fc8b7e405754f3)@ejtizado could you paste error message here?

[19:14](#msg59ce9b92614889d475563c57)works the same for me on Linux

```
Red for Linux version 0.6.3 built 30-Sep-2017/0:12:50+05:00
```

ghost~59be53e5d73408ce4f7618b4

[19:15](#msg59ce9bb4614889d475563cc1)I logout because I'm in WIndows to login form macOS

[19:17](#msg59ce9c34bac826f05415e3d4)@9214

```
>> a: make reactor! [x: 1 y: 2]
== make object! [
    x: 1
    y: 2
]
>> b: make a [x: is [a/x] y: is [a/y]]
*** Script Error: set-quiet does not allow set-word! for its word argument
*** Where: set-quiet
*** Stack:

>> b: make a [x: is [a/x] y: is [a/y]]
== make object! [
    x: 1
    y: 2
]
>> a/y: 20
== 20
>> b/y
== 2
```

9214

[19:18](#msg59ce9ca232fc8b7e40575b0f)@ejtizado thanks, looks like #3046 still lurks on macOS, @dockimbel to the rescue!

ghost~59be53e5d73408ce4f7618b4

[19:31](#msg59ce9f74cfeed2eb6568101e)@9214 ok, It seem the same bugs. I wait to the 0.6.4 milestones and the posible implementation of `extend` in objects.

9214

[19:46](#msg59cea304f7299e8f538b5ea3)@ejtizado  
&gt; 29-Sep because I built today with Rebol

To clarify - you built Red from latest sources?

## Sunday 1st October, 2017

geekyi

[15:49](#msg59d10e77b20c642429acf683)Btw @ejtizado https://gitter.im/red/red/welcome and https://gitter.im/red/help is better if you haven't question about Red/system specifically

## Monday 2nd October, 2017

dockimbel

[12:13](#msg59d22d7cf7299e8f539a736a)@9214 @ejtizado I cannot reproduce that issue on macOS:

```
>> a: make reactor! [x: 1 y: 2]
== make object! [
    x: 1
    y: 2
]
>> b: make a [x: is [a/x] y: is [a/y]]
== make object! [
    x: 1
    y: 2
]
>> a/y: 20
== 20
>> b/y
== 20
```

9214

[12:14](#msg59d22d96177fb9fe7e2b6eba)@dockimbel :+1: thanks

## Friday 3th November, 2017

wasamasa

[12:38](#msg59fc632ae44c43700ab1a87d)I'm trying to write a REPL by leveraging GNU readline, however my binding to the `readline` function returns the prompt for some reason. I've tested the same approach with `strfry` and that one returns the expected output:

```
Red []

#system [
    #import [
        "libreadline.so" cdecl [
            gnu_readline: "readline" [
                prompt [c-string!]
                return: [c-string!]
            ]
        ]
    ]
    #import [
        LIBC-file cdecl [
            libc_strfry: "strfry" [
                string [c-string!]
                return: [c-string!]
            ]
        ]
    ]
]

readline: routine [prompt [string!]] [
    gnu_readline as c-string! string/rs-head prompt
]

strfry: routine [arg [string!]] [
    libc_strfry as c-string! string/rs-head arg
]

string: strfry "12345"
print ["XXX" mold string]

line: readline ">>> "
wait 1
print ["XXX" mold line]
```

[12:45](#msg59fc64ce32e080696e5db1a3)Code mostly leveraged from https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version

dockimbel

[13:02](#msg59fc68f2976e63937e216f9a)@wasamasa Good job for a first incursion in Red/System! The conversion between the boxed Red string! and the low-level C string is missing. `string/rs-head` gives a pointer to the internal boxed string buffer, but the internal format can be any of UCS-1, UCS-2 or UCS-4. The `as c-string!` only does a type casting, not a conversion, so you should replace it by an explicit conversion to UTF-8. Moreover, a routine won't auto-convert strings for you (it can auto-convert numeric and logic types though), so you need to internalize the string (using `string/load`) and place the newly created string! value into the return slot (using `stack/set-last`). Let me write it for you:

[13:05](#msg59fc6985f7299e8f536980a9)

```
lisp
readline: routine [prompt [string!] /local len s][
    len: -1		;-- converts all characters
    s: gnu_readline unicode/to-utf8 prompt :len
    stack/set-last string/load s length? s UTF-8 
]
```

Untested, but should compile and run.

wasamasa

[13:11](#msg59fc6b032a69af844b4358ad)Interesting. The other issue I can think of here is that `readline` may return NULL.

[13:12](#msg59fc6b3e976e63937e217bd7)Also, you're expected to `free` whatever `readline` hands you, the FFI systems I've worked with before defined two separate string types to handle both strings that must be freed and strings that must not.

[13:17](#msg59fc6c565a1758ed0f83e95f)@dockimbel It doesn't compile yet with `*** Compilation Error: undefined symbol: red/unicode/to-utf8`.

PeterWAWood

[13:29](#msg59fc6f1e2a69af844b43736a)Try compiling with the `-r` argument.

wasamasa

[13:37](#msg59fc7123e44c43700ab1fe85)Ah, now I get a different error:

```
*** Compilation Error: argument type mismatch on calling: red/stack/set-last 
*** expected: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]], found: [struct! [
        header [integer!] 
        head [integer!] 
        node [pointer! [integer!]] 
        cache [c-string!]
    ]]
```

[13:39](#msg59fc71942a69af844b43821b)This can be fixed by replacing the last line with `stack/set-last as red-value! string/load s length? s UTF-8`.

[13:43](#msg59fc72964ff065ac18af6001)I wonder though, how would you handle the case of returning `false` when receiving a null pointer?

PeterWAWood

[13:54](#msg59fc7508f7299e8f5369ca12)One way is just to check the pointer value before converting the string returned from readline.

wasamasa

[13:55](#msg59fc7536e44c43700ab2181e)Yes, but how would you change the function so that it returns `false` in that case?

[13:55](#msg59fc754a32e080696e5e1300)`stack/set-last` appears to only accept composite values.

[13:57](#msg59fc75d7b20c642429828f8c)Here's my workaround so far, returning "q" (like `ask`):

```
readline: routine [prompt [string!] /local len s] [
    len: -1
    s: gnu_readline unicode/to-utf8 prompt :len
    if s = null [
        s: libc_strdup "q"
    ]
    stack/set-last as red-value! string/load s length? s UTF-8
    free as byte-ptr! s
]
```

[13:59](#msg59fc7632d6c36fca31d06ae3)This must be preceded by the following:

```
#system [
    #import [
        LIBC-file cdecl [
            libc_strdup: "strdup" [
                string [c-string!]
                return: [c-string!]
            ]
        ]
    ]
]
```

[16:18](#msg59fc96d85a1758ed0f8505e9)Is there a way to load a `.reds` file from a `.red` file? So far all examples I've seen have the example program as a `.reds` file which must be compiled, I'd ideally like to load a shared library from a regular `.red` script.

greggirwin

[17:41](#msg59fcaa3d32e080696e5f75ec)Red doesn't have FFI yet, though it should come pretty soon. Red/System must always be compiled, so you're correct on that. Once Red has FFI, you can build DLLs in Red/System and load those.

[17:59](#msg59fcae9932e080696e5f8ed4)You can look up the old R2 docs on its FFI, though Red will likely enhance it quite a bit. I just put up a (very) old library interface dialect I did for R2 at https://github.com/greggirwin/R2-library-dialect. As Team Red looks at the FFI, maybe we can have some design discussion to see how to make it even better.

pekr

[18:11](#msg59fcb1542a69af844b4529ec)@greggirwin is FFI going to be official internal means of loading libraries, which should come in terms of 0.6.4 release, or is that the add-on featureset?

greggirwin

[18:18](#msg59fcb2da976e63937e23604b)I haven't checked the timeframe for it. It will be standard at some point though.

wasamasa

[23:34](#msg59fcfd172a69af844b46c235)Ah, I didn't know R2 had that functionality.

[23:36](#msg59fcfd7f4ff065ac18b2995b)Apparently an add-on, so I won't be able to try it.

PeterWAWood

[23:54](#msg59fd01c432e080696e613bea)Rebol 2 FFI is included in the free Rebol/View but not the free Rebol/Core.

## Saturday 4th November, 2017

pekr

[06:25](#msg59fd5d525a1758ed0f889dbd)Wait, sorry for my ignorance, I thought that FFI stands for some complete stack of functionalities. R2 ability to wrap libraries is very limited, especially when compared to R/S. What is Red and R/S missing right now, is the ability to load DLLs, which is on the list for 0.6.4.

PeterWAWood

[09:51](#msg59fd8d922a69af844b48c315)You might well be right @pekr.

[09:51](#msg59fd8d9c976e63937e26fc12)I'm no expert on FFI.

greggirwin

[17:09](#msg59fdf461b20c642429898702)https://en.wikipedia.org/wiki/Foreign\_function\_interface

&gt; A foreign function interface (FFI) is a mechanism by which a program written in one programming language can call routines or make use of services written in another.

[17:10](#msg59fdf47b2a69af844b4a67c2)For me, it's as simple as that.

## Saturday 11st November, 2017

luce80

[17:37](#msg5a073567540c78242defcc64)I'd like to access the pixels of an `image!` as `binary!` inside a red `function!` and I thought I should use https://github.com/red/red/wiki/Guru-Meditations#access-binary-data-from-an-external-source and `image/acquire-buffer` and `image/release-buffer`but I don't know how to create the `routine`s that do the trick. Any idea?

greggirwin

[17:54](#msg5a07396adf09362e67f77453)Does https://github.com/red/code/blob/master/Scripts/mandelbrot-fast.red do what you want, as an example?

luce80

[18:03](#msg5a073b8bdf09362e67f77e7c)I am exactly try to make a version between mandelbrot-med and mandelbrot-fast. Something like:

```
getBinaryValue: routine [
    addr [integer!] "Data address"
    size [integer!] "Data size"
    return: [binary!]
	][
    as red-binary! stack/set-last as red-value! binary/load as byte-ptr! addr size
]

acquirePixels: routine [
	img  [image!]
	handle [int-ptr!]
    return: [binary!]
	/local
		pix [int-ptr!]
		;handle
	][
	handle: 0
	pix: image/acquire-buffer img :handle
	pix
]
releasePixels: routine [
	img  [image!]
	handle [int-ptr!]
	/local
	][
	image/release-buffer img handle yes
]
mandelbrot: function [img xmin xmax ymin ymax iterations handle pix][
...
	pix: getBinaryValue acquirePixels img handle (img/image/size/x * img/image/size/y * 4)
...
			change/part pix
			either i > iterations [#{FF000000}][
				c: (log-e i) / log-e (iterations - 1.0)
				#{FF000000} or to-binary 16777216 - to-integer c
			] 4
...
releasePixels img handle
...
]
```

but It gives me errors that I can not understand ;) and would like to see the right version.

## Friday 29th December, 2017

cwt8805

[09:09](#msg5a46065d0163b028108d730f)How can I call CreateThread on Windows in Red/System?

meijeru

[13:54](#msg5a46492db48e8c35667ac348)@luce80 what about this:

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/1
== 255.255.255.0
>> to-binary i/1
== #{FFFFFF00}
```

[13:56](#msg5a46497729ec6ac31197f70a)You get the pixel including its transparency, as a 4 byte binary.

9214

[13:57](#msg5a4649c568d092bb6201167d)there're also `/rgb` and `/argb` accessors

meijeru

[14:16](#msg5a464e290163b028108eae4d)`i/argb` in the above case yields a 16 byte binary, so in that case the first pixel is `copy/part i/argb 4` while the second is `copy/part at i/argb 5 4` etc., not so convenient...

luce80

[17:42](#msg5a467e7bba39a53f1ab5b8eb)@meijeru I am already doing it in a similar way but I wanted a faster way using only a minimum number of compiled routines and the rest in interpreted Red.

## Saturday 30th December, 2017

greggirwin

[02:40](#msg5a46fcadedd2230811f133c3)@cwt8805, what is your ultimate goal? Red is single threaded, though we'll get concurrency in the future. Adding thread support yourself will be a big task.

ldci

[16:13](#msg5a47bb28edd2230811f3f1bb)Update for video samples according to evolution of red camera object (https://github.com/ldci/redCV)
