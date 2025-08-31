# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2020

## Friday 31st January, 2020

Respectech

[19:44](#msg5e3483b9594a0517c25bda39)If anyone would like to create a password generator using LibreOffice's dictionary as a base, feel free to use this as a starting point:

```
change-dir to-red-file "C:\Program Files\LibreOffice\share\extensions\dict-en" ;Change path to the location of  your dictionary files
random/seed now/time/precise
dic: read/lines %en_US.dic
loop 3 [
    prin head change copy/part (mark: pick dic random length? dic) (any [find mark "/" tail mark]) uppercase mark/1
]
```

Note: parens added for readability (not required)

[19:47](#msg5e348461f6945f41ef4ee0f8)Just run it multiple times until you get a password you like. You may not like some of them, like the following examples:

```
SabraOutletStupendous
MeanderingsGasmanAchene
FarSlovenlinessFlexing
ActualizationFlambeExpressiveness
CandlerSuperficialityLeonidas
```

[19:48](#msg5e348482fe0e6f74e9f40ea3)In fact, that makes me think that maybe I should have it retry until it generates a password combo that is smaller than a certain length. That will require some code changes.

[19:53](#msg5e34859c15941335584a970a)

```
until [
    pass: copy ""
    loop 3 [
        append pass head change copy/part (mark: pick dic random length? dic) (any [find mark "/" tail mark]) uppercase mark/1
    ]
    print pass
    all [(length? pass) > 11 (length? pass) < 17]
]
```

[19:55](#msg5e348640d9895b17c3c2e8a7)The reason I decided to do this is because online password generators cannot be trusted...

greggirwin

[19:56](#msg5e348654e8a83835590a0d74):+1:

Respectech

[20:19](#msg5e348bd4bfe65274ead0decd)In case you're wondering how hard that would be to brute-force, using my LibreOffice English dictionary file, it would be at a minimum:

```
>> (length? dic) ** 3 * 2
== 236148977824758.0 ;About 236 trillion possibilities
```

The {* 2} on the end is because the cracker wouldn't know if the first letter of each word was capitalized or not.

If the cracker knew what length range the password needed to fall in, it would reduce this number significantly.

## Saturday 1st February, 2020

dander

[00:12](#msg5e34c27140da694c5efe5a26)@Respectech I'm a fan of the \[EFF wordlists](https://www.eff.org/deeplinks/2016/07/new-wordlists-random-passphrases). They are curated to avoid many undesirable characteristics (hard to spell, easily confused with other words, etc)... but it's going to be much shorter than a whole dictionary, so you may need more words

Respectech

[01:21](#msg5e34d27cd9895b17c3c41914)@dander Great info! Here's the slightly modified code to do it with that list instead (bonus: can be run from any computer with an Internet connection without having to specify a local filepath):

```
dic: read/lines https://www.eff.org/files/2016/09/08/eff_short_wordlist_1.txt
random/seed now/time/precise
until [
    pass: copy ""
    loop 3 [
        append pass head change mark: second split pick dic random length? dic #"^-" uppercase mark/1
    ]
    print pass all [(length? pass) > 11 (length? pass) < 15]
]
```

[01:22](#msg5e34d2f340da694c5efe8bb1)Using this wordlist, the probability of selecting the right password if knowing the list of words used for the generation is 1:4.4 billion.

[01:24](#msg5e34d33373ddad4acd85fc92)Example passwords generated:

```
WakePluckWages
PleadFreshPuma
PunkTweetFolic
BathDecorEnvoy
WaferQuiltFetch
YardHumpBoat
```

greggirwin

[19:51](#msg5e35d6cdf301780b835df70b)Had to tease it apart for my brain.

```
dict: read/lines https://www.eff.org/files/2016/09/08/eff_short_wordlist_1.txt
random/seed now/time/precise
word-part: func [entry][second split entry #"^-"]
cap: func [str][uppercase/part str 1]
mk-pass: function [][
    until [
        pass: copy ""
        loop 3 [
            entry: random/only dict
            append pass cap word-part entry
        ]
        all [(length? pass) > 11 (length? pass) < 15]
    ]
    pass
]
```

## Sunday 2nd February, 2020

Respectech

[00:18](#msg5e36155615941335584e6ee5)Ooh, `uppercase/part`... I like it out

[00:19](#msg5e3615a2fe0e6f74e9f8130c)You don't like my run-on Red sentence?

greggirwin

[00:20](#msg5e3615b3e8a83835590dfb1a)I just had to break it down to understand it.

Respectech

[00:20](#msg5e3615caf301780b835e7c15)Understanding is overrated. You need to go with your gut...

greggirwin

[00:20](#msg5e3615e1d9895b17c3c6d8e6)With long expressions, I find I'm in the middle, then have to scan back and mentally note where I am.

[00:20](#msg5e3615ead9895b17c3c6d8ec):^)

## Monday 3th February, 2020

Respectech

[18:54](#msg5e386c5e159413355853b2e0)`random/only` - Learning so much new stuff!

## Thursday 20th February, 2020

ralfwenske

[07:48](#msg5e4e39b889f30b12651ac3ee)I have a `printF` function which I find very usefull for creating formatted tabular reports. I am interested in getting feedback regarding concept and code. Perhaps others might want to play with it too. Is this the place to show it?

rebolek

[08:09](#msg5e4e3ebb4880f07ed1e83acb)@ralfwenske certainly

ralfwenske

[08:20](#msg5e4e4141dafa3029f6402178)this syntax :

```
Red []

do load %printF.red

printF/underlined ["Some examples" [20] "This" [-14] "That" [-10] "A Rest" [-8 ] "When" [-12]] #"_"
printF ["none shown" [20] 345.2345 [-14 2 "$ " 'blank] 123.4567 [-10 3] none [-8 ] 2000-1-1 [-12]]
printF ["various 'blank" [20] 98765.7321 [-14 2 "$ " 'blank] -1.87654 [-10 3] 0 [-8 'blank] 2019-3-6 [-12]]
printF ["zero blank / not blank" [20] 0.0 [-14 2 "$ " 'blank] 0 [-10 3] -98 [-8 0 "" 'blank]]
printF ["a block shown" [20] [0 "xyz"] [-14] 0 [-10 3] -98 [-8 0 "" 'blank]]
printF/underlined ["too big float" [20] 98765444444.7321 [-14 2 "$ " 'blank] 1.87654 [-10 3] 54321 [-8 'blank] none [-12]] #"-"

str: printF/asString/underlined ["more underlined" [20] 345.2345 [-14 2 "$ " 'blank] 123.4567 [-10 3] 12345678 [-8 'blank] now/date [-12]] #"="
print [str]
```

produces this report:

```
Some examples                  This       That   A Rest         When 
____________________________________________________________________
none shown                 $ 345.23    123.456            1-Jan-2000 
various 'blank           $ 98765.73     -1.876            6-Mar-2019 
blank / not blank                        0.000      -98 
a block shown             [0 "xyz"]      0.000      -98 
too big float        $ 98765444444.73      1.876    54321              
--------------------------------------------------------------------
more underlined            $ 345.23    123.456 12345678  20-Feb-2020 
====================================================================
```

\[Code for inspection:](https://github.com/ralfwenske/printF)

rebolek

[08:21](#msg5e4e419b0c4514126679ac01)That's nice!

greggirwin

[18:06](#msg5e4eca91a0aa6629f5df77b5)Nice work @ralfwenske. Thanks for posting.

## Friday 21st February, 2020

ralfwenske

[04:42](#msg5e4f5fd2dafa3029f6434ca6)Thanks for encouragement @rebolek @greggirwin . I have made a refinement by replacing the refinement /underline:  
!\[alt](https://github.com/ralfwenske/printF/blob/master/printF-test.jpg?raw=true)  
There are two odd things though (on Mac)  
\- still strange behaviour when resizing window (already reported)  
\- In the demo1-area some linefeeds are missing from `mould :demo1`  
as I have verified this with probe also this seems OS independant. Is this a bug?

greggirwin

[16:46](#msg5e5009523ca8a67fb80d0534)Is it this? https://github.com/red/red/issues/3964

If not, can you post a small reproducible case?

ralfwenske

[21:06](#msg5e50466a4609ce3a8819e0ad)Yes, that's it @greggirwin . Can someone confirm the lost linefeeds related to mold? Can be produced when running 'printf-test.red'.

## Monday 24th February, 2020

GaryMiller

[11:08](#msg5e53aec1ed27b13c42f81f06)I noticed in the large numbers such as 98765.73 that there were no comma separators such as 98,765.73

I wasn't sure if that was because it was just an American standard formatting feature or because of the comma being more complicated to include in a number due to a RED dual meaning.

rebolek

[12:14](#msg5e53be185cd3836098c65f46)@GaryMiller Yes, because the comma is used as decimal separator in other languages, it can't be used as thousands separator.:

```
>> 123.45
== 123.45
>> 123,45
== 123.45
```

However, you can use an apostrophe as a thousands separator:

```
>> 12'345.67
== 12345.67
>> 12'345,67
== 12345.67
```

## Thursday 27th August, 2020

theSherwood

[05:17](#msg5f4741ee89cf2d584b7b71aa)Are there any implementations of iterators or generators floating around in the community?

dander

[05:23](#msg5f47433c4823780937468344)@theSherwood I did some experimentation on that - https://gist.github.com/dander/66ad65555b30286115cee675b16bf1d7  
It's a little messy, but once you get past the different partial implementations, I think the sample generator functions down below should make sense. I've been meaning to get back to it to clean it up. I've learned a lot since then too, but life is crazy right now

theSherwood

[05:24](#msg5f4743999566774dfe3608e1)@dander Great! Thanks!

dander

[05:26](#msg5f47441e9bad075eacdcdb8b)Sure thing! I'd be interested to hear any thoughts you have about it. I think it would also be interesting to also add some sort of yield method

theSherwood

[05:28](#msg5f47446eddc2d041c0cd289e)Yeah. I'm trying to conceive of a way to yield without a bunch of slow parsing. But I haven't thought of a good approach yet.

dander

[06:07](#msg5f474da05580fa092b27b3a0)I was thinking maybe something with `do/next` saving the current position in the block

toomasv

[07:36](#msg5f47626a36e6f709fd0614f9)I was recently \[playing with a special syntax](https://gist.github.com/toomasv/097b92820f3e7a9d2bbf97dbd2cb304a) for these.

theSherwood

[07:41](#msg5f4763a79566774dfe3666a0)@toomasv I remember seeing that. Really cool stuff

toomasv

[07:43](#msg5f47642dddc2d041c0cd7e2c):smile: Thanks! If you will play with it, any remarks/ideas are welcome.

theSherwood

[07:50](#msg5f4765bddfaaed4ef511937e)The examples you show demonstrate just how flexible those functions are! I think the lazy sequence function you have there might be the one I focus in on.

rcqls

[08:09](#msg5f476a4a482378093746e41a) Really cool stuff @toomasv. I love the syntax when range (and I guess sequence) is followed by block as function body.

toomasv

[08:47](#msg5f4773239566774dfe36918f)@rcqls I didn't remember if it worked for sequences too, but seems so. E.g. this generates endless Fibonacci sequence:

```
>> fib: ...| [seed: [0 1] also seed/1 seed/2: sum reverse seed] ()
>> loop 10 [prin [fib ""]]
0 1 1 2 3 5 8 13 21 34
```

pekr

[09:20](#msg5f477af25580fa092b282b7b)Eeeh, you took a pipe char, which I dreamed of as an expression separator when writing one liners 😀

toomasv

[09:27](#msg5f477c7f4823780937471282)No problem, pipe char in this syntax is special after `...` and `..` only.

[18:31](#msg5f47fc0849148b41c97805de)Hmm, looking at it... this does too:

```
fib: does [seed: [0 1] also seed/1 seed/2: sum reverse seed]
```

No need for fancy syntax here :flushed:

9214

[18:37](#msg5f47fd6e5580fa092b298948) Reminded me of \[streams](https://gist.github.com/9214/e0410184b76d9e6e339bd5d8e0000218) implementation.

toomasv

[18:57](#msg5f48022cc3aa024ef9a53602)Quite an inception. Finally wrapped my head around it.

theSherwood

[19:30](#msg5f4809be482378093748a33f)@9214 I've been `probe`ing that thing for a little while. I still can't figure out how/where the growth function is being called in `thaw`. What am I missing?

[19:30](#msg5f4809e2482378093748a384)OOOOOh. nevermind. It just clicked.

9214

[19:30](#msg5f4809e7482378093748a38c)`stream/-1 stream`.

theSherwood

[19:31](#msg5f4809f8ddc2d041c0cf3e9c)Gotcha.

[19:31](#msg5f480a0ba5788a3c29b8191d)That thing is some dark magic.

[19:32](#msg5f480a50482378093748a410)Very cool stuff.

9214

[19:33](#msg5f480a919566774dfe383ed9)Here's the kicker.

```
Red [
    Title:  "Bubble sort"
    Date:   17-Apr-2018
    Author: 9214
]

bubble: func [list [series!]][
    also list until [
        tail? next list: skip list do reduce [
            pick [do last] list/1 > list/2
            [swap list next list negate 1]
        ]
    ]
]
```

toomasv

[20:30](#msg5f4817d49566774dfe386338)It is nice demonstration of dynamic construction, but consumes lot of memory due to reducing. Following stripped down version takes ~300 times less memory:

```
bubble2: func [list [series!]][
    until [
        tail? next list: skip list either list/1 > list/2 [
            swap list next list -1
        ][1]
    ] head list
]
```

theSherwood

[20:31](#msg5f48180f36e6f709fd0819a0)Interesting. @toomasv how do you do the memory profiling?

9214

[20:35](#msg5f4818fd9bad075eacdf3ad2)

```
text
>> recycle x: stats bubble [3 7 9 9 5 0 2] stats - x
== 3844
>> recycle x: stats bubble2 [3 7 9 9 5 0 2] stats - x
== 156
```

GiuseppeChillemi

[20:37](#msg5f4819925580fa092b29dba2)I didn't know about this group. What is it for?

9214

[20:38](#msg5f4819d99566774dfe38698c)Have you read this room's description?

theSherwood

[20:41](#msg5f481a6f59ac794e02ce16c5)@9214 Thanks!

[20:44](#msg5f481b3189cf2d584b7dd5cc)Follow up: why does reducing result in a lot of memory consumption?

9214

[20:48](#msg5f481c1addc2d041c0cf722b)Because it allocates a new block. `reduce/into` avoids that and reuses the one that you give it.

theSherwood

[20:52](#msg5f481cf9765d633c54b8f6d7)Good to know. Thanks

GiuseppeChillemi

[21:06](#msg5f48204e89cf2d584b7de417)Vladimir, I am on mobile, there is no description other than the name. The android client lacks of many things like this. I see just red/red/code 😔.

## Friday 28th August, 2020

toomasv

[03:30](#msg5f487a589bad075eace0189a)Ah, yes, of course, memory consumption grows with growing length of sorted series:

```
>> recycle/off
>> string: "sdlkjflkjlsdmcvLKJFawjrfaoiajfliuh.ghlskls" ()
>> profile/show [[bubble copy string][bubble2 copy string]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.001  | 0:00:00.001  |         360 | [bubble2 copy string]
0:00:00.002  | 0:00:00.002  |      104428 | [bubble copy string]
>> 104428 / 360
== 290.0777777777778
```

@theSherwood I used the \[profile](https://gist.github.com/greggirwin/908d44dc069ed84cf69f053e1308390d) func by @greggirwin.

[03:49](#msg5f487ebad4f0f55ebbe64c1b)With `reduce/into` it is almost as good as stripped down version:

```
bubble: func [list [series!] /local code][
    code: clear []
    also list until [
        reduce/into [
            pick [do last] list/1 > list/2
            [swap list next list negate 1]
        ] clear code
        tail? next list: skip list do code
    ]
]
```

[03:53](#msg5f487fd4482378093749ba04)

```
>> profile/show [[bubble copy string][bubble2 copy string]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.001  | 0:00:00.001  |         360 | [bubble2 copy string]
0:00:00.003  | 0:00:00.003  |         516 | [bubble copy string]
```

theSherwood

[04:32](#msg5f4888ee9566774dfe396ab1)@toomasv Thanks! I'll check out the profile func

toomasv

[04:35](#msg5f4889ae59ac794e02cf19d5)@theSherwood You are welcome!
