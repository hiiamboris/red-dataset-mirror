# Archived messages from: [gitter.im/red/parse](/gitter.im/red/parse/) from year: 2022

## Thursday 13th January, 2022

cloutiy

[20:04](#msg61e085ca82a4667b2574b59b)Is it possible to see how `parse` is implemented? Where can one see the implementation on github?

greggirwin

[20:57](#msg61e0924ad143b14f8316ab9e)https://github.com/red/red/blob/master/runtime/parse.reds

GiuseppeChillemi

[20:59](#msg61e092abd41a5853f94c0a8c)You can also Read This: http://www.codeconscious.com/rebol/parse-tutorial.html#Introduction

cloutiy

[22:28](#msg61e0a798742c3d4b21975563)@greggirwin thanks for the link gregg this is what i was looking for...

## Tuesday 18th January, 2022

bubnenkoff

[07:34](#msg61e66d7846529077f58e78a4)Hi! I need a way to remove quotermark from string only if it's exists at start and it's end.  
I decided that parse is best for it.  
For example:

```
{"Hello World"}
```

Should become:

```
{Hello World}
```

But:

```
{Company name "Hello World"}
```

Should stay:

```
{Company name: "Hello World"}
```

I tried to write next code:

```
str: {"Hello World"}

parse str [remove {"} to end  ]

probe str
```

But how to deal with last quote mark?

GalenIvanov

[07:52](#msg61e671cbe1a1264f0a60c0ad)@bubnenkoff Something like that?

[07:52](#msg61e671d05ee4df335aee3bee)

```
remove-quotes: function [str][
    parse dst: copy str [
		p-st: opt dbl-quote
		some [not dbl-quote skip]
		p-end: dbl-quote end
		(if p-st/1 = dbl-quote [remove p-end remove p-st])
	]
	dst
]
```

[07:54](#msg61e67225742c3d4b21a2845f)

```
>> remove-quotes {"Hello World"}
== "Hello World"
>> remove-quotes {Company name "Hello World"}
== {Company name "Hello World"}
>> remove-quotes {"Hello World" Company name}
== {"Hello World" Company name}
```

bubnenkoff

[08:27](#msg61e679e69a335454062b27dc)yeah! Big thanks!

Oldes

[08:38](#msg61e67c80d143b14f832233f1)

```
>> parse str: {"aa"bb"} [any [to #"^"" remove some #"^""]] str
== "aabb"
```

[08:39](#msg61e67cdf5ee4df335aee5918)Ah... sorry... it's not what you want... I should first read it:)

toomasv

[08:42](#msg61e67d5dd143b14f83223567)`parse` really not needed there:

```
rem: function [str][if all [#"^"" = first str   (index? find next str {"}) = length? str][replace/all str {"} ""] str]
rem {"Hello World"}
;== "Hello World"
rem {"Hello World" company}
;== {"Hello World" company}
rem {Company name "Hello World"}
;== {Company name "Hello World"}
```

Oldes

[08:42](#msg61e67d8d6d9ba23328c98af3)

```
>> str: {"hello"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== "hello"
```

toomasv

[08:44](#msg61e67e045ee4df335aee5c95)

```
str: {"hello" wrong "world"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== {hello" wrong "world}
```

Oldes

[08:45](#msg61e67e1e742c3d4b21a2a07b)hm:)

toomasv

[08:46](#msg61e67e6a2a210c38c1d44cfa)But `[remove back tail remove str]` is better, yes.

GalenIvanov

[08:55](#msg61e680756d9ba23328c99360)Yes, `parse` is not needed here :)

bubnenkoff

[11:16](#msg61e6a17b6d9ba23328c9e144)Thanks!

hiiamboris

[11:39](#msg61e6a6fcd41a5853f957f844)

```
>> parse s: {"hello" wrong "world"} [remove {"} to [{"} end] remove {"}] s
== {hello" wrong "world}
>> parse s: {"hello" wrong "world"} [remove {"} to [remove [{"} end]]] s
== {hello" wrong "world}
```

but parse will be much slower

toomasv

[15:55](#msg61e6e2f3526fb77b3186a91d)Huh?

hiiamboris

[16:05](#msg61e6e53b5ee4df335aef5784)much slower than `remove` :)

gltewalt

[18:13](#msg61e703595ee4df335aefa073)How can I account for parens with this?

```
Red ["24 Game"]

numbers: copy []
collect/into [loop 4 [keep random 9]] numbers
op: charset "*/+-"
valid-number: charset form numbers
valid-expression: [valid-number op valid-number op valid-number op valid-number]

explode: func [val /local c][
    c: copy []
    forall val [collect/into [keep val/1] c]
]

; allow spaces or no spaces in the expression with trim/all,
; but since Red throws invalid integer error without spaces, break the string
; back apart with explode, and then form it into a string with spaces.
; load that and feed it to math.
check-expression: does [
    either parse trim/all e: ask "Enter expression: " valid-expression [
        either 24 = math load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]

print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```

toomasv

[18:30](#msg61e70730526fb77b31870242)Hmm...

```
Using the following numbers, enter an expression that equals 24: 7 2 7 2
Enter expression: 7-2+7*2
== "Not quite correct"
```

Hey!

```
>> 7 - 2 + 7 * 2
== 24
```

hiiamboris

[18:49](#msg61e70bd6bfe2f54b2e2535e4)why are you using collect/into?

gltewalt

[18:51](#msg61e70c347842bd3ca951e908)It's using `math` so follow order of operaations toomas

[18:52](#msg61e70c6246529077f58ff0ec)Why not collect/into? `append [] ...` better?

hiiamboris

[18:52](#msg61e70c712a210c38c1d5acb5)why not just `collect`? it does the copy for you

[18:52](#msg61e70c84742c3d4b21a3f7ad)and you like no I don't need your copy I'll do that myself :)

[18:53](#msg61e70c93e1a1264f0a623d50)also

```
>> extract/into "1+2/3" 1 []
== [#"1" #"+" #"2" #"/" #"3"]
```

gltewalt

[18:53](#msg61e70cb5d143b14f83238e7e)Are you sure? I swear I did normal collect and it grew

[19:04](#msg61e70f23e1a1264f0a624346)Oh, no, this is why I went to `/into`

[19:04](#msg61e70f2ce1a1264f0a62434e)

```
>> x: "2*3/9-3"
== "2*3/9-3"
>> forall x [collect [keep x/1]]
== [#"3"]
```

[19:04](#msg61e70f4bd143b14f83239492)Because I iz smort

[19:08](#msg61e710146d9ba23328caedbf)There

```
op: charset "*/+-"
valid-expression: [valid-number op valid-number op valid-number op valid-number]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    valid-number: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24:" numbers]
    check-expression
]

forever [main]
```

[19:12](#msg61e7110e526fb77b3187189e)Now for the parens, which I assume `math` obeys

toomasv

[19:21](#msg61e71334526fb77b31871cd5)OK, this follows Red order, but parens can be added:

```
numbers: collect [loop 4 [keep random 9]]
op: charset "*/+-"
n: charset form numbers
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]
explode: func [val][collect [forall val [keep val/1]]]
check-expression: does [
    either attempt [(sort numbers) = (sort load form parse trim/all e: ask "Enter expression: " formula)] [
        either 24 = do load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]
print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```

```
Using the following numbers, enter an expression that equals 24: 8 7 4 6
>> check-expression
Enter expression: 8-7*4*6
== "You got it!"
>> check-expression
Enter expression: (8-7)*4*6
== "You got it!"
>> check-expression
Enter expression: 4*6
== "Invalid expression"
>> check-expression
Enter expression: 2*2*2*3
== "Invalid expression"
```

gltewalt

[19:55](#msg61e71b42742c3d4b21a41a4e)@toomasv "enter an arithmetic expression using just those, and all of those four digits, used exactly once each"

[20:13](#msg61e71f645ee4df335aefe13c)Yeah, I guess that's it.

```
op: charset "*/+-"
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e formula [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    n: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24 (pdmas):" numbers]
    check-expression
]

forever [main]
```

[20:15](#msg61e71fe8e1a1264f0a626991)Contrast with an entry that is already on rosetta.  
https://rosettacode.org/wiki/24\_game#Red

[20:17](#msg61e720752a210c38c1d5db05)Is there an "Easier to read to the non Red user" grammar for handling parens?

[20:22](#msg61e72168742c3d4b21a42c42)Example without parens: \[num op num op num op num] should be understandable to anybody

## Wednesday 19th January, 2022

gltewalt

[01:37](#msg61e76b7382a4667b25828390)@toomasv If collect is used, then an entry like "goodbye" will error. parse returns empty block if collect fails, instead of false

[03:00](#msg61e77ee7526fb77b3187facf)Can I just ignore any "()"?

toomasv

[06:01](#msg61e7a921d143b14f8324c6be)@gltewalt That's why I used `attempt`; and comparison - to ensure each number is used and only those numbers are used.

[15:30](#msg61e82e985ee4df335af1f2d7)Hmm.. actually to guarantee this `n` should be `charset "123456789"`.

gltewalt

[19:10](#msg61e8622f742c3d4b21a6ad5e)To be bone-headedly declarative, this works.

```
numbers: collect [loop 4 [keep random 9]]
num: charset form numbers
op: charset "*/+-"
expr: [num some [op num] | num]
term: ["(" expr ")" | num]
p1: [term op term op term op term]  ; (7)*3+1-2
p2: [term op term op term]          ; (7*3)+1-2
p3: [term op term]                  ; 7*(3+1-2)
p4: [term]                          ; (7*3+1-2)

valid-expression: [p1 | p2 | p3 | p4]
```

[19:11](#msg61e86265d41a5853f95ba40a)or could call it `level1`, `level2`, etc

[19:11](#msg61e862736d9ba23328cda07c)Not sure on the naming

[19:12](#msg61e8628c9a335454062f2eef)

```
>> numbers
== [7 2 7 2]

>> parse "7272" valid-expression
== false
>> parse "7+2+7+2" valid-expression
== true
>> parse "(7*2)+7+2" valid-expression
== true
>> parse "7*(2)+7+2" valid-expression
== true
>> parse "7*(2+7)+2" valid-expression
== true
>> parse "7*(2+7/2)" valid-expression
== true
>> parse "hello" valid-expression
== false
```

toomasv

[19:31](#msg61e867026d9ba23328cdaa2a)

```
>> parse "7+2+7+2" valid-expression
== true
>> parse "7+7+7+2" valid-expression
== true
>> parse "2+2+2+2" valid-expression
== true
>> parse "2+2" valid-expression
== true
>> parse "2" valid-expression
== true
>> parse "7" valid-expression
== true
>> parse "(7)" valid-expression
== true
```

greggirwin

[19:45](#msg61e86a5c9b470f3897758a78)Bone-headedly declarative sounds like just my style. :^)

gltewalt

[20:10](#msg61e870489a335454062f4d50)Curses

[20:14](#msg61e8711ad41a5853f95bc281)Wait.. no, it works when you generate the numbers. With my script:

```
Red [
    Title: "24 Game"
    Note: "Math precedence rules, PMDAS"
]

op: charset "*/+-"
expr: [num some [op num] | num]
term: ["(" expr ")" | num]

; naming? or recursive way?
p1: [term op term op term op term]  ; (7)*3+1-2
p2: [term op term op term]          ; (7*3)+1-2
p3: [term op term]                  ; 7*(3+1-2)
p4: [term]                          ; (7*3+1-2)
valid-expression: [p1 | p2 | p3 | p4]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    check-expression
]

forever [main]
```

[20:18](#msg61e872205ee4df335af28587)The `; (7)*3+1-2` comments are just examples if the numbers generated were 7 3 1 2

[20:54](#msg61e87a9a526fb77b318a0032)I swear "works on my machine!"

## Thursday 20th January, 2022

gltewalt

[04:10](#msg61e8e0a646529077f5938ec9)Ok. This, as near as I can tell.

[04:10](#msg61e8e0b16d9ba23328ce99f4)

```
op: charset "*/+-"
expr: [num some [op num] | num]
term: [num | "(" expr ")"]

p1: [term op term op term op term]  
p2: [term op term op term]          
p3: [term op term]                 
valid-expression: [p1 | p2 | p3]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = m: math to-block form explode e [
            print ["You got it!" m]
        ][
            print ["Not quite correct. That's" m]]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    check-expression
]

forever [main]
```

[04:11](#msg61e8e0f1e1a1264f0a65e757)Bug with `math` and `load form explode`, so switched to `to-block`

[04:13](#msg61e8e170f5a3947800142a5e)My flaw /bug.

toomasv

[06:17](#msg61e8fe78d143b14f83276c61)But it accepts formulas with 2 and 3 numbers too:

```
Using the following numbers, enter an expression that equals 24: (pmdas) 8 7 4 6
Enter expression: 4*6
You got it! 24
```

gltewalt

[07:07](#msg61e90a2246529077f593db73)Yep

[07:14](#msg61e90bd22a210c38c1d9a207)What I really want is:  
`[num op num op num op num]`, and "ignore any balanced paren along the way".  
`math` will take care of obeying the parens.

toomasv

[09:00](#msg61e9249e526fb77b318b42bd)Then probably the easiest you can do is, well, to ignore the parens in formula, e.g.:

```
term: [opt "(" num opt ")"]
valid-expression: [term op term op term op term]
```

Oldes

[10:12](#msg61e935955dc6213cd4ef6d85)But it will allow unbalanced parens.

toomasv

[10:29](#msg61e93982e1a1264f0a669817)Yes, and unbalanced parens will generate error. (Personally I would prefer to collect numbers from balaced expressions as shown above)

gltewalt

[18:37](#msg61e9abd45dc6213cd4f06c0f)I dontt want to. And im a stubborn jerk

## Friday 21st January, 2022

gltewalt

[18:40](#msg61eafe15d41a5853f960f29e)Error on unbalanced paren can be handled when calling `check-expression`

[18:40](#msg61eafe2ae1a1264f0a6a461b)

```
main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    if none? attempt [check-expression][print "Invalid expression"]
]
```

## Tuesday 8th February, 2022

mikeyaunish

[22:38](#msg6202f0edb8b082448224ce8a)  
in the middle of the parse. The result I am looking  
for is:

```
[btn: button]
```

which the parse gives  
correctly. Just don't like leaving the parens as a loose  
end.

```
res: parse [style btn: button "hello" 120x24] [
    collect any [
        'style 
            some [
                some [ ahead () keep set-word! ] | ;-- needs () to work??
                some [ ahead keep word! ]
            ]
        | skip 
    ]
]
? res
RES is a block! value.  length: 2  [btn: button]
```

&gt;

greggirwin

[22:42](#msg6202f1dc03f2704782262124)Will this work for you @mikeyaunish?

```
res: parse [style btn: button "hello" 120x24] [
	collect any [
		'style 
;		some [
		keep some set-word! 
		| keep some word!
;		]
		| skip 
	]
]
? res
```

[22:44](#msg6202f2504164105ab08a1fea)Bah, gitter formatting. :^\\

hiiamboris

[22:45](#msg6202f26c3e52f56a26f4e395)I don't see any difference with or without `ahead ()`

greggirwin

[22:46](#msg6202f2ae51bd8b580c93bdc5)Nor I.

mikeyaunish

[23:02](#msg6202f67341e3293d65e2155b)@greggirwin Thanks - can't seem to get the 'some idea clear in my head.

## Wednesday 9th February, 2022

gltewalt

[04:11](#msg62033ed40779373db8d62190)?

```
blk: [style b1: button "hello" 120x24 b2: button]
res: parse blk [collect [some [to set-word! keep thru word!]]]
```

toomasv

[07:33](#msg62036e433349fe1c710159a0)Rather:

```
res: parse blk [collect [any ['style keep set-word! keep word! | skip]]]
```

mikeyaunish

[15:40](#msg6203e05dd4102444805385d4)@toomasv Yes - that is what I was looking for. I like it. Much simpler. Thanks

toomasv

[15:56](#msg6203e43a1fe6ba5a971891fa)@mikeyaunish You are welcome!

greggirwin

[20:14](#msg620420bedc191b3d69a2c56c)That's where I didn't know if you wanted to collect multiple, potential set-words and words, so I erred on the side of closest to your original @mikeyaunish.

Thanks @toomasv. Sometimes showing the simplest thing is best.

toomasv

[20:19](#msg620421ba0779373db8d80475):)

gltewalt

[21:38](#msg6204344a03f270478228c2cb)Yeah, that will only grab one `btn: button` if that's what you wanted.

[21:38](#msg62043460a41d896a2089cd6f)Is `skip` needed when `any` or `some` is used?

[21:40](#msg620434b641e3293d65e4afd8)And if there is always going to be a `sw: button`, then should it be `some`?

## Thursday 10th February, 2022

toomasv

[05:42](#msg6204a5cc4164105ab08d8ce0)Intention seems to be to collect all new style words together with original styles.

Yes, `skip` is needed, otherwise it may never reach `style` (in general case), or reach next `style` somewhere later.

Not much difference between `any` and `some` in this case.

## Saturday 12nd February, 2022

GiuseppeChillemi

[23:44](#msg6208466651bd8b580c9eb9e0)I definitively need `SET-IN obj 'word` in parse to write values in objects... this would save me lot of code in parens and also using temporary words.

## Sunday 13th February, 2022

hiiamboris

[08:41](#msg6208c43b03f270478231fac6)Write your parse preprocessor macro. Turn set-paths into parens.

GiuseppeChillemi

[10:29](#msg6208dd9ea41d896a2093278f)Good but I think it should be included in the language as `SET-IN`, it is an important feature when you work initializing objects with parse.

hiiamboris

[10:44](#msg6208e10b51bd8b580c9fd574)Make a REP.

[12:13](#msg6208f5ebdc191b3d69ac8dcb)You reduce your chances IMO by opening it in the wrong place

GiuseppeChillemi

[14:08](#msg620910ee0779373db8e1e5e9)Where is the right place?

hiiamboris

[14:33](#msg620916cd03f2704782329994)https://github.com/red/REP/issues

GiuseppeChillemi

[14:52](#msg62091b450779373db8e1fa49)Thank you, I always forget about this

## Thursday 17th March, 2022

GiuseppeChillemi

[23:05](#msg6233beaf3ae95a1ec1a3f870)Hi, I have a binary file and I need to parse it in search of multiple `0x01` + `KEYWORD` sequences ending with `0x17`. In the middle there is a string I want to change.

Here is an example:

```
BINARY-DATA
0X01 "NAME:" "<PRODUCT-NAME>" 0x17
0X01 "BATCH:" "<BATCH STRING NUMBER>" 0x17
0X01 "EXPIRE:" "<EXPIRE STRING DATE >" 0x17
BINARY-DATA
```

In the first string, the word "NAME:" should be deleted and only "&lt;PRODUCT-NAME&gt;" will remain and be changed with the target string.

How could I parse this binary file and write it back?

## Friday 18th March, 2022

cloutiy

[01:52](#msg6233e5d0f43b6d783f0830ca)Are the words BINARY-DATA part of the text to parse, or you simply included to specify what follows is binary data?

GiuseppeChillemi

[10:50](#msg623463f309092523182e05bd)I have included them to specify that what is before and what is after text is binary data

[10:52](#msg623464819a09ab24f3ad7e13)I have also separated strings but they are joined

hiiamboris

[22:11](#msg623503ac6b912423203e487f)parse works on binary!, so what's stopping you exactly?

GiuseppeChillemi

[23:35](#msg6235174b6b912423203e706f)@hiiamboris How could I match a string like "Hello" on binary?

## Saturday 19th March, 2022

toomasv

[04:20](#msg623559f3d1b64840db72e2ff)@GiuseppeChillemi

```
>> binary: to-binary "Hello Giuseppe!" 
== #{48656C6C6F20476975736570706521}
>> parse binary reduce [to-binary "Hello" space quote s:] to-string s
== "Giuseppe!"
```

[04:38](#msg62355e539a09ab24f3af6438)But also:

```
>> parse binary ["Hello" space s:] to-string s
== "Giuseppe!"
```

GiuseppeChillemi

[14:05](#msg6235e3379a09ab24f3b04ef6)Thank you, so parsing a binary searching for a string, you have implicit conversion of the string to binary.

## Thursday 24th March, 2022

GiuseppeChillemi

[06:36](#msg623c1175ddcba117a23854d3)How could I match one or some datatype words? I mean: how could I match `string!` or `string!` and `block!`

[07:15](#msg623c1aa3c4350025000750da)Another question: why this fails?  
`parse [integer! string!] [some datatype! end]`

rebolek

[07:21](#msg623c1bdc9a09ab24f3bc3cd2)because they are words

[07:21](#msg623c1c10c43500250007536a)`parse reduce [integer! string!] [some datatype! end]`

hiiamboris

[10:59](#msg623c4f069a09ab24f3bca323)if you want datatype words, you should `get` them and check for datatype or typeset value

## Monday 18th April, 2022

bubnenkoff

[16:36](#msg625d939fe9cb3c52ae6ebba7)How to measure speed of parsing file of follow code:

```
parse file-content [ 
   some [ 
         tag (save-parent tag-name) | ahead chars copy tag-value to "<" ( do-operation-on-tags-tree-with-value tag-value ) | to  "<" 
      ] 
   ]
]
```

It's seems that code slow down on big file

hiiamboris

[16:52](#msg625d97518db2b95f0ac0f78c)Don't use `to`, use `skip`

[16:55](#msg625d97f9257a35782584269a)If you want to profile it, you will have to do it manually. E.g. measure time of each `some` iteration and see if there's something suspicious.

bubnenkoff

[16:57](#msg625d9874f43b6d783f577c0f)&gt; Don't use `to`, use `skip`

Why? Because I can jump in wrong place?

hiiamboris

[16:58](#msg625d98a4ddcba117a277de66)`to` backtracks if it fails, which in worst case leads to time complexity ~ file-size^2

[16:58](#msg625d98bfc43500250046c8c0)I'm not sure if this is what happens as I don't see your rules, but it's something to be careful with.

bubnenkoff

[16:58](#msg625d98c9ddcba117a277de95)&gt; If you want to profile it, you will have to do it manually. E.g. measure time of each `some` iteration and see if there's something suspicious.

How to do it? I remember about `time-it`, but how to wrap `some` with it?

hiiamboris

[16:59](#msg625d990499d94f5f0ca65f27)You can't wrap a parse rule. Just use `now/precise` when you enter `some` to get the time and subtract the previous result from it.

[17:01](#msg625d99706b912423208b9906)If you suspect it's not the parse but your functions that are slow, I have a handy profiler here: https://codeberg.org/hiiamboris/red-common/src/branch/master/profiling.red

Picture \[here](https://user-content.gitter-static.net/0160e0439d234733f5fd1e9100ccc49d1642bd5e/68747470733a2f2f692e6779617a6f2e636f6d2f37303630356564393636616234663564646237323031396235623830633066372e676966)

bubnenkoff

[17:02](#msg625d99ab99d94f5f0ca660a2)I looked at this chat but did not found examples of time subtraction

[17:03](#msg625d99d8d1b64840dbbf8a01)

```
>> t1: now/precise
== 18-Apr-2022/20:02:50.7804+03:00
>> 
>> 
>> t2: now/precise
== 18-Apr-2022/20:02:54.1006+03:00
>> 
>> t1 - t2 
== 0
>> 
>> t2 - t1
== 0
```

hiiamboris

[17:03](#msg625d99fc0466b352a472a450)

```
>> s: now/precise/utc
== 18-Apr-2022/17:05:34.037
>> e: now/precise/utc
== 18-Apr-2022/17:05:35.7549
>> difference e s
== 0:00:01.71785
```

bubnenkoff

[17:04](#msg625d9a0b99d94f5f0ca664c2)oh! thanks!

hiiamboris

[17:04](#msg625d9a2c0466b352a472a496)`-` just returns number of days, which is handy for calendar stuff only

[17:04](#msg625d9a3a3ae95a1ec1f34818)even that is buggy

bubnenkoff

[17:20](#msg625d9ddee9cb3c52ae6ed4d2)Is it correct measuring?

```
some [ (s: now/precise) <my parsing rules>   (e: now/precise)]
```

I am asking because I am measured all other functions with `time-it`, and they works fast, but result file is parsing slowly

hiiamboris

[17:28](#msg625d9fbf8db2b95f0ac10f58)it should be correct if you wrap in a block

## Friday 10th June, 2022

bubnenkoff

[10:03](#msg62a316d74e38f759e2b25e93)I need to remove namespaces from tag. I wrote rule, but it's stuck on last tag that have `:` inside attribute:

```
list: [ 
	{<ns1:foo bar="123" baz="2002-02-26" region="En">} 
	{<ns1:foo bar="123" baz="2002-02-26" region="En"/>} 
	{<foo bar="123" baz="2002-02-26" region="En"/>} 
	{<ns1:foo>} 
	{<foo x=1>} 
	{<foo x=2/>} 
	{<ns1:foo/>} 
	{<ns1:foo bar="123" baz="2002-02-26" region="En" baz="66:77">} 
	{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">} 

]

foreach tag-name list [
	only-tag-name: rejoin parse tag-name [ collect [ keep "<"  opt [thru ":"] keep to end ]  ]
	probe only-tag-name
]
```

toomasv

[14:30](#msg62a35569da83520ac374036d)Is that good enough?:

```
foreach tag-name list [
    	starting?: yes
        only-tag-name: rejoin parse tag-name [ collect [keep "<" s: any [sp (starting?: no) :s keep to end | if (starting?) ":" keep to end | skip]]]
        probe only-tag-name
]
{<foo bar="123" baz="2002-02-26" region="En">}
{<foo bar="123" baz="2002-02-26" region="En"/>}
{<foo bar="123" baz="2002-02-26" region="En"/>}
"<foo>"
"<foo x=1>"
"<foo x=2/>"
"<foo/>"
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
```

bubnenkoff

[15:12](#msg62a35f6cdeea5616bbeef106)Yes! Thanks! Perfect!

toomasv

[16:48](#msg62a375eddeea5616bbef1fc9):+1:

## Thursday 23th June, 2022

Oldes

[21:45](#msg62b4df0276cd751a2f543f53)Is there any reason, why not to allow `parse "a" [any [| #"a"]]` return `true` as it does for `parse "a" [any [#"a"]]`?

[21:46](#msg62b4df3c9f73251a2c6c8c21)My request is simply from esthetical reasons to be able have code like:

```
parse "a" [
	any [
	| #"a"
	| #"b"
	]
]
```

[21:46](#msg62b4df53568c2c30d3e211f9)Now I must have:

```
parse "a" [
	any [
	  #"a"
	| #"b"
	]
]
```

[21:51](#msg62b4e05a9f29d42bed923898)Possible reason is, that there would have to be another condition in the code, so it would slow down evaluation :/

hiiamboris

[21:59](#msg62b4e23bab6b634f735c7191)Alan wants this too

greggirwin

[23:14](#msg62b4f3bf76cd751a2f54d8ac)I've certainly had plenty of OCD formatting moments with rules through the years, especially with Red favoring tabs for indentation. But if you look at your first, single-line example: `parse "a" [any [| #"a"]]` to me that looks like something is missing. I think the other chat might be in red/bugs, but my thought in this moment is that it will lead to rules that are harder to reason about.

Oldes

[23:19](#msg62b4f4ffb408e830dc285377)Yes.. I think it is better how it is now.

## Friday 24th June, 2022

GiuseppeChillemi

[00:03](#msg62b4ff3bab6b634f735d4cc4)Yes, I see something missing too.

## Tuesday 28th June, 2022

henrikmk

[16:24](#msg62bb2b3bfe909e3ec7136124)I have always done this:

```
parse "a" [
    any [
      #"a"
      | #"b"
    ]
]
```

## Thursday 21st July, 2022

Oldes

[14:34](#msg62d96409d3c8894f71a3770e)I'm really not sure, if I like this:

```
>> parse [1] [collect any [keep some integer! | skip]]
== [1]
>> parse [1 1] [collect any [keep any integer! | skip]]
== [[1 1]] ;=== why not just [1 1]?
```

[14:36](#msg62d9647c0a52264798657936)And just use `collect collect` to have `[[1 1]]`?

[14:40](#msg62d9654cfe909e3ec7e9d477)Hm.. ok... it must be block... to support:

```
>> parse [1 "a" 2 2 "b" 3] [collect any [keep some integer! | skip]]
== [1 [2 2] 3]
```

toomasv

[14:46](#msg62d966ce8fe56a38b5b45e13)@Oldes

```
>> parse [1 1] [collect any [keep pick any integer! | skip]]
== [1 1]
```

[14:48](#msg62d967289f29d42bed97cdfb)

```
>> parse [1 "a" 2 2 "b" 3] [collect any [keep pick some integer! | skip]]
== [1 2 2 3]
```

Oldes

[15:05](#msg62d96b1e568c2c30d3e72515)Ah... good. I was not aware about `pick`. Is it supposed to work only with `keep`? If so, should not be this an error:

```
>> parse [1 1] [any [pick | skip]]
== true
```

toomasv

[15:14](#msg62d96d4cab6b634f73606a76)It probably should, yes. `pick` is mentioned in \[docs](https://github.com/red/docs/blob/master/en/parse.adoc#393-collect).

Oldes

[16:30](#msg62d97f0a76cd751a2f595a43)But this is strange:

```
>> parse [1 2 3][collect keep integer! collect keep integer! collect keep integer!]
== [1 [2] [3]] ;<-- it would be more logical to have it [[1] [2] [3]]
```

hiiamboris

[16:35](#msg62d98049fe909e3ec7ea9bb5)you're missing the outer `collect`

Oldes

[16:36](#msg62d98086d3c8894f71a456c0)I know, but should not it be handled by error, or silently by adding the outer block, instead of using the first collect's block for the rest?

hiiamboris

[16:37](#msg62d980bc8fe56a38b5b5279f)I would prefer an error

[16:37](#msg62d980c50a522647986640c4)asked this question myself some years ago

[16:40](#msg62d98176ef5ee44882c91b2b)would you like to open an issue for team's review? I don't think one exists

## Friday 22nd July, 2022

toomasv

[06:02](#msg62da3d6f1227f62be3c007aa)I don't understand, why it should be error! If first `collect` creates collection block, then it is only logical for all the rest to fall into this block. If you write it up with explicit block it is very clear:

```
parse [1 2 3][collect [keep integer! collect keep integer! collect keep integer!]]
```

If you want first integer to be in separate block too, add another `collect`

```
>> parse [1 2 3][collect [collect keep integer! collect keep integer! collect keep integer!]]
== [[1] [2] [3]]
```

or rather

```
>> parse [1 2 3][collect [3 collect keep integer!]]
== [[1] [2] [3]]
```

or use `copy`:

```
>> parse [1 2 3][collect [3 keep copy _ integer!]]
== [[1] [2] [3]]
```

[06:12](#msg62da3fd59a314a3ec4ce2e7d)Or you can drill deeper

```
>> parse [1 2 3][collect [keep integer! collect [keep integer! collect keep integer!]]]
== [1 [2 [3]]]
```

Oldes

[07:38](#msg62da53db568c2c30d3edb3ef)Feel free to add your opinion here: https://github.com/red/red/issues/5167

[07:41](#msg62da54a5568c2c30d3edb7a0)I must admit, that `collect`/`keep` in parse is much more complex than I initially thought and have many edge cases.

hiiamboris

[08:02](#msg62da599d9f29d42bed9eca13)@toomasv error IMO is much better than nonsensical results that break the symmetry of how rules are written vs what results they produce.

[08:04](#msg62da5a0422c53438bcc3e592)If one has written `collect ... collect ...` it's most likely one has forgotten to add the outer collect, hence the error would remind.

toomasv

[08:52](#msg62da65429a314a3ec4cf3b64)But it could perfectly be intentional, as in:

```
>> parse [1 2 3][collect keep integer! collect [keep integer! collect keep integer!]]
== [1 [2 [3]]]
```

Why should this rise error?

hiiamboris

[08:54](#msg62da65b3ab6b634f73676dae)Because you have an \*implicit* outer block which does not appear in the rules and by looking at the rules, it's hard to infer the result.

[08:54](#msg62da65d1904f20479a26cbf8)write it explicitly `[collect [keep integer! collect [keep integer! collect keep integer!]]]`

Oldes

[20:42](#msg62db0bb6ef5ee44882d4009f)Is there any example what `keep pick` (mentioned in the doc) should do? Because I don't see any difference:

```
>> parse "ab" [collect [keep ("ab")]]
== ["ab"]
>> parse "ab" [collect [keep pick ("ab")]]
== ["ab"]
>> parse [] [collect [keep ([1])]]
== [[1]]
>> parse [] [collect [keep pick ([1])]]
== [[1]]
```

hiiamboris

[20:58](#msg62db0f6c1227f62be3c5f6e2)it's supposed to explode a \*match*

Oldes

[20:58](#msg62db0f798fe56a38b5c08ed5)I expected, that the last one would be just `[1]`.

hiiamboris

[20:59](#msg62db0fb4904f20479a2bb02c)how?

[21:00](#msg62db0fd0fe909e3ec7f5ef31)if anything, it does the opposite: ensures a series

Oldes

[21:00](#msg62db1009568c2c30d3f344c2)When there is:

```
>> parse [1 2][collect [keep 2 integer!]]
== [[1 2]]
>> parse [1 2][collect [keep pick 2 integer!]]
== [1 2]
```

[21:02](#msg62db104a22c53438bcc9349b)Maybe if I would see some example of the `keep pick`.. but there are no unit tests for it.

hiiamboris

[21:08](#msg62db11b7d3c8894f71af7b68)is it not clear what the docs say?  
&gt; If rule matched multiple values, they are grouped into a series of the same type as input; with pick option, values are not grouped but kept one-by-one.

[21:09](#msg62db11fc3bbb384889a21e4e)

```
>> parse "abc" [collect keep pick to end]
== [#"a" #"b" #"c"]
```

Oldes

[21:10](#msg62db12479f29d42beda400b3)There is difference between expressions and rules. `to end` is a rule!

[21:11](#msg62db12669a314a3ec4d4021f)\[!\[image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/2i7W/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/2i7W/image.png)

hiiamboris

[21:12](#msg62db12a6fe909e3ec7f603b2)ah, I see what you mean

[21:13](#msg62db12f3904f20479a2bc941)I think it's a deficiency in the docs  
`keep pick` is there only to outline that it's a valid combo  
but it is the same thing as `keep` (which is not said there)

Oldes

[21:17](#msg62db13f476cd751a2f64ca45)And I think, that it is probably not implemented, because this would be better:

```
>> parse [1][collect [keep pick ([x: 1 +]) keep integer!]]
== [x: 1 + 1] ;== instead of current: [[x: 1 +] 1]
```

hiiamboris

[21:18](#msg62db143c0a5226479871a29e)is this a real use case though?

[21:19](#msg62db147e9a314a3ec4d40fa8)I'm not sure it's worth exploding arbitrary data

[21:20](#msg62db14a1568c2c30d3f3666f)though I agree, semantically that would be the expected thing to do

## Saturday 23th July, 2022

toomasv

[03:58](#msg62db71e8d3c8894f71b22961)As doc says:

&gt; If keep is used with paren! expression, result of its evaluation is kept as-is.

[03:59](#msg62db721f568c2c30d3f6066a)But yes, I have wanted it to pick from paren-expressions too.

Oldes

[08:54](#msg62dbb74e1227f62be3caabab)Should the `collect set` in the inner `collect` be excluded from the upper result?

```
>> parse [1 2][collect [collect keep skip]]
== [[1]]
>> parse [1 2][collect [collect set x keep skip]]
== []
```

hiiamboris

[10:18](#msg62dbcafcab6b634f7371771c)

```
>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> parse [1 2][collect [collect set x keep skip]]
== []
```

[10:18](#msg62dbcb12ef5ee44882d93884)it's one of those bugs that require an explicit block

Oldes

[10:25](#msg62dbcca3d3c8894f71b48b08)I don't think so, I think it is another issue and it should work like:

```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]
```

[10:26](#msg62dbcceb904f20479a30e0a0)And there should not be difference between `collect [set x keep skip]` and `collect set x keep skip`.

[10:31](#msg62dbce11568c2c30d3f8855f)(I mean the complete result... because `x` is different) So I expect this:

```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

hiiamboris

[10:36](#msg62dbcf4b3bbb384889a75c8e)I don't follow. Why should `x` be different?

[10:37](#msg62dbcf751227f62be3cb4d40)oh I get it

[10:38](#msg62dbcf890a5226479876e743)`collect set` comes in conflict with `collect` + `set`

[10:39](#msg62dbcff00a5226479876eac4)so, good question if it should or not be included

[10:42](#msg62dbd07bab6b634f73719ecb)we can think of it as of \*diverting* the collection into a new series, or as just as \*marking* a word with the collection result

[10:42](#msg62dbd0a876cd751a2f6a19cd)since you can do your thing with:

```
>> parse [1 2][collect [set x collect keep skip]]
== [[1]]
```

then diverting is by design

Oldes

[11:06](#msg62dbd6279f29d42beda955c2)Just to make it clear. I'm not looking for \_how to do \*\*my thing\*\*\_. I'm looking for extreme cases and their results.

[11:13](#msg62dbd7bffe909e3ec7fb4435)But it is true, that I confused myself when I made the `set` not related to `collect`.

[11:18](#msg62dbd8f79f73251a2c81bde9)Actually it looks, that the inner set is just not included in the upper level, so it still may be by design.

```
>> parse [1 2][collect [keep integer! collect set x keep skip]]
== [1]
>> x
== [2]
```

[11:19](#msg62dbd951fe909e3ec7fb5190)@toomasv is above good or not?

hiiamboris

[15:50](#msg62dc18a83bbb384889a95e68)btw https://github.com/red/red/issues/4198

[15:51](#msg62dc18edd3c8894f71b6b773)so it was indeed by design not splitting expressions

Oldes

[16:45](#msg62dc25c722c53438bcd10124)When thinking about it a little bit more, it probably makes sense that the \_named collects_ are excluded from the \_unnamed parents\_. It would be more useful in real use scenarios.

## Sunday 24th July, 2022

toomasv

[03:28](#msg62dcbc409a314a3ec4dfd208)@Oldes Something seems wrong with it, yes. Giving `set`-rule to `collect` seems to ignore `collect`. And setting `x` seems also weird. Compare these

```
>> parse [1][collect set x keep skip]
== true
>> x
== [1]
>> parse [1][collect copy x keep skip]
== [1]
>> x
== [1]
```

These are correct

```
>> parse [1][collect keep set x skip]
== [1]
>> x
== 1
>> parse [1][collect keep copy x skip]
== [[1]]
>> x
== [1]
```

With your example above

```
>> parse [1 2][collect [keep integer! collect keep set x skip]]
== [1 [2]]
>> parse [1 2][collect [keep integer! collect keep copy x skip]]
== [1 [[2]]]
```

hiiamboris

[07:45](#msg62dcf8a91227f62be3d332f5)@toomasv `collect set` has a special meaning, like `collect into`

## Monday 25th July, 2022

Oldes

[14:22](#msg62dea7238fe56a38b5d9b790)Is this useful?

```
>> a: ""  parse to-binary "ah" [collect into a keep 2 skip] a
== "#{6168}"
>> a: ""  parse to-binary "šo" [collect into a keep 2 skip] a
== "#{C5A1}"
```

Should not it be error like in this case?

```
>> a: #{} parse "1" [collect into a keep skip]
*** Script Error: PARSE - COLLECT INTO/AFTER expects a series! of compatible datatype
```

toomasv

[14:27](#msg62dea843ef5ee44882ed41c5)@hiiamboris

&gt; collect set has a special meaning, like collect into

Ah, yes, thanks!

hiiamboris

[14:29](#msg62dea8b6904f20479a451432)@Oldes I agree

greggirwin

[15:34](#msg62deb7f976cd751a2f7eaac0)I agree as wel @Oldes.

toomasv

[16:57](#msg62decb919f73251a2c96590c)But then (enforced compatibility) you would not be able to do this either

```
>> a: []  parse to-binary "ahhaa!" [collect into a [some keep skip]] a
== [97 104 104 97 97 33]
```

hiiamboris

[17:15](#msg62decfba8fe56a38b5dad577)interesting trick

greggirwin

[17:27](#msg62ded2858fe56a38b5daea84)So the char! into binary! case should \*not* error? We do love our tricks and flexibility. Easier to make stricter on top.

Oldes

[20:30](#msg62defd62568c2c30d30ee11a)It is not same.. there is difference having `a` as block and or string!

[20:31](#msg62defdb4ab6b634f73883af7)And of course.. the main issue is with the unicode char of course

## Tuesday 26th July, 2022

Oldes

[12:24](#msg62dfdd081227f62be3e7bcaf)And which result makes more sense in this case?

```
x: 0  parse [][ 2 [(x: x + 1)] ]  x
```

Is it `1` or `2`?

hiiamboris

[12:51](#msg62dfe35a8fe56a38b5e278c7)`1` if we know loops are stopped when they don't advance  
`2` if we make loops dumber

[12:54](#msg62dfe40cfe909e3ec717b42e)`2 rule` &lt;=&gt; `2 2 rule` is a special case of `N M rule`, which we could require to evaluate `N` times unconditionally, and then depending on advancement

[12:55](#msg62dfe43876cd751a2f8721e7)can't see any drawbacks atm

Oldes

[12:55](#msg62dfe45a9f29d42bedc5f374)In Rebol it is even without the block:

```
>> x: 0  parse [][ 2 (x: x + 1) ]  x
== 2
```

hiiamboris

[12:56](#msg62dfe46c8fe56a38b5e27d56)then it's a good argument for the change

[12:56](#msg62dfe4988fe56a38b5e27fda)on the other hand,  
`x: 0 parse [][ 2 3 [(x: x + 1)] ] x` in R2 returns 3

[12:57](#msg62dfe4a99f29d42bedc5f6eb)so it doesn't even check for advancement?

Oldes

[12:57](#msg62dfe4a9ef5ee44882f624a5)Personally I don't think anybody is using this \_feature\_.

[12:57](#msg62dfe4d79f29d42bedc5f739)3 make sense.. in the above example:)

hiiamboris

[12:58](#msg62dfe50c568c2c30d3152e23)ok maybe so

## Saturday 13th August, 2022

snotbubble

[13:35](#msg62f7a8b3aa09177429538c32)is there an equivalent of the Regex `(^)` in Parse?  
having trouble detecting the a character at the start of a string while also skipping past an escape character, eg:

```
d: complement charset "\"
a: "+xx+ x\+y +yy+"
parse a [ 
  some [ 
    to [ d #"+" ] skip remove thru #"+" insert ("<s>") 
    to [ d #"+" ] skip remove thru #"+" insert ("</s>") 
  ] 
]
probe a
== "+xx<s> x\+y </s>yy<s>"
```

while if the beginning of the string `(^)` was in the bitset, it could return:  
`== "xx x\+y yy"`

gurzgri

[15:05](#msg62f7bda0aa09177429541e97)No, "start of string" is not a character which can be part of a charset.

```
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>" | skip]] a
== "<s>xx</s> x\+y <s>yy</s>
```

You can test for head? with parse with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless pos is at it's head.

## Monday 15th August, 2022

snotbubble

[03:29](#msg62f9bd8205ad4a3701444a79)@gurzgri understood thanks... out of curiosity is there a benefit to using parse with nested loops vs vanilla Red in this case?

gurzgri

[05:33](#msg62f9daad458f823ce0d8aa24)The rule of thumb is: the `parse` solution is usually faster.

hiiamboris

[07:16](#msg62f9f2e9443b7927a76b5690)when interpreted

GiuseppeChillemi

[08:47](#msg62fa0808458f823ce0d9fe95)@hiiamboris how much is the difference between compiled and interpreted?

hiiamboris

[08:49](#msg62fa087d443b7927a76bed62)depends on your code

GiuseppeChillemi

[08:50](#msg62fa08d97ccf6b6d452caeb9)I have zero experience in parse, I have not material to test it.

## Thursday 18th August, 2022

GiuseppeChillemi

[15:50](#msg62fe5fe211a6a83d042b255f)I am doing my first experiment with Parse.  
I would like to validate a specs block but I don't know how to check for datatype instead of a word in a subrule:

```
parse-ctx: context [
	datatypes: [any word!];<<<<--- need [any datatype!]
	specs: [word! ahead block! into datatypes]

]
spec: [x [word!] y [integer!]]
probe parse spec bind [
	any specs
] parse-ctx
```

greggirwin

[16:10](#msg62fe646511a6a83d042b445a)Looks can be deceiving:

```
>> type? first [integer!]
== word!
>> type? first reduce [integer!]
== datatype!
```

GiuseppeChillemi

[16:49](#msg62fe6d939d3c1862997635b8)Gregg, I have learned this topic but I don't know to let parse `get` the word at check for it as datatype

[16:49](#msg62fe6d9f05ad4a370165f7f5)* and check

greggirwin

[16:55](#msg62fe6ee8f4d7a323de491718)You can look at `help`'s source (specifically `parse-func-spec`), which `reduce`s the type part of the spec (the block).

## Wednesday 7th September, 2022

Oldes

[21:16](#msg63190a15d020d223d327eb55)If we would like to swap `map!` and the construction syntax.. we can use something like:

```
swap-map-cons: function[src [string!]][
	bl: complement charset "[]"
	pb: complement charset "()#"
	cr:  [#"[" any bl opt cr #"]"]
	crn: [     any bl opt cr #"]"]
	mr:  [#"(" any pb opt tr #")"]
	mrn: [     any pb opt tr #")"]

	tr: [ any pb [
		#"#" s: [
		  #"[" (s/1: #"(") crn s: (s/-1: #")")
		| #"(" (s/1: #"[") mrn s: (s/-1: #"]")
		| tr
		]

	]]
	parse src [any tr]
	src
]

print swap-map-cons {
	#[none] #[f32! [1 3 4]] #[string! "aaa" 2]
	#(x: 1 y: #(a: 2 b: #[true]))
	#issue #{01}
	#[integer!]
}
```

[21:17](#msg63190a506837563d1cc24550)It would do the change also inside strings, but that should not be big problem.

hiiamboris

[21:18](#msg63190ac072ad51741fcce19e)https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/mapconv

Oldes

[21:20](#msg63190b2f647d633cf60d01e9)Hm.. my version looks shorter:)

hiiamboris

[21:21](#msg63190b6e72ad51741fcce2ed):)

[21:24](#msg63190c21647d633cf60d03c4)My doesn't break strings &amp; comments! ☻

Oldes

[21:29](#msg63190d25458f823ce0709c75)It would not be hard to handle it... but I will rather go sleep... it would be an use-and-delete utility anyway.

[21:36](#msg63190ec4b16e8236e3679279)Btw.. I think the utility should change also strings and comments. Because if there is `#[..]` or `#(..)` in comments/strings, than it is the most probably commented out code, which also need conversion. I don't think I would find a comment inside my construction value.

hiiamboris

[21:45](#msg631910dd443b7927a70225e9)Actually, nested strings are quite hard... (besides no one knows real lexing rules ;)

[21:46](#msg6319111b3a42316d33dd3623)I agree there are cases for that. But also e.g. `charset "#(){}"` you don't wanna mess things like that.

[21:52](#msg6319128411a6a83d04a355f0)`gen-delims: charset ":/?#[]@"` from red codebase

[21:52](#msg631912ac11a6a83d04a3562d)Perhaps adding an option for comments is worth it though. I see a lot of single line comments with `#[none]` in my tests.

greggirwin

[22:14](#msg631917da72ad51741fccfc06)Do the easy thing first, which gives the most value. Then analyze to see what's left.

## Friday 16th September, 2022

GiuseppeChillemi

[22:13](#msg6324f4fc72ad51741fe440d5)How do I express: scan the whole block for THIS rule but if you find it twice, fail.

[22:13](#msg6324f523458f823ce087cfc6)I mean "if you have more than one match, fail".

hiiamboris

[22:26](#msg6324f821647d633cf62433dc)`rule opt [rule reject]`?

[22:27](#msg6324f83daa09177429127115)or `rule not rule`?

GiuseppeChillemi

[22:41](#msg6324fb82b16e8236e37edda6)

```
>> rule: ['a integer!]
== ['a integer!]
>> parse [a 22 x x x x x b ] [rule opt [rule reject | skip]]
== false
>> parse [a 22 x x x x x a 33] [rule opt [rule reject | skip]]
== false
>>
```

The second should be true

The third should fail

[22:42](#msg6324fbe1d020d223d33f34ab)Usage: I need to check if a key present more than one time

[22:42](#msg6324fbe9f4d7a323ded7b268)And also its next value

[22:43](#msg6324fc27647d633cf6243b99)As bonus, I whould like to check if the total of data keys are EVEN

## Saturday 17th September, 2022

toomasv

[03:41](#msg632541f972ad51741fe4cbfb)@GiuseppeChillemi

```
b1: [a 1 x x] b2: [a 1 x x a 2] b3: [x a 1 x x b 2 z] b4: [a b x a 1 a c a a 2 x]
f: func [b] [parse b [any [check any [check (return false) | skip] | skip]] true]
```

```
>> f b1
== true
>> f b2
== false
>> f b3
== true
>> f b4
== false
>> b4: [a b x a 1 a c a a 2.5 x]
== [a b x a 1 a c a a 2.5 x]
>> f b4
== true
>> even? length? b4
== false
>> even? length? b1
== true
```

[07:17](#msg6325747b05ad4a3701f6054f)

```
check: ['a integer!]
```

hiiamboris

[08:17](#msg632582a8443b7927a71a4bc6)maybe you should read parse docs to understand what value `parse` returns or how to combine rules then

[08:17](#msg632582ab9d3c186299067d31)

```
>> rule: [thru ['a integer!]]
>> parse [a 22 x x x x x b ] [rule not rule to end]
== true
>> parse [a 22 x x x x x a 33] [rule not rule to end]
== false
```

GiuseppeChillemi

[08:22](#msg632583c4b16e8236e37fdfcd)Parse is one of my last beasts. I have started to conquer VID, then will come a full work on parse.

hiiamboris

[08:23](#msg632583f87ccf6b6d45dc3c30)push hard ;)

GiuseppeChillemi

[08:24](#msg6325843acf6cfd27af923712)However, `thru` approach is dangerous for me:

[08:27](#msg632584e1d020d223d3403bcd)`[a 2 b c 2]` must fail as I want to process values by couples, where the first is always a word and skip by 2.

[16:39](#msg6325f83c9d3c1862990768d7)@toomasv @hiiamboris I forgot to thank you.

[23:16](#msg63265554443b7927a71be800)@toomasv

I was studying it your version but it has one problem:

```
check: ['a integer!]
f: func [b] [parse b [any [check any [check (return false) | skip] | skip]] true]

>> f [a b]
== true
```

It should return false.

[23:35](#msg632659b8458f823ce08a7ca2)I have tried this:

```
>> f: func [b] [parse b [1 [check any [check (return false) | skip skip] | skip skip]]]
```

It works on:

```
>> f [a 2 b 2]
== true
f [a x]
== false
```

But it fails on:

```
f [a x b x a 2]
== false
 f [a x a 2 b x]
== false
```

Which should be true

## Sunday 18th September, 2022

toomasv

[06:27](#msg6326ba6805ad4a3701f87239)@GiuseppeChillemi So single `['a integer!]` should always be present, on any position? Maybe this:

```
f: function [b] [out: false parse b [some [check (if out [return false] out: true) | 2 skip | (out: false)]] out]
```

[06:31](#msg6326bb25f4d7a323dedafc28)What about `[x a 1 x]`? Should it succeed?

GiuseppeChillemi

[06:33](#msg6326bbd4f4d7a323dedafd12)No, this should not succeed

[06:37](#msg6326bca5b16e8236e38224cb)As for `['a integer! ]` it must always be there 1 time and no more

toomasv

[09:37](#msg6326e6e372ad51741fe7d435)So, how does the latest `f` perform?

GiuseppeChillemi

[11:06](#msg6326fb9b6837563d1cdd3668)I confess I am still in my bed surfing internet, I will try soon!

toomasv

[11:24](#msg6326fff3aa091774291641bf):joy:

GiuseppeChillemi

[12:26](#msg63270e873a42316d33f853bf)@toomasv Ok, now I am out of my bed!

It works and I am continuing my experiments. I was trying to check split key/values passing a parse validation block.

```
split-words: func [
	word [word! object!]
	/local
	out-data
] [
	out-data: copy []
	if object? word [
		word: words-of word
		forall word [append out-data reduce [word/1 get word/1]]
	]
	if word? word [
		append out-data reduce [word get word] 
	]
	out-data
]
check-key: func [
	data [word! object! block!]
	check [block!]
] [
	either any [word? data object? data] [
		f split-words data check
	] [
		f data check
	]
	
]
```

This is the result on objects and blocks.

```
>> data: make object! [x: 22 c: 33 d: [a b c]] 
>> check-key data ['x integer!]
== true
>> check-key [a 88 x 22 d 33] ['x integer!]
== true
```

toomasv

[17:34](#msg632756937ccf6b6d45dfb0a6):+1:

## Wednesday 21st September, 2022

GiuseppeChillemi

[23:55](#msg632ba46d9994996293776968)How could append an additional button to panel `p`, below the `x` button?

```
view [
	p: panel 300x150 [
	x: button "hello" [append p/pane layout/only [button "world"]]
	]
]
```

## Thursday 22nd September, 2022

toomasv

[07:26](#msg632c0e26647d633cf631d420)@GiuseppeChillemi You \*do* append it, just on top of `x` ;). Give it a different offset.

GiuseppeChillemi

[20:41](#msg632cc8773a42316d3303860e)Ops, this is the reason why I was not finding it! I have sent to the wrong group!

## Wednesday 21st December, 2022

bubnenkoff

[08:34](#msg63a2c52d410c633d48ea9d22)

```
flag: true
parse "foo" [ 
	some [
		"fo"
		(print "test")
		if (flag) break 	
		(print "here")

		]  
	]
```

[08:35](#msg63a2c5410dba3574233b623e)I want to stop parsing at getting some flag. is it good solution?

[09:12](#msg63a2ce093b37dd2c1140db67)strange that even with `flag: false` same behavior:

```
flag: false
parse "foo" [ 
    some [
        "fo"
        (print "test")
        if (flag) break     
        (print "here") ; not printing

        ]  
    ]
```

hiiamboris

[16:25](#msg63a3336763c9fc72d3ef4244)Do you want to stop `some` loop or terminate all parsing?

[16:25](#msg63a3338d378d512c1825e572)If latter, the only solution is either `return` from a function or `break` from the loop or `throw` into catch.

[16:27](#msg63a333da0dba3574233c399f)

```
loop 1 [
	parse "foo" [ 
	    some [
	        "fo"
	        (print "test")
	    	(if flag [break])     
	        (print "here") ; not printing
	
	        ]  
    ]
]
```

## Sunday 25th December, 2022

WayneCui

[03:52](#msg63a7c8e80cd40c2e89a48a9f)Hello guys, some binary! data, 6-7 (0022) is the length of bytes (length is two bytes) I need to get to get a string, how can I do it in PARSE?  
the result is `com.caucho.hessian.test.TestObject`, corresponding `#{636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A656374}`

[03:52](#msg63a7c9143b37dd2c1149b191)

```
;4D = 'M'
;74 = 't'
;7A = 'z'
data: #{7201004D740022636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A6563745300065F76616C756549000000007A7A}
 
probe collect [
    probe parse data [
        thru #{720100} thru "M"
        opt [
            thru "t" [
                ; copy len skip 4 (keep to integer! len)
            ]
        ]
        to end
    ]
]
```

[03:56](#msg63a7c9ef8f8df4262abf89dc)How can I express copy or set 2 bytes to a word! ?

[04:11](#msg63a7cd837de82d2616f8f834)Make it! Just `2 skip` instead of `skip 2`

[04:11](#msg63a7cd8e40557a3d5c4446fc)

```
data: #{7201004D740022636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A6563745300065F76616C756549000000007A7A}
 
probe parse data [
    thru #{720100} thru "M"
        opt [
            thru "t" [
                copy len 2 skip (n: to-integer len) copy class-name n skip (probe to-string class-name)
            ]
        ]   
]
```

greggirwin

[04:37](#msg63a7d38d410c633d48f3b911):+1:
