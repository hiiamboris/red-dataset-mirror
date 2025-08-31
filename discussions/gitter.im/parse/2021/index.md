# Archived messages from: [gitter.im/red/parse](/gitter.im/red/parse/) from year: 2021

## Monday 11st January, 2021

gltewalt

[07:46](#msg5ffc026c9632f63d870d07d7)Percy the Parse :mouse2: - finding his way `to end` of mazes

[07:47](#msg5ffc027afe007479e4046bf9):mouse:

## Monday 25th January, 2021

gltewalt

[22:47](#msg600f4a8c004fab47416551fd)So getting back acquainted with parse (not that I was especially acquainted before), how to parse out all the words in a string that come before "=&gt;" ?  
Using `collect/into`

`"hello => some text..."`

[23:01](#msg600f4de436db01248aa0006e)Oh, probably just `[copy my-word to "=>"]` ?

greggirwin

[23:14](#msg600f50bcd8bdab47395c7c59)`to` works well in simple cases, but may skip things you didn't intend if your data isn't regular.

gltewalt

[23:38](#msg600f56708816425540ed955c)given `txt: "Hello => some text... World => other text"`

[23:40](#msg600f56dbcae490555f69e562)`parse txt [some [collect [keep to "=>"]]]`

Not quite

[23:41](#msg600f57313855dd07fd7a870c)looking for `["Hello" "World"]`

[23:44](#msg600f57c42cb18a437c4008a2)I'm sure I've got things out of order..

## Tuesday 26th January, 2021

gltewalt

[00:52](#msg600f67ca6b20cf7730da216b)Dag nab it...

[01:06](#msg600f6b1536db01248aa053e5)What I really need is `Between whitespace and =>`

[01:07](#msg600f6b366b20cf7730da2978)Sortof

[03:12](#msg600f88853855dd07fd7b09d4)

```
>> words: copy []
== []
>> parse txt [any [collect into words [keep to "=>" thru lf]]]
== true
```

[03:12](#msg600f888c6b20cf7730da74ae)Like so?

toomasv

[04:40](#msg600f9d59d8bdab47395d39c7)

```
>> parse txt [s: collect any [ahead [some #" " "=>"] :s keep to #" " some #" " "=>" | #" " s: | skip]]
== ["Hello" "World"]
```

gltewalt

[04:53](#msg600fa03236db01248aa0d67d)Thanks but I cant make sense of that yet

[05:09](#msg600fa40bdfdbc1437fb1cbfc)If you were collecting the word values from `help-string action!` it would be the same?

greggirwin

[05:12](#msg600fa4c92cb18a437c40c783)

```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                      2   3              4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[05:16](#msg600fa5a26244ee1450b1bfc0)Oh for a fixed pitch font in Gitter. I think I have those lined up OK now.

[05:18](#msg600fa6266b20cf7730dab8be)The trick is that `s:` sets the position just past the last known space, and part 2 (`:s`) moves the input \*backwards* to that position, so it can copy the last word before the `=>` marker.

toomasv

[05:21](#msg600fa6dca2354e44acaa58af)Thanks @greggirwin , I started explaining it too, and then changed the rule a bit, and here it is with explanation:

```
parse txt [s: collect any [some #" " "=>" e: :s keep to #" " :e | #" " s: | skip]]
```

Explained:

```
[s:                    ; record start of the text for case the word we want is in the very beginning
collect any [          ; it doesn't really matter if it is `any` or `some`
                       ; Principal alternative:
  some #" " "=>"       ;   we hit some spaces and "=>" (let's call it "separator")
  e:                   ;   record position after separator
  :s                   ;   go back to last recorded position before separator ...
  keep to #" "         ;   ... and keep word between that position and next space
  :e                   ;   now jump to position after separator and continue from there
                       ; Second alternative:
| #" " s:              ;   we meet a space and record position after that, so we remember last position before we hit separator.
                       ;   Notice that this rule *has* to be after the first one, otherwise we'll hit spaces before "=>" first
					   ; Third alternative:
| skip                 ;   just skip everything else
]]
```

greggirwin

[05:22](#msg600fa7256244ee1450b1c2de)Great minds. :^)

toomasv

[05:25](#msg600fa7bcdfdbc1437fb1d3a0):smile\_cat:

[05:48](#msg600fad2cac653a0802e1af16)But it is still too brittle. Suppose you have text where "=&gt;" may have no spaces before it. Here is solution:

```
txt: "Hello  => some text... World=> other text ! =>"
form parse txt [s: collect any [ahead [any #" " "=>" e:] b: keep (copy/part s b) :e | #" " s: | skip]]
;== "Hello World !"
```

[05:54](#msg600fae9a8816425540ee7200):point\_up: \[January 26, 2021 7:09 AM](https://gitter.im/red/parse?at=600fa40bdfdbc1437fb1cbfc)

```
>> txt: help-string find
== {USAGE:^/     FIND series value^/^/DESCRIPTION: ^/     Returns the series where a value is found, or ...
>> form parse txt [s: collect any [ahead [any #" " "=>" e:] b: keep (copy/part s b) :e | #" " s: | skip]]
== {/part /only /case /same /any /with /skip /last /reverse /tail /match}
```

gltewalt

[06:03](#msg600fb0ba2cb18a437c40e146)Thanks ghys.

[06:03](#msg600fb0bf3855dd07fd7b65ee)Guys

toomasv

[06:03](#msg600fb0cd410c22144022c03a)To make it even more robust, use `ws` instead of `#" "`.

```
ws: charset " ^-^/"
rule: [s: collect any [ahead [any ws "=>" e:] b: keep (copy/part s b) :e | ws s: | skip]]
print txt: "Hello => some text ...^/World=>other text^-!^/=>end"
;Hello => some text ...
;World=>other text	!
;=>end
form parse txt rule
;== "Hello World !"
```

gltewalt

[06:04](#msg600fb0ddcf8b82773454d479)Things to play with tomorrow

[06:06](#msg600fb181a2354e44acaa7301)`ws: charset reduce [space tab cr lf]`

toomasv

[06:07](#msg600fb1a5004fab47416652a1):)

## Thursday 4th February, 2021

GiuseppeChillemi

[10:06](#msg601bc72b1ed88c58d81d259c)Could a code act as a rule? I want to create a function that does a custom check and then returns true or false. Parse would fail or have success accordingly.

rebolek

[10:10](#msg601bc81032e01b4f7173c5f2)Yes, you can do something like `parse data [.... (result: my-custom-check) result]`.

hiiamboris

[10:26](#msg601bcbdba0246860dc2e94d5)`[... if (code)...]` ?

rebolek

[10:26](#msg601bcbef5500a97f82e6229d)right, that's easier

## Friday 5th February, 2021

gltewalt

[01:31](#msg601c9fecaa6a6f319d06a984)Are there examples somewhere for `parse/trace`?

[01:32](#msg601ca03055359c58bf220d24)I'm not sure how to use it. `parse/trace "stuff" [some rule] func`, but the func part is the part I'm not sure about.

zentrog:matrix.org

[05:03](#msg601cd1bd428d9727dd57f78f)@gltewalt: check out `parse-trace`, which has a built in callback method and might be all you need

toomasv

[09:28](#msg601d0fa1aa6a6f319d07dae8)Yes, look at result of `parse-trace` and compare it to \[this function](https://github.com/red/red/blob/master/environment/functions.red#L311) used to create the result.

GalenIvanov

[13:13](#msg601d448f9fa6765ef8fda798)@toomasv Maybe this is too easy for you, but it could be a nice exercise for `parse`: [Evaluate left-or-right  
](https://codegolf.stackexchange.com/questions/218618/evaluate-left-or-right)

toomasv

[14:42](#msg601d596a9238c531ad27dab0)@GalenIvanov Interesting exercise, thanks! And nice solution.

GalenIvanov

[14:45](#msg601d59fd0eed905f189458ec)@toomasv Thank you, it's iteresting indeed.

toomasv

[15:23](#msg601d62ff55359c58bf2428c7)@GalenIvanov Working on your solution I got it 15 chars shorter :smile:

```
func[s][a: charset"<>"until[parse s[any[t: change[a"<"a](t/1)| change[a">"a](t/3)| change["("a")"](t/2)| skip]]2 > length? s]s]
```

[15:29](#msg601d644924cd6b60d81e9fde)But for given patterns the shortest possible is just `<`.

GalenIvanov

[17:15](#msg601d7d321ed88c58d8225e1d)@toomasv That's very nice! Btw, the question allows for the input to be entirely enlosed in parens `><>` -&gt; '(&gt;&lt;&gt;)\`. This way your solution can be even shorter:

[17:15](#msg601d7d3f55359c58bf247246)

```
func[s][a: charset"<>"until[parse s[any[t: change["("a"<"a")"](t/2)| change["("a">"a")"](t/4)| skip]]2 > length? s]s]
```

hiiamboris

[17:35](#msg601d81ea9d5c644f6652225c)`func[s][r:["<"|">"]until[not parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]]]`

[17:35](#msg601d81f5063b6c68d53fbd1b)as far as obfuscation goes.. 94b

[17:38](#msg601d8279a0246860dc33f471)who needs spaces anyway

toomasv

[17:50](#msg601d85589fa6765ef8fe5e2b)@hiiamboris Wohoo! Still 22 shorter than @GalenIvanov 's latest! :clap:

GalenIvanov

[19:05](#msg601d96fcae4b9b27c1a0c811)@hiiamboris Wow! That's great! After seeing yours and @toomasv solutions, they look obvious - too bad I didn't find something similar by myself. Thank you for your lessons!

hiiamboris

[19:13](#msg601d98e5428d9727dd5a1189)we can probably cut 2 more bytes by using `while`:  
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]]][]`  
:D

GalenIvanov

[19:16](#msg601d998aa0246860dc3436de):+1:

## Saturday 6th February, 2021

GalenIvanov

[08:22](#msg601e51dca0246860dc35fd31)@hiiamboris Can I use your code in Stack Exchange's Code Golf &amp; Coding Challenges (with credits)?

toomasv

[09:12](#msg601e5d7955359c58bf26a647)@hiiamboris You probably meant:  
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]][]]`  
Typo in the end?

GalenIvanov

[09:16](#msg601e5e851ed88c58d82492a5) I observed the misplaced `]` too

[09:18](#msg601e5ed64f7d1b68e5353ef8)and using the clarification of the rules, `opt`s are not necessary, just plain "(" / ")"

toomasv

[09:22](#msg601e5fea84e66b7f7ed6a3a2)Indeed!

hiiamboris

[09:40](#msg601e640624cd6b60d8212227)Yep!

GalenIvanov

[09:45](#msg601e65390eed905f1896fa99)@hiiamboris Thank you!

hiiamboris

[09:56](#msg601e67d984e66b7f7ed6b431)`func[s][r:["<"|">"]while[parse s[to change[opt"("x: r["<"r |">"x: r]opt")"](x/1)to end]][]]` 91b

GalenIvanov

[10:00](#msg601e68b70eed905f1897011d)@hiiamboris Great - a new improvement!

toomasv

[10:02](#msg601e69279d5c644f665452be)Without `opt`'s 85 ;)

GalenIvanov

[10:05](#msg601e69d41ed88c58d824aaa2)\[86 bytes](https://tio.run/##ZVLLbsMgELz3KxAnOFW9Wqv5iF4RhyjGTarUiXCq5tB/d/eB7Vj1YWXYYR4LtfTze@lTfhm6efgej2nKqXbJk//18PnndL6UdDvUqbgp3a/ueDqMHyX54B@dq4KrTpCyyj76HB6vb5GBZexzTnnK83Ct5XA8uckl9@L48wB5@yMKBIptFQDEtRe4R4hcKEZadwMYRpEb4O4OT9wjpmB80C4XRQrFel4W0lMa09cFn1tRrGEMaoBbDd42@dzGJxpWxC5XQ0J5yULELZPBLeoiDLFDFuzJBQvvXKMpaKpNH2qTGgZPGWDDkzCE/75hltFsUjOPJxTIgDAamPHYpoZNLbR5tnvRYryGJ@yVaR2NRNc/MlrseWm9IqXCMmwsw9YE@2kIk56SG1uyyZ2qstxGTu5Wz@Pdpa/rpee36bvOu8HV8nk9j/K@ZY/fc3Z5/gM ) - I add a `s` to make it work iin TIO

## Monday 8th February, 2021

qtxie

[03:47](#msg6020b45a84e66b7f7edc049b)Why this parse rule works in Rebol but not in Red?  
https://gist.github.com/qtxie/e321ac4d1c737fc6e5d843f67cbb7de4

toomasv

[07:57](#msg6020eedf9238c531ad305010)Strange indeed! For some reason it stops parsing after `#switch` alternative, exiting parser with `false`. If forced (insert `(parse s rule-blk)` in the end of line 60) then it works. Also, Red doesn't like `halt` in the end. And there is undefined `blk` on line 62. Should be `rule-blk`?  
With said insertion, `halt` replaced by `()` and `blk` changed, both REBOL and Red produce this:

```
>> do %parse-test.r
LIBREDRT-file : "libRedRT.dll"
src: [
    print "libRedRT.dll"
]
```

[08:03](#msg6020f039a0246860dc3c1dba)Although `blk` seems not to affect the result.

gltewalt

[22:57](#msg6021c1e2aa6a6f319d137315)I have severa rules, and I get the result i want by doing multiple passes - `parse input [rule]`, repeat, but i dont get the results i want if i try to do one pass.

[22:58](#msg6021c21cae4b9b27c1aae868)Do i need to add in the backtrack? `[rule | rule2]` etc?

[22:59](#msg6021c256063b6c68d549ffe0)Does order matter?

## Tuesday 9th February, 2021

greggirwin

[00:30](#msg6021d7bc4f7d1b68e53d9bd3)Have to see the rules to know. Do you have a `some` or `any` to repeat over the rule?

gltewalt

[00:58](#msg6021de3b24cd6b60d8297d94)Yep

greggirwin

[01:04](#msg6021dfb9aa6a6f319d13b28c)Order does matter. You need to put the longest matching rules first.

gltewalt

[01:06](#msg6021e01155359c58bf2f0e2c)This is `very` deliberate and basic, down to the simplest I can make it while I stumble through it - so... don't make fun of me :sunglasses:

https://gist.github.com/gltewalt/4bdba9588bec79d111bb4056fc209e41

greggirwin

[01:18](#msg6021e2d684e66b7f7edf10fa)Will have to wait for time to dig in, but a key thing to remember is that `to` can skip over a lot of things to get to its match, so tends to be less useful when the format is less strict.

gltewalt

[01:20](#msg6021e34b55359c58bf2f1589)What should i use in place of `to`?

greggirwin

[01:20](#msg6021e356428d9727dd646565)To handle all your rules in this case, you would need `|`, but then you'll run up against `to` skipping over things, based on the order your check your rules in.

gltewalt

[01:21](#msg6021e38ba0246860dc3ea260)Most of these are reated patterns, but... little steps

greggirwin

[01:21](#msg6021e39484e66b7f7edf12c6)`| skip`. So you check your known values to match, then skip one char if none of them do.

gltewalt

[01:21](#msg6021e39784e66b7f7edf12ca)Related patterns

greggirwin

[01:28](#msg6021e5379fa6765ef808d3f6)e.g.

```
Red []

level-3-rule: [change "====" {<a href="#Lnk">} to "^/" insert "</a><p>"]
level-2-rule: [change "===" "<h3>" to "^/" insert "</h3><p>"]
level-1-rule: [change "==" "<h2>" to "^/" insert "</h2><p>"]
level-0-rule: [change "=" "<h1>" to "^/"  insert "</h1>"]
main-rule: [
    some [
        level-3-rule
        | level-2-rule
        | level-1-rule
        | level-0-rule
        ;...
        | skip
    ]
]

s: {
= Parse dialect

== Overview

Parse dialect is an embedded domain-specific language (DSL) of Red that allows concise processing of _input_ series with grammar _rules_. Parse's common use-cases are:

* *Search:* locate specific patterns;
* *Validation*: check the conformity of input to some specification;

=== Usage

Parse is invoked through the `parse` function using a simple default syntax (see <<Extra functions>> section for more details):

----
parse <input> <rules>

<input> : any series! value except for image! and vector!
<rules> : a block! value with valid Parse dialect content (top-level rule)
----
}

parse ss: copy s main-rule
print ss
```

gltewalt

[01:30](#msg6021e5b3428d9727dd646a8d)Dont need the anys?

greggirwin

[01:33](#msg6021e65632e01b4f7183afd1)The outer `some` could be `any` instead, which will handle all the sub rules.

qtxie

[02:12](#msg6021ef961ed88c58d82cfe81)@toomasv Thanks. So maybe a bug in parse?

toomasv

[04:38](#msg602211d632e01b4f71840a95)@qtxie Yes, I thought so too.

[08:53](#msg60224d7d9238c531ad33d492)@gltewalt On from @greggirwin :

```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "<" | change ">" ">"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			 change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: false)
	|				change "_" "<i>" (in-italics?: true)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: false)
	|			 change "*" "<b>" (in-bold?: true)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: false
parse r [
	any [
		 level-0-rule
	|	level-1-rule
	|	level-2-rule
	|	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	|	skip
	]
]
```

But I am not sure it works for all funcs.

Oldes

[17:52](#msg6022cbd05500a97f82f86713)Currently there is:

```
>> parse "a" [#a]
== false
>> parse "#a" [#a]
== false
```

Should not be there an error instead as it looks that `issue!` is not supported.

toomasv

[17:57](#msg6022cd19ae4b9b27c1ad92f4)Datatypes and typed data in general are not supported in string-parsing.

Oldes

[18:00](#msg6022cdae428d9727dd66ae92)Really?

```
>> parse "http://aaa b c@d <e>" [http://aaa sp "b" sp c@d sp <e>]
== true
```

[18:02](#msg6022ce469d5c644f665f10c3)Also:

```
>> parse "a" [%a]
== true
```

But I'm not sure if I like this result... but it's compatible with Rebol.

[18:09](#msg6022cfcdaa6a6f319d161a48)It is consistent with:

```
>> parse "oldes" [@oldes]
== true
```

But I have a feeling that it would be more useful if it would count also the `@` char... having `true = parse "@oldes" [@oldes]`

gltewalt

[18:49](#msg6022d93d428d9727dd66ce9b)Do I have to use that copy trick and moving around the index for this?

```
; capture word after "==== " replace Lnk with word, lowercase. Example: "==== Usage"   {<a href="#usage>"}
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
```

[18:50](#msg6022d96e0eed905f18a1d0fe)&gt; Thanks @greggirwin , I started explaining it too, and then changed the rule a bit, and here it is with explanation:  
&gt;

```
> parse txt [s: collect any [some #" " "=>" e: :s keep to #" " :e | #" " s: | skip]]
>
```

&gt; Explained:  
&gt;

```
> [s:                    ; record start of the text for case the word we want is in the very beginning
> collect any [          ; it doesn't really matter if it is `any` or `some`
>                        ; Principal alternative:
>   some #" " "=>"       ;   we hit some spaces and "=>" (let's call it "separator")
>   e:                   ;   record position after separator
>   :s                   ;   go back to last recorded position before separator ...
>   keep to #" "         ;   ... and keep word between that position and next space
>   :e                   ;   now jump to position after separator and continue from there
>                        ; Second alternative:
> | #" " s:              ;   we meet a space and record position after that, so we remember last position before we hit separator.
>                        ;   Notice that this rule *has* to be after the first one, otherwise we'll hit spaces before "=>" first
> 					   ; Third alternative:
> | skip                 ;   just skip everything else
> ]]
>
```

Similar to that

toomasv

[19:19](#msg6022e051ae4b9b27c1adc789)@gltewalt These are all `any-string!` types (string! file! url! tag! email! ref!), but `issue!` does not belong to these.

gltewalt

[19:55](#msg6022e8b624cd6b60d82c225c)Its just another string if you split it, get the value, then rejoin

greggirwin

[20:02](#msg6022ea43aa6a6f319d1667dd)@Oldes there is limited support for typed parsing from strings. We should consider it experimental, and maybe not as useful now with `transcode/trace` available. I believe it helps to think in terms of text, which may be anything, versus Red data.

Oldes

[20:04](#msg6022eae5a0246860dc4135a7)@toomasv I know that `issue!` is not in `any-string!`... I was asking if there should not be error like in Rebol instead of silently ignoring it.

[20:06](#msg6022eb4f428d9727dd670865)On the other side.. there are no errors for unsupported types... like:

```
>> parse "aa" [%1]
== false
```

gltewalt

[20:58](#msg6022f77f32e01b4f71867637)I swear there was an error on my linux version - cant check until after work, now

## Wednesday 10th February, 2021

toomasv

[06:00](#msg60237686428d9727dd6859e1)@Oldes It is just the same as you showed before:

```
>> parse "aa" [%aa]
== true
>> parse "1" [%1]
== true
```

As it belongs to `any-string!` typset it is supported. Just not matching.

[06:41](#msg60238005ae4b9b27c1af44a5)@gltewalt Yes, copy and juggle indexes:

```
>> level-3-rule: [s: change "==== " {<a href="#Lnk">} copy lnk to newline :s thru "#" change "Lnk" (lowercase replace/all copy lnk #" " #"-") to newline insert "</a><p>" newline]
== [s: change "==== " {<a href="#Lnk">} copy lnk to newline :s thru "#" change "Lnk" (lowercase re...
>> parse str: "==== Usage^/" level-3-rule str
== {<a href="#usage">Usage</a><p>^/}
>> parse str: "==== Usage example^/" level-3-rule str
== {<a href="#usage-example">Usage example</a><p>^/}
```

[06:42](#msg6023805484e66b7f7ee33548)Alternatively, without jumping around:

```
>> level-3-rule': [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy lnk #" " #"-") insert {">} lnk insert "</a><p>" newline]
== [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy ...
>> parse str: "==== Usage example^/" level-3-rule' str
== {<a href="#usage-example">Usage example</a><p>^/}
```

Oldes

[09:37](#msg6023a946a0246860dc430518)@toomasv ah... my fault... I wanted to write:

```
>> parse "1" [1%]
== false ;<-- no error when used `percent!` (or any other unsupported) datatype as a rule.
>> parse "1%" [1%]
== false
```

toomasv

[09:41](#msg6023aa4f063b6c68d54ec37c)I agree that error would be useful if trying to match non-any-string rules on any-string input. Like:

```
>> parse "1" [integer!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

Or even

```
>> parse "1" [string!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

hiiamboris

[12:52](#msg6023d7090eed905f18a44e18)That's strange considering:

```
>> parse to #{} "1" [integer!]
== true
```

[12:52](#msg6023d70e24cd6b60d82e7807)I think it's a bug

[13:01](#msg6023d93b32e01b4f71889d28)OK crash is a different issue, I'll report it myself

gltewalt

[18:18](#msg6024237e9fa6765ef80e9356)@toomasv I had this before you responded

```
level-3-rule: [change "==== " {<li><a href="#_} copy s to newline insert {">} insert (rejoin [ s {</a></li>}])]
```

toomasv

[19:18](#msg60243183aa6a6f319d19b987)If there are single words only in headings and lowercase doesn't matter, then why not.

gltewalt

[19:25](#msg6024332b32e01b4f7189a8cb)Yeah

## Thursday 11st February, 2021

gltewalt

[03:48](#msg6024a92984e66b7f7ee63f2a)The doc says you can match by datatype for utf-8 encoded values if you use `to binary!`

[03:53](#msg6024aa1e9238c531ad39f60e)`parse to binary! "1" [integer!]` == true

[03:55](#msg6024aa9884e66b7f7ee6423d)https://imgur.com/a/Jod9rmB

## Friday 12nd February, 2021

gltewalt

[00:31](#msg6025cc489238c531ad3cea91)Can you copy more than one thing?

[00:31](#msg6025cc7f4f7d1b68e547e3ee)

```
s: "CAUTION: Ensure that..."

hmmm: [change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">ALL OF S GOES HERE</td></tr></table>}]
    ) copy x to ":"]
```

[00:34](#msg6025ccff4f7d1b68e547e5aa)The whole string should go in between `td class="content">` and . No text after

[00:36](#msg6025cda09d5c644f6666cded)Tried this but `y` has no value.

```
hmmm: [change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">} y {</td></tr></table>}]
    ) copy x to ":" skip copy y to newline]
```

[00:37](#msg6025cdad9fa6765ef812d205)I swear ... I'm never going to learn this

[02:01](#msg6025e17655359c58bf395489)Close, but need the text after gone.

```
s: copy "CAUTION: Ensure that..."

hmmm: [s: change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">} s {</td></tr></table>}]
    ) copy x to ":"]
```

[02:21](#msg6025e61e9fa6765ef81303f1)Oh well

toomasv

[08:25](#msg60263b5e5500a97f820134ea)@gltewalt Several things about latest:  
\* `s` is used for original string but reused inside rule  
\* `change` rule starts with empty option - it will never check further alternatives  
\* `x` is referred before it has got value

Here is one possibility, assuming there is no more text (which there probably would be):

```
str: copy "CAUTION: Ensure that..."
hmmm: [ahead [copy x ["CAUTION" | "WARNING" | "IMPORTANT"] #":"] insert (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">}]) to end insert ({</td></tr></table>})
]

parse str hmmm probe str
{<table><tr><td class="icon"><div class="title">CAUTION</div></td><td class="content">CAUTION: Ensure that...</td></tr></table>}
```

gltewalt

[15:52](#msg6026a435063b6c68d5564928)Empty option was typo

greggirwin

[18:36](#msg6026ca94428d9727dd70c0a9)R2

```
parse [1] [any [1 1 1]]
;== true
val: 1
;== 1
parse [1] [any [1 1 val]]
;== true
```

Red:

```
parse [1] [any [1 1 1]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:  

parse [1] [any [1 1 quote 1]]
;== true

val: 1
;== 1
parse [1] [any [1 1 quote val]]
;== false
parse [1] [any [1 1 val]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:
```

Do others agree this is a bug?

toomasv

[18:43](#msg6026cc6732e01b4f719042c6)But in Red you can do this:

```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== true
```

Not in R2:

```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== false
```

Not that it is useful :confused:

[18:46](#msg6026cced428d9727dd70c7bb)Plain integer is \*\*always\** a rule in Red

```
>> val: [quote 1] parse [1] [any [1 1 val]]
== true
```

hiiamboris

[18:50](#msg6026cdda32e01b4f7190473e)I agree, a bug.

greggirwin

[19:05](#msg6026d19532e01b4f71904f32)How `to/thru` handle ints is another wrinkle. Today they don't. But R2 didn't either.

[19:07](#msg6026d20a84e66b7f7eebb91a)`parse [1] [any [1 1 1 1 1 1 quote 1]]` melted my brain.

[19:13](#msg6026d370ae4b9b27c1b7dde7)I can use the `val: [quote 1]` trick (thanks @toomasv) for my experiment.

toomasv

[19:33](#msg6026d81aaa6a6f319d20670a)But there \*may* be situations where this matters, e.g. Red:

```
outer-min: 1
outer-max: 2
inner-min: 2
inner-max: 3
parse [1 2 3 4 5 6][outer-min outer-max inner-min inner-max integer!]
== true
```

R2:

```
outer-min: 1
outer-max: 2
inner-min: 2
inner-max: 3
parse [1 2 3 4 5 6][outer-min outer-max inner-min inner-max integer!]
== false
```

hiiamboris

[19:35](#msg6026d899428d9727dd70e436)oh wow

greggirwin

[19:43](#msg6026da720eed905f18ac0722)Naming things helps sooo much. :^) Saved my melted brain from leaking out entirely.

toomasv

[19:45](#msg6026dacb9fa6765ef8156dac):point\_up: \[February 12, 2021 9:05 PM](https://gitter.im/red/parse?at=6026d19532e01b4f71904f32) What about `to/thru`? Seems it treats integers as expected:

```
>> parse [a 1 2 b]['a thru 2 3 [quote 1 | quote 2 | quote 3] 'b]
== true
```

greggirwin

[19:50](#msg6026dc18aa6a6f319d207568)Indeed. I mixed something up somewhere. Thanks for the sanity check.

[19:54](#msg6026dce54f7d1b68e54a8139)The nested range "feature" will surely help us win code obfuscation contests. One of those things that makes logical sense when teased apart, but was totally opaque to me with the unnamed `1` example.

[19:55](#msg6026dd2132e01b4f71906d20)I bet @toomasv cheated and used DiaGrammar. ;^)

[19:55](#msg6026dd4bae4b9b27c1b7fc72)\[!\[image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/WFBw/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/WFBw/image.png)

toomasv

[20:03](#msg6026df239fa6765ef8157bb3):smile: I'd like to have had that idea!

## Wednesday 24th February, 2021

gltewalt

[20:14](#msg6036b39148e4d527e806b263)How come the index of the next position to match is one beyond the match with strings, but is at the match with blocks? Or is it not supposed to be that way?

[20:16](#msg6036b439739b422ea7551a24)https://imgur.com/a/PoWNrAx

hiiamboris

[20:20](#msg6036b4f84821572018fae547)both look identical to me

[20:20](#msg6036b5052a9d4f27f12fba4f)2 = after '7'

gltewalt

[20:25](#msg6036b61db13524529aab094e)Am I just roasted tired?  
https://imgur.com/a/IWRIYEa

hiiamboris

[20:31](#msg6036b7b227f8804c6bb1de22)OK here it looks weird

[20:32](#msg6036b7ca42f30f75c7c5bf09)Is this a bug in `parse/trace` or `parse-trace`?

gltewalt

[20:33](#msg6036b8006c077b203573fc2b)Might be

[20:33](#msg6036b8306c077b203573fd12)Im running to the other job right now so i cant try to check

hiiamboris

[20:34](#msg6036b8546eb766540c20251c)You'll hunt it down eventually ;)

gltewalt

[20:37](#msg6036b90811ef2d2e9c2505ed)Pulling from on-parse-event

## Thursday 25th February, 2021

gltewalt

[00:58](#msg6036f64711ef2d2e9c25a929)longer example  
https://imgur.com/a/qIGWrVg

## Friday 26th February, 2021

gltewalt

[05:59](#msg60388e25e0d7284c735cf7f2)Fixed it. Not an issue with on-parse-events. I was the issue.

## Monday 1st March, 2021

GiuseppeChillemi

[23:00](#msg603d720c95e23446e407415e)How could I trigger 2 opposite actions on a rule, one if it succeeds and one if it does not succeeds? For example: if the element I have found is a string I want to set a word and do some code, if it is not a string I want to write "expected a string"

greggirwin

[23:15](#msg603d75a695e23446e4074b3c)

```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
	some [
		set s string! (print 'do-do-do) 
		| set v any-type! (print ["Expected a string, but saw a(n)" type? :v])
	]
]
```

GiuseppeChillemi

[23:25](#msg603d77eca3a2f04f1fc90fe0)I can't actually test, is `| set v not string!` possible?

greggirwin

[23:38](#msg603d7b12457d6b4a949878cd)`Not` is great, but can be trickier to think about. You have to remember that it never advances the input. Docs also have a note that says `set` sets the word to `none` if the rule doesn't advance the input, so you can't chain `set v not ...` together and get the \*next* thing. You can do it other ways, like so:

```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | ahead not string! set v skip (print ["Expected a string, but saw a(n)" type? :v])
    ]
]
```

But then you have to ask if that's clearer. You could also create a custom typeset, and match against that. e.g.

```
not-string!: exclude any-type! make typeset! [string!]
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | set v not-string! (print ["Expected a string, but saw a(n)" type? :v])
    ]
]
```

GiuseppeChillemi

[23:50](#msg603d7dacd1aee44e2dba3dd9)Thank you, I will work on it. It is a technique that I thought could be useful in situations like function's argument type checking, so you exactly know that has gone wrong and where.

greggirwin

[23:53](#msg603d7e7bd74bbe49e0c9a8a5)That's an interesting idea. Datatypes for func specs have always been seen as inclusive (what you want) rather than exclusive (what you don't want). The latter may be more informative in some cases, and also more automatically extensible (pros and cons there). Puts a new twist on how you think about testing too.

## Tuesday 2nd March, 2021

GiuseppeChillemi

[00:07](#msg603d81ae120cd84f78e9c165)Until now we have given meaningfulness to the domain of what is matched, but when something has not matched, another parallel domain arises and it is the domain of errors. Think when you parse a communication protocol and its rule fails: you want your code either to process the successful event but also do something like storing the position and content, for unmatched one; also, for other rules, you may want to collect all unmatching elements in a block...

greggirwin

[00:12](#msg603d82ede8267a46f2e6da47)Yes, you'll see more of my thoughts on this in the near future.

GiuseppeChillemi

[00:13](#msg603d833f95e23446e4076ef9)Waiting to read all your thoughts! Goodnight!

[00:43](#msg603d8a32d71b6554cd1627c4)Can't sleep:

Its simpler that we think:

```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | set v any-type! (print ["Expected a string, but saw a(n)" type? :v]) 
    ]
]
```

Expressed linearly the alternate rule matches everything which has not been matched in the first rule.

greggirwin

[00:44](#msg603d8a64d74bbe49e0c9c728)Ummm, isn't that what I posted originally? ;^)

GiuseppeChillemi

[00:45](#msg603d8aa9a3a2f04f1fc93fb8)Yes, we just miss: `not-string!: exclude any-type! make typeset! [string!]`

greggirwin

[00:46](#msg603d8ae0b5131f4f28e74ce6):point\_up: \[here](https://gitter.im/red/parse?at=603d75a695e23446e4074b3c)

GiuseppeChillemi

[00:46](#msg603d8ae1d1aee44e2dba5c47)And please, I feel ashamed to ask this simple thing but why you check the type with get notation? `type? :v`

[00:46](#msg603d8b03e8267a46f2e6edc0)&gt; :point\_up: \[here](https://gitter.im/red/parse?at=603d75a695e23446e4074b3c)

Ok, I NEED to sleep! Bye!

greggirwin

[00:47](#msg603d8b0f457d6b4a94989f3e)Since it's a block it could contain "active" values like functions, which we don't want to evaluate in this scenario.

toomasv

[09:07](#msg603e0053d71b6554cd175206)It's even simpler:

```
some [
        set s string! (print 'do-do-do) 
        | v: (print ["Expected a string, but saw a(n)" type? :v/1])
    ]
```

[09:09](#msg603e00c3b5131f4f28e87222)BTW in `ahead not` `ahead` is superfluous. Use just `not` if you need negative lookahead.

[09:15](#msg603e023ed71b6554cd175662)&gt; why you check the type with get notation?

You might have a function in input, e.g.:

```
>> parse reduce [func [a][print a]] [set v skip (print type? :v)]
function
== true
>> parse reduce [func [a][print a]] [set v skip (print type? v)]
*** Script Error: v is missing its a argument
```

GiuseppeChillemi

[10:26](#msg603e12cfe562cf54ac92e530)Thanks you, I make this error often because of a phenomenon of expansion of the concepts I was using to the other elements: I was thinking about inactive values that get reduced, then I also see the functions as inactive values that get reduced, forgetting they are active ones. I have learned that's part of the way I work, so I ask for an explanation because I know that simple thing sometime could block me and I should not be ashamed to ask. O:-)

greggirwin

[16:25](#msg603e66e6d1aee44e2dbcb0fa)Thanks for the addenda and errata @toomasv. :+1:

[16:25](#msg603e6709b5131f4f28e991a4)Never be ashamed. :^)

toomasv

[16:29](#msg603e67d495e23446e409c2fb):flushed:

GiuseppeChillemi

[17:24](#msg603e74dcd1aee44e2dbcddda)&gt; Never be ashamed. :^)

Never, ever!

gltewalt

[18:05](#msg603e7e68823b6654d27bcbe1)I'm frequently ashamed :-)

GiuseppeChillemi

[19:14](#msg603e8eb3e5f1d949d475310f)Programmers are often sensitive people because higher intelligence is associated with higher perceptions and reactions, but we are not so good at managing them!

## Wednesday 3th March, 2021

gltewalt

[00:19](#msg603ed62322a5ce4a912c9679)I dont consider myself a "real" programmer

[02:02](#msg603eee1c5d0bfb4e5882550c)I think this is ready for others to test out . If you're willing, I'd be happy to get the feedback.  
https://github.com/gltewalt/parse-caddy

toomasv

[05:06](#msg603f193cb5131f4f28eb7a52)@gltewalt Nice work, congratulations!

greggirwin

[05:48](#msg603f233ed2619a4f2e1c3c46)Thanks for posting @gltewalt ! Nice mascot. :^) I will check it out soon.

gltewalt

[06:05](#msg603f2743e8267a46f2eb38ff):blush: I hope it's ok for completed v1

hiiamboris

[09:20](#msg603f54c122a5ce4a912dd47d)I'd like such tool to remember start and end of every match. Then when I select one char/value or more, it would highlight in green parts of the rule that matched this whole selection, and in red - parts that tried to match it but failed. Or smth like that :)

gltewalt

[18:16](#msg603fd277e8267a46f2ed3088)like, copy the selected input and pass it to parse/trace?

[18:19](#msg603fd347823b6654d27f7a94)I need to learn rich-text . Right now the highlight color when text is selected isn't showing itself, for some reason

ne1uno

[18:58](#msg603fdc40457d6b4a949ee3ab)a log area might be nice, push results and traces

gltewalt

[23:01](#msg6040155922a5ce4a91301ad5)Log files, or just text to a panel?

ne1uno

[23:25](#msg60401afb22a5ce4a913028e3)just to an area that could be copied from. I usually add a limiter so the log does't keep growing

[23:25](#msg60401afbd74bbe49e0d03228)`log-area/text: copy/part rejoin [form count etc other-f/text "**" newline log-area/text] 28000`

## Friday 5th March, 2021

bubnenkoff

[09:44](#msg6041fd82e562cf54ac9db7c5)I have got next data structure:

```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]
```

I need to make every child know `id` of it's parent. So result should be like:

```
data: [
	id: 123
	lots: [
		id: 123
		lot: [id: 123 name: "apple"]
		lot: [id: 123 name: "bananas"]
	]
]
```

At first step I want to learn how to collect root `id`. But I can't understand how to take it's value with parse. I tried:

```
parse data rule: [some [ set b if (b = quote id:) ahead set c integer! | ahead block! into rule | skip]]
```

But it's seems that `ahead` not suitable for. Also I tried to do some magic with checking value `skip`ing it and reasigning `b`:

```
parse data rule: [some [ set b if (b = quote id:) skip set b integer! | ahead block! into rule | skip]]
```

But it's also not working.

[09:54](#msg6041ffc1b5131f4f28f38367)Wow! This rule is working:

```
parse data rule: [some [ set b quote id: ahead [ set b integer! ] | ahead block! into rule | skip]]
```

Am I right understand that ahead with subrule do collect value?

rebolek

[09:59](#msg60420107b5131f4f28f38819)`ahead` checks the rule and rewinds. `set`, `copy` and `keep` work as usual. You can argue that they shouldn’t and I probably would agree with you.

[10:00](#msg6042012ba3a2f04f1fd58fbe)OTOH I can imagine situation where it makes sense.

bubnenkoff

[10:01](#msg60420195b5131f4f28f38951)Is it's good idea to use `skip` (`set b skip`):

```
parse data rule: [some [ set b quote id: ahead [ set b skip ] | ahead block! into rule | skip]]
```

if it's does not matter what type I should collect?

rebolek

[10:02](#msg604201d0a3a2f04f1fd59199)Yes, I don’t see a problem there. If you know what to expect there and don’t need to check for validity, then `skip` is good enough (and faster).

bubnenkoff

[10:38](#msg60420a15d1aee44e2dc6b827)How to insert value in block?

```
>> b: []
== []
>> parse [b] [insert 44 block!]
```

I am expecting to get `b: [44]`

rebolek

[10:53](#msg60420d96d71b6554cd228dee)

```
>> parse reduce [b] [into [p: insert (44)]]
== true
>> b
== [44]
```

bubnenkoff

[10:55](#msg60420e0dd1aee44e2dc6c35b)is it possible to do without reduce? I will need to mix insert with code above....

toomasv

[10:56](#msg60420e40d1aee44e2dc6c3d2)This

```
parse [b] [set s word! (if block? s: get/any s [insert s 44])]
```

or this

```
parse [b] [ahead word! s: skip (if block? s': get/any s/1 [insert s' 44])]
```

bubnenkoff

[10:56](#msg60420e63d74bbe49e0d50272)oh thank!

toomasv

[10:58](#msg60420ef244f5a454a45735ec)better

```
parse [b] [set s word! (if block? s: attempt [get s] [insert s 44])]
```

bubnenkoff

[10:59](#msg60420f1c457d6b4a94a4d991)but if I am sure that it's block I can drop checking?

toomasv

[11:01](#msg60420f77d2619a4f2e246cab)Then you can do even

```
parse [b] [set s word! (insert get s 44)]
```

bubnenkoff

[11:01](#msg60420fa3d2619a4f2e246d2e)cool! thanks!

toomasv

[11:01](#msg60420fa6e8267a46f2f34016)or

```
parse [b] [s: skip (insert get s/1 44)]
```

bubnenkoff

[11:13](#msg60421249d71b6554cd229b05)@toomasv I tried to mixed all code together but it do not work:

```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: skip (insert get s/1 44)  into rule | skip]
		] 	

probe data
```

I expected that it will insert 44 in every new block, but iit does not

toomasv

[11:13](#msg60421277b5131f4f28f3b7e4)

```
parse data [
	quote id: set id skip (probe id)
	quote lots: into [some [quote lot: s: skip (insert s/1 compose [id: (id)])]]
]
```

or

```
parse data [
	any [
		quote id: set id skip
	|	set-word! ahead block! into [
			any [set-word! set block block! (insert block compose [id: (id)])]
		] 	
	]
]
```

bubnenkoff

[11:15](#msg604212b5823b6654d2859848)wow!!! Thanks!!!

toomasv

[11:15](#msg604212e35d0bfb4e588b10c1):smile:

pekr

[11:17](#msg60421356d2619a4f2e247802)Now I will study the above few lines of code for one week and hope I get a clue, what it does :-)

bubnenkoff

[11:20](#msg604213ffe562cf54ac9df794)Yeah!! I mixed Toomas solution with my (I understand my code better):

```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip]
		] 	

probe data

>> probe data
[
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 name: "bananas"]
    ]
]
```

[11:21](#msg6042143ad71b6554cd22a019)It's interesting that adding `skip` insert `id` only in first level of child:

```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: skip (insert s/1 compose [id: (b)]) into rule | skip]
		] 	

probe data
```

[11:35](#msg6042177644f5a454a4574b2e)@toomasv could you explain what are you doing with this:

```
set-word! set block block!
```

toomasv

[11:40](#msg604218a4a3a2f04f1fd5cf3f)After a `set-word!` it sets a word `block` to the following `block!` value.  
Ok, here's another

```
parse data rule: [
    some [s: 
	  quote id: set b skip 
	| if (head? s) insert (quote id:) insert (b) 
	| ahead block! into rule 
	| skip
	]
]
```

bubnenkoff

[11:51](#msg60421b34457d6b4a94a4f998)thanks! Could you also explain why with `skip` it's process only first level child and do not go deeper (code above)

toomasv

[11:51](#msg60421b47120cd84f78f66e27)In your rule above:

```
set b quote id:                       ; `set b` is unnecessary here
ahead [ set b skip ]                  ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```

So, following rule does it without unnecessary clutter:

```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

bubnenkoff

[11:53](#msg60421ba3e8267a46f2f35f59)&gt; After a `set-word!` it sets a word `block` to the following `block!` value.  
&gt; Ok, here's another  
&gt;

```
> parse data rule: [
>     some [s: 
> 	  quote id: set b skip 
> 	| if (head? s) insert (quote id:) insert (b) 
> 	| ahead block! into rule 
> 	| skip
> 	]
> ]     
>
```

this look very cool!

[18:27](#msg60427806e5f1d949d47eb7f1)Why `Hello` never don't printing?

```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b) (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```

hiiamboris

[18:29](#msg6042789eb5131f4f28f4dd18)It does for me

bubnenkoff

[18:32](#msg6042795b5d0bfb4e588c3017)Oh, sorry, strange. One moment I will check in fresh console

[18:33](#msg60427994d71b6554cd23be0c)yes, sorry! I did not understand the reason I got this issue

[18:41](#msg60427b60e8267a46f2f47655)

```
data: [
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123  name: "bananas" ]
    ]
]
```

with this data it's not printing:

```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b)  (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```

toomasv

[18:49](#msg60427d46e5f1d949d47ec3ad)It doesn't print "Hello" because you never happen to be in head of block with these data.

Oldes

[18:50](#msg60427d7044f5a454a4586b19)@bubnenkoff because you have skip in the first rule

```
parse data rule: [
    some [
        (print "will set s") s: quote id: set b skip (print "RULE1 DONE")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2 NEVER DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

greggirwin

[18:51](#msg60427dc595e23446e4150bab)@gltewalt nice work on Parse Caddy. It's very close to what I'm working on now, as an interactive approach. I do get this error when clicking Parse Block Values:

```
*** Script Error: reset-field has no value
*** Where: act
*** Stack: context view do-events do-actor do-safe
```

Should it consider success that any rule matches, or based on `parse`'s result? e.g. with "a,b,c" as input `to #","` passes but `some [thru #","]` doesn't.

Oldes

[18:54](#msg60427e4e44f5a454a4586dbf)

[18:56](#msg60427ed022a5ce4a9136d56a)@bubnenkoff why you want to do something like that? If it would be processed, you would get into infinite loop!  
You may try it by replacing `(head? s)` with `(2 = length? s)`. But you will have to kill the console!!!

bubnenkoff

[19:01](#msg60427feed1aee44e2dc80e37)Oh! Infinity loop! I am just experimented!

gltewalt

[20:39](#msg60429708a3a2f04f1fd73d92)@greggirwin ill look at it this evening. As far as tirn green on a match vs green on parse returning true... im not sure.

[20:54](#msg60429a96d71b6554cd241e94)Turning green

## Saturday 6th March, 2021

gltewalt

[00:22](#msg6042cb51457d6b4a94a6f679)@greggirwin that's weird, because `some [thru #","] does match. It just doesn't turn green.`some \[to #","]\` does turn green.

greggirwin

[00:41](#msg6042cfa1823b6654d287c892)Right.

gltewalt

[00:57](#msg6042d383d74bbe49e0d6ee0e)Oh, I see why

[01:35](#msg6042dc5a457d6b4a94a71fc2)Could do it this way  
https://imgur.com/a/NKn2qoc

[01:44](#msg6042de735d0bfb4e588d3a1b)Or highlight the match position in the Input field, and turn color in the rule field.

[01:45](#msg6042decf457d6b4a94a726d9)Speaking for myself as a parse novice - I'm more interested in seeing if something matches and then doing something with that match, than I am interested in whether parse reaches the end of the input or not

[03:42](#msg6042fa2bd2619a4f2e2702c2)One known issue is that if you use insert, it inserts until `match?` is false - which means the whole time you're hitting space or typing the next part of the rule

[03:47](#msg6042fb63a3a2f04f1fd8480b)https://imgur.com/a/GhpkEvM

[03:48](#msg6042fb80a3a2f04f1fd84841)Not sure how to fix that, but I fixed the other stuff

hiiamboris

[08:47](#msg604341b722a5ce4a9138d6f6)One more thing. Parse is often expressed as a set of named rules. Such tool should be able to help trace in which rule the match stuck or never succeeded.

gltewalt

[15:53](#msg6043a576d74bbe49e0d8d6fb)My intent was to have a tool that helps you see what is going on for "a" parse rule.

[15:54](#msg6043a5a122a5ce4a9139d70c)Beginners in mind.

[15:57](#msg6043a65fd1aee44e2dcb048f)Something for me to think about, though

## Monday 8th March, 2021

gltewalt

[02:34](#msg60458d23e8267a46f2fc0017)Not exactly safe input, but making a little more progress.  
https://imgur.com/a/x10MYK7

[02:52](#msg6045916d5d0bfb4e5893c649)https://imgur.com/a/gF1VXZy

## Tuesday 9th March, 2021

bubnenkoff

[11:49](#msg604760df5d0bfb4e5898ad9f)@toomasv is there any nice way to measure nesting level?

```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [
			name: "bananas"
			obj: [ price: 44 ]
			]
	]
]		
		
; count: 0		
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b) 
		| ahead block! into rule 
		| skip
    ]
]
```

For example I want to add id only on third level. But common task is measuring of levels

toomasv

[12:39](#msg60476c6ae8267a46f2011215)@bubnenkoff E.g.:

```
level: 1
id-level: [2 3] ; or just <int>

parse data rule: [
    some [s: 
        quote id: set b skip 
        | if (all [find id-level level head? s]) insert (quote id:) insert (b) 
        | ahead block! (level: level + 1) into rule (level: level - 1)
        | skip
    ]
]
```

If you don't need to insert into single level, use just `level = 3` or `level = id-level`.  
If you need ranges of levels, then you need to adjust comparison.

bubnenkoff

[12:55](#msg6047703ae5f1d949d48a0475)thank!

[12:57](#msg604770cf823b6654d2936836)I was quite near! But stuck with this line:

```
ahead block! (level: level + 1) into rule (level: level - 1)
```

I did not expect that code after `into rule` will work, because I thought it will make jump exactly in this moment

toomasv

[12:59](#msg6047712d120cd84f78042788)Yes, it continues after exiting from `rule`, i.e. after `into rule`.

bubnenkoff

[13:14](#msg604774ac44f5a454a464e721)Oh! I understood!

[13:17](#msg60477556d71b6554cd307584)So we do `into rule` and after it do decrement, right?

toomasv

[13:17](#msg6047756dd2619a4f2e325e54)Yes

bubnenkoff

[18:55](#msg6047c491457d6b4a94b3cf3e)Why exclamation mark is printing only once?

```
parse [11 aa 11 bb cc] [some [ahead word! | skip (print "!") | 'cc]]
>!
```

toomasv

[18:59](#msg6047c594e8267a46f20223b4)Think it through:

```
>> parse [11 aa 11 bb cc] [some [s: (probe s) ahead word! | skip (print "!") | 'cc]]
[11 aa 11 bb cc]
!
[aa 11 bb cc]
== false
```

Remember, that `ahead` does not advance.

bubnenkoff

[19:09](#msg6047c7d8a3a2f04f1fe4a282)At first step we are checking it `word!` is ahead, than we are doing `skip`ing.  
No we have: `[aa 11 bb cc]`  
And first rule is success but input do not advice? Right?

toomasv

[19:14](#msg6047c92944f5a454a465e86c)Yes, on `11` first subrule fails, second subrule advances and prints `!`; in next round, parsing stops at `aa`, because subrule succeeds but does not advance. If it would not stop it would be in infinite loop.

## Wednesday 10th March, 2021

bubnenkoff

[10:33](#msg6048a091120cd84f78079861)Here I am trying to collect/print all set-words

```
parse [a: 1 b: 2 name: "Mike" c: 3] [ ahead [set-word!] set w set-word! (probe w) fail | skip  ]
```

And I can't understand why it's do not work.  
`ahead`-- look ahead  
`set w set-word!` set `w` to next value (next value is set-word)  
`fail` should advance input to next rule.

Where I am wrong?

hiiamboris

[10:45](#msg6048a339d1aee44e2dd80c5c)aren't you forgetting a loop?

bubnenkoff

[10:45](#msg6048a34644f5a454a46840a6)ohhh!

[10:48](#msg6048a405457d6b4a94b63f1e)still stop at first set-word:

```
>> parse [a: 1 b: 2 name: "Mike" c: 3] [some [ ahead [set-word!] set w set-word! (probe w) fail | skip  ] ]
a:
```

[10:55](#msg6048a5a0d1aee44e2dd81246)I dropped `fail` and it's begin to work. Could you explain why? `fail` interrup `some`?

```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ ahead [set-word!] set w set-word! (probe w) | skip  ] ]
```

rebolek

[11:06](#msg6048a82cb5131f4f28053037)Yes: `fail : force current rule to fail and backtrack.`

hiiamboris

[11:12](#msg6048a99de562cf54acaf553d)@bubnenkoff `[fail]` might work in place of `fail`.  
Put simply, `fail` and `reject` are a dubious design and best avoided.

rebolek

[11:42](#msg6048b095120cd84f7807c19d)@hiiamboris do you have a better design idea?

hiiamboris

[11:49](#msg6048b26744f5a454a4686adb)https://github.com/red/red/issues/3478#issuecomment-406884362

[11:54](#msg6048b37ca3a2f04f1fe73ebe)specifically for `fail`: equivalence with `not none` or `end skip` is proposed

[12:04](#msg6048b5d9120cd84f7807cd9c)like here https://en.wikibooks.org/wiki/Rebol\_Programming/Language\_Features/Parse/Parse\_expressions#Parse\_idioms

rebolek

[12:19](#msg6048b945457d6b4a94b67963)Thanks, I take a look. I’m not using `fail` or `reject` very much but `break` is extremely important.

toomasv

[13:51](#msg6048cef4d1aee44e2dd895ff)@bubnenkoff Neither is `ahead` needed here:

```
[some [ set w set-word! (probe w) | skip ] ]
```

Oldes

[14:08](#msg6048d2eb5d0bfb4e589cee15)@hiiamboris I just FAILed reading the 3478 issue, because my brain REJECTed to understand all of mentioned cases and I must take a BREAK now ;-)

hiiamboris

[14:09](#msg6048d300e562cf54acafda67)lol

toomasv

[14:10](#msg6048d36195e23446e425ba7e)@bubnenkoff `fail` works ok in some situations, e.g. let's say you want to probe set-words except `b:`

```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ set w set-word! [if (w = quote b:) fail | (probe w) ] | skip ] ]
```

Same could be achieved in different ways:

```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ not quote b: set w set-word! (probe w) | skip ] ]
```

or

```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ s: skip opt [if (all [set-word? s/1 s/1 <> quote b: ]) (probe s/1)]]]
```

Oldes

[14:13](#msg6048d40a22a5ce4a91475ac8)or:

```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ quote b: | set w set-word! (probe w) | skip ] ]
```

[14:20](#msg6048d5cad1aee44e2dd8ab37)@hiiamboris what took my attention is yours note:  
&gt; `parse haystack [to needle to end]` But assume that there's no end (maybe we're parsing continuous stream of data).

It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

[14:24](#msg6048d6b6a3a2f04f1fe7b295)In R3 it could be:

```
>> parse "ab" ["a" return (true)]
== true
```

rebolek

[14:25](#msg6048d6d822a5ce4a9147647b)BTW, just now I’ve updated my \[HTML parser](https://gitlab.com/rebolek/castr/-/blob/master/html.red) so now it can handle even more buggy HTML than before. Stuff like `startinnerend` [and other monstrosities can be parsed without a problem.](/)

[Oldes](/)

[](/)

[](/)[14:26](#msg6048d70f120cd84f780832ce)But `return (true)` is in R3 14x slower than `to end` and longer:/

rebolek

[14:27](#msg6048d73c95e23446e425c7f7)14x slower? wow

Oldes

[14:29](#msg6048d7e495e23446e425c9bd)Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

bubnenkoff

[14:43](#msg6048db20120cd84f78084137)Am I wrong or the was discussion about `then` should be remove from parser?

hiiamboris

[14:45](#msg6048db90d71b6554cd3488d7)There's no `then` in Red as far as I know

bubnenkoff

[14:49](#msg6048dc5cd74bbe49e0e543d4)https://ungaretti.gitbooks.io/red-language-notebook/content/parse.html

"`then` Regardless of failure or success of what follows, skip the next alternate rule."

hiiamboris

[14:49](#msg6048dc7995e23446e425da7f)maybe it was there 2-3 years ago but was removed

[14:53](#msg6048dd56a3a2f04f1fe7c726)&gt; It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

&gt; Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

That's an interesting consideration, but probably should be left to a separate REP? ;)  
We don't have infinite data (yet), but to exit parse asap, I recall I used `exit` at least once. Otherwise I could write `loop 1 [parse ... [ .. (break)..]]`. But that's a workaround alright.

Oldes

[15:46](#msg6048e9e4b5131f4f28060349)I'm used to `to end` for now, but it is right, that if we would have streaming parse one day, there could be some other way how to end and report a success. But hard to say how to implement the streaming parse.. it would require more thoughs.

rebolek

[16:49](#msg6048f899120cd84f7808a1af)`then` was extremely confusing, no one could figure out how to use it properly and I believe it was buggy anyway.

bubnenkoff

[18:26](#msg60490f6d44f5a454a469a150)@toomasv I did it! Thanks for examples! I will learn them. You was totally right that I do not need `ahead` before `set`

```
data: [
    foo: 33
    bar: 66
	id: 123
	lots: [
		lot: [name: "blackberry"]
		lot: [name: "apple"]
		lot: [
			name: "bananas"
            number: 43
			obj: [ price: 44 ]
			obj: [ price: 23 ]
			]
	]
]		
		
parse data rule: [
    some [
           set w set-word! (probe w) | not block! skip
        |  ahead block! into rule     
    ]
]
```

This code will print all set-words

greggirwin

[18:31](#msg6049108f22a5ce4a914829d4)If someone would like to track this chat and pull useful topics and examples into https://github.com/red/red/wiki/Parse-Cookbook, that would be fantastic. Such great information, but it will fade as chat continues. Of course, I'm selfish and this is also to keep me from having to ask the same questions later. :^) @bubnenkoff would you be up for that?

bubnenkoff

[18:33](#msg60491106457d6b4a94b79c88)I will to add examples later, I am doing small collections of good solutions

toomasv

[18:35](#msg60491163b5131f4f280688d7)@bubnenkoff :+1:

hiiamboris

[18:38](#msg60491222d1aee44e2dd9760b)@bubnenkoff FYI there's another way to do the same task: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/collect-set-words.red#L9  
In Red there's always another way :D

bubnenkoff

[18:44](#msg604913a85d0bfb4e589dbf14)@hiiamboris hah! Funny!

greggirwin

[18:49](#msg604914add74bbe49e0e5e1e8)@hiiamboris the `loop+break` trick is neat, but yes it's a workaround, as is `accept: [to end]`. As noted, the latter won't work for streaming cases.

[18:50](#msg604914f2120cd84f7808fcd5)Thanks @bubnenkoff ! You've been doing a lot of `parse` work.

[18:53](#msg604915b0d2619a4f2e374623)@hiiamboris your set-word collector is "sufficiently advanced technology", as Mr. Clarke would say. :^)

[19:03](#msg604917fb120cd84f780905f0)Very clever leverage of `function`.

hiiamboris

[19:06](#msg604918a244f5a454a469bf5b)Had to google it :D Turns out it's one of the guys who wrote `2001`

toomasv

[19:30](#msg60491e72457d6b4a94b7c62a)Yes, @hiiamboris , funny func! :)

hiiamboris

[19:32](#msg60491ed3e5f1d949d48e9471)Thanks (:

toomasv

[20:53](#msg604931cf22a5ce4a91489374)@hiiamboris, I wanted to compare your witchcraft with a more traditional method:

```
collect-setwords: function [block [any-list!]][
    setwords: [any [keep set-word! | ahead any-list! into setwords | skip]] 
    unique parse block [collect setwords]
]
```

and tried both on %red-object-browser.red:

```
>> rob: load %red-object-browser.red
>> length? c1: collect-setwords rob
== 42
>> length? c2: collect-set-words rob
== 46
```

Hey, you gather more words!

```
>> exclude c2 c1
== [i: item: w: ctl:]
```

Ha, these are `foreach` words probably, i.e. you gather some words that are not set-words! \*per se\*.  
But your performance is much better:

```
>> profile/show/count [[collect-setwords rob][collect-set-words rob]] 1000
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.148  | 0:00:00      |    20184284 | [collect-set-words rob]
0:00:00.279  | 0:00:00      |     2020596 | [collect-setwords rob]
```

hiiamboris

[20:56](#msg60493297a3a2f04f1fe8f034)Good catch on foreach!

[21:00](#msg6049335ce562cf54acb114f5)I'll note this in the header

toomasv

[21:00](#msg60493369e562cf54acb11517):+1:

greggirwin

[21:01](#msg604933a5120cd84f78095a02)Hey @rebolek, when we revisit Gritter at some point, it could be really cool to find messages with code.

rebolek

[21:26](#msg60493992823b6654d298cab7)@greggirwin I believe there’s a function for it in Gritter, I need to take a look.

[21:27](#msg604939c5d1aee44e2dd9e974)Yup, there is: https://github.com/rebolek/gritter/blob/master/gitter-tools.red#L209

greggirwin

[22:29](#msg6049483422a5ce4a9148d1d7)Nice!

## Thursday 11st March, 2021

bubnenkoff

[08:38](#msg6049d6f5b5131f4f2808adb9)How to change type during `set`?

```
parse [foo:] [set x set-word!]
```

now `x` become `set-word!` but I want to make it simply `word!`

[08:39](#msg6049d758d1aee44e2ddb98c7)is it good:

```
parse [foo:] [set x set-word!  (x: to word! x) ]
```

?

Oldes

[08:49](#msg6049d98ba3a2f04f1feab7c0)Yes... that is good. Question is, it you need to convert it.

[08:52](#msg6049da64a3a2f04f1feaba7b)Do you know, that you may use `any-word!` and `any-word?` in many situations?

bubnenkoff

[08:55](#msg6049daebb5131f4f2808bbc6)Thanks for tips! I did not know about them!

[10:35](#msg6049f27922a5ce4a914a8a52)With great help I mixed all examples and wrote interesting code. It can advance value to nested blocks. It check it parent name and insert value if it in list. The only problem I can't find issue why it do not process top level item: `lots` (but perfect work with `lot`) :

```
data: [
	id: 123
    foo: 33
    bar: 66
	lots: [ lot: [name: "blackberry"]
		lot: [name: "apple"]
		lot: [
			name: "bananas"
            number: 43
			obj: [ price: 44 ]
			obj: [ price: 44 some: [ age: 20 bar: []  ] ]
			]
	]
]		
		
tags: [lots obj bar]

parse data rule: [
    some [
           s: ahead [set-word! block!] set set-word-name set-word! (set-word-name: to word! set-word-name) (probe set-word-name) 
           | quote id: set b skip
           | if (not unset? set-word-name) if (find tags set-word-name) if (head? s) insert (quote id:) insert (b)
           | not block! skip
           | ahead block! into rule     
    ]
]

probe data
```

[10:58](#msg6049f7ea95e23446e42910eb)fix: `if (not unset? set-word-name)` --&gt; `if (value? 'set-word-name)`

toomasv

[12:50](#msg604a121ea3a2f04f1feb6a30)@bubnenkoff Good work, congratulations!  
Here is a bit reorganized rule that works for `lots` too

```
set-word-name: none

parse data rule: [
    some [
           s: quote id: set b skip
           | if (all [find tags set-word-name head? s]) insert (compose [id: (b)])
		   | ahead [set-word! block!] set set-word-name set-word! into rule 
           | skip
    ]
]
```

Con you point out now why your rule didn't work for `lots`?

bubnenkoff

[13:17](#msg604a1855b5131f4f28097fcf)thanks! That's very funny that my last version is very similar with your (I dropped a lot of `ahead`s), but my did not worked because few small but important difference!) Thanks!

[18:39](#msg604a63d6b5131f4f280a7be7)I want to do something like this. It should be possible, but I do not understand what I am doing wrong:

```
needle: 'id
parse [id: 1] compose [(to-set-word needle) integer!]
```

hiiamboris

[18:40](#msg604a6418e562cf54acb46d3a)use `probe` to find out

bubnenkoff

[18:42](#msg604a6499e5f1d949d491eb1a)Probe show that `needle` was right evalauted, but result of parsing is `false`

hiiamboris

[18:44](#msg604a652b44f5a454a46d7c5d)what do you think `id:` means for parse in it's rule?

bubnenkoff

[18:45](#msg604a6550823b6654d29c36c0)Oh, it seems that `quote` should be used: `parse [id: 1] compose [quote (to-set-word needle) integer!]`

hiiamboris

[18:45](#msg604a655fe5f1d949d491ed97)exactly :+1:

## Friday 12nd March, 2021

bubnenkoff

[09:18](#msg604b31f8b5131f4f280cc1e4)Why Insert do not insert noting in follow code:

```
a: [foo: 123]
parse [a] compose [quote (needle) set x integer! insert [id: (x)] ]
a
```

hiiamboris

[09:24](#msg604b3364d1aee44e2ddf9b30)`[a]`?

bubnenkoff

[09:41](#msg604b375c95e23446e42cb7d9)Yes, `[a]`, what's wrong?

hiiamboris

[09:55](#msg604b3a8ee562cf54acb6d27f)that's a block with one `word!`

bubnenkoff

[09:57](#msg604b3b1ba3a2f04f1feecec9)"with word and value" right?

hiiamboris

[09:59](#msg604b3b8422a5ce4a914e47f4)nope

bubnenkoff

[10:01](#msg604b3bee823b6654d29e94cc)oh my bad! Brackets!

[10:47](#msg604b46b6e8267a46f20c5bd5)This code is working:

```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip ]
x
>> 123
```

But here I am getting `x has no value`. It's seems that `compose` try to evaluate all before last `x` will get value. How to solve it?

```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip (print x) insert [(to-set-word needle) (x)] ]
>> x has no value
```

hiiamboris

[10:57](#msg604b4926d2619a4f2e3d9179)`([(print x)])`

[10:58](#msg604b494ad2619a4f2e3d91ee)etc

[10:59](#msg604b499ee562cf54acb70ac8)or use https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md better suited for that

toomasv

[11:02](#msg604b4a4fa3a2f04f1feef3f0)Or try to wrap your head around this convoluted example:

```
parse a compose [ 
    quote (n: to-set-word needle) 
    set x skip (quote (print x)) 
    insert (to-paren reduce ['compose reduce [n quote (x)]])
]
```

bubnenkoff

[11:04](#msg604b4ad5823b6654d29ec33c)Oh magic! I do not know how I would read it after few weeks after writing)))

toomasv

[11:08](#msg604b4baeb5131f4f280d0ae2)(Corrected example: `quote (x)` in the end)

bubnenkoff

[11:09](#msg604b4bd4823b6654d29ec529)this work for me:

```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip insert [(to-set-word needle) (reduce [(x)] ) ] ]

>> a
== [id: 123 id: 123]
```

toomasv

[11:11](#msg604b4c68b5131f4f280d0c43)Did you try it in fresh console? ;)

bubnenkoff

[11:17](#msg604b4dd6e8267a46f20c6e32)hah! In fresh do not work)

toomasv

[11:20](#msg604b4e6c457d6b4a94be1959)What do you think `compose/deep [[(reduce [(x)])]]` would do?

bubnenkoff

[11:25](#msg604b4fa695e23446e42d0175)at result it will try to evaluate `x`

[11:26](#msg604b4fcca3a2f04f1fef012f)I checked and it will print: `[[1]]` is `x` is setted

toomasv

[11:29](#msg604b50b4d1aee44e2ddff9ae)But you need not to evaluate `x` at compose-time, only at parse-time...

bubnenkoff

[12:47](#msg604b62c7d1aee44e2de02a81)Still hard to realize this magic.  
So:

```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip insert [ (to-set-word needle) ([(x)])  ] ]
```

output:

```
[id: 123 id: (x)]
```

so I need compose it's once again to get result, right?

[12:50](#msg604b63abe562cf54acb75677)But honestly I am not understanding why: `([(x)])` is evaluate to `(x)`. it should be: `[x]`

hiiamboris

[12:53](#msg604b6440d2619a4f2e3de2a0)

```
>> append [1 2] ([(x)])
== [1 2 (x)]
```

toomasv

[12:59](#msg604b65b6823b6654d29f0b2d)&gt; I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consecutive) parens

```
>> compose/deep [((([((x))])))]
== [((x))]
```

But there is another problem in your rule - `insert` will not evaluate block, but you need to evaluate `(x)`.

bubnenkoff

[13:15](#msg604b6986d1aee44e2de03c63)So `insert` and `append` evaluate block that inserting/appending? Because this:

```
>> append [1 2] ([(x)])
== [1 2 (x)]
```

toomasv

[13:16](#msg604b69aae562cf54acb76948)No

bubnenkoff

[13:17](#msg604b69d922a5ce4a914ecedc)then where `[]` ?

hiiamboris

[13:18](#msg604b6a08d71b6554cd3c0a45)

```
>> append [1 2] [3 4]
== [1 2 3 4]
>> append [1 2] ((([3 4])))
== [1 2 3 4]
>> ((([3 4])))
== [3 4]
```

bubnenkoff

[13:26](#msg604b6c0ae562cf54acb77177)I used not correct word. Not evaluate, but "right part is value or block content". Right?

hiiamboris

[13:27](#msg604b6c32e5f1d949d4949866)more or less

toomasv

[13:29](#msg604b6cca5d0bfb4e58a48c8b)I would add "or a result of evaluation"

```
>> append [a b](1 2 3 'c)
== [a b c]
```

Which is some kind of value of course

bubnenkoff

[14:42](#msg604b7dbe22a5ce4a914f0994)@hiiamboris "This mezz was made to counter the limitations of COMPOSE." so is there any plans to improve compose? I look at your code too, but it look like black magic for me. How to say in human words what limitation is? Something like: "ability to not evaluate impty values"?

hiiamboris

[14:54](#msg604b80abd2619a4f2e3e3403)you've just encountered that limitation yourself

bubnenkoff

[14:58](#msg604b81a7457d6b4a94beb299)So in theory there is should be something like `compose/lazy` that do not try to evaluate value if it has no value?

hiiamboris

[15:04](#msg604b830cd74bbe49e0ec4567)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md#an-overview-of-the-previous-designs first part is dedicated to the limitations of `compose`  
second point is about your problem:  
&gt; It \\\[compose\\] uses parens, so if one wants to also use parens in the code, code gets uglified.

You want some parens to be ignored by `compose` above, otherwise you uglify your code with `([(..)])` thing

[15:06](#msg604b838ba3a2f04f1fef95df)reshape ignores `()` and only processes `@()` and `!()`, thus helping you

[15:08](#msg604b8404457d6b4a94beb89f)but your last `x` is of course available only after parse, so you'll have to resort to `compose` again there

## Sunday 14th March, 2021

bubnenkoff

[11:53](#msg604df932d2619a4f2e44911e)Hot to check if `1` is next to set word?

```
>> parse [a:] [set-word!]
== true
>> parse [a:1] [set-word! 1]
== false
```

hiiamboris

[11:55](#msg604df99de562cf54acbe0fc9)`quote` it

[11:55](#msg604df9b6d2619a4f2e4492c7)`a:1` is not a set-word though

bubnenkoff

[11:57](#msg604dfa41d71b6554cd42a741)Thank! I got it!

## Thursday 18th March, 2021

bubnenkoff

[09:28](#msg60531d389ebdfd16408065a4)word in my case can be:

```
none
integer!
string!
```

Is the any common type for them?

rebolek

[09:33](#msg60531e692beb1e1da3b440e5)No, but you can make a typeset:

```
>> whatiwant!: make typeset! [integer! none! string!]
== make typeset! [none! string! integer!]
>> parse [1] [whatiwant!]
== true
>> parse ["a"] [whatiwant!]
== true
>> parse [#[none]] [whatiwant!]
== true
```

hiiamboris

[09:33](#msg60531e763a9448256c1334e0)until evaluated, it's just words though

bubnenkoff

[09:44](#msg60532110ac0fd631ca761262)Why false?

```
>> parse [a: none] [ set-word! [string! | integer! | none! ] ]
== false
```

[09:45](#msg6053212288edaa1eb8c44874)

```
>> parse [a: 1] [ set-word! [string! | integer! | none! ] ]
== true
```

[09:53](#msg60532329ad83ec3d7d3955fe)though evaluation `x` as `'none` is working:

```
>>  parse [a: none] [ set-word! 'none ]
== true
```

toomasv

[11:04](#msg605333a388edaa1eb8c47ba5)How many nones are in your input? None.

greggirwin

[19:01](#msg6053a39233346c16275eff05)@bubnenkoff sometimes it can help to use other funcs to explore your data. e.g. `foreach ... print type? ...]` or a general `parse` rule that accepts any value and dumps info about it.

## Friday 19th March, 2021

bubnenkoff

[12:49](#msg60549dd5ad83ec3d7d3dbfd7)How to split parsing in two step. On first to process words that have values as value. And on second to process only words with block.  
I know about recursion, but I am not sure that it should be used here

```
parse [a: "Hello" b: [ foo: 123 bar: [ x: "name" ]] c: "world" ] rule: [  ]
```

[12:50](#msg60549e19563232374c2dd9c9)I want to process first level, that to move to second and then move to third

hiiamboris

[13:03](#msg6054a12183533831b4ee94b5)why separate?

bubnenkoff

[13:15](#msg6054a3fea7dfe1372ee3dda3)I want to make from mext structure:

```
data: [
    purchaseNumber: 848838383
    region: none
    lots: [
        objects: [
            object: [
                    OKPD_code: "25.22.11" 
                    OKPD_name: {aaaaaaaaaa} 
                    quantity: "1.00" 
                    isMedicalProduct: none 
                ]

            object: [
                    OKPD_code: "83.44.66" 
                    OKPD_name: {bbbbbbbbb} 
                    quantity: "2.00" 
                    isMedicalProduct: none 
                ]
				
            some: "Test message"
            ]
        ]
    tag: "is_lots"
]
```

Something like this:

```
[
	[parent-name: "mainTable" key: [purchaseNumber region tag] value: [[848838383 none "is_lots"]] ]
	[parent-name: "objects" key: [some] value: [ ["Test message"] ]]
	[parent-name: "object" key: [OKPD_code OKPD_name quantity isMedicalProduct] value: [ ["25.22.11" {aaaaaaaaaa} "1.00" none ] ["83.44.66" {bbbbbbbbb} "2.00" none ]  ]]
 ]
```

I started with follow code:

```
root?: true
root-name: "mainTable"
block-name: none
inside-parent?: true

result: copy []
key-value: copy/deep [parent-name: none key: [] value: []]

parse data rule: [

    some [
        ( if root? [ key-value/parent-name: root-name ] ) 
        ahead [set-word! [string! | integer! | 'none ] ] set set-word-name set-word! set set-word-value [string! | integer! | 'none ]  
        (append key-value/key to-word set-word-name append/only key-value/value set-word-value)
        (root?: false) 
         | skip

    ] 

]

print block-name
probe key-value
probe result
```

But when I am going into recursion I am loosing child/parent name

hiiamboris

[13:18](#msg6054a4903a9448256c17a825)make a function with arguments: child-name and parent-name, and recurse into it

## Sunday 21st March, 2021

rseger

[21:33](#msg6057bba58478e061b94f5288)am I understanding `to rule` correctly: even if `rule` advances the input considerably before it ultimately fails, `to` will dutifully continue from where it began testing (and not where the input was left when things failed)?

hiiamboris

[21:35](#msg6057bc0aa7dfe1372eeb6612)Exactly. This is called backtracking.

rseger

[21:38](#msg6057bcc4f07ffa1eb557f991)excellent, makes sense. Love it when that happens :)

hiiamboris

[21:39](#msg6057bcf828e6153d7234b648)you can hack it to work your way :)

[21:39](#msg6057bd17ac0fd631ca820c2e)read this? https://www.red-lang.org/2013/11/041-introducing-parse.html

[21:40](#msg6057bd6788edaa1eb8d03a8e)there's `word:` an `:word` things in there of particular interest ;)

[21:41](#msg6057bd7bad83ec3d7d454667)but I don't recommend hacking `to`

[21:41](#msg6057bd9328e6153d7234b82c)well.. if only to later discover how you were making your life harder

rseger

[21:42](#msg6057bda888edaa1eb8d03b03)constantly :)  
most of the examples seem to assume transparent data. Meaning you can know what's before and after the nugget you're trying to parse. I'm having a hard time translating things for opaque data

[21:42](#msg6057bdb63a9448256c1f1e27)learning a ton, but struggling mightily for it :)

gltewalt

[21:46](#msg6057beb5f07ffa1eb557ff5e)I struggle too

hiiamboris

[21:46](#msg6057becead83ec3d7d454967)@rseger when stuck, post your code snippet here, someone will offer an advice ;)

rseger

[21:51](#msg6057bff388edaa1eb8d040ca)sanitizing data isn't so wildly out of parse's use case that I'm running at a dead end, right? I have a semi-functioning horrific version working with regexes that I can no longer maintain because I can no longer read the gd regexes. Parse is like a goldmine for readability and I'm really hoping I can figure out how to use it this way without losing that

hiiamboris

[21:58](#msg6057c1703a9448256c1f27dc)you'll learn it ;)

[21:58](#msg6057c18abc554b42d615ea4b)sanitizing works just as well as anything else really

greggirwin

[22:07](#msg6057c38fbc554b42d615eed9)Almost anything can be done with `parse`, though it's not \*always* the best choice. Sanitizing data is a perfect use case for it though. How complicated things get all depends on your data, and how well specified the rules are. You can use the free version of DiaGrammar (link at the bottom of https://www.redlake-tech.com/products/diagrammar-for-windows/) to see if visualizations help you think through it.

As @hiiamboris if you post sample data and goals, you'll often get help here.

rseger

[22:13](#msg6057c5033b9278255bc4bd1e)it has to work against intentionally degenerate data, unfortunately. Both the nugget and the surrounding opaque data are available to the attacker to manipulate in any way they like before it all gets passed through my engine. The data has to come out squeaky clean without destroying the good stuff in the process

[23:10](#msg6057d27388edaa1eb8d06a87)bah, my `to` hack works but it is painfully slow :sob: why you gotta be right @hiiamboris?

[23:15](#msg6057d39d8478e061b94f8c77)I gotta take a break for a bit but if anyone is bored and interested in a concrete example, this works save being painfully slow

```
xor: [to [ to "$" begin-xor: copy first-var to [whitespace | "="]		; find the first var assignment where,
		ahead [to [{^^} any whitespace first-var]]						; that variable is ever ^ed (xor)
		to "$" copy second-var to [whitespace | "="]					; and the next variable
		thru [to "$" copy third-var to [whitespace | "="]				; is called, with the results assigned
				any whitespace "=" any whitespace second-var "("]
		thru [third-var "();"] end-xor:									; to a third variable, itself called
		(change/part begin-xor "" end-xor)] any skip]					; remove all the bad
```

## Monday 22nd March, 2021

hiiamboris

[08:05](#msg60584fb2ad83ec3d7d469e8d)Haha. I wonder if this code has O(n^4) complexity or near that (:

toomasv

[09:14](#msg60586010ad83ec3d7d46cac2)@rseger Maybe post a small sample of your input and state what you want as an output, so we can hopefully offer some advice how to go about it with `parse`?

rseger

[14:56](#msg6058b014a7dfe1372eedd925)I don't have a problem sharing it buuut, it's malware. It's inert, in that you would have to copy it into a php file and then have the php engine run it before it was at all harmful, but I can see how it would make a lot of people nervous.

[14:57](#msg6058b05c563232374c37e9ea)had some ideas in twilight while I was drifting to sleep last night - love it when that happens and hopefully can get that knocked down from O(n^4) (It's definitely somewhere around there)

toomasv

[15:53](#msg6058bd6b563232374c381285)No need for actual code, just something that would satisfy your constraints, e.g. following:

```
whatever 
$x = $y 
$a = 123 
$b = xyz
$c = $b(blah-blah)
$c();
gnah 
^ $a 
whatever
```

Should this be sanitized into:

```
whatever 
$x = $y 
gnah 
^ $a 
whatever
```

## Wednesday 24th March, 2021

hiiamboris

[15:24](#msg605b59ae9ebdfd1640964f69)@pekr I've implemented your idea of a \[parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) (how I imagined it) so check it out ;)  
Can we improve it?

[15:32](#msg605b5b712beb1e1da3c9f741)I'm also interested in real world use cases if you guys have any

toomasv

[15:51](#msg605b5ff1c1e10242c5be80bb)@hiiamboris Seems really nice! :+1:

pekr

[16:20](#msg605b66b33b9278255bce8a83)wut? In just two days? How's that? :-)

[16:20](#msg605b66d49ebdfd16409676b7)I will try to run the examples, thanks for that!

hiiamboris

[16:22](#msg605b6754563232374c3f5c09)in 4 hrs ;)

greggirwin

[16:23](#msg605b678668921b62f4831606)Look at how little code it takes @pekr, and everyone please say what you think of his CLI approach. We've had that waiting in the wings for quite some time.

Nice work @hiiamboris. :+1:

As far as real world use, making `parse` an option in our own future AWK-like tool would be a superpower.

pekr

[16:59](#msg605b70013a9448256c2908f7)The only thing I might be concerned about, is the Red's parse speed. I do remember my R2 old days comparison to the CA-Visual objects lang, which compiled down to the native language. Rebol was faster and everybody was like - how could that be? It's just an interpreter. I do remember some examples with Red, which was lot slower, than in R2, but it is an old story, so I will have to re-try.

[17:00](#msg605b702bbc554b42d61fd747)@greggirwin I do remember some blog post, talking about the CLI. What was that? Is that some concept, like to create some CLI apps using Red and @hiiamboris just used that?

greggirwin

[17:28](#msg605b76a5ac0fd631ca8c119d)We can profile it @pekr, what's your worst case scenario? But then, to be fair, we have to show solutions in the faster lang or tool, e.g. the consecutive vowel or mixed case examples. :^)

@hiiamboris wrote this CLI dialect. It's quite different from what I originally proposed, and I admit it's still different enough that until you use it a few times it may seem strange. If you look at the \[parse tool code](https://gitlab.com/hiiamboris/red-cli/-/blob/master/mockups/parse/parse.red), you'll see a func called `parse-tool`, and then a \[line](https://gitlab.com/hiiamboris/red-cli/-/blob/master/mockups/parse/parse.red#L73) that processes the CLI. The rest is magic.

Look again at the `parse-tool` func. Look at its spec. Look at the `--help` output for the app.

[17:29](#msg605b76fa8478e061b9598a9c)The details for it are \[here](https://gitlab.com/hiiamboris/red-cli).

## Friday 26th March, 2021

rseger

[19:43](#msg605e39442beb1e1da3d2100d)I've been trying to learn to incorporate `remove` into my parsers but I'm having a hard time solving for conditional removal. Meaning I want to remove something starting from the beginning of the parse rule but only if the whole rule ultimately matches. To complicate that, I need to scan through the whole file to find if the rule matches anywhere.

`remove to [bigger rule]`does the opposite in that it effectively destroys everything I want to keep.  
`to remove [bigger rule]` isn't valid syntax. And thus far all of my efforts to embed remove into that bigger rule have resulted in partial removals

[19:43](#msg605e3952bc554b42d627b45a)anyone able to point me in the right direction?

hiiamboris

[20:18](#msg605e41a22beb1e1da3d22638)like this?

```
>> parse s: "abcdef" [p: 4 skip remove p] s
== "ef"
```

[20:21](#msg605e4237ad83ec3d7d574a98)tried `to [remove [bigger rule]]`?

rseger

[20:22](#msg605e428fad83ec3d7d574b81)remove here is removing everything from `p:` to the current index when it's called?

[20:23](#msg605e42c288edaa1eb8e23baa)and you can change that current index with `:other-spot` (assuming it's set, of course), right?

hiiamboris

[20:25](#msg605e4324ad83ec3d7d574d66)yep

[20:25](#msg605e433f3a9448256c30ebf4)be careful though that all your indexes after start of remove will move too (relative to the content that's left I mean)

rseger

[20:26](#msg605e435b9ebdfd16409ea4bf)good to know

[20:27](#msg605e439cc1e10242c5c6b45f)(and thank you - that is exactly what I was hoping to learn!)

hiiamboris

[20:27](#msg605e439e68921b62f48b3fbd)I added `--write` to the Parse tool to batch edit files ;)

[20:27](#msg605e43aba7dfe1372efd528e)With ports it will kill `sed` ;)

GiuseppeChillemi

[21:30](#msg605e526fad83ec3d7d577713)Wow

Oldes

[21:44](#msg605e55d088edaa1eb8e26e8d)Can anybody explain what's goin on in this piece of Rebol2 parse code?

```
defs: [<nothing>]

line-rule: [
	s: #L set line integer! e: (
		s: remove/part s 2
		new-line s yes
	) :s
]

src: [
	R/S [
	  #L 2 T: "R/S"
	  #L 3 A: "o"
	  #L 4
	]
] 

parse src blk: [
	some [
	 line-rule
	| p: [path! | set-path!] :p into [some [defs | skip]]	;-- process macros in paths
	| s: 
	  [into blk | block! | paren!]			;-- black magic...
	  s: (print "END?" ? src halt)
	| skip
	]
]
```

[21:45](#msg605e55f2563232374c47c645)It works in R2, but not in Red (matching by datatype not supported) nor in R3.

[21:46](#msg605e564d28e6153d7246ec8f)It's trimmed from \[this Red's compiler function](https://github.com/red/red/blob/master/system/loader.r#L222).

hiiamboris

[22:02](#msg605e5a08f07ffa1eb56a1d2b)what do you mean by "matching by datatype not supported"?

[22:05](#msg605e5a939ebdfd16409ee730)ah I see

[22:05](#msg605e5abb563232374c47d396)try changing `into blk` with `ahead any-block! into blk`?

Oldes

[22:08](#msg605e5b6a8478e061b961aef9)This is the problematic part: `into [some [defs | skip]]`

hiiamboris

[22:09](#msg605e5ba068921b62f48b7c17)I don't see a problem there

Oldes

[22:10](#msg605e5bec68921b62f48b7ca0)It's the combination of `into` and `skip`

hiiamboris

[22:11](#msg605e5bfef07ffa1eb56a215a)So?

[22:11](#msg605e5c143b9278255bd6f298)`into` applies the following rule `some [defs | skip]` to the path

Oldes

[22:13](#msg605e5ca2a7dfe1372efd9812)Where happens the:

```
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

9214

[22:14](#msg605e5ca9bc554b42d6281714)@Oldes try this in R2, R3, and Red.

```
parse [""][into [none!]]
```

`into blk` tries to match `"R/S"` because it's a series. The other `into` does some pre-checking (poor man's `ahead`) for paths and avoids that.

Oldes

[22:22](#msg605e5e939ebdfd16409ef27a)AH.. so this is the magic.. `parse ["R/S"] [into blk]` is `false` in R2, but error in R3 and Red.

## Sunday 28th March, 2021

rseger

[02:05](#msg605fe47c3b9278255bdab59c)is there a clean/concise way to tell parse "if you've gone past here, fail"? Using markers, changing them to index integers, and comparing those works it's just not very elegant

9214

[02:09](#msg605fe5449ebdfd1640a2ac9b)

```
text
>> parse [forbidden zone]['forbidden 'zone [fail] | (print 'fallback!)]
fallback!
== false
```

rseger

[02:10](#msg605fe5a468921b62f48f4db5)I was thinking more "if you've gone past the next newline, bail"

[03:10](#msg605ff3958478e061b9659657)am I right that `[0 1234 skip "a"]`would be more efficient than `thru "a"` when there is no "a" in the input, and the input is longer than 1234 characters?

[03:19](#msg605ff5b468921b62f48f743f)nm - skip is super greedy so it won't work for what I was thinking anyway

hiiamboris

[08:28](#msg60603e2733346c1627800d8b)not "greedy" :) `skip` just means accept any token. Parse rules do not look ahead to see what rule is next.

rseger

[17:08](#msg6060b81ead83ec3d7d5d54a9)fair, still stuck in regex land a bit :flushed:

[17:14](#msg6060b96a28e6153d724cd9b1)I just went through a chunk of my code from a week ago. Two things became apparent: I have actually learned a lot, my original cut.. :sob:

hiiamboris

[18:15](#msg6060c7c8bc554b42d62e06ec)maybe you can start a "Parse for Regex users" wiki entry ;)

rseger

[19:02](#msg6060d2e3f07ffa1eb5702ed0)lol. I feel like maybe I should figure that out a little first :)

greggirwin

[19:19](#msg6060d6d0a7dfe1372e03c60e)@rseger look at how much you've done in a short time, even with a few stumbles. Progress indeed.

Even thinking about how we use terms, or are used to their use in use cases where you hadn't had a case to use them, can be confusing. Is `skip` greedy in the sense that it matches any value, or is repetition greedy because it will consume all it can up to a point? Is `to end` the ultimate in terms of greed?

I'm still amazed at how easy `parse` is to use for many things, given how powerful it is. That makes these clarifications important because it's easy to wade into dangerous territory without realizing it. Suddenly you're lost and the urge to run will not serve you well. :^)

rseger

[20:50](#msg6060ebfb33346c162781d6a5)heh, I've fought that urge a few times "I could just do XYZ with a regex and this would work". Problem is, regexes at this level of complexity are absolutely unreadable (if you can get them to work at all). Like it or not they are simply not an option - I need something more powerful. Parse is that, with an ice cold bucket of new perspective on the side :)

[20:58](#msg6060eded2beb1e1da3d8bead)lol, right into an ice bucket

```
>> parse "abc" [to "b" break]
== false
```

but the intro to parse page is saying `break : break out of a matching loop, returning success.`  
Is there a new command for that or am I totally misunderstanding again?

greggirwin

[21:07](#msg6060f001f07ffa1eb5707153)&gt; an ice cold bucket of new perspective

Fair warning. I'm going to steal that line. :^)

[21:08](#msg6060f049c1e10242c5cd6ab1)https://github.com/red/docs/blob/master/en/parse.adoc#break is a better reference. Intro to parse was written a long time ago, and is likely stale in some descriptions.

hiiamboris

[21:08](#msg6060f05668921b62f491ef1b)@rseger I suggest \[raising an issue](https://github.com/red/red/issues/new?template=bug\_report.md) about that. `break`, `fail` and `reject` designs are fundamentally flawed IMO. There was a discussion about them previously in https://github.com/red/red/issues/3478 , but unfortunately I don't know if Nenad saw it.

A more in-depth material https://w.red-lang.org/en/parse/ says that for Parse to return `true` it requires  
&gt; Full match of top-level rule and input exhaustion

"Input exhaustion" is what's missing. But to me it looks like a special case where one shouldn't be.

[21:09](#msg6060f0a1c1e10242c5cd6b48)In any case it's worth careful consideration and documenting.

greggirwin

[21:11](#msg6060f0f0ad83ec3d7d5de7a3)Docs say "Forces enclosing block! rule to instantly succeed. " but only repetition based examples are used. I agree that this needs to be clarified.

The great thing about new people is that they don't know what to tiptoe around, reminding us of traps we automatically avoid.

hiiamboris

[21:11](#msg6060f10868921b62f491f0b7)True ;)

rseger

[21:29](#msg6060f52d56debe325c494f4f):boom: &lt;- my true skillset ;)

hiiamboris

[21:32](#msg6060f5e4f8add214d8ff7c3d)Dangerous! :D

greggirwin

[21:35](#msg6060f69bcfd0b814eba8533a)Save that codepoint for function name annotations. We can blow Hungarian Notation out of the water, almost literally.

rseger

[21:35](#msg6060f6b23bc21d01dd4d4846)`to end` works, similar to `any skip` - I was just looking for a more efficient "you're good buddy, thank you"

greggirwin

[21:38](#msg6060f75947b0403241a543ca)\*Finally* someone who is kind to their constructs. :^)

## Monday 29th March, 2021

9214

[02:17](#msg606138c96b7b535ee1e23cf3)@rseger, `break` forces enclosing block to succeed, but also breaks looping constructs (i.e. `any`, `some`, `while` and integer repetition), if any. Control-flow keywords in Parse are bugged though, see https://github.com/red/red/issues/4193 for potential pitfalls. Your example is a bit of a special case: `break` "breaks" top-level rule, so it should return `true`, but then it did not actually exhaust the input, so it's `false`.

gltewalt

[02:43](#msg60613ec0679f465566aa1988)Why did they decide on returning `true` when input is exhausted? Seems to me that people are primarily concerned with whether something matches or otherwise succeeds along the way to the end of the input.

[02:45](#msg60613f39c1c67842a3f4cd62)I know it's an expression based language, and has to return something

rseger

[02:46](#msg60613f7a1049fe429b86ee38)I appreciate the heads up!

[02:48](#msg60613fea679f465566aa1cfc)I don't know that it makes sense beyond my use case but a word which halted everything and returned true, just the opposite value but how I assume `fail` returns, would be cool.

greggirwin

[02:49](#msg60614035cfd0b814eba8f767)@gletewalt, how can it know when \*you* think it's done? If you don't care after finding a match, just add `to end`, which also makes your code more self-documenting. But also consider that you may be collecting data or executing commands in a dialect. If you want to scan an input without actions, you can still tell if it's valid. Another use case might be a dispatcher that takes inputs, scans them fast without actions, and sends them on to handlers based on the match. If you only do partial matches, you may not be able to distinguish two inputs that start the same, which comes back again to how does it know what you want?

gltewalt

[02:50](#msg606140643bc21d01dd4de8c5)It knows by Stern Scowl

rseger

[02:50](#msg6061406a8ebd6869504fcce1)lol

9214

[02:50](#msg60614086679f465566aa1e19)@rseger that depends on what you mean by "halted everything and returned true". Do you mean stop parsing and force `parse` to return `true`?

rseger

[02:50](#msg60614091af65792631b17feb)yep :)

9214

[02:51](#msg606140c1679f465566aa1edb)Well, the only way to do so is to consume all the input, so I think you know the answer.

rseger

[02:53](#msg606141271049fe429b86f295)right now, yeah. It's not super efficient when I've got MBs of input left but I already found the thing I wanted

9214

[02:54](#msg60614157cfd0b814eba8f9b6)@rseger you can mark the tail of the input in advance and then simply use `:mark`, for example. Should be marginally faster than combing thru megabytes of data with `to` or `thru`.

[02:58](#msg6061423c6b7b535ee1e2501e)Or you can rephrase the problem: why do you need `parse` to return `true`? You can signal that the thing you wanted is found the other way, e.g. `[thing (found?: yes)]`.

greggirwin

[02:58](#msg6061423f3bc21d01dd4ded27)@9214, what's your view on using `throw` for that case?

```
accept: [(throw true)]
catch [parse [a b c]['a accept]]
```

rseger

[02:58](#msg6061423f47b0403241a5eaa5)I really like the sound of that. How do you get the input to the end in order to set the `mark:`?

9214

[02:59](#msg606142740613c4694923ae15)@rseger `mark: tail input`? In pure Red, that is. IIRC Parse docs have some examples that show that approach.

rseger

[02:59](#msg606142a50613c4694923ae69)that's true. Right now I have a really slick little `foreach` loop running through all of my parses. Each one of them is executed in a `while` loop. So, while they are finding things they get sent back out to keep trying. As soon as they are unable to find what they are looking for, the next parser is called in

[03:01](#msg60614304cfd0b814eba8fcbf)looking to an external variable for success/failure could certainly work, and I may need to go that route if that turns out to be a considerable efficiency gain, but using parse's return value directly is really nice

[03:03](#msg606143980613c4694923b11b)forgive the newbie question but you can set marks in/on input outside of parse?

[03:04](#msg606143b46b7b535ee1e2534a)or is `tail` a special word in parse?

9214

[03:05](#msg6061440414188a5edfcf9262)@rseger no, `tail` is a Red native that sets series' index to a, well, tail. Just like `head` sets it to a head. Are you familiar with how series work in Red though?

[03:07](#msg606144701049fe429b86f974)Does that make sense?

```
>> block: [a b c d e]
== [a b c d e]
>> c: find block 'c
== [c d e]
>> e: find block 'e
== [e]
>> parse block ['a 'b 'nope | :c mark: (probe mark) :e mark: (probe mark) skip] 
[c d e]
[e]
== true
```

rseger

[03:07](#msg60614483cfd0b814eba9004a)well, I thought I was :)  
evidently there are some subtleties there I'm missing.

[03:07](#msg6061448d940f1d555e24f3cc)let me noodle on that a sec :)

[03:13](#msg606145e7cfd0b814eba903b9)find is returning a pointer into that series, effectively?  
`:c` is inserting that pointer as the current parse index. Then `:e` is doing the same.  
the final skip is eating that last 'e'.

[03:13](#msg606145ed0613c4694923b790)am I reading that right?

9214

[03:15](#msg606146653bc21d01dd4df698)@rseger yes, conceptually that's correct. Series is a heterogenous (i.e. it can contain any value regardless of its type) array with boundary checking + an offset (or rather a 1-based index, but internally it's a 0-based offset). Kind like Go's slices, except that the length cannot be modified.

[03:17](#msg606146d914188a5edfcf979b)So, in the example above, there's a single array (aka data buffer) `a b c d e` and two indices into it, `c` and `e`.

rseger

[03:18](#msg606146fa6b7b535ee1e25b48)wow. Evidently I understood almost nothing about how marks/find, all of it, really works. This is incredibly helpful, thank you!

9214

[03:19](#msg6061473e8ebd6869504fde1b)@rseger \[Rebol/Core](http://www.rebol.com/docs/core23/rebolcore-6.html) user guide has some pretty pictures that might help you.

rseger

[03:20](#msg60614786679f465566aa2e9c)yeah, those were helpful. What I didn't put together was their relationship with parse. I thought the two were entirely independent ways of working with series

[03:21](#msg606147bc6b7b535ee1e25d6f)seems I can do some pre-processing on the series before entering parse and (conceptually) pull that information in during processing. Amazing.

[03:22](#msg606147ff940f1d555e24fc80)is there a way to have parse process the series in reverse?

[03:23](#msg606148351049fe429b8703e3)conceptually that might be hard for me to wrangle right now but it would be incredibly useful for my use case

9214

[03:25](#msg6061489d56debe325c4a0c26)Well, you'll have to either `reverse` the input and write all the rules in Da Vinci's mirror writing, or do a lot of scaffolding.

[03:26](#msg606148e2af65792631b19321)There was some talk in the past about adding extra modes to Parse (reverse, Packrat, etc), but no one knows when it will happen, or happen at all.

toomasv

[06:16](#msg606170b347b0403241a66550)@rseger I use backward parsing a lot. Here is main logic of it:

```
>> block: tail [a b c d e f g]
== []
>> parse block [[any [s: (probe s) if (head? s) break | (s: back s) :s]] :block]
[]
[g]
[f g]
[e f g]
[d e f g]
[c d e f g]
[b c d e f g]
[a b c d e f g]
== true
```

[08:03](#msg606189cb8ebd686950508d49)Here is a bit more involved example of finding needle in possibly nested block by backward parsing:

```
block: [a b c [d a g f e] g h]
needle: 'a 
parse block rule: [
    (mark: none) 
    s: (s: tail s) :s 
    [any [
            s: (done: tail s) ahead needle mark: :done 
        |   ahead block! into rule s: [
                if (mark) thru end 
            |   (s: back s) fail
            ] 
        |   if (head? s) [
                if (s = block) fail 
            |   :done
            ] 
        |   (s: back s) :s
    ]]
] 
mark
== [a g f e]
needle: ['g 'f]   parse block rule   mark
== [g f e]
needle: 'g   parse block rule   mark
== [g h]
```

hiiamboris

[08:46](#msg606193fe679f465566aafaba)this is highly inefficient though, you would be better off with find/reverse

[09:36](#msg60619f8556debe325c4aef03)@toomasv for the record, what's your use case(s)?

toomasv

[09:39](#msg6061a039cfd0b814eba9f262)I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually front) shapes or transformations, often identified by mouse offset only.  
The above snippet was just made up. I don't think I've used exactly same form before.

rseger

[14:45](#msg6061e7fe56debe325c4bb331)`back`? I didn't know about that at all. Is there a way to go backward in larger chunks? Say I wanted to back up by 1K bytes?

more importantly, thank you!

toomasv

[15:08](#msg6061ed7ff8add214d801edf3)@rseger look at `? skip`

[15:12](#msg6061ee5014188a5edfd15f05)

```
>> bin: tail append/dup #{} #{00} 1000
== #{}
>> head? skip bin -1000
== true
```

rseger

[15:17](#msg6061ef97af65792631b35cab)you can skip negative numbers?!

toomasv

[15:17](#msg6061ef9e1049fe429b88cbd3)Sure

rseger

[15:17](#msg6061efa0eb800601df080da6)so much love

hiiamboris

[15:18](#msg6061efdd47b0403241a7c0d6)It looks like some people come here not because of Red, but because of Parse alone ;)  
@rseger how did you find out about Parse?

rseger

[15:20](#msg6061f056eb800601df080f40)somewhat, kind of - yeah, very guilty. Happy coincidence is that I'm really digging Red as well. I realized the other day that I very rarely have syntax errors while coding Red and that's quite unusual for me, particularly when learning a new language.

hiiamboris

[15:22](#msg6061f0b6940f1d555e26cb6d)So you've been digging Red a bit and realized Parse is what you need and started digging it instead?

rseger

[15:22](#msg6061f0be8ebd68695051b322)I ran into the limits of regex, thought about creating my own one-off solution, and remembered that there's no way in the world I'm the first person to have this problem. Took some aggressive googling but I did finally find an alternative. Originally my goal was effectively just a subset of regex with great readability. I found a superset, just need to totally upend the way I look at the problem, lol

hiiamboris

[15:23](#msg6061f103940f1d555e26cc3b)I see. Do you happen to recall what webpage told you that there's Parse? ;)

[15:24](#msg6061f1326831fa2647d256cc)I'm just curious because like you say I imagine it'll require some really aggressive googling to find it..

rseger

[15:24](#msg6061f149f8add214d801f7c2)I solved 50% of this problem (it was 100% then, the problem is ever-evolving) about 6mo ago with pure regex. When I returned to pick up that extra 50% I realized I was going to have to re-write the original regexes because I couldn't read them anymore (and I'm fairly experienced with regexes)

[15:25](#msg6061f17a14188a5edfd1688c)let me see if I can't recreate the searches real quick

[15:25](#msg6061f186af65792631b36202)it definitely wasn't a "oh, here's your perfect answer" situation :)

hiiamboris

[15:31](#msg6061f2e88ebd68695051b957):D

rseger

[15:39](#msg6061f4a08ebd68695051bf15)alright, here's the high level. I'm not sure whether google's algorithm is lying to me now or not. I recall digging through 10s of pages of results for the last step and now it's only the fourth down but ultimately, here's the ark  
search "alternatives to regex" -&gt; "regex is the best, you're just dumb" and "somebody made an ABNF parse in javascript".

search "BNF parser" -&gt; 100's of effectively specialized solutions similar to what I was considering making.

search "alternatives to regex" -&gt; chase the results. This sounds quick but I read through a lot of garbage to finally get to this nugget `You may want to look at the RebolLanguage. It has parsing built into the language, using a syntax that looks like the one you described` in a message thread on `wiki.c2.com`. Rebol gets you to Red pretty quickly :)

hiiamboris

[15:44](#msg6061f5ccc1c67842a3f6cc1b)Thanks! That's quite a lot to skip thru to finally find what's you're looking for..  
I imagine Parse being useful on it's own should have more active advocacy agenda (something for @greggirwin to consider).  
Kinda speaks though, of a power of a language at whole, if just one small dialect of it draws so much attention.

[15:44](#msg6061f5e8c1c67842a3f6cc9d)@bubnenkoff should you come around, please tell us how did you discover Parse? ;)

rseger

[15:47](#msg6061f69c0613c4694925a270)Every new language is always looking for its "killer app", most of them don't really have anything except novel syntax and making XYZ for the specific problem(s) they were designed around easier. Since those problems technically can be solved in any other language, the new language basically just languishes at the fringes. I love them because they represent new ways of thinking about problems but that's as far as I get with most.

Red has the "killer app" already, parse is ridiculous. Just needs some marketing :)

hiiamboris

[15:57](#msg6061f8d6940f1d555e26e2b6)That's what @pekr says too. And what the experiment of \[Parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) is all about. But I guess we need to gather some real world use cases to make the tool solid. I don't really have anything myself except occasional `type file | find "string"` filter.

greggirwin

[16:00](#msg6061f99e3bc21d01dd4fdf70)Thanks for the info @rseger. Helpful indeed. And yes, @hiiamboris, we need more `parse` advocacy, which is one of the goals of https://www.redlake-tech.com/products/diagrammar-for-windows/.

rseger

[16:59](#msg60620760f8add214d8023880)the other thing that would be really helpful, something I hope to help with, is a more robust set of string-centric examples. A lot of the more robust examples are very focused on block parsing. It's certainly possible to do the translation but much harder when coming from a regex background.

greggirwin

[17:00](#msg606207920613c4694925d6c6)Agreed.

hiiamboris

[17:02](#msg6062083f940f1d555e270fe6)FWIW these pages have some potential for highlighting Parse and Red :  
https://rosettacode.org/wiki/Category:Text\_processing  
https://rosettacode.org/wiki/Parsing  
And others there... Red is often missing or contains solutions without wow-effect.

greggirwin

[17:05](#msg606208e0679f465566ac434e)We could make notes specifically for that on https://github.com/red/red/wiki/Advocacy.

[17:06](#msg606209041049fe429b8919ed)And put things here too: https://github.com/red/red/wiki/Parse-Cookbook

bubnenkoff

[18:36](#msg60621e39940f1d555e27542d)Is the re  
&gt; @bubnenkoff should you come around, please tell us how did you discover Parse? ;)

I will answer tomorrow.

hiiamboris

[18:37](#msg60621e6baf65792631b3ee4c):+1:

bubnenkoff

[18:38](#msg60621eb7f8add214d8027f99)I need to check if data have some values that are not blocks. For simplification I check `integer` only. I wrote next code and not sure that it's optimal (it's working):

```
if value? 'at-least-one-integer [ unset 'at-least-one-integer ]
parse [aa: [] cc: 1 bb: []] [ 
			some [ set at-least-one-integer integer! | skip ] 
			 if (value? 'at-least-one-integer) to end | [fail]
		]
```

`On:`\[aa: \[] cc: \[] bb: \[]]\` answer should be false.

Is there any ideas how to do it in better way?

hiiamboris

[18:41](#msg60621f451049fe429b8965aa)why not just `parse [aa: [] cc: 1 bb: []] [to integer! to end]`?

[18:45](#msg6062203647b0403241a85476)or `find [aa: [] cc: 1 bb: []] integer!`

## Tuesday 30th March, 2021

bubnenkoff

[08:12](#msg6062dd6b47b0403241aa515b)&gt; @bubnenkoff should you come around, please tell us how did you discover Parse? ;)

Be honestly I knew somthing about Rebol from Kaj de Vos who was co-developer of Syllable. I take part in it's community, but at that time I was not programmer. After long time I become programmer, and re-discovered Red. For few years I have not time\\task for it. And I started from Parse. It's take around 2-3 months to getting \*minimal* experience. With incredible help from community. And it take for me around one year before I was able to write some more o less working. It took a long time, but algorithms have never been my strong suit. So only every day practice.

hiiamboris

[08:38](#msg6062e37214188a5edfd3fcec)Aha. Thanks.

GalenIvanov

[08:58](#msg6062e8211049fe429b8b8c7b)Speaking of alternatives of regex, has someone tried \[Bracmat](https://github.com/BartJongejan/Bracmat)? It's about pattern matching in general, not only in text :

[08:58](#msg6062e82547b0403241aa6e1f)&gt; Bracmat is a computer programming language designed for analysis and manipulation of complex data, be it evaluation of algebraic expressions, parsing natural language, validation of HTML or automatic chaining multi-facetted webservices into a workflow. In several projects, Bracmat has been combined with other programming languages to take care of high level activities that otherwise would be very time consuming to implement.

[09:02](#msg6062e914679f465566aea8b2)I spent some time reading the docs, but the terse symbolic notation turned out to be beyond my grasp and my array languages experience.

rseger

[15:45](#msg606347a1679f465566afb810)this quote `beats Perl in terms of line noise` was what turned me off it. Line noise is the wrong sin, in my oh so humble opinion, to be focused on with perl. And you can see the results in the syntax they've chosen. They seem to be under the inaccurate impression that optimizing character count is somehow a good thing. Those days have long since passed. The correct optimization is for the maintainer of a codebase. You can certainly swing too verbose but the last thing I think when reading perl is "there's too much information in this line of code"

that said, I was saddened to see it. Their goals and ideas seem to be very solid. I just wish they were in a more maintainable package.

hiiamboris

[16:28](#msg606351c8f8add214d805c0b3)Perl is \[one of the best](http://99-bottles-of-beer.net/language-perl-737.html). I wonder if such code is possible in Bracmat.

rseger

[17:19](#msg60635d8b8ebd68695055c612)it truly is a marvel

GalenIvanov

[17:49](#msg606364bc14188a5edfd582be)@rseger Yes, I agree!

[17:51](#msg60636530c1c67842a3fabf7e)@hiiamboris I don't know Perl, but I think Raku (formerly Perl 6) have taken steps in the right direction - at least the (golfed) code I have seen in Code Golf &amp; Coding Challenges on StackExchange looks much better than Perl.

greggirwin

[18:10](#msg6063699f1049fe429b8cffde)That Perl stuff is astounding. True artistry. Bracmat is an interesting find. Skimming the docs, it brings to my mind how important foundational principles are. His are quite specific and lead to design choices and a user experience that make it interesting (e.g. no subtraction, no named fields). If it empowers people, that's what DSLs are for, but it isn't clicking for me at a glance.

There's an informal grammar in the PDF, but I can't copy it out to see how hard it might be to normalize. Not worth downloading and trying locally in PDFElement right now. If @GalenIvanov wants to reach out and see if the author can use the free version of DG to make a diagram for it, we'll render him one without watermarks.

GalenIvanov

[18:26](#msg60636d7014188a5edfd59a0e)@greggirwin That's an interesting idea - yes, I'll try to contact him with your suggestion.

greggirwin

[18:44](#msg606371968ebd686950560359):+1:

toomasv

[19:51](#msg606381593bc21d01dd5422e4)Bracmat grammar (for visualisation only):

```
input: [opt expression opt [";" input]]
expression:   [
 white-space expression white-space
 | opt prefixes "(" expression ")"
 | leaf
 | expression binop expression
]
leaf: [opt prefixes atom-or-nil]
atom-or-nil: [atom | nil]
atom: [{"} string {"} | string]
string: [character opt string]
character: compose [(charset [not #"\" #"^""]) | spec]
spec: compose ["\" (charset {abtnvfr"\})]
nil: [none]
binop: compose [(charset "=.,|&:+*^'$_") | white-space | "\L" | "\D"] 
prefixes: [prefix opt prefixes]
prefix: compose [(charset "[~/#<>%@`?!") | "!!"]
white-space: charset " ^-^/^L"
```

greggirwin

[19:55](#msg606382150613c4694929e046)Thanks @toomasv !

toomasv

[19:57](#msg6063829914188a5edfd5dc6e):)

greggirwin

[19:59](#msg606383061049fe429b8d4791)\[!\[bracmat.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/JfTY/thumb/bracmat.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/JfTY/bracmat.png)

[20:00](#msg60638353eb800601df0c97ff)@GalenIvanov feel free to pass that along to the author. If they want to use it, ask if they'll give us credit and point to https://www.redlake-tech.com/products/diagrammar-for-windows/. You can send them the working grammar from @toomasv as well.

hiiamboris

[20:31](#msg60638ab1eb800601df0cafe8)the image doesn't zoom for me (says files.gitter.im inaccessible, but ping works) :/

greggirwin

[23:10](#msg6063afd7af65792631b84a06)Technology is hard it seems. :^\\

## Wednesday 31st March, 2021

cloutiy

[14:46](#msg60648b4d6831fa2647d998d4)Is diagrammar available for linux?

greggirwin

[17:40](#msg6064b420f8add214d809a6d4)Not at this time.

## Thursday 1st April, 2021

bubnenkoff

[18:38](#msg6066130a56ddab18d7230252)Could anybody help me to adopt this code to output result in single quotes: like: `'`.  
I tied to write big hack with `replace "{"` but it produce a lot of errors.

```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]
```

The result should look like as SQL insert VALUES. They are single quoted.

greggirwin

[18:43](#msg60661437d765936399cac209)You should just be able to add the single quotes at the head and tail of each string.

bubnenkoff

[18:44](#msg606614970508990a25cac7f7)Do not understand moment where it should be added(

greggirwin

[18:48](#msg60661564156d1f51d8c6082d)I don't remember SQL rules for embedded quotes. What should the "some string..." look like when done?

bubnenkoff

[18:48](#msg6066158d657d022d5a57b759)`VALUES(1 'aa', 'some "name"', 123, NULL)`  
the quotes should look like this

greggirwin

[18:52](#msg6066165b657d022d5a57b8ac)If just enclosing each string works, this should do it:

```
enclose: func [
	"Returns a string with leading and trailing values added."
	str [any-string!]   "(modified)"
	val [char! series!] "A single value can be used in the series"
][
	rejoin either char? val [ [val str val] ][
		[form first val  str  last val]
	]
]
;enbrace:   func [s] [enclose s "{}"]
;enbracket: func [s] [enclose s "[]"]
;enparen:   func [s] [enclose s "()"]
;enquote:   func [s] [enclose s {"}]
;entag:     func [s] [enclose s "<>"]

block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [set s string! keep (enclose s {'}) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]
```

bubnenkoff

[18:53](#msg60661692d765936399cac8c2)Wow! Thanks! I need to check it on real data!

[19:00](#msg606618410508990a25cad20a)

```
block-to-comma-list ["25.22.11" "aa aaa aaaaa" "1.00" none]

== "('25.22.11', 'aa aaa aaaaa', '1.00', )"
```

it loosing none (that should be renamed to NULL)

greggirwin

[19:02](#msg606618c50147fb05c5ced3a5)So you'll need to add a rule for `| none!` as an alternate. I missed that when changing to the `string!` check.

[19:02](#msg606618dc9ecc541fc8cf1823)Then you can remove your last `replace` call.

bubnenkoff

[19:04](#msg606619560147fb05c5ced4a2)I put `none!` in wrong place?

```
rule: [collect any [set s string! keep (enclose s {'}) [end | keep (", ") | none!]]]
```

[19:05](#msg60661982d765936399cad0da)After one year this string is look magic for me(

greggirwin

[19:07](#msg606619ded765936399cad205)Well, you're not doing anything when you see the none. You want to keep NULL in that case, right?

bubnenkoff

[19:09](#msg60661a5163fb5651c1e4e1aa)yes

[19:09](#msg60661a7563fb5651c1e4e206)To get:

```
== "('25.22.11', 'aa aaa aaaaa', '1.00',  NULL)"
```

greggirwin

[19:14](#msg60661b7f56ddab18d7231716)So what do you think you need to do when you hit the `none!` rule? (hint: look at the `string!` rule)

bubnenkoff

[19:19](#msg60661cd61dbd860a2326a878)I tried different combination of `keep none!` and `keep 'none` do not work. Rule hard for me

greggirwin

[19:29](#msg60661f0d0508990a25cae5de)

```
enclose: func [
	"Returns a string with leading and trailing values added."
	str [any-string!]   "(modified)"
	val [char! series!] "A single value can be used in the series"
][
	rejoin either char? val [ [val str val] ][
		[form first val  str  last val]
	]
]
;enbrace:   func [s] [enclose s "{}"]
;enbracket: func [s] [enclose s "[]"]
;enparen:   func [s] [enclose s "()"]
;enquote:   func [s] [enclose s {"}]
;entag:     func [s] [enclose s "<>"]

block-to-comma-list: function[str-blk] [
    str: none
    rule: [
        collect any [
            set s string! keep (enclose s {'})
            | 'none keep (" NULL")   ; change to none! if it's a real none! value
            [end | keep (", ")]
        ]
    ]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]
```

bubnenkoff

[19:36](#msg606620bc0508990a25caeb33)It do not add `,` before last NULL, if to make it `(", NULL")` it would issue on first none  
`block-to-comma-list [none "25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]`

greggirwin

[19:38](#msg606621241dbd860a2326b3fd)I leave the details to you. :^)

bubnenkoff

[19:38](#msg6066214b15cd52559d73d022)Ok! Thanks!

## Friday 2nd April, 2021

bubnenkoff

[08:16](#msg6066d2c41dbd860a23285e07)@greggirwin It's seems that I did it. The yesterday rule was to hard for me and I was not able to fix it. So I did next:

```
enclose: func [
    "Returns a string with leading and trailing values added."
    str [any-string!]   "(modified)"
    val [char! series!] "A single value can be used in the series"
][
    rejoin either char? val [ [val str val] ][
        [form first val  str  last val]
    ]
]

data: [none "25.22.11" 44 "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]

result: ""

count: 0
foreach el data [
      count: count + 1
      if (string? el) [el: enclose el [{'}] "," ]
      if (el = 'none) [el: "NULL"]
      append result el

      if (count < length? data) [ ; prevent adding at end
      append result ", " 
      ]
]
insert result "("
append result ")"
```

output:

```
== {(NULL, '25.22.11', 44, 'aa aaa aaaaa', 'some string with quotes "Microsoft", "Apple", "HP"', '1.00', NULL)}
```

toomasv

[08:52](#msg6066db53ed315705c2929341)@bubnenkoff

```
SQLify: func [data][
    head insert next copy "()" rejoin parse data [
        collect [
            any [[
                  ['none | none!] keep ("NULL") 
                | ahead string! keep ("'") keep skip keep ("'") 
                | keep skip] 
                [end | keep (", ")]
]]]]
>> SQLify data
== {(NULL, '25.22.11', 44, 'aa aaa aaaaa', 'some string with quotes "Microsoft", "Apple", "HP"', '1.00', NULL)}
```

GalenIvanov

[08:54](#msg6066dbd33153ce63a3b4b497)@toomasv I was wondering isn't it possible to change `head insert next copy "()"` with `mold to-paren`?

[08:56](#msg6066dc2d15cd52559d758821)Apparently not in this particular case :smile:

toomasv

[08:58](#msg6066dcb456ddab18d724e770)As `to-paren` loads string, so yes, i.e. no.

GalenIvanov

[08:58](#msg6066dcc20147fb05c5d0b2e0):+1:

Oldes

[09:03](#msg6066ddf5db595f5599ce52f4)@toomasv your solution will fail once there will be some string like `"it's fail"`

toomasv

[09:06](#msg6066de9b3153ce63a3b4bc79)@Oldes I'm only giving pointers, not trying to develop THE solution :)

greggirwin

[20:00](#msg606777e03153ce63a3b6482f)@bubnenkoff \*not* using `parse` is a great option at times.

## Saturday 29th May, 2021

ldci

[17:11](#msg60b275d4a10461235da7a0d3)Hello everybody: looking for a parse rule for deleting punctuation marks in a text in order to keep only words.

GalenIvanov

[17:38](#msg60b27c2014d9cd234a667bfb)@ldci Here is some simple rule (you can add another punctuation marks to `punct`):

[17:39](#msg60b27c4978e1d6477d70fdba)

```
punct: charset ".,;!?"
remove-punct: [any [remove punct | skip]]
text: "This, that? No! Some ... "
parse text remove-punct
text
== "This that No Some  "
```

ldci

[17:49](#msg60b27ea643fc4a24c5d2213b)@GalenIvanov Thanks a lot!

GalenIvanov

[17:50](#msg60b27f039d18fe1998327145)@ldci You're welcome! Don't forget that it changes the source string in place.

ldci

[17:51](#msg60b27f3b9d18fe1998327199)@GalenIvanov Better. than using trim/with. Perfect:)

GalenIvanov

[17:52](#msg60b27f5ba10461235da7b47d):+1:

ldci

[17:59](#msg60b2811584a2f633a77ca527)\[!\[image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/REQ1/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/REQ1/image.png)

GalenIvanov

[18:04](#msg60b28225df5c362d4bfaa172)@ldci Nice! Is this part of a bigger project?

ldci

[18:07](#msg60b282e39d18fe1998327a8b)@GalenIvanov Nope. Just testing Red. BTW I really appreciate your contribution for L-System and graphics stuff:)

GalenIvanov

[18:09](#msg60b2834ffec22b4786ea7f76)Thank you! I hope there will be more to come :smile:

ldci

[18:10](#msg60b28392688a2624b8bc0f4b)@GalenIvanov We have to connect your work and redCV. :)

GalenIvanov

[18:14](#msg60b2848b801b07264e777863)Yes, I need to get familiar with redCV and stop reinventing things :smile:

ldci

[18:17](#msg60b2854adf5c362d4bfaa9cf)@GalenIvanov Please feel free to contribute. You’re welcome.

GalenIvanov

[18:24](#msg60b286da43fc4a24c5d233c3)@ldci Thanks, I'll be glad to contribute!

## Sunday 30th May, 2021

ldci

[06:46](#msg60b334e284a2f633a77e049a)@GalenIvanov Solution with trim is 2x faster than with parse. Probably because with parse this is char by char.

GalenIvanov

[06:55](#msg60b336c643fc4a24c5d38307)@ldci I don't know why - I'm not aware of the implementation details. Btw, have you tried `remove-each`?

[06:57](#msg60b3374ea10461235da91d53)

```
>> remove-each c text[find ".,;!?" c]
>> text
== "This that No Some  "
```

ldci

[06:58](#msg60b337a9688a2624b8bd72e8)@GalenIvanov I’ll test :)

[08:24](#msg60b34bd13d43a15a65d46e9c)@GalenIvanov 3 methods tested: trim, remove-each and parse. They are equivalent: less than 150 ms to count 2615 words in classical Cinderella text.

GalenIvanov

[09:14](#msg60b35760801b07264e790da3)@ldci Thanks!

greggirwin

[19:31](#msg60b3e80c84a2f633a77f7d98)`Trim` is low-level R/S code, which can spin through strings as characters very quickly. You trade speed for flexibility.

dsunanda

[19:51](#msg60b3ecbb45c2185a5efbade0)@ldci Stupid trick possible with TRIM - specify only the characters you want to keep. Everything else gets removed:

```
good-chars: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -"
text: "This! is (,not,).... a [good] example hyphen-ated"
trim/with text trim/with copy text good-chars
== "This is not a good example hyphen-ated"
```

ldci

[23:49](#msg60b424763d43a15a65d61af6)@dsunanda Very elegant!

## Monday 31st May, 2021

ldci

[00:34](#msg60b42f090ff6de262b3a21c8)I’m really impressed about string processing with Red: powerful and elegant  
`trim/with aTxt rejoin [",.;:!?-(){}'" form #"^ » »]`

[00:34](#msg60b42f31fec22b4786ede195)Fabulous

abdllhygt

[14:39](#msg60b4f53445c2185a5efdc21b)hi!  
which one is logic?

```
a: complement charset "<>"
b: ["<" copy a to ">"]
```

[14:40](#msg60b4f54643fc4a24c5d7361a)

```
a: complement charset "<>"
b: ["<" copy a ">"]
```

rebolek

[15:19](#msg60b4fe7314d9cd234a6bd4fa)second one. if you have charset, you don’t need `to`. But it would be `copy some a`.

abdllhygt

[15:31](#msg60b5014c43fc4a24c5d75663)@rebolek thank you!

[21:21](#msg60b55342850bfa2d3bf487c5)

```
any [
            !satır
            | !işaret
            | !işlev
            | !an
] ;any
```

is this enough to make loop?

[21:21](#msg60b55366df5c362d4b007b77)or, do i have to add this:

```
script: any [
             !satır
            | !işaret
            | !işlev
            | !an
            | script
] ;any
```

greggirwin

[22:28](#msg60b5630ad0f55b33ba1cd07e)You don't have to name rules unless you want to reference them by name, e.g. from multiple locations.

abdllhygt

[22:33](#msg60b564300ff6de262b3cc347)i didn't understand, can you give me an example?

greggirwin

[22:47](#msg60b5677c850bfa2d3bf4b020)`parse series [any ['a | 'b | ['satir | 'an]]]` vs

```
my-rule: ['satir | 'an]
parse series [any ['a | 'b | my-rule]]
```

abdllhygt

[22:53](#msg60b568ed850bfa2d3bf4b37f)i see, but i was talking about putting a block into itself

[22:54](#msg60b5693dfec22b4786f08cb0)

```
blok: [1 | 2 | 3 | 4 | blok]
```

like a loop  
i was asking that do we still need this if we use `any`. but now i know the answer, thank you! @greggirwin

greggirwin

[23:03](#msg60b56b4d84a2f633a782d7d5)Yes, if you want to use a rule recursively you have to name it.

## Thursday 3th June, 2021

abdllhygt

[20:58](#msg60b94292d0f55b33ba266369)hello!

[20:59](#msg60b942b5688a2624b8cb8629)how to use `parse/trace`? i was using it before, but i couldn't use now.

[21:02](#msg60b94359fec22b4786f99b03)ah it is `parse-trace`, i really forgot. long time i don't write `Red`.

[21:08](#msg60b944d914d9cd234a760a2c)is there a better method for reading result of `parse-trace`?

## Friday 18th June, 2021

gltewalt

[21:17](#msg60cd0d5ab9bddf676b20bd90)`parse-trace` is a wrapper for `parse/trace`, you can view the source and craft your own - `source parse-trace`, or modify parse/trace itself.  
Depends on what you mean by a better method for reading result

[21:30](#msg60cd10640b98b759b8d84efb)You can play with this, but I haven't touched it in weeks. Use a nightly build for your Red version.

https://github.com/gltewalt/parse-caddy

gtzip

[23:54](#msg60cd32537b5e81376330c79a)If parse-trace output is too long, there is a /part refinement that may be all you need to play with

## Sunday 20th June, 2021

abdllhygt

[18:10](#msg60cf848bb60c3137c3822699)thank you

## Friday 9th July, 2021

giesse

[09:54](#msg60e81cd848f9b1084a1e1640)Bug?

```
parse ['keep/only] ['keep/only]
```

[09:54](#msg60e81ce282dd9050f5dfce21)(returns true)

[09:54](#msg60e81cf3515cab3e4faa43af)(there used to be the same bug for lit-words)

hiiamboris

[13:26](#msg60e84e73f2b4077d6bb95f33)The bug was never fixed, so it likely affects paths too.

[13:27](#msg60e84eaef2b4077d6bb95fbf)If you wish to leave a comment: https://github.com/red/red/issues/3029 https://github.com/red/red/issues/3554

## Saturday 10th July, 2021

GiuseppeChillemi

[21:54](#msg60ea172ef2b4077d6bbd2f27)Could `Parse` in Block catch carriage returns?

[22:31](#msg60ea1fd9f2b4077d6bbd404a)\*Parse for Blocks

greggirwin

[22:34](#msg60ea20737b5a415e65dba291)Yes.

```
blk: [a b 
c d
e f]
parse blk [
	some [
		mark: (if new-line? mark [print mold mark])
		skip
	]
]
```

GiuseppeChillemi

[22:37](#msg60ea212a515cab3e4fae9547)Ok, it is needed for data rows ending with `new-line`, thank you.

## Monday 16th August, 2021

ne1uno

[21:54](#msg611ade89aedfa70f0d98c9f3).gse python for

[21:54](#msg611adeac4b7707158f86f56a)^H^H^H

## Thursday 9th September, 2021

greggirwin

[22:07](#msg613a85b411793469660b3767)For reference, on binary parser work: https://project-everest.github.io/everparse/

## Saturday 25th September, 2021

XANOZOID

[20:34](#msg614f87c163dca818917d3e90)&gt; not rule : invert the result of the sub-rule.

By result, does it mean it makes a "true" match reject??

[20:34](#msg614f87e24c7be06b79da50ca)I was expecting something like `parse blok [ any [not word!]]` to succeed on any block that has no words

[20:34](#msg614f87e6f428f97a9fa7858a)But it just fails

[20:36](#msg614f88598065e87a8e02e72e)\[!\[image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/8Ymk/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/8Ymk/image.png)

[20:37](#msg614f887f4c7be06b79da5203)the one that passes clearly shows there's only numbers and spaces . . . so why not pass when there's anything that isn't a word?

hiiamboris

[20:38](#msg614f88a97cd57813a8e5e6a1)https://w.red-lang.org/en/parse/#not

XANOZOID

[20:40](#msg614f893f11793469663946ca)Okay so based on that, this should pass as true  
`parse [1 2 3 4] [any [not word! | skip]]`  
But it does not

hiiamboris

[20:40](#msg614f895367e789189c1ae85d)`not word!` succeeds

[20:41](#msg614f8965117934696639473c)`any` stops because it doesn't advance

[20:41](#msg614f8978fd7409696e2fe8a1)end of parse block, input is not exhausted

[20:41](#msg614f897b117934696639476d)=&gt; false

[20:42](#msg614f89ab4c7be06b79da55a4)https://w.red-lang.org/en/parse/#any

greggirwin

[20:42](#msg614f89be8065e87a8e02ea6b)The key being that `not` (or `ahead`) never advance. Think of them as peeking ahead.

XANOZOID

[20:46](#msg614f8a8e4c7be06b79da5729)Thanks guys! Also nice to see there's a docs page now; I've just been referring to the blog post. I guess I was thinking a "true with no pass" would attempt to use the other rules but that wouldn't make sense - this helps!

## Thursday 14th October, 2021

lylgithub2021

[01:27](#msg61678776cd4972068b472cf0)I want to convert "%abc.txt.def.txt" to "%abc.txt.def" — that is to say, only keep the part before the last dot. How can I achieve

it by `parse`? Or in common, how to get part of content before the last given symbol(here is dot in this example）？

dsunanda

[01:46](#msg61678beefb8ca0572bbe5658)@lylgithub2021 Here's one way:

```
str: "%abc.txt.def.txt"
copy/part str find/last str "."
== "%abc.txt.def"
```

lylgithub2021

[01:54](#msg61678dcdf2cedf67f98359f9)@dsunanda Many thanks. According to your code `find/last str "."` which gives ".txt", then \`copy/part str ".txt" gives wrong message, why?

dsunanda

[02:00](#msg61678f49d78911028ad93cf2)@lylgithub2021

```
copy/part str ".txt"  ; is not the same as:
copy/part str find/last str "."
; my code is the equivalent of
copy/part str 13
```

lylgithub2021

[02:06](#msg616790a5cd4972068b473f3c)How does 13 comes since `find/last str "."` only returns ".txt"?

dsunanda

[02:14](#msg6167927e2197144e8463f509)`find/last str "."` returns the `str` series at the 13th position (ie at the last period). That happens to look like ".txt" but is subtly different - it's effectively `str` offset by 13.  
Series can take a while to get the hang of.  
Red's daddy - Rebol - probably still has the better documentation for explaining it -- see 7.5 here, for example:  
http://www.rebol.com/docs/core23/rebolcore-6.html

lylgithub2021

[02:27](#msg6167957f38377967f44ec7cc)The above reference seems not explain why the result of `find` can be regarded as length that can be used as argument of other function(i.e. `copy`).

dsunanda

[02:36](#msg616797aacd4972068b474d75)It may help to realize that `str: "%abc.txt.def.txt"` and `xxx: ".txt"` are completely separate series.

So `copy/part str xxx` is meaningless in this instance, while `copy/part str find/last str ".txt"` means copy `str` up to the position found within `str`

```
str: "%abc.txt.def.txt"
 xxx: ".txt"
 index? find/last str "."
== 13
index? xxx
== 1
```

lylgithub2021

[02:52](#msg61679b5d9d20982e4fbb95bc)But `copy/part str find/last str "."` gives "abc.txt.def", and `copy/part str 13` gives "abc.txt.def.". I am confused. Why does the former have not the last dot,but the latter have?

dsunanda

[02:54](#msg61679bf5d78911028ad9556d)I'd agree that's confusing - it's behavior copied over from Rebol, and it may take a deeper expert to explain why it is the best, rather than a mistake..... Might want to ask again in the Help room -- we're off topic for `parse`.

lylgithub2021

[03:06](#msg61679ec17db1e3753e3cc0b2)Many thanks again!! Then, is there a way to achieve it by `parse`?

gltewalt

[03:21](#msg6167a232fb3dcd4e882630c6)Because `find/last` returns `.` through the end of the string. Effectively takes it, or "chops it off"

[03:23](#msg6167a294ee6c260cf71944c3)

```
>> str
== "%abc.txt.def.txt"
>> find/last str "."
== ".txt"
```

[03:24](#msg6167a3093f09d85736110707)`>> copy/part str find/last str "."` is telling it to copy up to ".txt"

[03:28](#msg6167a3f738377967f44ee720)Including index? will give the latter result.  
`copy/part str index? find/last str "."`

lylgithub2021

[04:25](#msg6167b1437db1e3753e3ce467)`index?` is more readable, thanks. And I am still confused why the result of `find` can be used as length argument of `copy/part`. I don't find any explanation from help of `Rebol` or `Red`.

toomasv

[04:37](#msg6167b41c9d20982e4fbbc5a5)If you give a number, it is interpreted as offset (i.e. length to be copied), but result of find (i.e. same series with different index position) is interpreted as target position until which to copy.

greggirwin

[05:32](#msg6167c0d42197144e846456cd)The doc string for `/part` was shortened from R2, which was "Limits the search to a given length or position." so it's confusing as it is. If we change "length" to "extent" that helps, but the R2 doc string might be best. We can also add details to the `length` arg, and keep the `/part` doc-string short. The fact that the arg is called `length` makes it a bit confusing too. And just reiterating the types in a doc string isn't much more informative.

```
/part        => Limit the extent of the search.
    length       [number! series!] "Length or series position"
```

lylgithub2021

[07:04](#msg6167d6757db1e3753e3d3860) I see. Thank you @all

[07:13](#msg6167d88b9d20982e4fbc15bb)So, here, how to achieve it by `parse`?

rebolek

[07:17](#msg6167d9a0d78911028ad9d8bd)@lylgithub2021 for example:

```
file: %abc.txt.def.txt
rejoin parse file [collect some [keep to #"." ahead [skip to #"."] keep skip]]
```

[07:20](#msg6167da507db1e3753e3d422d)If you don’t want to use rejoin, `collect`directly into `string!`:

```
out: ""
parse file [collect into out some [keep to #"." ahead [skip to #"."] keep skip]]
```

toomasv

[08:30](#msg6167ea9a38377967f44f8873)Some more:

```
; Simplest
>> first parse "%abc.txt.def.txt" [collect keep to [".txt" end]]
== "%abc.txt.def"
; If you know the structure ahead
>> first parse "%abc.txt.def.txt" [collect keep [2 thru dot to dot]]
== "%abc.txt.def"
; Interesting :)
>> first parse tail "%abc.txt.def.txt" [collect any [dot keep (copy/part head s s) fail | s: (s: back s) :s]]
== "%abc.txt.def"
```

Oldes

[12:26](#msg61682204fb8ca0572bbfae10)

```
file: %abc.txt.def.txt           
ext: find/last file #"."  ;== %.txt
copy/part file ext  ;== %abc.txt.def
rejoin [copy/part file ext ext]  ;== %abc.txt.def.txt
clear ext  ;== %""
file  ;== %abc.txt.def
```

[12:30](#msg616822cc7db1e3753e3df0dc)@lylgithub2021 when the series is used for the \_part\_, than it is zero-based index and it makes sense. You want `s: "abc" copy/part s s` to be `""` and not `"a"`.

## Friday 15th October, 2021

lylgithub2021

[00:50](#msg6168d0548c019f0d0b364bff)Thank you all. I'm learning them.

gltewalt

[02:46](#msg6168eb7bcd4972068b4a75eb)lol

```
>> reverse remove/part reverse str 4 
== "%abc.txt.def"
```

lylgithub2021

[06:39](#msg6169221bf2cedf67f986fd5d)Why do codes with `parse` fail to complie? I have a red script named "fortestparse.red" which only contains:

```
Red []
parse "abc.def.ghi.jkl" [copy aa thru "." to "."]
probe aa
```

When I compiled this script by `red -r -t MSDOS fortestparse.red`, it faild with wrong message: `undefined word aa`. Why and how to deal with it?

rebolek

[06:40](#msg616922648c019f0d0b36f93a)insert a line `aa: none` before the parse. Compiler can't determine words from parse, they need to be initialized manually. Interpreter is smarter in this case.

lylgithub2021

[06:41](#msg61692296fb8ca0572bc2128f)Is it a bug of compiler?

rebolek

[06:42](#msg616922bf29ddcd02932317f4)I won't say "bug". Maybe a missing feature?

lylgithub2021

[06:43](#msg616922f429ddcd02932318ea)Does that mean all word used in `parse` has to be preclaimed when compiling needed?

[06:46](#msg616923aefb8ca0572bc214b3)Any help Doc mention this?

rebolek

[06:47](#msg6169241fd78911028adcda2b)Yes, you need to define all used words. There may be a list of compiler limitations in the docs, I'll take a look.

## Wednesday 27th October, 2021

hiiamboris

[16:17](#msg61797bb498c13e7550fde12e)More targeted repost from red/red:

Hi! If you feel like expanding mental horizons, here's an experiment I'd love feedback on.

\## \[MORPH DSL - A dialect for efficient local series conversion](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/morph.md)

A few teaser examples (more on that page):

```
>> morph [1 2 3 4] ['x 'y ...] ['y 'x ...]
== [2 1 4 3]

>> morph/auto [1 2 3 4] ['x ? even? x | skip ...] ['x ...]
== [2 4]

>> morph/auto/into [1 2 3 4] ['x ...] ['x (not 'x | " ") ...] ""
== "1 2 3 4"
```

## Thursday 28th October, 2021

rebolek

[05:54](#msg617a3b24fb8ca0572bea960b)Nice :)

## Saturday 13th November, 2021

justinthesmith

[16:03](#msg618fe1b798c13e7550318201)Hey folks, I've run into a problem with unexpected case sensitivity with `parse` in Red 0.6.4:

```
parse [a] ['A]
```

This returns `true` in Rebol 2, Rebol 3, and older versions of Red (0.6.3). But Red 0.6.4 returns `false`.

This is problematic as it's preventing construction of a case insensitive but case preservative dialect using block parsing mode. I've not enabled case-sensitive mode with the `/case` refinement. Any idea what's up?

rebolek

[16:25](#msg618fe6fecd4972068ba52a47)@justinthesmith sounds like a bug

ne1uno

[20:44](#msg61902399a41fd206993ef977)@justinthesmith try with latest, 064 is old

justinthesmith

[22:53](#msg619041fcee6c260cf77831db)I get the same unexpected case-senstivity with latest, Red 0.6.4 for Windows built 13-Nov-2021/2:17:19-08:00 commit #5f09829  
Where do I file a bug report?

## Sunday 14th November, 2021

greggirwin

[16:14](#msg619135df3f09d85736712958)https://github.com/red/red/issues

[16:17](#msg619136b52197144e84c4c697)See also: https://github.com/red/red/issues/3554 and https://github.com/red/red/issues/3029

justinthesmith

[17:09](#msg619142d7f2cedf67f9e3fd5f)Thanks! Will file an issue.

One interesting thing that's arisen looking back, is that the /case refinement in Rebol's parse doesn't seem to apply in block parsing mode. For example, this is what I would expect:

```
>> parse/case [a]['A]
== false
```

This returns `false` in Red latest as I expected, but this is `true` in Rebol. Is Red's behavior here a bug? Should /case apply to word values in block parsing mode?

## Monday 15th November, 2021

hiiamboris

[07:38](#msg61920e657db1e3753e9eb7f2)Of course it should.

justinthesmith

[17:47](#msg61929d3a9d20982e4f1eb87a)Thanks for the comment on the ticket, @hiiamboris . I was hoping Red could solve problem with a dialect, but I'm not sure my vision is possible with this bug.

hiiamboris

[17:59](#msg61929fef38377967f4b26183)Haven't I provided you with a workaround?

[18:00](#msg6192a035f2cedf67f9e6e3f9)I don't see how that can impair your dialect ;)

[18:00](#msg6192a041cd4972068baaa7bf)Just produce the rules that work.

justinthesmith

[19:55](#msg6192bb21fb3dcd4e88899216)The goal is to produce a dialect that's human readable, human writable, and human maintainable. "Just produce the rules that work" is easier said than done--and seems to stand in sharp contrast with the philosophy of building the the language to suit the problem.

Consider this dialect example:

```
test1: {sell 100 shares acme now}
test2: {Sell 100 Shares Acme Now}
test3: {Sell  100 Shares Acme  20-Nov-2021/11:45:00-08:00}

rule: [
	set order ['buy | 'sell]
	set amount integer!
	opt 'shares
	set ticker word!
	['now (set 'when now) | set when date!]
]

parse load test1 rule
parse load test2 rule
parse load test3 rule
```

All three tests are `true` in Rebol, but test2 and test3 return `false` in Red with the case sensitivity bug in parse.

Rewriting the rule with your tip:

```
rule: [
	set order [set w word! if (w = 'buy) | set w word! if (w = 'sell)]
	set amount integer!
	opt set w word! if (w = 'shares)
	set ticker word!
	[set w word! if (w = 'now) (set 'when now) | set when date!]
]
```

Now all three tests are `true` in Red (but all are `false` in Rebol). But the added complexity is the problem. Going to be very difficult to scale to a more complex dialect--especially if I expect people who haven't been using parse for decades to be able to write rules as well. I can't present a solution like this to my manager, let alone others who don't know me as well.

To me, this bug is a critical issue as it severely hinders one of the key features of the language.

hiiamboris

[19:58](#msg6192bbf129ddcd02938315ba)Ah, so them others would need to modify your dialect then. I see.

[19:59](#msg6192bc1d38377967f4b2a3aa)Well, you can fix the bug and PR the solution then ;)

[20:06](#msg6192bdc2fb3dcd4e888998a3)https://github.com/red/red/issues/3029#issuecomment-436438710 here it was reported as a regression

[20:07](#msg6192bdfed78911028a3d0327)here's commit that caused it https://github.com/red/red/blame/5f09829edc80342c70b65f69defc4d05c2d081b8/runtime/parse.reds#L190

[20:08](#msg6192be4efb3dcd4e88899a42)And there's a better workaround for you: `quote buy | qoute sell`

justinthesmith

[20:09](#msg6192be5d38377967f4b2a8f0)Thanks for finding that! I'll take a look

greggirwin

[20:09](#msg6192be758c019f0d0b978e00)Words should not be treated case sensitively by default. That's the main bug. Whether `/case` should apply to them is separate. It is supported elsewhere.

justinthesmith

[20:18](#msg6192c07d8c019f0d0b979382)Makes sense to me, Gregg.

I have a few old builds saved locally prior and confirm things worked as expected prior to that commit @hiiamboris referenced. I don't have any experience with Red/system but please let me know if there's anything else I can do to help address this bug.

greggirwin

[20:26](#msg6192c2938c019f0d0b9797df):+1: This is probably one we want the core team to tackle.

## Monday 6th December, 2021

bubnenkoff

[10:17](#msg61ade3518f98cb0811aa3813)I need to extract letter from string if digits. I tried to use `char!` datatype to determinate symbol, but it's seems that every element in string is `char!` so the code do not work:

```
>> parse ["81128A24826"] [ to char! s: (print s) ]
== false
```

rebolek

[10:19](#msg61ade39c63c1e83c95472183)First, you are parsing a string, so it doesn’t make sense to put it into block, just use string parsing.

[10:19](#msg61ade3c542fc2863b245f0f4)Then it’s pretty straightforward.

[10:21](#msg61ade40cc2cc0e5343e90af8)

```
>> numbers: charset "0123456789"
== make bitset! #{000000000000FFC0}
>> parse "81128A24826" [collect some [keep numbers | skip]]
== [#"8" #"1" #"1" #"2" #"8" #"2" #"4" #"8" #"2" #"6"]
```

bubnenkoff

[10:24](#msg61ade4c4cdb5c1081a4bc134)So I should do something like:

```
>> parse "81128A24826" [collect some [ numbers | set x skip ]]
== []
>> x
== #"A"
```

To extract letter

rebolek

[10:24](#msg61ade4ed6104ea63b6d23a5e)either that or you can turn it around and define letters charset

dsunanda

[10:26](#msg61ade5398f98cb0811aa3bd7)Just for variety, a non-parse way:

```
trim/with "81128A24826" "0123456789"
== "A"
```

rebolek

[10:26](#msg61ade562026dc63ca6338541):+1:

bubnenkoff

[10:38](#msg61ade814cdb5c1081a4bc838)hah! Cool!

## Monday 13th December, 2021

lylgithub2021

[02:45](#msg61b6b3c6a9c8eb44c429ebce)A string like this: "a.b.c.d.e.f.g"(the number of "." and the content of string are both unknown in advance). How to get "a.b.c.d.e.f" by parse? That is to say, all things before the last dot.

toomasv

[04:42](#msg61b6cf1863c1e83c955ac0a1)If it should always get string just before the last dot, then e.g.:

```
head clear find/last copy "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```

If it is rather everything until 6th dot, then maybe:

```
count: 0 string: copy "a.b.c.d.e.f.g.h.i" 
until [string: next string if dot = first string [count: count + 1] all [count > 5 string: head clear string]]
== "a.b.c.d.e.f"
```

Or with parse:

```
count: 0 
parse string: copy "a.b.c.d.e.f.g.h.i" [any [s: dot if (5 < count: count + 1) (clear s) | skip]] string
== "a.b.c.d.e.f"
```

[05:19](#msg61b6d7d38853d316404593ea)With hypothetical new `split`it might be

```
first split "a.b.c.d.e.f.g" [last dot]
== "a.b.c.d.e.f"
```

Or maybe

```
first split/last "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```

Which would you prefer?

lylgithub2021

[05:49](#msg61b6dece8f98cb0811bdbcd4)Many thank! @toomasv ! THe version of ypothetical new split is more readable. When is it usable in Red?

[07:20](#msg61b6f429cdb5c1081a5f6b7b)I think `find/last copy "a.b.c.d.e.f.g" dot` returns a pointer which is used by `head clear`. If I need to store the returned value in a variable which will not be affected by the further movement of the pointer, what shall I do?

toomasv

[07:41](#msg61b6f923c2cc0e5343fce865)You are welcome!

&gt; If I need to store the returned value... what shall I do?

Use set-word. You can record both tail of your string and head of it, e.g.

```
head-of-string: head tail-of-string: clear find/last copy "a.b.c.d.e.f.g" dot
```

Or, if you don't need it at once, but later, you might set a word to it at once when copying:

```
clear find/last str: copy "a.b.c.d.e.f.g" dot 
...
str
== "a.b.c.d.e.f"
```

## Friday 24th December, 2021

lylgithub2021

[13:06](#msg61c5c5c65dc6213cd4ac9829)I have a string whch contains some numbers. How can I get all numbers from the string(and all strings in the string). For example, `str: " 1.5yuan ^/ 3 yuan ^- -2.3dollar"`

hiiamboris

[13:16](#msg61c5c82dbfe2f54b2ee6b66a)use \[Parse](https://www.red-lang.org/2013/11/041-introducing-parse.html)

toomasv

[13:17](#msg61c5c867d143b14f83e4c340)

```
digit: charset "0123456789.-" parse trim/all str [collect any [copy num some digit keep (load num) | keep to [digit | end]]]
== [1.5 "yuan" 3 "yuan" -2.3 "dollar"]
```

pekr

[13:20](#msg61c5c91846529077f550f584)

```
str: " 1.5yuan ^/ 3 yuan ^- -2.3dollar"

number: charset "0123456789."
string: charset complement number

parse str [
    any [
         copy num some number (print ["Number: " num])
        | 
         copy str some string (print ["String:" str])
   ]
]
```

My code is surely complicated and not efficient in comparisong to parse gurus here :-)

toomasv

[13:29](#msg61c5cb56f5a3947800d1d650)Also

```
parse str [any [digit not digit insert space | skip]] new-line/all load str no
== [1.5 yuan 3 yuan -2.3 dollar]
```

## Sunday 26th December, 2021

lylgithub2021

[02:22](#msg61c7d201526fb77b314bd3cd)Good solutions! Thank you all.

[03:07](#msg61c7dc81d143b14f83e80f36)@toomasv I modified your first method with this:

```
>> parse trim/all str [collect any [keep some digit | keep to [digit | end]]]
== ["1.5" "yuan" #"3" "yuan" "-2.3" "dollar"]
```

Then I tried to change `#"3"` into `3` by `load #"3"` as you did in parse but failed. I also tried with `do #"3"`, and get #"3". So how to change a digit char to number? And why does it work by `load` in `parse` but fail outside `parse`?

toomasv

[05:56](#msg61c804219a33545406f136c5)@lylgithub2021 No, I did not load a char, bc it cannot be loaded. You can load strings.

[07:28](#msg61c819a4bfe2f54b2eea4e66)That's why I used `copy`. If you have char, then you can do e.g.`load to-string #"3"` or `to-integer to-string #"3"`. (Or `(to integer! #"3") - 48`:)

[07:42](#msg61c81ce8bfe2f54b2eea5356)You can use `keep copy _ some digit` in your rule to get all elements as strings.

lylgithub2021

[13:49](#msg61c872e5d41a5853f91e7d0e)Thank you @toomasv so much!

toomasv

[15:33](#msg61c88b32d41a5853f91ea423)You are welcome!
