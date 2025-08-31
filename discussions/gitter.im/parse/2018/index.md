# Archived messages from: [gitter.im/red/parse](/gitter.im/red/parse/) from year: 2018

## Monday 4th June, 2018

gltewalt

[01:37](#msg5b1497da016ae21a4c0936f4)I’m here to learn parse

rebolek

[05:20](#msg5b14cc19a45f930a65fb8356)What do you want to know?

endo64

[06:28](#msg5b14dc1b22a05f5e71fb82a0)@greggirwin Can you put a description for this room?

guraaku

[09:24](#msg5b150531352b9e1a4b58b163)Wow, new parse room !!! :clap:

[09:25](#msg5b150588e26c847ac8b62e48)I had a thought on this empty block thing

[09:26](#msg5b1505c3edd06f7d1509feae)I wonder if it might be a suitable solution in some cases, to simply not worry too much about it, and just have a "cleanup" function that you run on your output afterwards, to remove the empty blocks

[09:27](#msg5b1505ef4eaffb692d7d2c95)if the only issue was extraneous empty blocks, and you wanted to keep your parse code fairly clean

[09:28](#msg5b150633a45f930a65fc55f8)I'd rather not have the empty blocks there in the first place of course, but depending on what you need to do to the parse code to get rid of them

toomasv

[10:22](#msg5b1512cea45f930a65fc8447)@guraaku Currently it seems, that to get rid of superfluous empty block it is enough to include parens (can be empty) after literal matches.

guraaku

[11:17](#msg5b151fc8352b9e1a4b59176d)oh !

[11:19](#msg5b152024edd06f7d150a619c)how did you work that out, @toomasv ?

[11:19](#msg5b15203ce26c847ac8b6901e)

```
>> parse [x 1 2 x 3 4 x] [collect some [collect keep ['x () | integer!]]]
== [[x] [1] [2] [x] [3] [4] [x]]
```

toomasv

[11:20](#msg5b152091e26c847ac8b69136)@guraaku Seemed to be interesting bug, so I played with it a bit.

guraaku

[11:21](#msg5b1520b74eaffb692d7d941d)ok, I wonder if I can use that same thing to f my original grammar

[11:21](#msg5b1520bb22a05f5e71fc7f4c)to fix

[11:21](#msg5b1520c093dc78791cad09a2)I'll try it

rebolek

[11:21](#msg5b1520c393dc78791cad09a5)https://github.com/red/REP/issues/8

guraaku

[11:49](#msg5b15274d4eaffb692d7dafb5)@toomasv , I can't see how to make that help with my parse rules

[11:49](#msg5b15275452e35117cd071e69)

```
COIParser: make object! [
    ; handle whitespace
    ws: [any [space | tab | cr | lf]]

    ; the statements
    ThisStatement: ["this" keep ('this)]
    ThatStatement: ["that" keep ('that)]
    Statement: [ThisStatement | ThatStatement]

    ; grouping into rules and libraries
    Rule: [collect [
        "rule" keep ('rule)
        any [ws Statement] ws
        "endrule" keep ('endrule)]
    ]

    Library: [collect [
        "library" keep ('library)
        collect [any [ws Rule]] ws
        "endlibrary" ws keep ('endlibrary)]
    ]
]
```

[11:51](#msg5b1527a6016ae21a4c0b0465)what I am parsing :-

[11:51](#msg5b1527acba1a351a68eb1260)

```
LIBRARY

RULE
this
that
ENDRULE

RULE
that
this
ENDRULE

ENDLIBRARY
```

[11:51](#msg5b1527d352e35117cd072030)

```
>> parse lib COIParser/Library
== [library [[rule this that endrule] [rule that this endrule] []] endlibrary]
```

[11:52](#msg5b1527f699fa7f4c06431df0)I have tried a number of places to put () ... but the empty block remains

9214

[11:52](#msg5b15281316f649612405dd8c)

```
text
input: load {
    LIBRARY 
    
    RULE 
        this 
        that 
    ENDRULE 
    
    RULE 
        that 
        this 
    ENDRULE 
    
    ENDLIBRARY
}

library:   [keep 'LIBRARY (rules: make block! 10) any rule keep (rules) keep 'ENDLIBRARY]
rule:      [collect into rules keep ['RULE some statement 'ENDRULE]]
statement: ['this | 'that]

probe parse input [collect library]
```

[11:53](#msg5b15281c93dc78791cad26c8)I wonder why you need Parse for that.

guraaku

[11:54](#msg5b15288399fa7f4c06432060)how do you mean, @9214 ? This is a simplified grammar and input, but I have existing stuff written in my DSL, that may or may not have whitespace separating things.

9214

[11:55](#msg5b1528cf93dc78791cad2ab1)Nevermind.

guraaku

[11:56](#msg5b1528e5e26c847ac8b6b212)ah..sorry, I'm just trying to understand what you mean

toomasv

[11:56](#msg5b1528ffc712f5612558bdfc)@guraaku Nevermind about `()` here. This is what you need:

```
Rule: [
        "rule" 
		collect [keep ('rule)
        any [ws Statement] ws
        "endrule" keep ('endrule)]
    ]
```

9214

[11:56](#msg5b152907f9f2e56cf23c5555)I mean that so far your task boils down to inserting square brackets in the right places and loading the modified string.

guraaku

[11:57](#msg5b15292c93dc78791cad2be3)@9214 basically yes ! :)

[12:01](#msg5b152a24f9f2e56cf23c58d7)@toomasv ok I think I see what you've done - by putting the collect after it has recognised "rule" then it can only ever open the collect once a rule is being recognised

[12:01](#msg5b152a3552e35117cd072a22)wherewas where I had it before, I'm starting a collect which may not end up keeping anything

9214

[12:05](#msg5b152b0a99fa7f4c06432aee)https://gitter.im/red/parse?at=5b151fc8352b9e1a4b59176d  
Hmm... you're using one `keep` with two wrapping `collect`s, I wonder why it even works that way.

guraaku

[12:06](#msg5b152b63b6eece791dd9f0f7)well, my naive understanding of it is that a collect will start collecting into a new block

[12:08](#msg5b152bca160c567d16008684)which is what I wanted - the whole thing in a block, and each item in a block

toomasv

[12:08](#msg5b152bce016ae21a4c0b16c0)I earlier suggested

```
parse [x 1 2 x 3 4 x] [collect some [keep copy whatever ['x | integer!]]]
== [[x] [1] [2] [x] [3] [4] [x]]
```

guraaku

[12:09](#msg5b152bf7a45f930a65fcea0a)yes, I played around with the copy... but, my understanding is that copy will get what is matched

[12:09](#msg5b152bfcedd06f7d150a8ed0)not what I say to keep

toomasv

[12:12](#msg5b152c9852e35117cd0733d9)In given cases you are keeping what is matched anyway

guraaku

[12:12](#msg5b152cb0c712f5612558ccf9)yes, in this simplification I am

[12:12](#msg5b152cb352e35117cd073425)but in the real thing, I won't be

toomasv

[12:12](#msg5b152cb94eaffb692d7dc862)OK, `collect` works too.

guraaku

[12:12](#msg5b152ccb22a05f5e71fcb115)I'm just trying to get it working bit by bit :)

[12:13](#msg5b152cd74eaffb692d7dcb28)so, first thing, was trying to understand why I was getting the empty block

toomasv

[12:13](#msg5b152cec160c567d16008c36)Bug IMO

guraaku

[12:14](#msg5b152d1452e35117cd0736ec)oh well, I have to live with it - and I think your changed placement of the collect fixes it

[12:14](#msg5b152d19ba1a351a68eb2875)in this case

9214

[12:14](#msg5b152d3993dc78791cad3bbb)

```
text
>> parse [x 1 2 x 3 4 x][collect some [keep ahead collect keep skip skip]]
== [[x] [1] [2] [x] [3] [4] [x]]
```

guraaku

[12:15](#msg5b152d6552e35117cd073866)@\_@

[12:40](#msg5b15333f16f6496124061195)anyway, that's some progress for tonight I think ! I'll see what issue I run into next :)

[12:40](#msg5b153357016ae21a4c0b383e)thanks for the help once again :)

9214

[12:42](#msg5b1533a0352b9e1a4b5969cb)Np. I think it's more of a `collect` subtlety than a bug. Need to think about it deeply some time.

[12:49](#msg5b15356d16f6496124061bbe)@greggirwin would it make sense to rename this room into `/dialects`, or to create another room for discussions concerned with DSL creation in Red/Rebol?

toomasv

[12:54](#msg5b15366fba1a351a68eb4e96)@9214 This goes beyond `collect` and is \*very* subtle indeed:

```
>> parse [x][some [(print '.) 'x]]
.
.
== true
>> parse [x][some [(print '.) 'x ()]]
.
== true
>> parse [x][some [(print '.) word!]]
.
== true
```

9214

[12:55](#msg5b1536bfa45f930a65fd23a7)@toomasv first example makes sense, but not the second one :confused:

[12:55](#msg5b1536d3c712f5612558fb06)Huh!

rebolek

[12:56](#msg5b1536e5b6eece791dda217f)Does it really make sense?

9214

[12:56](#msg5b1536f0edd06f7d150abfa4)Could you repost this in `/bugs` then?

toomasv

[12:56](#msg5b1536fce26c847ac8b6f0b3)It is there already

9214

[12:56](#msg5b153710a45f930a65fd25d4)@rebolek kinda - `.` printed before Parse realizes that it can't match non-existing `'x`.

[12:57](#msg5b15372ce26c847ac8b6f17e)But then @toomasv updated his snippet with the third example.

rebolek

[12:57](#msg5b153733a45f930a65fd2647)but it's on `end` already

[12:57](#msg5b15374422a05f5e71fce4f0)that third example is...well

[12:58](#msg5b153759ba1a351a68eb5220)how I expect it to work

9214

[12:58](#msg5b15378dba1a351a68eb52a5)@rebolek maybe first `paren!` expressions are evaluated, and then `end` is checked?

rebolek

[13:02](#msg5b153863160c567d1600bcbb)that would be interesting implementation

toomasv

[13:23](#msg5b153d4252e35117cd0781d9)Go figure it out

```
>> parse [x][collect some [collect keep 'x]]
== [[x] []]
>> parse [x][collect some [collect some keep 'x]]
== [[x]]
>> parse [x][collect some collect any keep 'x]
== [[x]]
>> parse [x][collect some collect 1 2 keep 'x]
== [[x]]
>> parse [x][collect some keep copy dang! 'x]
== [[x]]
>> parse [x][collect some collect keep copy dang! 'x]
== [[[x]] []]
>> parse [x][collect some collect [keep copy dang! 'x ()]]
== [[[x]]]
>> parse [x][collect some collect keep 1 10 'x]
== [[x]]
```

greggirwin

[22:11](#msg5b15b8fda45f930a65ff4182)@endo64, description added. Improvements welcome.

[22:16](#msg5b15ba3752e35117cd0999f9)@9214, let's see how the room does covering multiple `parse` topics. Still all related, and likely to run in batches on themes that come up.

## Tuesday 5th June, 2018

endo64

[08:33](#msg5b164af7edd06f7d150e7faa)I saw "??" usage in Respectech's http://video.respectech.com:8080/tutorial/r3/index.r3 tutorial.  
We don't have ?? in Red/Parse, is it handy? Should we consider to add it, or `parse-trace` is already do what `??` does?

greggirwin

[18:00](#msg5b16cfbce26c847ac8bcd70b)`parse/trace` (`parse-trace` wraps that) is more powerful, but not as convenient for ad-hoc rule checking.

```
>> parse "dog" [ ?? "d" ?? [ "i" | "o" ] ?? "g" ?? ]
"d": "dog"
["i" | "o"]: "og"
"g": "g"
end!: ""
== true
```

vs

```
>> parse-trace "dog" [ "d" [ "i" | "o" ] "g" ]
 -->
   match: ["d" ["i" | "o"] "g"] 
   input: "dog"   
   ==> matched
   match: [["i" | "o"] "g"] 
   input: "og"   
   -->
     match: ["i" | "o"] 
     input: "og"     
     ==> not matched
     match: ["o"] 
     input: "og"     
     ==> matched
   <--
   match: ["g"] 
   input: "g"   
   ==> matched
 <--
return: true
== true
```

It's worth adding as a wish ticket to the red/rep repo, so we don't forget about it.

[18:02](#msg5b16d04122a05f5e7102e894)We could experiment with a `parse/trace` wrapper and callback to start.

[18:07](#msg5b16d157160c567d16069e73)I can't find a ticket for it, but does anyone know if `p-indent` being global (leaking) is doc'd somewhere? It's shared for parse tracing and the callback, likely global because of a compiler limitation. Don't know if that still holds.

[18:15](#msg5b16d3404eaffb692d83f160)

```
parse-??: func [
	{Wrapper for parse/trace using ?? hook} 
	input [series!] 
	rules [block!] 
	/case 
	/part 
	limit [integer!] 
	return: [logic! block!]
][
	clear p-indent 
	either case [
		parse/case/trace input rules :on-parse-??
	] [
		either part [
			parse/part/trace input rules limit :on-parse-??
		] [
			parse/trace input rules :on-parse-??
		]
	]
]

on-parse-??: func [
	event [word!] {Trace events: push, pop, fetch, match, iterate, paren, end} 
	match? [logic!] "Result of last matching operation" 
	rule [block!] "Current rule at current position" 
	input [series!] "Input series at next position to match" 
	stack [block!] "Internal parse rules stack" 
	return: [logic!] {TRUE: continue parsing, FALSE: stop and exit parsing}
][
	switch event [
	    fetch [
	        if '?? = rule/1 [
	            print [mold rule/2 ":" mold input]
	            remove rule ; produces R3-like output, but mods the rule
	        ]
	    ]
	] 
	true
]

parse-?? "dog" [ ?? "d" ?? [ "i" | "o" ] ?? "g" ?? ]
```

[18:17](#msg5b16d3afb6eece791de02fae)Something we can't do today, in the callback, is modify positions for the rule or input. We can modify the blocks themselves, but don't want to do that. All we would want to do in a case like this is skip `??` in the rule.

gltewalt

[20:12](#msg5b16eec6b0d8ca5f1a8087d1)https://github.com/red/red/blob/9ce2aacce1509943ac11efa3b13457e8a66f03b4/environment/functions.red#L268

[20:13](#msg5b16eee8b0d8ca5f1a808839)Looks like it was a todo, to put in non-global?

greggirwin

[22:06](#msg5b170965160c567d16078294)Thanks @gltewalt

## Saturday 9th June, 2018

cloutiy

[15:41](#msg5b1bf524a09ae108e610aa20)In an attempt to get to grips with `parse`, I'm going to try to make a typography program. The idea is quite simple. Every document element you see below is a red function which takes a string, parses it, then creates a document in a target output. I intend to have the functions definitions for different target outputs in separate red files, and load the appropriate typography functions file based on the target specified at the command line.

for example: ellipses publish mydoc.red -latex

Below is a sample of what a document (which is actually a red program!) could look like. Following this is my actual question.

```
use %typogaphy.red

document-style {default}
document-orientation {landscape}
page-orientation {portrait}
page-size {letter}

document {
	title: My First document
	author: Yves Cloutier
	isbn: 970-123-456
	publication-date: Nov-30-1978
	publisher: Birch and Aspen
	format: epub
}

chapter { My First Chapter }

section { First Section }

p {	
	hang-indent: 1cm 
	drop-cap: 2 2
	Before there was light in the world, there was darkness.

	Before there was light in the world, there was darkness[*].
} 

footnote {
	Some text for the footnote, identified above as [*].
}

list {
	1. Item 1
	2. Item 2
		a) Sub item 
		b) Sub item
	3. Item 3
}
```

I thought approaching it this way, would be a bit simpler, since in essence, each document element can be represented as a function, and each function's job is to parse a relatively short string, each with moderately simple syntax.

My question is....since a document would simply a red program, it could allow users to create functions, variables etc...it would be nice to have a "string interpretation" feature. A possible syntax I'm eyeing is using '@' to indicate what follows in a string is red code that should be executed. For example:

```
sum: function [ a b ] [ a+ b] ; A user defined function
a: 5 b: 6 ; Some user defined values

; A paragraph function call, with red code to be evaluated and interpolated into the string.
p {
   The sum of a and b is @sum [ @a @b ].
}
```

Something like this would allow me to parse the string argument, and when I encounter `@`, this means I need to evaluate red code, and append the result as a string as part of my function output. For example, if the target output is HTML, the output would be:

```
<p>The sum of a and b is 11</p>
```

Would this be a ok way to implement a "string interpolation" feature into my program?  
(long story, I know. I apologize!)

9214

[15:44](#msg5b1bf5d2d7b4f6288cbab3d8)@cloutiy https://gist.github.com/greggirwin/d40a0e3b4c8de31a7d3b82695b9b4b03

[15:47](#msg5b1bf6a8e36e0e7d3f6102df)@cloutiy basically yes, you can utilize Parse for that, in the trivial cases.

cloutiy

[16:04](#msg5b1bfa866077c67d3ede9f12)@9214 ok thank for the feedback. Yes, I intend to start with the most trivial use case and refactor later if needed. For no I just intend to get a minimum viable product going with a core set of features and add more later, like inline formatting, user-defined style sheets, tables etc...

9214

[16:05](#msg5b1bfac33516592752f773f0)@cloutiy I see. Your approach requires the end user to download Red toolchain, however.

cloutiy

[16:11](#msg5b1bfc169ca98417e25853de)@9214 yes they would need Red on their system.

9214

[16:12](#msg5b1bfc76ffd8896fe91712f9)On the other hand, I don't think this is necessary, since Red runtime will be embedded anyway.

gltewalt

[21:19](#msg5b1c4463d7b4f6288cbb9569)Can you use blocks?

[21:21](#msg5b1c44c46077c67d3edf6e18)

```
p [
   "The sum of a and b is" sum a b
]
```

[21:39](#msg5b1c490bdd54362753fd0678)

```
p: func [blk /local output][output: "<p></p>" head insert skip copy output 3 form reduce blk]

>> p ["The sum of a and b is" sum a b]
== "<p>The sum of a and b is 11</p>"
```

cloutiy

[23:53](#msg5b1c686bddd61d08e542da37)@gltewalt I'd prefer not to use blocks for the reason that 99% of the use case would be text. As well I'd like to try to keep the syntax consistent.

## Thursday 21st June, 2018

mikeparr

[15:49](#msg5b2bc911ad21887018d20aed)I want to use block-parsing to parse into a sub-block.  
E.g my input is: \[a \[b c \[d] ] ]  
and I want to use a recursive rule which expresses the idea of a block! containing another block!.  
Is this possible?

9214

[15:49](#msg5b2bc925aeb8fa0c07343f1f)@mikeparr `into`

[15:51](#msg5b2bc964960fcd4eb916fd81)`parse [...] rule: [some [word! | into rule]]`

mikeparr

[15:56](#msg5b2bca9c960fcd4eb9170141)Thanks @9214 - now I know what to look for, I found it in: https://www.red-lang.org/2013/11/041-introducing-parse.html

rebolek

[18:22](#msg5b2bece77d3bca737afea4ac)@mikeparr just be careful, `into` will parse both `string!` and `block!`, so it's better to first check for block - `ahead block! into rule`.

## Friday 22nd June, 2018

mikeparr

[07:45](#msg5b2ca915ad21887018d3ec00)Thanks @rebolek - I saw that 'into' works with series in general, but I did not plan to use 'ahead'.

## Wednesday 27th June, 2018

mikeparr

[18:18](#msg5b33d50ed2abe466888f7960)I'm trying to insert a new block with parse. The problem seems to be when the inserted block gets interpreted as a rule. I want to stop the block being evaluated.  
Here is a cut-down version of the problem:

```
blk:  [name1 123]
item: ["Mike"] ; ok
; item: [Mike]  ;-- parse error:usage of: Mike
rule1: [word! insert only item  integer!] 
print parse blk rule1
print mold blk    ;-- [name1 ["Mike"] 123] OK
;-- but how do I get:   [name1 [Mike ] 123]  ?
```

9214

[18:20](#msg5b33d56559799e7017472a12)@mikeparr

```
>> block: [name 42]
== [name 42]
>> item: [|9214|]
== [|9214|]
>> also block parse block [word! insert only (item) integer!]
== [name [|9214|] 42]
```

mikeparr

[18:26](#msg5b33d6d5be98b142240e4765)@9214 Thanks! I need to study this!

## Monday 2nd July, 2018

greggirwin

[20:23](#msg5b3a89d99b82c6701b9cc4a8)@mikeparr, to confirm, you \*don't* want to use a lit-word, like this?

```
blk:  [name1 123]
item: ['Mike]
rule1: [word! insert only item  integer!] 
print parse blk rule1
print mold blk
```

If that's correct, you might be able to hack around it. But you would need to know or process the possible options.

```
mike: []
blk:  [name1 123]
item: [Mike]  ;-- parse error:usage of: Mike
rule1: [word! insert only item integer!] 
print parse blk rule1
print mold blk    ;-- [name1 ["Mike"] 123] OK
```

@9214's solution is more general, and better.

## Wednesday 4th July, 2018

mikeparr

[21:40](#msg5b3d3ee860c38707835e3863)Thanks @greggirwin - I'm working with the parenthesis style, this works for what I need.

## Friday 13th July, 2018

gltewalt

[22:01](#msg5b492156c2d95c60f4d876da)Time to learn parse

[22:04](#msg5b4921d96534bc5d2e5934c5)If I have a string that represents a number and I only wan to check if the first char matches?

[22:04](#msg5b4921ef26aa91065e922133)parse "2" \["25654446"]

endo64

[22:41](#msg5b492ab573026160f59efb1d)Not sure if I understand exactly what do you expect but something like this?

```
>> parse "2" [ ["2" end] | "25654446"]
== true
>> parse "23" [ ["2" end] | "25654446"]
== false
>> parse "25654446" [ ["2" end] | "25654446"]
== true
```

gltewalt

[22:55](#msg5b492df8d1428e5aefe647ff)I was thinking:  
parse "2565446" \[only care about the first character to test for Category A]

parse "518989888888" \[only care about the first two characters to test for Category B]

endo64

[23:06](#msg5b49306ec2d95c60f4d89661)

```
>> parse "518989888888" ["51" to end]
== true  ; check if this is true, then do something
; or
>> parse "518989888888" ["51" (print 'do-something) ]
do-something
```

gltewalt

[23:06](#msg5b493089897d514b3c4ca155)

```
mastercard: [["51" | "52" | "53" | "54" | "55"] to end]
visa: ["2" to end]
```

[23:06](#msg5b49308d897d514b3c4ca16a)Like that?

[23:07](#msg5b4930cfb5efcd5aeefb11b7)Can I check for a valid string length? Or do I have to use block parse?

endo64

[23:08](#msg5b4930d9d1428e5aefe64e8a)Yes that would work.

gltewalt

[23:08](#msg5b4930e46534bc5d2e5955ff)I think a valid card is 16 digits

[23:08](#msg5b4930ea582aaa6307684fb7)Or 16 chars

endo64

[23:08](#msg5b493109641ecc065fa13cc5)You can check before parse, `16 = length? card`

gltewalt

[23:09](#msg5b49311e26aa91065e924411)true

endo64

[23:12](#msg5b4931e995e03e3d7b48be58)This would work but it is unnecessary to do it in parse, `parse "518989888888" ["51" to end end: (print length? head end)]`

gltewalt

[23:16](#msg5b4932cb582aaa6307685454)Like so?

```
valid-entry?: func [val] [16 = length? val]
mastercard: [["51" | "52" | "53" | "54" | "55"] to end]
visa: ["2" to end]
valid-card: [mastercard | visa]
```

[23:18](#msg5b49335a95e03e3d7b48c147)Or `valid-card-type`. There's an algorithm for valid card numbers that I'll do later.

[23:20](#msg5b4933aa582aaa63076855f9)Thanks for getting me started @endo64

endo64

[23:21](#msg5b493401582aaa63076856f8)You are welcome.

## Saturday 14th July, 2018

greggirwin

[02:02](#msg5b4959ad73026160f59f508a)Luhn checksum is what you're after, but checking for length alone is easy. e.g.

```
dig: charset "0123456789"
parse input [16 dig]
```

To check by type, as AmEx has a different length, you can do something like:

```
visa?: ["4226" 12 dig]
```

And add checksumming after copying the matching input.

gltewalt

[02:04](#msg5b495a3b9a612333aa5f61b8)Yeah, I was going to use Luhn

[02:05](#msg5b495a75897d514b3c4cf113)I was going to make a rule for each company

[02:37](#msg5b4961e766c1e833a9e6d942)You probably have done card stuff before.

Looks I need to consult this, in part  
https://en.wikipedia.org/wiki/Payment\_card\_number

[02:43](#msg5b49634095e03e3d7b49153f)Or I’ll restrict it to three companies to simply things

[02:43](#msg5b49634c95e03e3d7b491541)Simplify

greggirwin

[06:01](#msg5b4991d6866e0c6b15a66e3c)I can post some old code if you want.

gltewalt

[08:46](#msg5b49b84aba5f154b3b9e22e5)I want to do the basics by myself first.

greggirwin

[19:07](#msg5b4a4a0ab5efcd5aeefd1653):+1:

## Monday 16th July, 2018

gltewalt

[01:05](#msg5b4bef65866e0c6b15add9c7)How do I get valid length AND valid company?

```
digits: charset ["0123456789"]
mastercard: [["51" | "52" | "53" | "54" | "55"] to end]
visa: ["2" to end]
valid-company: [mastercard | visa]
valid-length: [16 digits]
valid-entry: [valid-length | valid-company]
```

greggirwin

[02:10](#msg5b4bfe91866e0c6b15ae0ee4)You'll have to be more specific in your rules, or copy the input and check the other rule in an action.

dander

[05:59](#msg5b4c344f9a612333aa66548f)@gltewalt Gregg suggested above already, but if you replace `to end` with the number of remaining digits, then you don't need a separate rule for valid length

gltewalt

[06:26](#msg5b4c3a85582aaa63076f7cff)hmm, yeah I’ll try that in the morning

[20:36](#msg5b4d01c0582aaa630771df8d)I have this:

```
; Based on https://en.wikipedia.org/wiki/Payment_card_number
;
; The maximum length of a credit card number is 19 digits, 
; with the maximum length of the account number field being 12 digits 
; (initial six-digit issuer identifier minus the final digit check number).  

digits: charset ["0123456789"]

amex: [["34" | "35" | "36" | "37"] 13 digits] ; Length of 15 is valid.
discover: [["6106" | "64" | "65"] 15 digits] ; Length of 16 to 19 is valid. 
mastercard: [["51" | "52" | "53" | "54" | "55"] 14 digits] ; Also the range: 2221–2720, Length of 16 is valid.
visa: ["4" 15 digits]  ; ??? Length of 13, 16, or 19 is valid

valid-entry: [amex | discover | mastercard | visa]
validate-entry: func [n][parse n valid-entry]

view [
    size 400x200 title "CC parse thing" 
    f: field 120x20 on-change [
        f/color: either validate-entry trim/all copy f/text [green][white]
    ]
]
```

[20:37](#msg5b4d020f95e03e3d7b586340)Don't know how to handle the Visa rule. A length of 13, 16, or 19 is valid.

[20:38](#msg5b4d024876c128603c7e52b4)All the comments are just reminders for me while I play with it.

toomasv

[21:10](#msg5b4d09b51c0f906b14612502)

```
>> digits: charset "0123456789"
== make bitset! #{000000000000FFC0}
>> visa: ["4" [19 digits | 16 digits | 13 digits]]
== ["4" [19 digits | 16 digits | 13 digits]]
>> parse "41234567890123" visa
== true
>> parse "412345678901234" visa
== false
>> parse "4123456789012345" visa
== false
>> parse "41234567890123456" visa
== true
>> parse "412345678901234567" visa
== false
>> parse "4123456789012345678" visa
== false
>> parse "41234567890123456789" visa
== true
>> parse "412345678901234567890" visa
== false
```

gltewalt

[21:15](#msg5b4d0ad66534bc5d2e62d935)It has to be in that order right? 19 16 13

toomasv

[21:22](#msg5b4d0ca476c128603c7e7595)Yes

## Tuesday 17th July, 2018

greggirwin

[04:18](#msg5b4d6e1864990f3c000999b4)@gltewalt, you can think of `parse` rules as greedy. Put your longest matches first. Otherwise the shorter rule may match first, and miss part of what would have matched a longer rule.

gltewalt

[04:43](#msg5b4d73e61539a7040ce36860)That makes sense

[05:17](#msg5b4d7bef03a5fa639e5f195b)Would this be right since discover can start with the long "6106" and the max card number length is 19?

```
discover: [["6106" | "64" | "65"] [15 digits | 14 digits]]  ;Length of 16 to 19 is valid.
```

hiiamboris

[05:44](#msg5b4d824c8578203ee7384ee9)moving here from /help :point\_up: \[July 16, 2018 9:27 PM](https://gitter.im/red/help?at=5b4ce37466c1e833a9efa8d0)

[05:46](#msg5b4d82c03187ca3ee8b974bf)actually even if `reject` worked, quite a pity I can't exit the outer loops somehow, have to design a workaround with variable assigning/checking everywhere etc... becomes messy

dander

[07:35](#msg5b4d9c3a1539a7040ce3cbca)@gltewalt with that rule, you would always have between 16 to 19 digits, but it excludes combinations starting with "6106" of 16 or 17 digits and starting with "64" or "65" that are 18 or 19 digits long

toomasv

[09:36](#msg5b4db8a0623cc3040b282fe0)@gltewalt Yo have to use different alternatives for `"6106"` and `["64" | "65"]`. First will have shorter range of digits following it than second. Range of digits can be given by `digits`.

gltewalt

[19:18](#msg5b4e40fe3187ca3ee8bbbe3c)&lt;to&gt; isn't inclusive?

[19:20](#msg5b4e4181fd1b3474a698fba4)Well it seems to work for "64", "65", but falls one short for "6401"?  
`discover: [["6106" 12 15 digits | "64" | "65"] [14 16 digits]]`

[19:30](#msg5b4e43bead8d085553aa0d39)Oh, that was me messing up

[19:31](#msg5b4e4422f046ba6aca5f1689)`discover: ["6106" 12 15 digits | "64" 14 16 digits | "65" 14 16 digits]`

toomasv

[20:09](#msg5b4e4ce34b583a74a723a4ae)Yes, it is inclusive:

```
>> discover: ["6106" 12 15 digits | ["64" | "65"] 14 17 digits]
>> parse "6412345678901234567" discover
== true
>> parse "64123456789012345678" discover
== false
```

## Wednesday 18th July, 2018

greggirwin

[00:32](#msg5b4e8a9fad8d085553aaba61)@hiiamboris concrete examples and suggestions for improvements are great. Not many use more advanced `parse` features, so seeing them applied may lead to more useful...rules.

hiiamboris

[15:44](#msg5b4f6058cad358639d634003)concrete example was like this:  
`plan: [do smth while checking (conditions) and stop if some fail]`  
then come the rules to parse `plan` and `parse plan [while [at: ... :at]]` would go over it indefinitely, only quitting from `while` once some condition fails

[15:47](#msg5b4f610a623cc3040b2cd82e)ofc it's not an optimal solution (which I'm working on now - to generate code from `plan` and exec that code), but as a quick and dirty test it would've been OK - if only break/reject worked as they are documented, and better if there was a way to quit from the outer loop in situations like `[while [at: any [... reject or smth] :at]]`

## Thursday 19th July, 2018

greggirwin

[06:10](#msg5b502b61fd1b3474a69df2d4)If you have actual code showing what you want, and expect, that's the best way to get Nenad's time.

[06:11](#msg5b502b8ead8d085553af1159)I'm also short on time, so can't dig in to suss it out myself right now.

hiiamboris

[07:28](#msg5b503d94fd1b3474a69e2891)I guess I'll just ticket `reject` in and call it a day :) Since multi-level breaks are probably too much pain to design and it will require a multitude of concrete use cases which I do not possess.

[13:15](#msg5b508f0579f7236acb37f73f)https://github.com/red/red/issues/3478

greggirwin

[22:57](#msg5b511766c331e0355205a781)Good for a start. Thanks!

## Saturday 21st July, 2018

hiiamboris

[16:56](#msg5b5365b9c331e035520b2d93)@pekr https://github.com/revault/rebol-wiki/wiki/Parse-Project this link?

pekr

[17:02](#msg5b53673505e1cc3553001100)Yes, that's it, thanks ...

## Monday 23th July, 2018

giesse

[22:48](#msg5b565b2832fa1b74085fe69d)I've been trying to figure out what I want to say about https://github.com/red/red/issues/3478 and every time I come to the same conclusion: nothing matters unless I can see a real problem and thus come up with real solutions.

It makes sense to design out of a desire of symmetry - for example, you have `break`, and you imagine a symmetrical `reject` which does the same thing \*except* for failing the entire loop. But... this has the big danger of coming up with a design that tries to cover everything regardless of what's actually useful.

I think that symmetry and other similar principles should be used as strong indicators that we \*probably* need something and we should think about it. But ultimately, design should be driven by real world use. Remove actual pain points (that's how most of the `parse` improvements for R3 came about), not imagined ones.

(The problem with R3 `parse` seems to be that a lot of things were put in because it was annoying not to have them in R2, however, some of them don't seem to make that much sense together. I want to see actual usage, but I'm not sure there's enough R3 code out there to gain that perspective.)

[22:50](#msg5b565b9d9ddf5f4aad03da06)What I want from everyone is: if you are writing a `parse` rule, and you \*wish* something was different or something else was possible etc., then post it here. If your use case is esoteric, I don't think Red should worry about it. But if it's a reasonable common thing then we need to address it.

## Tuesday 24th July, 2018

greggirwin

[01:47](#msg5b56854b32fa1b74086042fe)In a broader sense, this also holds true. When suggestions for other operators come up, which might be useful, we need to step back and look at what other things that might disallow in lexical forms.

Examples of real parsers, working against real input, and how we can improve things is most helpful to me.

My first instinct on @hiiamboris's "this was a bad idea since the beginning" `reject` comment was "Hmmm, could I use `throw` for that?".

We may also find that we have \*simple* directive, and others that we warn most people away from, but benefit CS types and power parsers.

giesse

[03:21](#msg5b569b24f9ffc4664bfa4be7)So long as there is a clear use case for power parsers. :) I'm the first in line for radical changes to `parse` to make things easier, but we should focus on common use cases, and make sure we cover less common ones in someway, but not necessarily with ad-hoc solutions for obscure cases.

[03:23](#msg5b569bc305e1cc3553079b5b)I do instinctively want `break` and `reject` because they make sense... but are they so useful in practice that they should be there as opposed to being able to do the same thing with just `break` and `if` (for eg.)? We need code to look at. :)

hiiamboris

[09:18](#msg5b56eefbe06d7e74099b7634)What are power parsers and CS types?

[09:45](#msg5b56f5539ddf5f4aad053cc0)Let's keep it realistic: we don't have a Red parse code base and won't have it until parse has a stable finished design and Red is spread around. I think @9214 in his \[comment](https://github.com/red/red/issues/3478#issuecomment-406884362) provided a lot of pretty clear use cases that cover most needs imaginable. And the more is covered the simpler will become expressions, no?

It's worth noting that R3 code base as a reference is only useful \*to some extent\*, as Red parse is already sort of different, and our set of rules &amp; constraints defines the way we approach each problem, so it probably won't always be immediately clear how to simplify an R3 problem without redesigning it from scratch.

If you @giesse \*instinctively* feel that `reject` is useful it might be enough reason to have it ☻, since this instinct comes from lots of experience. A few more arguments in favor of `reject`:  
1\. as long as we have `break`, supporting `reject` is absolutely trivial, it's not an effort  
2\. what is the other way you backtrack a loop?

\- `p: loop [... :p break now ...]` - works with `now` but just `break` (in the proposed model) will go thru the alternatives and they don't probably expect `:p` thing happen. Plus this whole rule will succeed, which might be undesirable  
\- `(backtrack: no) loop [... break (backtrack: yes) ...] if (not backtrack)` ? ugh.. so ugly

Do you at least agree with me that having a \*block rule* notion that can be inside or outside the loop makes it very hard to reason about rules behavior? I say we get rid of it. Return success/failure in place of the loop itself.

[09:54](#msg5b56f74cc579673e6b8ef600)&gt; My first instinct on @hiiamboris's "this was a bad idea since the beginning" `reject` comment was "Hmmm, could I use `throw` for that?".

I don't see how `throw` can be used for that. `throw` gets out of the parse expression completely and you'll have hard time restoring the position where it stopped. No?

[10:17](#msg5b56fc9e9ddf5f4aad055399)&gt; What I want from everyone is: if you are writing a `parse` rule, and you \*wish* something was different or something else was possible etc., then post it here. If your use case is esoteric, I don't think Red should worry about it. But if it's a reasonable common thing then we need to address it.

Let me be the first to add a case. I don't have a long reboling history but it already happened to me twice in a few months. Can't throw the code at you since I dropped it until better times, but I can explain the idea (which I think is bound to become common). It's like this. I have:  
\- some \*data*  
\- a proxy \*dialect* that is supposed to tell how to deal with this data  
\- a \*function* that interprets the dialect and does the work on the data

One example was a macro dialect in an editor prototype, another is for text transformation. Both times I have loop constructs defined in the dialect, so it's natural to use `while` to \*reparse* these loops over and over, executing the respective code and checking conditions. Based on these conditions in both cases I might want to backtrack the whole loop or accept it. It makes both \*deep* `break` and `reject` useful. What held me back is I couldn't reason about my own code with these constructs behaving the way they do.

Sure, instead of reparsing the loop I could generate the Red code from the dialect expression and run that code. It will be more efficient, but reparse approach is useful when:  
\- you don't care about performance, sacrificing it for development speed and ease  
\- the code will run once or twice and loops are not long  
\- you don't wanna deal with recursion, as parse provides it out of the box  
\- you want just a proof of concept, postponing the optimizations

giesse

[16:13](#msg5b57501632fa1b74086290d6)&gt; And the more is covered the simpler will become expressions, no?

No, it doesn't work that way. All you get is clutter. It's like filling your room with more and more stuff, until there's no more space for you.

[16:18](#msg5b575139c579673e6b902dfe)And to be clear, I don't think we should remove `break`. I don't know if we \*need* `reject`, because that's very subtle, and it may be that code turns out to be better without it (you have to think more about your code, which people don't want to do, but it's a very good thing to do). Not having `break` in R2 has been quite painful in the past. But, we also have other construct that we didn't have back then, so it's not trivial for me to make a conclusion without trying to solve problems and thinking about it for a long time.

[16:23](#msg5b57528ac579673e6b90332a)IMHO, it's best to start with a minimalistic set and then add/change stuff based on actual real world problems. This works nicely when it's very easy to add and change stuff, and experiment. If you have to wait months or years for your extension to be added to the language so you can play with it, the approach fails.

With Red, it's not that hard to change the code and try out your changes, then submit a PR. That being said, it's not trivial either (this is one of the main reason why at some point I decided that Topaz should be written in Topaz, not a lower level dialect like Red/System). Perhaps we should have a mezz level implementation, like my `topaz-parse`, to allow people to play with this more. So if you stumble upon a problem, you can go ahead and make a change and submit a PR, then we can discuss both the PR and the problem it came from, and decide if it should go upstream to Red or not.

hiiamboris

[16:50](#msg5b5758b8b2411177a26ab534)Don't you think this logic is like "why do we have \*append\*? let's remove it since \*insert* can do the same job"?

giesse

[16:50](#msg5b5758cbc579673e6b9047be)Something that might not be obvious: once you \*add* something to the language, you can never \*remove* it (because it would break existing code).

(It's not really "never", but it's really hard to take stuff away.)

[16:50](#msg5b5758e4c86c4f0b472f8bb2)`insert tail` is so common that you get `append` for convenience and readability.

[16:51](#msg5b5758fa05e1cc355309d903)if you were writing `end skip` all the time, you'd get `fail`, even though they are the same thing.

[16:53](#msg5b57599e9ddf5f4aad06992e)it's a difficult balancing act. Minimalism is appealing but not practical. Bloat is even worse. There is no magic way to find the right spot in-between. It's a process. Which is what I'm trying to express; you don't just say "oh, this sounds useful", there's a non-trivial process to figure out what gets added and what not.

At the end of the day, @dockimbel makes the final decisions. We just provide him with the data he needs to make the decisions. :)

[16:59](#msg5b575af3f477e4664abc6d5e)Think of it this way. `reject` is non-trivial to emulate if you don't have it. So if it's something that can pop up from time to time, it's worth having it. If it never pops up because we can show that you can always achieve your goal in a different, cleaner way, then it's not worth having it.

But if you have something like `fail`, that is easy to achieve with just `end skip`, and is only used in obscure cases, then it's not worth having. It might very well be that once you have `if`, for eg., things like `fail` don't make much sense anymore. Even `none` has perhaps been made obsolete by `opt`(and was just kept in R2 for the "can't take things away" reason). Ie. I believe the original intent was things like `a | b | none` which is the same as `opt [a | b]`.

hiiamboris

[17:07](#msg5b575cbab2411177a26ac106)Yeah, and I've already shown in the ticket that `fail` and `none` can be both expressed easily. No big deal if we won't have them. On the other hand, @9214 vision of `break` that does not terminate the loop right away gives a sudden meaning to `fail`, so maybe it's worth having instead of reinventing every now and then...

[17:09](#msg5b575d53c331e035521528b8)@giesse so your call would rather be to bust `fail` `none` and `reject` and see where it leads, right?

giesse

[17:47](#msg5b576618b2411177a26add77)No, my call would be to look at actual code and how they are being used.

I would fix the obvious bugs, at least from the POV of Nenad. Then wait for more data before making big changes. Additionally if we have enough people interested in messing around with this stuff we can put together a mezz implementation for experiments. (Or we just need to play with the actual Red/System code.)

9214

[18:00](#msg5b57693105e1cc35530a07e2)But they are not being used, because they're considered to be:  
\* high-level  
\* broken (by design or not)

Go write a lot of Parse code, then come here with "man I wish I could just write X instead" ideas and idioms proposals. Then we'll see where they overlap and which one of them can be named `reject`, `fail` or whatever.

[18:01](#msg5b57699263cf1636bdec1a03)As I already said, there's a need in error recovery and reporting, either in parsing or in a DSL. These 3 keywords are supposed to fill this niche.

giesse

[18:24](#msg5b576ee1f10ffa0b48ac5def)If there's a need then you can write examples, or, other people will.

If they're not being used and they will never be used then it will be easy to remove or change them.

hiiamboris

[18:27](#msg5b576fa263cf1636bdec3026)So the plan is ☻?  
1\. we get rid of block rule notion, implementing @9214's model  
2\. fix the bugs  
3\. properly document what these rules do and don't and how to use them  
4\. fast forward the time half a year into the future  
5\. return to the question and observe what ppl have written with regard to usefulness of these 3 rules  
6\. start cutting :) if it still makes sense at the time...

sounds about right?

## Wednesday 25th July, 2018

guraaku

[09:28](#msg5b5842a3b1b9572ed3dc7322)Hi @giesse , I have been playing around with Parse for the past couple of months, so here's a couple of thoughts from me... not that I have really put much thought yet into whether these things are really bad, or how I would want to change them, but just some initial thoughts from my experience

[09:28](#msg5b5842bf07be4357bdeb3fd6)1. red code in brackets will get done, even if eventually the rule fails

[09:29](#msg5b5842e5db8bd24550af6760)2. same with collect/keep - things get kept even if the rule eventually fails

[09:29](#msg5b5842ef5301255724c3d4b0)sorry, that should have been 2 :)

[09:29](#msg5b584316db8bd24550af6837)But yes, it just seems a bit inconvenient to me that things are happening, even when the rule fails

9214

[09:30](#msg5b5843301be9bb57bcc1336c)Are we talking about Red parse or Topaz parse?

guraaku

[09:30](#msg5b5843486dd1ab57233b5ac6)Hi @9214 , sorry, I'm talking about Red ! Was the topic Topaz ?

[09:31](#msg5b584354d2f0934551cdd174)actually, I don't even know what Topaz parse is @\_@

9214

[09:31](#msg5b5843694d2e050b45528140)No, it's just that I never saw p. 1 happenning, and p. 2 is by design.

guraaku

[09:31](#msg5b58438ed2f0934551cdd1f6)really ?

[09:32](#msg5b58439ad2f0934551cdd251)I'll see if I can dig up an example

9214

[09:33](#msg5b5843dedb8bd24550af6b21)It's by design that paren expression are evaluated if and only if accompanied rule returns success. Maybe you hit some loop-related edge case.

guraaku

[09:33](#msg5b5843e193395d1d96483261)3. bit unsure about the best way to do something while parsing, eg build an AST, and still keep the code clean.

[09:33](#msg5b5843e4d2f0934551cdd315)ah

[09:33](#msg5b5843f732d98c2ed2b320f6)sorry..that's 3 ! ah ok, I think I'm getting autocorrected ??? I'm sure I typed 3.....

9214

[09:34](#msg5b5844106dd1ab57233b5d63)1. you  
1\. should  
1\. type  
1\. them  
1\. together

guraaku

[09:34](#msg5b58442593395d1d9648338e)eg, I'd like to have a nice clean set of parse rules, and then be able to apply different code to do different stuff, without polluting my nice clean rules

[09:35](#msg5b584449db4bcb16e876be09) too late for that :P

[09:35](#msg5b58446b07be4357bdeb4577)ok, then 4, I think as previously mentioned by someone, error handling and reporting useful messages to users - not sure the best way to go about that

9214

[09:36](#msg5b5844a1b1b9572ed3dc7a1f)@guraaku you can use `parse/trace` for AST/CST building, to some extent (haven't done it personally, just speculating). I don't think API is fine-grained enough, but you already can shoot your feet off.

guraaku

[09:37](#msg5b5844bf6dd1ab57233b5e9f)yes, I wondered about that as a possibility

[09:38](#msg5b5844fea31e386158aeab64)so far, I've been doing collect/keep, and I've found this actually pretty good, basically building up nested blocks representing my language elements

[09:39](#msg5b58454ddb8bd24550af7069)if anyone is interested, here's a little example

[09:39](#msg5b58455e6dd1ab57233b60ee)

```
[definition IsAdult 
            [expression 
                [simpleexpression 
                    [term 
                        [factor 
                            [fieldreference 
                                [record "Customer" endrecord] 
                                [field "Age" endfield] 
                            endfieldreference] 
                        endfactor] 
                    endterm] 
                endsimpleexpression] 
                [relation ">" endrelation] 
                [simpleexpression 
                    [term 
                        [factor 
                            [number 15 endnumber] 
                        endfactor] 
                    endterm] 
                endsimpleexpression] 
            endexpression] 
        enddefinition]
```

[09:40](#msg5b58459093395d1d964837a0)then it's straightforward to write code to do whatever you want with that block

9214

[09:41](#msg5b5845bfc0fa8016e736c327)It's too wordy for an AST :)

guraaku

[09:41](#msg5b5845d407be4357bdeb490a)ah, works for me for now !

9214

[09:41](#msg5b5845e04d2e050b45528811)Cool then. :+1:

guraaku

[09:41](#msg5b5845e61be9bb57bcc13ad5)I just wanted to make it clear what the "objects" were, and where they started and finished

[09:42](#msg5b5845f0bd17b9615900ee84)rather than creating actual objects

[09:43](#msg5b584631bd17b9615900ef04)don't know if you remember, but at first had a few issues, that mostly turned out to be little annoyances rather than anything major

[09:43](#msg5b58464d32d98c2ed2b32782)like, getting lots of empty blocks, because I would start collecting, and then the rule would eventually fail

9214

[09:45](#msg5b5846d54d2e050b45528aea)Yeah, I've stumbled on that once in a while, especially with recursive grammars.

guraaku

[10:06](#msg5b584bc2db4bcb16e876d535)so it may just be a lack of knowledge about how to do things, but, in general, I'd say, parsing is really very good - it's the next steps that are more problematic

[10:07](#msg5b584bffee7b230b4466e9c6)and usually, it's not just parsing that you might want to do, it is those further steps

toomasv

[16:21](#msg5b58a3774d2e050b4553cb7b)@9214 @guraaku I think this proves your first point:

```
>> unset 'x unset 'y unset 'z
>> parse [a b c][(x: 1) 'g | (y: 2) 'h | (z: 3) 'f]
== false
>> print [x y z]
1 2 3
```

9214

[16:22](#msg5b58a3c732d98c2ed2b469d0)How's that?

[16:23](#msg5b58a4156dd1ab57233ca6ae)It's the same as writing `[none (x: 1) [fail] | none (y: 2) [fail] | ...]`

toomasv

[16:25](#msg5b58a48ed2f0934551cf2c02)Yes, in each alternative `paren` before the failure is evaluated.

9214

[16:28](#msg5b58a54007be4357bdec9c2d)But paren expression and failed rule are not related one to another in this case.

giesse

[16:40](#msg5b58a7e3a31e386158afffdf)@guraaku the important part to understand is that `parse` is not doing anything special - just one thing at a time, like any other procedural language.

So, if you saw something like:

```
print "Hello"
if a > 10 [print "World"]
```

...you wouldn't think "oh, why is Hello being printed even though the condition later fails?", because you don't expect the `if`, that happens "later", to affect the `print` happening "earlier".

In the same way, if you have something like `[(print "Hello") integer! (print "World")]`, you need to think of it in terms of:

```
print "Hello"
if integer? current-value [print "World"]
```

...rather than imagining that `parse` would try to magically determine what the programmer intended to happen.

[16:41](#msg5b58a840bd17b961590235f8)The same is true for `collect` and `keep`. So \*where* you put them in the rules becomes very important. (And this is part of why things like `ahead` were introduced.)

[16:45](#msg5b58a916b1b9572ed3dddb76)@guraaku since somebody mentioned it, I will point out that my main motivation behind a completely different and incompatible `parse` in Topaz was indeed to do stuff like create ASTs while parsing. It's not that hard with REBOL and Red's `parse`, but it's not as easy as it should be IMHO.

I ported it to Red recently: https://github.com/giesse/red-topaz-parse  
Please be aware that it is incomplete.  
An example that builds an AST can be found here: https://github.com/giesse/red-topaz-parse/blob/master/examples/expression-parser.red

toomasv

[17:33](#msg5b58b47232d98c2ed2b4a920)@9214 May be I have failed to notice exact definition of rule, but it seems to me it depends how "rule" will be defined. You seem to define it as match-try, I tend to see it as one alternative separated by `|`. In latter view a `paren` can start a rule initializing it.

## Thursday 26th July, 2018

greggirwin

[00:59](#msg5b591cdad2f0934551d07c3e)&gt; I'd like to have a nice clean set of parse rules, and then be able to apply different code to do different stuff, without polluting my nice clean rules

Just have the actions contain a function call in that case. If the arity varies by what you're doing, you can work around that with block args to your func.

guraaku

[12:15](#msg5b59bb7ca31e386158b2e0d2)thanks @giesse , yes, that explanation makes sense, I'll keep it in mind

## Friday 3th August, 2018

gltewalt

[04:42](#msg5b63dd4a8eb2d52fde3ae022)How can I get the beginning of a markdown code fence, like:

x: {\\

```
some code...
\
```

}

````
fence: ["```" newline]
parse x [copy f to fence]
````

[04:47](#msg5b63de526d45752f9880f689)I want to change all occurences of  
\\

```
code...
\
```

to

\\

```
red
code...
\
```

[04:47](#msg5b63de680cfcf02fdf0333bd)First I have to write something that matches

toomasv

[05:03](#msg5b63e22685278d705e79b4c0)@gltewalt How about this:

````
parse x [some [thru "```" insert "red" thru "```"]]
````

Or, if you need to check for newline too:

````
parse x [some [thru "```" [ahead newline insert "red" | skip] thru "```"]]
````

gltewalt

[05:08](#msg5b63e33e85278d705e79bc52)How about code fences of the type that are: indent 4 spaces

[05:08](#msg5b63e34904436a1ae60c9005)thru 4 space?

toomasv

[05:12](#msg5b63e42d8eb2d52fde3b0676)If all and only 4 spaces is what you want, then yes. Example would help.

gltewalt

[05:20](#msg5b63e6010cfcf02fdf035afb)https://i.imgur.com/wlVCrOb.jpg

[05:21](#msg5b63e6608eb2d52fde3b1069)at least 1 tab (4 spaces)

[05:22](#msg5b63e695c917d40dc2367dc7)Produces a code block.

I'd need to replace that with the  
\\

```
red
\
```

fence

[05:27](#msg5b63e7aa5d1362758b264b62)trim out the tabs maybe?

toomasv

[05:30](#msg5b63e8906d45752f9881271f)Code block for each command/response pair or until next empty line or through last line with indent?

gltewalt

[05:31](#msg5b63e8b2c917d40dc2368a90)through last line with indent

toomasv

[05:45](#msg5b63ec0a0cfcf02fdf037c50)I propose something like this instead of parse:

````
insert find text "    " "```red^/"
insert next find find/last text "    " newline "```^/"
````

gltewalt

[05:51](#msg5b63ed5585278d705e79eec3)Hmmm

[06:02](#msg5b63f0016d45752f98814ca0)Woops. Wiped out my local clone with this line. Changes all the file contents to "false".

`foreach f read %. [write f parse read f [some [thru "`" insert "red" thru "`"]]]`

[06:03](#msg5b63f030e9ab53770c81b3ca)Not a big deal because I can re-clone

[06:09](#msg5b63f1a504436a1ae60cd8be)Funny though :laughing:

endo64

[06:11](#msg5b63f1f8cf8ab4758a9795d7)Btit there might be more than one code block above code would find the very first and the very last one, which corrupts the file.

[06:11](#msg5b63f209945df30dc1488314)* but

gltewalt

[06:11](#msg5b63f2153bca002dcbb668b6)Which code, Endo?

endo64

[06:12](#msg5b63f23974470f5c9841dd88)Thomas's code.

gltewalt

[06:12](#msg5b63f25274470f5c9841ddec)For the indented code blocks?

endo64

[06:13](#msg5b63f27d3bca002dcbb66a61)finds the first 4 spaces and then finds the last 4 spaces, there might be other 4 space indented blocks between.

toomasv

[06:13](#msg5b63f2843a5a2d2f99e80f34)@endo64 Yes, but I specifically asked, if code extends to the end of last line with indent.

gltewalt

[06:14](#msg5b63f2c83bca002dcbb66c9a)Wouln't they render as separate sections if other blocks are in between?

toomasv

[06:14](#msg5b63f2d4e8698a2dcafefece)Nope

gltewalt

[06:14](#msg5b63f2e2945df30dc1488720)Sorry

toomasv

[06:22](#msg5b63f4b5e9ab53770c81ceeb)If there are several blocks of code with other text in between, you can use this:

````
text: {Beginning
    red>> "a" = "A"
    == false
    red>> "a" = "A"
    == false

    red>> "a" = "A"
    == true
    red>> "a" = "A"
    == false
Some other text.
    red>> "b" = "B"
    == false
    red>> "b" = "B"
    == false

    red>> "b" = "B"
    == true
    red>> "b" = "B"
    == false
}
parse text [some [to "    " insert "```red^/" thru [newline not [newline | "    "] insert "```^/"]]]
print text
````

Outcome:  
\-------------  
Beginning

```
red>> "a" = "A"
    == false
    red>> "a" = "A"
    == false

    red>> "a" = "A"
    == true
    red>> "a" = "A"
    == false
```

Some other text.

```
red>> "b" = "B"
    == false
    red>> "b" = "B"
    == false

    red>> "b" = "B"
    == true
    red>> "b" = "B"
    == false
```

\-----------------  
`thru` part may need modification, e.g. detecting for `end` if needed.

[06:31](#msg5b63f6be0cfcf02fdf03b9b7)Have to go now.

[07:05](#msg5b63fe9f5d1362758b26cd5e)@gltewalt You shouldn’t write outcome of `parse` to file. In above case it will always be `false`. `read` file to a var/word, `parse` this var, `write` var back to file.

gltewalt

[07:05](#msg5b63feb90cfcf02fdf03e5bc)Yes. Thanks.

toomasv

[07:06](#msg5b63ff0374470f5c984225e0)You are welcome!

## Thursday 30th August, 2018

guraaku

[09:39](#msg5b87bb67c2bd5d117af3178e)Hi, am still playing around with parse - now looking at reporting more meaningful error messages. Am trying the technique detailed in the answer here

[09:39](#msg5b87bb68d8d36815e5ae3f25)https://stackoverflow.com/questions/17477164/error-message-on-match-fail-in-rebol-parse

[09:40](#msg5b87bb8b58a3797aa3d8b924)anyone have any thoughts on this approach, or whether anything else is any better than this ?

[09:42](#msg5b87bbebac25fd11b5b5dbea)I'm thinking of perhaps making some function to save repeating this kind of code :-

[09:42](#msg5b87bbf660f9ee7aa4b0bb56)

```
here:
    (error: "expecting dash")
    "-"
```

[09:43](#msg5b87bc2acff55e56177fcc14)well, for certain things, we can kind of generalise this to get something reasonable

[09:43](#msg5b87bc5d11227d711decf3c9)eg if keyword "-" returned here: (error: {expecting "-"}

9214

[09:46](#msg5b87bd12e5b40332ab1bc82c)@guraaku either this or `parse/trace`, or combination of both.

guraaku

[09:48](#msg5b87bd53f86b741b05e38133)yes, was thinking about parse/trace... although at the moment, I still seem to have some issues with it

[09:48](#msg5b87bd614be56c5918b7bdd1)well, with parse-trace

[09:48](#msg5b87bd67f86b741b05e38156)and even my own implementation

[09:48](#msg5b87bd7694f8164c17be4ad0)but, it seems to hang (or at least take a very very long time....)

[09:49](#msg5b87bd91d8d36815e5ae4ad5)when a parse with the same inputs completes in normal time

9214

[09:52](#msg5b87be68d457a1406c82b13b)@guraaku your callback function should return a `logic!` value, I believe, otherwise parsing will either fail or stuck in a loop. Also, there were a couple of tickets on Github that pinpoint differences between `parse-trace` and `parse`.

guraaku

[09:53](#msg5b87be9ecff55e56177fdd21)ah ok, thanks @9214 . I'll check to see if that's my problem

[09:54](#msg5b87bef34be56c5918b7c956)hmm... presumably though, the callback function in parse-trace should be written correctly

9214

[09:55](#msg5b87bf0c1d3a5711b6bbc3e5)I can't find any tickets though. Let's start with a minimum example (if you can reproduce one).

guraaku

[09:56](#msg5b87bf41f5402f32aab114d3)yes, my grammar got so big that I have been too lazy to try to cut it down to try to pinpoint exactly why it's happening :(

9214

[09:56](#msg5b87bf6af86b741b05e38d68)Try to relax your rules a bit. IIRC hanging was related to additional block nesting or something like that (e.g. `[[a] b]` instead of `[a b]`).

[09:57](#msg5b87bf9ed8d36815e5ae562b)Or just give up on `trace` for a moment and follow @moliad's approach, as it's simple and flexible enough to tailor your exact domain.

guraaku

[10:04](#msg5b87c137f86b741b05e39749)yes, I'll do that for now

## Monday 3th September, 2018

Oldes

[19:40](#msg5b8d8e1dc2bd5d117a143eca)In REBOL is possible to use:

```
>> chars: object [digit: charset [#"0" - #"9"]]
== make object! [
    digit: make bitset! #{000000000000FFC0}
]

>> parse "123" [some chars/digit]
== true
```

In Red it fails. Could it be also supported?

[19:45](#msg5b8d8f67e5b40332ab3cf16a)Looks like paths are not supported.

[19:50](#msg5b8d9076f5402f32aad235b7)Made a wish: https://github.com/red/red/issues/3528

## Monday 26th November, 2018

dander

[20:45](#msg5bfc5b5ee25cc274054a120d)I'm trying to understand why I'm getting all these empty blocks... is there a different way I should be doing this? I want to get `[[#"a"][#"b"]]` or `[["a"]["b"]]`

```
>> parse "xx(a)xx(b)xx" [some [collect ["(" keep skip ")"] | skip]]
== [[] [#"a"] [] [] [#"b"] [] []]
```

rebolek

[20:50](#msg5bfc5c89baf43f2b9b7ae5a7)@dander it looks like a bug to me, `keep`is triggered twice, as it should be but the result makes no sense.

```
>> z: [] parse "xx(a)xx(b)xx" [some [collect [#"(" keep skip (print "keep") ")"] | skip]]
keep
keep
== [[] [#"a"] [] [] [#"b"] [] []]
```

dander

[20:53](#msg5bfc5d4dbaf43f2b9b7aecf0)@rebolek okay, thanks. I will open an issue for it then. Does this seem like a sensible approach (assuming it was behaving as expected)?

rebolek

[20:55](#msg5bfc5db5fa7bbb3fe00b5764)@dander Issue is certainly fine in such case. Either it's a bug or it's feature that does need some explaining. Nevermind that there's another problem, that `keep` in `parse` behaves like `keep/only` but that's been already reported.

[20:56](#msg5bfc5e00b6c0701052911c46)Anyway, it seems like a bug, it has to pass `(` to keep one value and it does it twice, not seven times.

dander

[20:58](#msg5bfc5e67958fc53895f3ecf7)I did find some stuff about the `keep` behavior, and it looks like \[there are some ways to control it](https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#parse-collectkeep-options-combined-with-tothru-rules) now with `pick` and `copy`, but it didn't explain what I was seeing here.

rebolek

[21:00](#msg5bfc5ed0b6c0701052912241)@dander that is very interesting, I need to look into it, thank you very much!

[21:01](#msg5bfc5f40cfa682348d8bbd4a)But all these examples use `to`. Can you have such behaviour with `keep ... | skip`?

dander

[21:07](#msg5bfc6074b6c0701052912c9a)I'm not quite sure what you are asking, but it doesn't quite seem to apply with the multiple `collect`

9214

[21:07](#msg5bfc6084e25cc274054a3559)

```
text
>> parse "xx(a)xx(b)xx" [collect some ["(" copy match skip keep (reduce [match]) ")" | skip]]
== [["a"] ["b"]]
```

```
>> parse "xx(a)xx(b)xx" [collect some ["(" set match skip keep (reduce [match]) ")" | skip]]
== [[#"a"] [#"b"]]
```

rebolek

[21:09](#msg5bfc60fe662131389422392b)@dander I am asking for a simple way to end up with `"ab"` instead of `[["a"]["b"]]`.

dander

[21:09](#msg5bfc61166621313894223a08)@9214 thanks! that does help

9214

[21:09](#msg5bfc61236621313894223a1c)@rebolek

```
>> rejoin parse "xx(a)xx(b)xx" [collect some ["(" keep skip ")" | skip]]
== "ab"
```

rebolek

[21:10](#msg5bfc6139a115c91ef7994f5c)@9214 it's nice that there are workarounds but they are still workarounds.

9214

[21:11](#msg5bfc616cd24f9324d25a2739)

```
text
>> also x: "" parse "xx(a)xx(b)xx" [collect into x some ["(" keep skip ")" | skip]]
== "ab"
```

rebolek

[21:16](#msg5bfc62a6fa7bbb3fe00b74bd)@9214 how can you explain those five empty blocks?

[21:17](#msg5bfc62ce97a8982b9a6c13af)of course it's possible to dodge this problem, but solving it would be better

dander

[21:18](#msg5bfc633e7074b903685d8693)I've opened #3612 for it

9214

[21:20](#msg5bfc63b0a115c91ef7995ecb)@rebolek `collect` will return a block in any case, if nothing was `keep`ed then block will be empty.

dander

[21:22](#msg5bfc6417a115c91ef79960aa)@9214 in this case, the skip where the empty blocks are occurring is not even wrapped in a `collect` just `parse`

[21:23](#msg5bfc6448ed6bcf1ef8657f40)is there some kind of implicit `collect`?

9214

[21:25](#msg5bfc64b2e25cc274054a5227)Dunno, I'm more concerned why it returns 5 blocks when there are 6 `x`.

[21:25](#msg5bfc64d6fa7bbb3fe00b81b4)And `parse-trace` crashes on `b`:

```
*** Script Error: PARSE - KEEP is used without a wrapping COLLECT
*** Where: parse
*** Stack: parse-trace
```

rebolek

[21:27](#msg5bfc6537b6c0701052914ad0)

```
>> parse "xx(a)xx(b)xx" [some [collect ["(" (prin #"?") keep skip (prin #"!") ")"] | skip (prin #".")] (print "")]
..?!..?!..
== [[] [#"a"] [] [] [#"b"] [] []]
```

[21:27](#msg5bfc6546b6c0701052914b20)it makes no sense, sorry

[21:31](#msg5bfc663ae25cc274054a5de4)

```
>> parse "xx(" [some [collect ["(" keep skip ")"] | skip]]
== [[] []]
>> parse "xx(a" [some [collect ["(" keep skip ")"] | skip]]
== [[] [#"a"] []]
```

[21:31](#msg5bfc664ea115c91ef799717f)this is really strange

9214

[21:33](#msg5bfc669b958fc53895f42d23)

```
text
>> parse [x][some collect skip]
== []
>> parse [x x][some collect skip]
== [[]]
>> parse [x x x][some collect skip]
== [[] []]
```

dander

[21:35](#msg5bfc6729b6c0701052915aad)are `keep`s supposed to backtrack if a later part of the rule is not matched?

rebolek

[21:37](#msg5bfc67aeed6bcf1ef8659bbb)

```
>> parse [x] [some [collect [keep 'x | skip]]]
== [x []]
```

dander

[21:39](#msg5bfc6806f048fa105129c2e4)to answer my own question: "no"

```
>> parse [x y z][collect [some [[keep 'x 'z] | keep skip]]]
== [x x y z]
```

[21:39](#msg5bfc6818f59704348e0b4a4a)or at least it isn't currently the case

rebolek

[21:40](#msg5bfc685697a8982b9a6c3860)@dander No, this is actually fine, no rule does that.

dander

[21:41](#msg5bfc6898d24f9324d25a548a)@rebolek yeah, it seems fine to me. I was just wondering which way it worked

9214

[21:42](#msg5bfc68d587c4b86bcc20903a)@dander rules don't backtrack, Parse does. Rule just returns either success or failure.

rebolek

[21:44](#msg5bfc69567074b903685dadcb)Right, something like `killer-robot-rule: ['kill 'everybody (kill/everybody now) /s (message "just joking")]` is bad idea.

dander

[21:49](#msg5bfc6a6c6621313894228397)😁

## Tuesday 27th November, 2018

toomasv

[05:18](#msg5bfcd38a97a8982b9a6edbd9)@dander I think the normal way to do this would be:

```
parse "xx(a)xx(b)xx" [collect some [#"(" collect [keep skip] #")" | skip]]
;== [[#"a"] [#"b"]]
parse "xx(a)xx(b)xx" [collect some [#"(" collect [keep copy x skip] #")" | skip]]
;== [["a"] ["b"]]
```

@rebolek Your examples seem quite normal behaviour. If yos put `collect` into `some`, then on each step it returns block or kept entity.

dander

[05:52](#msg5bfcdbac87c4b86bcc234229)@toomasv oh, I think I understand it now. So even though the rule following the `collect` doesn't match, it still starts a new 'collection' for each iteration of the `some` rule. Though as @9214 pointed out, the missing first empty block is still strange...

toomasv

[07:15](#msg5bfcef18ced7003fe1915d08)@dander First encounter with `collect` creates the initial block, so first "x" is responsible for outer block in your example. But consider this:

```
parse "xx(a)xx(b)xx" [collect some [collect ["(" keep skip ")"] | skip]]
;== [[] [] [#"a"] [] [] [#"b"] [] []]
```

And in my previous example, if first `collect` is removed, `[#a]` will become the collection block:

```
parse "xx(a)xx(b)xx" [some [#"(" collect [keep skip] #")" | skip]]
;== [#"a" [#"b"]]
```

[07:21](#msg5bfcf092ced7003fe1916591)One more way to get "ab" out of it :smile::

```
parse x: "xx(a)xx(b)xx" [some [remove #"(" skip remove #")" | remove skip]] x
;== "ab"
```

[07:31](#msg5bfcf2c5ced7003fe191739b)@rebolek In your "really strange" example last block is due to stepping to end. Compare:

```
parse "xx(a" [some [collect ["(" keep skip [end | ")"]] | skip]]
== [[] [#"a"]]
```

rebolek

[07:45](#msg5bfcf633f048fa10512d3943)@toomasv I need to take a look at it again, I was really tired yesterday.

toomasv

[07:46](#msg5bfcf66c97a8982b9a6fa6c7):sleeping: Take rest!

rebolek

[07:47](#msg5bfcf68987c4b86bcc23e1bb)If only I could! :)

dander

[08:12](#msg5bfcfc59ced7003fe191addb)@toomasv, thanks so much for your careful explanation. It has really helped me a lot!

toomasv

[08:14](#msg5bfcfcdee25cc274054de22d)@dander You are most welcome! Glad to be of help.

hiiamboris

[15:29](#msg5bfd62dae25cc2740550899f)&gt; And in my previous example, if first `collect` is removed, `[#a]` will become the collection block:

```
parse "xx(a)xx(b)xx" [some [#"(" collect [keep skip] #")" | skip]]
;== [#"a" [#"b"]]
```

This is scary

## Wednesday 28th November, 2018

greggirwin

[03:51](#msg5bfe10cdced7003fe198b0a1)Scary and confusing we should be able to address with docs and any necessary fixes. :^)

toomasv

[04:25](#msg5bfe18b2b6c07010529c24fc)But predictable, and with kind of logic.

hiiamboris

[08:02](#msg5bfe4ba87074b90368699f9a)@toomasv if you ask me, I'd say it's a design flaw, and that multiple invocations of `collect` within a single parse run should be forbidden without an explicit outer `collect` block.

rebolek

[08:05](#msg5bfe4c31ed6bcf1ef871914f)@hiiamboris I don't think they should be forbidden, but I agree that the output should be more predictable that this:

```
>> parse "abcd" [collect [keep #"a" keep #"b"] collect [keep #"c" keep #"d"]]
== [#"a" #"b" [#"c" #"d"]]
```

hiiamboris

[08:18](#msg5bfe4f6f7d26db1e830a6ec6)@rebolek You're right.  
And since parse can only return a single block, I think it will make sense for it to join the collections:

```
== [#"a" #"b" #"c" #"d"]
```

And if more depth is required, one should be explicit about it:

```
>> parse "abcd" [collect [collect [keep #"a" keep #"b"] collect [keep #"c" keep #"d"]]]
== [[#"a" #"b"] [#"c" #"d"]]
```

toomasv

[09:59](#msg5bfe66eeed6bcf1ef87231dd)@hiiamboris Why on earth would you use multiple collects if you want flat output?  
I think there is nothing wrong with current design, although good practice would be to be explicit about your intention. E.g. @rebolek's example could better be written as:

```
parse "abcd" [collect [keep #"a" keep #"b" collect [keep #"c" keep #"d"]]]
```

But current form is ok too IMO, if you understand how `collect` in `parse` works.

hiiamboris

[10:24](#msg5bfe6cd2f849b222e0b7e520)@toomasv Yes, but also why on earth would I want to rely on rather questionable side effects of the current design?

toomasv

[10:31](#msg5bfe6e8ff849b222e0b7f2b1)How is it side-effect?  
Mock-up algo  
1\. `collect` with following rule is seen  
2\. collection-block is created  
3\. things are kept into it if any  
4\. if there is already a collection-block,  
current collection is appended to it,  
otherwise currrent collection will be base collection

[11:08](#msg5bfe773ccfa682348d9934c8)Now `parse "a" [collect collect keep "a"]` is ok, because `collect keep "a"` is normal rule, and we can rewrite the example as`rule: [collect keep "a"] parse "a" [collect rule]`.

hiiamboris

[12:50](#msg5bfe8f27d24f9324d267f17b)Practicing more bad rules ☺

```
p: []
prefix: [collect into p [any keep ["+" | "-"]]]
digits: [collect [any keep ["1" | "2" | "3"]]]
letters: [collect [any keep ["a" | "b" | "c"]]]
```

```
>> parse "123a" [collect [digits letters]]
== [[#"1" #"2" #"3"] [#"a"]]
>> parse "123a" [digits letters]
== [#"1" #"2" #"3" [#"a"]]
>> parse "123a" [prefix digits letters]
== true

>> parse "123a" [[prefix |] digits letters]
== true
>> parse "123a" [[digits | prefix digits] letters]
== [#"1" #"2" #"3" [#"a"]]
```

[12:58](#msg5bfe90eef048fa10513798f3)@toomasv what I dislike is that the logic:  
if `parse s [rule]` returns `b1` (`block! = type? b1`)  
then I expect `parse s [collect [rule]]` to return `b2 = [b1]`  
But this doesn't hold true:

```
>> parse "123" [digits letters]
== [#"1" #"2" #"3" []]
>> parse "123" [collect [digits letters]]
== [[#"1" #"2" #"3"] []]
```

):

rebolek

[13:00](#msg5bfe917e958fc5389501e99f)Because blocks in parse rules have bit different meaning than in Red itself

[13:00](#msg5bfe9183b6c07010529f01a9)

```
>> parse "abc" ["abc"]
== true
>> parse "abc" [["abc"]]
== true
>> parse "abc" [[["abc"]]]
== true
```

[13:01](#msg5bfe9197f849b222e0b8dccb)Do you expect `true [true] [[true]]` here?

hiiamboris

[13:11](#msg5bfe93f58dffd748dbf6dbc7)@rebolek that's why I wrote `block! = type? b1` :)

[13:12](#msg5bfe9434ed6bcf1ef8736024)If it returns block, then it's a collection. Putting a collection into a collection is like append/only of one block into another.

[13:16](#msg5bfe953c7d26db1e830c3feb)I mean, I see why it's done as it is. But I'm for symmetry, as symmetry is simplicity and simplicity is beauty ☺

toomasv

[13:37](#msg5bfe9a24f59704348e197d79)@hiiamboris In your `[prefix digit letters]` case what did you expect?

hiiamboris

[13:43](#msg5bfe9b97f59704348e19885f)@toomasv I expected `[#"1" #"2" #"3" [#"a"]]` although would rather like it to be `[[#"1" #"2" #"3"] [#"a"]]` or `[#"1" #"2" #"3" #"a"]`. Definitely not just `true`, as all my collects were lost.

toomasv

[13:44](#msg5bfe9bcbcfa682348d9a288e)@hiiamboris

```
>> parse "123a" [prefix digits letters]
== true
>> head p
== [[#"1" #"2" #"3"] [#"a"]]
```

hiiamboris

[13:45](#msg5bfe9bfa6621313894309cfa)Aha! So it sort of "remembered" `into` destination?

toomasv

[13:46](#msg5bfe9c1eced7003fe19c22c4)`prefix` initiated the collection-block

hiiamboris

[13:46](#msg5bfe9c25e25cc27405585b30)I see.

## Tuesday 18th December, 2018

dockimbel

[13:42](#msg5c18f9634e0d6621ba116f18)That was an interesting discussion about `collect`. If you can figure out a better trade-off (easy of use vs easy of reasoning vs implementation complexity) for `collect` semantics, by all means write a REP so we can discuss about it.

[13:45](#msg5c18f9e89f431114185d4773)For example, would a `/collect` refinement for `parse` be a better option to trigger the collecting mode instead of waiting to encounter the first `collect` keyword and cause some harder-to-predict results? As collecting mode changes the type of output for `parse`, it would make sense to make it more explicit in form of a refinement. Though, it then looses the ability to dynamically switch between the validation/collecting modes from the rules themselves, but I guess that's a very rare use-case (I doubt anyone ever relied on that feature).

## Wednesday 26th December, 2018

endo64

[06:35](#msg5c2321433c4093612c62ce4d)`parse/collect` looks good to me.  
What about keeping both? `parse/collect` acts like it already found a collect inside the rule block just like `parse blk [collect ...]`

hiiamboris

[11:50](#msg5c236aee23323d58bd28d217)keeping both is the only option here, since parse can encounter nested `collect` rules

endo64

[14:05](#msg5c238a95ab910e7d3ad626a7)@hiiamboris That's right

## Thursday 27th December, 2018

hiiamboris

[20:33](#msg5c253715db5b5c6883173043)@dockimbel Just REPped it: https://github.com/red/REP/issues/39

## Friday 28th December, 2018

dockimbel

[03:50](#msg5c259d9f5064a51f83885ee2)@hiiamboris Thanks.
