# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2020

## Wednesday 1st January, 2020

dockimbel

[21:24](#msg5e0d0e11b4ed68096e157d2c)@ne1uno Good catch! :+1:

## Thursday 2nd January, 2020

hiiamboris

[14:26](#msg5e0dfda9833c373f4d993d59):point\_up: \[December 27, 2019 4:46 PM](https://gitter.im/red/bugs?at=5e060b2389701b511d1cfeef)  
Just an update on GUI console stability:  
\- normal GUI console still crashes randomly after a period of inactivity  
\- debug GUI console is stable during a few days of uptime

loziniak

[16:17](#msg5e0e1794d5a7f357e6c20f21)Hi! I get this error:

```
*** Runtime Error 1: access violation
*** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/string.reds
*** at line: 1067
***
***   stack: red/string/concatenate-literal-part 00000001h 00443988h 4338534
***   stack: win32-startup-ctx/exception-filter 0012EC34h
```

[16:28](#msg5e0e1a3b0fd3413f4c95d90d)It's on compiled (`-r`) application. When interpreted, it runs fine.

[16:29](#msg5e0e1a5e89701b511d4ff473)It's on Windows. Linux binary works ok.

greggirwin

[20:59](#msg5e0e59be3062aa3e8de5b7ed)@loziniak can you post a minimal example to dupe it? If not, using `-e` (encap mode) should let your app run, if interpreted is OK.

## Friday 3th January, 2020

ne1uno

[01:47](#msg5e0e9d194e9ea12051a5c655)fast-lexer branch, `to word!` or `to-word` any string that starts with `Ch`

[01:47](#msg5e0e9d19be6bab58cd63c427)&gt;\*\** Syntax Error: Ch invalid character at none

[01:47](#msg5e0e9d196dda2430febcea27)lowercase ok `to-word "ch"`

dockimbel

[10:18](#msg5e0f14f51c3a592052c389ea)@ne1uno Good catch again!

loziniak

[10:19](#msg5e0f15433062aa3e8dea7b26)that's a strange bug!

dockimbel

[15:31](#msg5e0f5e3a809bc77efee146dd)It's not a bug, it's a collision between the current hex literal syntax and words. The thing is if the word syntax check is disabled for `to-word`, it will be a all-or-nothing case, so many illegal words could then be made again, as in R2.

[15:40](#msg5e0f60783062aa3e8deca0be)@ne1uno You can use the following workaround:

```
>> to-word to-issue "Ch"
== Ch
```

gurzgri

[16:05](#msg5e0f665014328863c0050f17)@dockimbel And finally it starts to make sense that in VSC syntax highlighting "ch" stands out all over the place ... I was wondering about that so often. Thanks for the explanation!  
&gt; It's not a bug, it's a collision between the current hex literal syntax and words.

dockimbel

[16:08](#msg5e0f66fc1c3a592052c5dbe9)@gurzgri I guess you mean "Ch" and not "ch"?

[16:09](#msg5e0f67381c3a592052c5dd16)It should be possible to reduce this kind of collision by requiring at least 2 hex characters (e.g: `0Ch`).

greggirwin

[16:16](#msg5e0f68f94e9ea12051ab18d1)That sounds like a good compromise @dockimbel. Hex is handy, but more in R/S, and words are more important in Red.

hiiamboris

[16:27](#msg5e0f6b7d4e9ea12051ab2cf8)I agree there should be 2 at least. With 2 chars you have 2 uppercase and 1 lowercase chars, which is unlikely a meaningful word.

greggirwin

[16:39](#msg5e0f6e32316c1473270cdc1b)It's our one case-sensitivity exception, which makes me a little sad. Such is life.

dockimbel

[17:37](#msg5e0f7be1316c1473270d468d)@greggirwin We can drop it once we add the `0#...` syntax support. Though in R/S where such hex literals are much more common, I find the current form really nicer to read.

greggirwin

[17:59](#msg5e0f80ec2af31b403d11e74b)I agree it's very nice in R/S.

## Saturday 4th January, 2020

loziniak

[00:31](#msg5e0fdcd4a86f9758ccc43ebf)@greggirwin regarding `access violation` error.  
I could not reproduce it in a minimal code, but I spotted the line which is problematic. This is the smallest thing I can think of, that keeps executing all steps that lead to the error:

```
Red [Needs: 'View]

metrics: compose [
	font: (make font! [
		size: 15
		color: 68.68.68
		anti-alias?: true
	])
]

context [
	styles: reduce [
		'bomba [
			default-actor: on-down
			template: [
				type: 'base
				size: 200x75
				extra: context [
					redraw: func [face] [
						probe metrics/font		;-- this causes access violation error
					]
				]
				actors: [
					on-resizing: func [face [object!] event [event! none!]] [
						face/extra/redraw face
					]
				]
			]
		]
	]

	vid-code: [
		on-resizing [
			face/pane/1/size: 300x75
			do-actor face/pane/1 none 'resizing
		]
		bomba "BOMBA" on-create [
			face/extra: make face/extra [a: 123]
		]
	]

	do [
		set 'gui context [
			display: does [view/flags layout/styles vid-code styles ['resize]]
		]
	]
]

do [gui/display]
```

greggirwin

[02:02](#msg5e0ff2366dda2430fec6006b)@qtxie :point\_up:

ne1uno

[08:52](#msg5e10524e4e9ea12051b12353)@doc, thanks for the work around for `to-word hex literal`. I don't have benchmarks, but seems to build and run faster since yesterday.

[10:52](#msg5e106e5a865af87363b83d13)much stricter syntax check for charset and even headers. `Author: @someone` &gt;\** invalid character at @

[10:56](#msg5e106f5c2af31b403d17d114)@hiiamboris in `cli.red` for example

dockimbel

[12:54](#msg5e108b1a016ca663c18b9295)@ne1uno The `@someone` syntax is reserved in `fast-lexer` branch for a new datatype (not yet implemented). Just add a letter prefix to turn it into an `email!` value until the new type is added.

## Monday 6th January, 2020

Oldes

[08:15](#msg5e12ec8cc23234403cd8b52f)

```
>> p: 's/s
== s/s
>> clear p
== 
>> type? p
== path!
```

I think that if the path is empty, the yet missing serialized form should be used as a result in console:

```
>> clear p
== #[path! []]
```

greggirwin

[08:58](#msg5e12f6a6f6ee9c3e8e14fed3)That makes sense.

dockimbel

[11:29](#msg5e131a2c016ca663c19c766f)@Oldes Good idea.

hiiamboris

[15:20](#msg5e13502dc23234403cdb6722)Is this by design that `set [a b c] image` and `set [a b c] vector` do not set `a`,`b`,`c` to pixels or vector items, but to image/vector itself (contrary to other series)? (same with binary as well)

meijeru

[17:17](#msg5e136b9d0ba7b60f20332905)`set [a b c] string` and `set [a b c] path` also do the same! Thus the only case of series types where individual items end up in `a b` and `c` is `set [a b c] block/hash`. That seems pretty much by design to me....

[17:21](#msg5e136caf09534142ca1dc02f)Besides, you can see it in the code for `set` (`runtime/natives.reds` at lines 618 and following)

hiiamboris

[17:24](#msg5e136d560ba7b60f203333c8)Just looked. It turns out `set-many` is indeed defined for images: https://github.com/red/red/blob/c97604c6c429fda6c0dbc2dbd9e35c6b44d0b811/runtime/datatypes/image.reds#L56

[17:26](#msg5e136dd404adee486b404498)What's funnier it is defined for maps too (and works), although I doubt the usefulness of it. If it did look up only the selected words in a map and assigned values to them - that could be useful, but mapping an unordered container as is to words:

```
>> set [a b] #(a: 1 b: 2)
>> a
== a:
>> b
== 1
```

...not so much

[17:27](#msg5e136dfc821b826f5a75c0d4)The plot thickens... ;)

meijeru

[17:47](#msg5e1372ab0ba7b60f20335bfe)`set-many` is defined indeed, but not used for the purpose we are discussing...

## Tuesday 7th January, 2020

rebolek

[10:03](#msg5e14578204adee486b468591)I can't quit Red...

```
>> q
*** Access Error: cannot open: %/home/sony/.red/.Red-Console/console-cfg.red         
*** Where: write
*** Stack: q _save-cfg save
```

bitbegin

[13:24](#msg5e1486a83679536f962425ce)seems no access right

rebolek

[14:48](#msg5e149a45e52f6353789cc27b)I'm not sure about reason, but if it can't write to that file, it should just ignore it.

hiiamboris

[15:05](#msg5e149e4f09534142ca26480f)@meijeru yes, only used in `foreach` https://github.com/red/red/blob/master/runtime/natives.reds#L3097 but not implemented even there yet. So I'd say it's a TBD feature.  
Also https://github.com/red/red/blob/master/runtime/natives.reds#L3091 explains why `set-many` on maps is so strange - it was implemented with `foreach` in mind only.

## Wednesday 8th January, 2020

loziniak

[15:46](#msg5e15f941e52f635378a69f94)@greggirwin @qtxie regarding \[Violation Access](https://gitter.im/red/bugs?at=5e0e1794d5a7f357e6c20f21), I've managed to extract minimal example:

```
Red [Needs: 'View]

metrics_font: make font! []

styles: reduce [
	'menu-button [
		default-actor: on-down
		template: [
			type: 'base

			actors: [
				on-create: func [face [object!] event [event! none!]] [
					face/draw: copy []
					append face/draw compose [
						font (metrics_font)
					]
				]
			]
		]
	]
]

vid-code: compose/only [
	on-resizing [
		print "ERROR?"
		probe metrics_font
		print "There was no error."
	]
	menu-button []
]

window: layout/styles vid-code styles
view/flags window ['resize]
```

[15:47](#msg5e15f9a0821b826f5a87dccc)It gives error under Windows 7:

```
ERROR?

*** Runtime Error 98: assertion failed
*** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/string.reds
*** at line: 1063
***
***   stack: red/string/concatenate-literal-part 00000062h 00438A1Eh 30422756
***   stack: red/string/concatenate-literal-part 01A300E4h 009E00C4h 10354885
***   stack: red/datatype/mold 01D03568h 01A300E4h false false true 00000000h 0 0
***   stack: red/actions/mold 01D03568h 01A300E4h false false true 00000000h 0 0
***   stack: red/error/reduce 01A300C4h 01A300A4h
***   stack: red/error/form 01A300A4h 01A300B4h 01A30094h -18
***   stack: red/actions/form 01A300A4h 01A300B4h 01A30094h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake 01703814h
***   stack: gui/make-event 00577D0Ch 0 32
***   stack: gui/WndProc 000701F0h 5 0 1310836
```

[16:05](#msg5e15fdaee52f635378a6c1cb)Should I file a bug report?

dockimbel

[16:17](#msg5e1600889c13050f1f9703f0)@loziniak Yes please.

loziniak

[16:39](#msg5e1605cfe0f13b70c952dbc1)done.

## Thursday 9th January, 2020

Oldes

[12:32](#msg5e171d4e810a1042cb8ec918)I just found this:

```
>> type? first [a:b]
== url!
```

It is same like in R2 and R3, but is it ok?

hiiamboris

[12:44](#msg5e1720169c13050f1f9e7751)Compare that to `about:config`. Some plugins also work via url:command and no slashes.

Oldes

[12:53](#msg5e17225ba1e15049012b4682)I don't know if some Mozilla's feature is good example, but makes sense when used like: `mailto:a@b.c`

[12:59](#msg5e1723c0810a1042cb8ef3cf)What about this one?

```
>> ['']
*** Syntax Error: missing #"]" at "'']"
*** Where: do
*** Stack: load
>> ['a']
== ['a']
```

Rebol uses more appropriate error:

```
** Syntax error: invalid "word" -- "''"
** Near: (line 1) ['']
```

[13:03](#msg5e17248ea74ac853777ccadd)I was checking Boron a few days ago and noticed, that \[Karl uses](http://urlan.sourceforge.net/boron/doc/UserManual.html#char) `'a'` instead of classic `#"a"` for chars, so wanted to try, what such a notation does in Red and Rebol. I wonder if `'...'` could not be used somehow.

[13:07](#msg5e17257ac3950349026de765)Because I don't think that having valid words like `abc'` is useful enough.

[13:15](#msg5e17278f810a1042cb8f0e27)It looks that any invalid word has the wrong error message:

```
>> [,]
*** Syntax Error: missing #"]" at ",]"
*** Where: do
*** Stack: load
```

hiiamboris

[13:41](#msg5e172d99c3950349026e1742)&gt; Because I don't think that having valid words like `abc'` is useful enough.

I'm using words like that quite often ☻

loziniak

[14:07](#msg5e17339c9c13050f1f9f02dc)could be used for naming function derivatives, eg. \*f* and \*f'\*: https://en.wikipedia.org/wiki/Prime\_(symbol)#Use\_in\_mathematics,\_statistics,\_and\_science

rebolek

[15:13](#msg5e17432604adee486b5b031b)@Oldes if you look at related RFC, `a:b` is valid URI.

greggirwin

[21:43](#msg5e179e84e52f635378b239f6):point\_up: \[January 9, 2020 5:32 AM](https://gitter.im/red/bugs?at=5e171d4e810a1042cb8ec918) @Oldes yes, it's a valid URL, per the RFC. It points out what I think is a bug in https://github.com/red/red/blob/master/environment/networking.red#L62 which I think should `any` instead of `some`.

`scheme-part: [copy =scheme [alpha some scheme-char] #":"]`

The ABNF says:  
`scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )`

[21:44](#msg5e179eda91129970ca9b3c3e)`mailto:a@b.c` is also valid.

[21:55](#msg5e17a1403679536f9639f931)I also use `'` as a suffix on words at times. Admittedly, that's going to be confusing to users coming from langs that use single quotes for strings, but we're not going to remove the current `char!` syntax at this point.

## Sunday 12nd January, 2020

rebolek

[08:30](#msg5e1ad910b720fa5b3cfd98a1)When I read webpage with headrs, I get duplicates:

```
>> probe second read/binary/info http://red-lang.org
#(
    Location: ["http://www.red-lang.org" "https://www.red-lang.org/"]
    Date: ["Sun, 12 Jan 2020 08:28:53 GMT" "Sun, 12 Jan 2020 08:28:54 GMT" "Sun, 12 Jan 2020 08:28:54 GMT"]
    Content-Type: ["text/html; charset=UTF-8" "text/html; charset=UTF-8" "text/html; charset=UTF-8"]
    Server: ["ghs" "GSE" "GSE"]
    Content-Length: "220"
    X-XSS-Protection: ["0" "1; mode=block" "1; mode=block"]
    X-Frame-Options: ["SAMEORIGIN" "SAMEORIGIN"]
    Expires: ["Sun, 12 Jan 2020 08:28:54 GMT" "Sun, 12 Jan 2020 08:28:54 GMT"]
    Cache-Control: ["private, max-age=0" "private, max-age=0"]
    X-Content-Type-Options: ["nosniff" "nosniff"]
    Accept-Ranges: ["none" "none"]
    Vary: ["Accept-Encoding" "Accept-Encoding"]
    Transfer-Encoding: ["chunked" "chunked"]
    Last-Modified: "Fri, 10 Jan 2020 17:17:36 GMT"
)
```

[08:33](#msg5e1ad9e9c6897e1bc61bfb97)As the `Date` field holds two different values and there's redirect on red-lang.org, I guess that headers are not properly cleared on redirect. IIRC it worked fine before.

hiiamboris

[10:03](#msg5e1aeee20e65654fa0ccfdda)This is on W7:

```
>> probe second read/binary/info http://red-lang.org
#(
    Cache-Control: "private, max-age=0"
    Date: "Sun, 12 Jan 2020 10:02:13 GMT"
    Transfer-Encoding: "chunked"
    Content-Type: "text/html; charset=UTF-8"
    Expires: "Sun, 12 Jan 2020 10:02:13 GMT"
    Last-Modified: "Fri, 10 Jan 2020 17:17:36 GMT"
    Accept-Ranges: "none"
    Server: "GSE"
    Vary: "Accept-Encoding"
    X-Content-Type-Options: "nosniff"
    X-XSS-Protection: "1; mode=block"
)
```

[10:03](#msg5e1aeef60aba1f0d801ddb6d)`Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00`

[10:04](#msg5e1aef32b720fa5b3cfe2aa9)`Red 0.6.4 for Windows built 8-Jan-2020/23:51:56+03:00 commit #e26452d` same output

[10:04](#msg5e1aef461cf5106b35091c87)Linux-only bug?

rcqls

[10:58](#msg5e1afbc90aba1f0d801e3079)@hiiamboris Don’t think so since on macOS latest build

```
>> probe second read/binary/info http://red-lang.org
#(
    Location: ["http://www.red-lang.org" "https://www.red-lang.org/"]
    Date: ["Sun, 12 Jan 2020 10:57:09 GMT" "Sun, 12 Jan 2020 10:57:09 GMT" "Sun, 12 Jan 2020 10:57:09 GMT"]
    Content-Type: ["text/html; charset=UTF-8" "text/html; charset=UTF-8" "text/html; charset=UTF-8"]
    Server: ["ghs" "GSE" "GSE"]
    Content-Length: "220"
    X-XSS-Protection: ["0" "1; mode=block" "1; mode=block"]
    X-Frame-Options: ["SAMEORIGIN" "SAMEORIGIN"]
    Expires: ["Sun, 12 Jan 2020 10:57:09 GMT" "Sun, 12 Jan 2020 10:57:09 GMT"]
    Cache-Control: ["private, max-age=0" "private, max-age=0"]
    X-Content-Type-Options: ["nosniff" "nosniff"]
    Accept-Ranges: ["none" "none"]
    Vary: ["Accept-Encoding" "Accept-Encoding"]
    Transfer-Encoding: ["chunked" "chunked"]
    Content-Security-Policy: "upgrade-insecure-requests"
    Content-Security-Policy-Report-Only: {default-src https: blob: data: 'unsafe-inline' 'unsafe-eval'; report-uri https://www.blogger.com/cspreport}
    Last-Modified: "Fri, 10 Jan 2020 17:17:36 GMT"
)
```

## Monday 13th January, 2020

rebolek

[09:06](#msg5e1c330c6f604152993196d8)reported https://github.com/red/red/issues/4236

## Wednesday 15th January, 2020

greggirwin

[19:26](#msg5e1f677753fd014bb07a4d28):point\_up: \[January 9, 2020 2:43 PM](https://gitter.im/red/bugs?at=5e179e84e52f635378b239f6) @Oldes or @rebolek, do you agree that this is a bug?

Oldes

[22:08](#msg5e1f8d6253fd014bb07b67c4)@greggirwin I agree.. it is a bug.

[22:08](#msg5e1f8d733ff141256d3c2473)

```
>> decode-url a:b
== none ;<====== WRONG
>> decode-url aa:b
== make object! [
    scheme: 'aa
    user-info: none
    host: none
    port: none
    path: %./
    target: %b
```

[22:14](#msg5e1f8ece25256256b7fb17fd)Btw.. I see that in R3 `decode-url` returns just a block... is this difference intentional?

```
>> decode-url a:b
== [scheme: 'a host: "b"]
```

[22:16](#msg5e1f8f41123d916da2430874)Although in R2 it returns object too (like Red now).

[22:19](#msg5e1f8ffd8b5d766da1afe592)I personally prefer R3's version as it is more lightweight (if this matter).

[22:26](#msg5e1f91a9123d916da2431dff)@greggirwin also notice, that the object result is not same... where Rebol reports `host`, Red uses `target`. This is clearly wrong in Red:

```
>> decode-url mailto:aa@bb.c
== make object! [
    scheme: 'mailto
    user-info: none
    host: none
    port: none
    path: %./
    target: %a
```

[22:27](#msg5e1f91d632c2e05ecc4e2de7)R3 reports better result:

```
>> decode-url mailto:aa@bb.c
== [scheme: 'mailto user: "aa" host: "bb.c"]
```

[22:32](#msg5e1f931632c2e05ecc4e378c)@greggirwin this is also wrong result in Red:

```
>> decode-url foo://example.com:8042/over/there?name=ferret#nose
== make object! [
    scheme: 'foo
    user-info: none
    host: "example.com"
    port: 8042
    path: %/over/
```

## Thursday 16th January, 2020

greggirwin

[01:58](#msg5e1fc338000f49789903a2f5)Thanks for the feedback @Oldes.

I chose to return an object, because it's a fixed spec. This makes it clear that it's key-value, isn't confused with existing `make url!` block behavior, and keys are fixed. `make url!` uses a couple simple rules, which R3 doesn't even do, and treats all non-block specs as strings.

&gt; mailto:aa@bb.c ...This is clearly wrong in Red:

Per the RFC:

&gt; For example, the URI &lt;mailto:fred@example.com&gt; has a path of "fred@example.com"

We do follow Rebol and split the target out from the path, but otherwise follow the spec there. If we split those fields out, it won't round-trip unless we add more fields to track what kind of path it was (rootless in this case). e.g.

```
...
== make object! [
    scheme: 'mailto
    user-info: "aa"
    host: "bb.c"
    port: none
    path: none
    target: none
 
>> encode-url oo
== mailto://aa@bb.c
```

&gt; decode-url foo://example.com:8042/over/there?name=ferret#nose

What's wrong in that example?

[02:13](#msg5e1fc6c85b81ab262e33241a)I'll try to make time to add some tests for it.

[02:19](#msg5e1fc816ad195a0f67167a4e)Here's the original gist with tests: https://gist.github.com/greggirwin/b08ffb5c9fa54a9b9387248387baf46d

Oldes

[08:11](#msg5e201abe5b81ab262e354161)&gt;&gt; decode-url foo://example.com:8042/over/there?name=ferret#nose

&gt; What's wrong in that example?

@greggirwin wrong is, that information from `there?name=ferret#nose` part is completely missing.

[08:20](#msg5e201cb0ea55e3623e6222e1)And when I'm in the review, I don't like your `user-info`. First of all, it looks strange that it is the only value, which has 2 words in name, and second is, that I prefer Rebol way, which also decoded `password` part:

```
>> decode-url http://name:pass@example.com
== [scheme: 'http pass: "pass" user: "name" host: "example.com"]
```

versus Red's:

```
>> decode-url http://name:pass@example.com
== make object! [
    scheme: 'http
    user-info: "name:pass"
    host: "example.com"
    port: none
    path: none
```

[08:23](#msg5e201d7f20d0f078a6883425)&gt;&gt; For example, the URI fred@example.com has a path of "fred@example.com"

This may be mentioned in RFC, but again... I prefer the decoder to decode the user name from the mail for me and so I don't need to use email decoder to do it, when needed.

[08:26](#msg5e201e3a0dbd9379ed44ce0d)Also... where is the `host` in Red version here?

```
>> decode-url foo:name@example.com
== make object! [
    scheme: 'foo
    user-info: none
    host: none
    port: none
    path: %./
    target: %name
```

[08:29](#msg5e201efc3ea53f0f6631a87f)So to sum it up, I prefer Rebol version, which was proved to be working with all the old R2 schemes. R3 just went to block instead of object as it is more lightweight and looks better in console (in R2 there is no output on resulted objects in console).

[08:31](#msg5e201f534c1f9679ecf59c0b)The only thing I'm not sure in Rebol version is, if it should not parse also the `query` part from the `path`. In case like:

```
>> decode-url http://example.com/path?query
== [scheme: 'http host: "example.com" path: "/path?query"]
```

[08:34](#msg5e20200ba1dfaa3ba12a1696):point\_up: \[January 16, 2020 9:11 AM](https://gitter.im/red/bugs?at=5e201abe5b81ab262e354161) hm... now I see I was fooled by the truncated object output in console! So it is indeed not lost. Another reason why `object` as a result is not good enough.

dockimbel

[11:27](#msg5e2048840289c83ba2a91294)@Oldes I don't see the trailing dots at the truncation point, seems like a console output bug to me.

greggirwin

[18:50](#msg5e20b083000f4978990a3b91)@Oldes thanks for the feedback.

&gt; I don't like your user-info

Noted. Let's see if others agree.

&gt; `mailto:fred@example.com`  
&gt; I prefer the decoder to decode the user name from the mail for me and so I don't need to use email decoder to do it, when needed.

Do you understand that `mailto:fred@example.com` does not have `host` or `user` info? If we produce `[scheme: 'mailto user-info: %fred host: example.com]` as you ask, what logic do you propose to create the original url from a spec? If `host` exists, we \*MUST* include `//` when making a url from it.

&gt; Another reason why object as a result is not good enough.

That's a completely invalid argument.

Oldes

[19:10](#msg5e20b532a1dfaa3ba12e7125)Noted.

[19:38](#msg5e20bbcb4c1f9679ecfa28c1)actually `mailto:fred@example.com` has `host` and `user`, but I understand that you want to solve also the encoding (when to add `//`). There was not `encode-url` in Rebol so I never needed to solve it.

[19:51](#msg5e20beab0289c83ba2ac9349)@greggirwin I think that if I forget to decoding `user` from `mailto` scheme, than I would prefer to have:

```
>> u: decode-url mailto:fred@example.com
== [scheme: 'mailto path: fred@foo.com]
>> type? u/path
== email!
```

[19:53](#msg5e20bf44714883789887f94b)You have now `fred@example.com` as a `target`, but that violates your RFC, which you want to follow so much, as it clearly states that it is a `path`.

[19:53](#msg5e20bf4aad195a0f671d68d0)\[!\[image.png](https://files.gitter.im/red/bugs/enuX/thumb/image.png)](https://files.gitter.im/red/bugs/enuX/image.png)

greggirwin

[20:04](#msg5e20c1d6c7647778a5d56ef1)&gt; actually mailto:fred@example.com has host and user

Not in the context of a URL spec. Or I'm missing something. It's a `rootless-path` even if, to a human, it looks like it contains a user name and a host.

Whether the decoder should `load` data is a good question.

&gt; You have now fred@example.com as a target, but that violates your RFC

If you want to pick a fight, we can. :^) There is the letter of the law, and the spirit of the law. My original goal was to follow the spirit of the law first, and the letter of the law second. To that end, I did follow the R2 convenience of splitting the path from the target. That doesn't break with how the RFC defines elements or how they are grouped.

[20:13](#msg5e20c3f10289c83ba2acb8ef)Some of this comes back to the basic principle of lossiness. When we build foundational blocks, do we throw away information that may be useful or necessary later? Or do we try to be lossless in the core, and let others build pieces on top that suit their needs, which may be lossy?

[20:15](#msg5e20c44d0289c83ba2acbb22)This applies to codecs in general, including `load`.

## Friday 17th January, 2020

Oldes

[00:10](#msg5e20fb775cd79646606227a4)@greggirwin I don't know what you mean with `rootless-path`, but for me as a human, after having several beers (at 01:10 local time), `mailto:fred@example.com` means: \_send a `mail to` `user` \*\*fred\** at `host`ed domain \*\*example.com\*\*\_.

[00:12](#msg5e20fbf6dd1429262d3a53ed)And for me working in a console is for command `decode-url mailto:fred@example.com` prefered result:

```
== [scheme: 'mailto path: fred@foo.com]
```

than current:

```
== make object! [
    scheme: 'mailto
    user-info: none
    host: none
    port: none
    path: %./
    target: %f
```

[00:15](#msg5e20fcaa0dbd9379ed4b36eb)But I can say, that you win that the `decode-url` should not resolve the `user` and `host` from this type of url.

greggirwin

[01:28](#msg5e210dc9dd1429262d3abe63)Czech beer always wins. Several win more. :^)

loziniak

[13:50](#msg5e21bbb3a1dfaa3ba13567a5)Hi! Found this:

```
>> to float! "12e4"
== 120000.0
>> to float! "12e"

*** Runtime Error 1: access violation
*** in file: /home/devel/prj/red/gtk/red-github/runtime/dtoa.reds
*** at line: 1334
***
***   stack: red/dtoa/parse-exponent 08457000h 081E00BEh
***   stack: red/dtoa/to-float 081E00BBh 081E00BEh FFACD93Ch
***   stack: red/string/to-float 081E00BBh 3 FFACD93Ch
***   stack: red/tokenizer/scan-float F5398EE3h 3 1 FFACD93Ch
***   stack: red/float/to 09A2D854h 09A2D864h 12
***   stack: red/actions/to 09A2D854h 09A2D864h
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments F553A7E0h F5398E58h F5398E58h 00000000h 00000000h
***   stack: red/interpreter/eval-code F553A7E0h F5398E38h F5398E58h false 00000000h 00000000h F553A7E0h
***   stack: red/interpreter/eval-expression F5398E38h F5398E58h false false false
***   stack: red/interpreter/eval 09A2D824h true
***   stack: red/natives/catch* true 1
***   stack: ctx||512~try-do F7F229ECh
***   stack: ctx||512~do-command F7F229ECh
***   stack: ctx||512~eval-command F7F229ECh
***   stack: ctx||512~run F7F229ECh
***   stack: ctx||512~launch F7F229ECh
***   stack: ctx||529~launch F7F22530h
***   stack: ***_start
```

hiiamboris

[14:02](#msg5e21be89000f49789911889d)confirmed, W7 `Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00`

meijeru

[16:51](#msg5e21e60bdd1429262d4065ca)Confirmed W10

BeardPower

[16:51](#msg5e21e615000f497899129eb3)Same here.

greggirwin

[19:40](#msg5e220da73ea53f0f663f4573)Good catch. Please submit a ticket.

## Saturday 18th January, 2020

vazub

[15:38](#msg5e23268fa1dfaa3ba13ee09d)Something seems to be wrong with `shape` subdialect of draw. Lines that form the pentagram in this code are not aligned one to another. On the other hand, `polygon`  
word works as expected (except for the line width, which differs from the one shape has). Can anyone chime in and confirm?

```
Red [need: 'view]

canvas: 500x500
radius: 200
center: as-pair canvas/x / 2 canvas/y / 2

points: collect [
	repeat angle-num 5 [
        angle: angle-num * 72 + 18 ;-- +18 is required for rotation
        keep as-pair (cosine angle) * radius + center/x (sine angle) * radius + center/y
    ]
]

view [
	title "Pentagram" 
    base canvas white
    draw compose/deep [
        fill-pen red
        line-width 5
        ;polygon (points/1) (points/3) (points/5) (points/2) (points/4)
        shape [line (points/1) (points/3) (points/5) (points/2) (points/4)]
    ]    
]
```

hiiamboris

[16:18](#msg5e232fe20289c83ba2bcf8ff)I think that's expected, as the line is drawn \*outside* the shape area

[16:19](#msg5e23302ead195a0f672e0772)you can draw this shape without pen, and then draw an unfilled polyline over it

vazub

[22:28](#msg5e2386885cd7964660734d43)@hiiamboris I am actually trying to get the whole pentagram filled with color, but I am obsiously missing something...

hiiamboris

[23:09](#msg5e2390463ea53f0f66492fd8)that's why I propose you fill it without pen but with fill-pen first (`pen off`)

[23:10](#msg5e23906ac7647778a5e89a3a)whom are you going to summon anyway? ;)

## Sunday 19th January, 2020

vazub

[07:17](#msg5e2402914c1f9679ec0fdad8)&gt; whom are you going to summon anyway? ;)

Well, only you answered my summons so far, so go figure :)) But jokes aside, I was merely going for this task on Rosetta - https://rosettacode.org/wiki/Pentagram , just trying to be more original than the majority there, with their generic blue stars.

## Thursday 23th January, 2020

hiiamboris

[21:33](#msg5e2a11469ad22d5bd5cacc37)Is that by design that `halt` in CLI console prints "(halted)" and just terminates it?

[21:53](#msg5e2a15c11a1c2739e3ea2a7b)(`halt` need to be in a script to reproduce)

## Friday 24th January, 2020

dockimbel

[00:15](#msg5e2a3732e177666195b9cb49)@hiiamboris You mean the console exiting to system shell?

hiiamboris

[09:41](#msg5e2abbc0f85dba0aab06e272)@dockimbel yes (unless I also provide --catch)

dockimbel

[10:29](#msg5e2ac727f85dba0aab0733e8)The intended `halt` behavior is to exit Red when running a script from shell: `$ red script.red`.

hiiamboris

[11:16](#msg5e2ad21da9b30639e2da1369)But it does not exit when running it in GUI mode (and I'm using that to play, in console, with stuff my script provides)

[11:23](#msg5e2ad3b7a9b30639e2da2232)I think the difference is not in halt, but in the fact GUI console implies --catch

dockimbel

[12:20](#msg5e2ae11b34829272791d2495)That's intended. The GUI console is not supposed to be used for batch scripts.

ne1uno

[12:22](#msg5e2ae171e177666195be4d2f)except needs view?

[12:25](#msg5e2ae224da04a624f474f8b5)a drop to console like `python -i` would be useful and error on syntax error like `--test` in some lang

hiiamboris

[12:28](#msg5e2ae30adc07667042e4a142)@dockimbel got it, thanks

[12:30](#msg5e2ae365dc07667042e4a607)@ne1uno --catch works in CLI console, just use halt on error and quit at the end

ne1uno

[12:35](#msg5e2ae484da04a624f47506a9)thanks, `--catch` works. gui-console needs `--batch` implemented to allow exit?

hiiamboris

[12:49](#msg5e2ae7cee177666195be7e46)I use `quit` :)

## Saturday 25th January, 2020

rgchris

[17:19](#msg5e2c78a0dc07667042f04604)When calling Red from Rebol's call:

```
call/wait/input "red" {Red []^/print "I am Red!"}
```

I get the following output:

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

== 
I am Red!

*** Runtime Error 1: access violation
*** at: 000244A5h
```

The 'at: 000244A5h' is consistent. It works fine if I explicitly add QUIT. If I replace the newline with a space, or omit the Red header nothing happens (possible hang?).

Am using \*\*red-latest\** via Homebrew.

[17:20](#msg5e2c78d0a420263e039a8041)(also, should the banner appear when invoked in this way?)

hiiamboris

[17:32](#msg5e2c7b95da04a624f480b3db)https://github.com/red/red/issues/4241 related Windows /input bugs

[17:32](#msg5e2c7ba8183449313bd836f6)You should report this

## Sunday 26th January, 2020

vazub

[07:37](#msg5e2d41c2183449313bdd19b3)There is a possibility that `-o` compiler option regressed. On Win10, no matter what I use as an argument, when running it from the console, the libRT and final executable gets built in the source folder. Can someone confirm?

toomasv

[09:15](#msg5e2d58aa4c3dae24f5eff0b6)In Jan 13 build it works correctly on W10.

vazub

[09:17](#msg5e2d5944f85dba0aab1933c9) @toomasv could you please provide a sample command, so that I try to reproduce it as close as possible in my env?

toomasv

[09:20](#msg5e2d59ec1a1c2739e300fde9)I did `red -c -o ..\out.exe rr.red` and it built libraries and exe correctly in upper dir.

vazub

[09:28](#msg5e2d5bc6f85dba0aab194615)&gt; I did `red -c -o ..\out.exe rr.red` and it built libraries and exe correctly in upper dir.

Yep, works this way for me as well. However, I am now confused as to the ordering of arguments. I assumed that one would use the source argument right after the `-c`option, like this

```
red -c .\play.red -o ..\out.exe
```

. At least this is the way the command gets executed by the Red VSCode plugin, and that is where it builds only in src folder.

toomasv

[09:29](#msg5e2d5c16cd53a80aac2a726c)IIRC options first, source last.

vazub

[10:03](#msg5e2d63f2cd53a80aac2aa7de)&gt; IIRC options first, source last.

If this is correct, then the VScode plugin has an argument ordering bug. However, such way of ordering seems to be a bit unintuitive to me - what would be the practical case of separating the option from an immediate argument to put other options in-between?

[10:48](#msg5e2d6e73da04a624f486db45)@bitbegin ^  
https://github.com/red/VScode-extension/blob/master/src/commandsProvider.ts#L154 and other lines in respective compile-related functions

hiiamboris

[10:56](#msg5e2d706ef196225bd65ea871)&gt; &gt; IIRC options first, source last.  
&gt;  
&gt; If this is correct, then the VScode plugin has an argument ordering bug. However, such way of ordering seems to be a bit unintuitive to me - what would be the practical case of separating the option from an immediate argument to put other options in-between?

What gave you the idea that `-c` accepts an argument at all? ;)

vazub

[10:59](#msg5e2d70f61a1c2739e30191cd)@hiiamboris exact command execution in VSCode, as shown above :)

hiiamboris

[11:03](#msg5e2d71e79ad22d5bd5e22018)I see :)  
Well, it's up to @bitbegin to fix then. Everything after the script name is arguments to that script. It doesn't make sense with `-c` or `-r` as script is never run, but forbidding it or otherwise reordering would complicate the command line parser unnecessarily.

greggirwin

[18:47](#msg5e2ddecde177666195d2e6d8)@vazub FWIW, I hit the same thing recently. Happens to all of us.

[18:48](#msg5e2ddefd44c076313ceeaf89)We think in refinement order. :^)

vazub

[18:49](#msg5e2ddf2fa420263e03a3b977) &gt; We think in refinement order. :^)

agree :)

GiuseppeChillemi

[19:55](#msg5e2deea0183449313be19057)Here:

```
>> [a: 22 b: "hello]
*** Syntax Error: missing #"]" at {"hello]}
*** Where: do
*** Stack: load 
>> [a: 22 b: "hello]
```

I think should be reported the lack of `"` and not `]`

hiiamboris

[20:34](#msg5e2df7d7a420263e03a46074):point\_up: \[January 20, 2020 12:47 AM](https://gitter.im/red/red?at=5e24ce8d5cd79646607c5550)

GiuseppeChillemi

[22:15](#msg5e2e0f67da04a624f48b3a26)There should have been some sort of astral connection.

## Monday 27th January, 2020

Oldes

[12:47](#msg5e2edbc51a1c2739e30b2b32)@dockimbel is this by design?

```
>> parse "aabbccdd" [ thru [p: (probe p) "cc" ]]
"aabbccdd"
"abbccdd"
"bbccdd"
"bccdd"
"ccdd"
```

hiiamboris

[12:51](#msg5e2edccff196225bd6682e54)It is. How else would `thru` know where to jump to? By divination? :)

[12:51](#msg5e2edcef1a883c61961a1b1a)See `parse-trace` output and recent parse documentation by @9214

Oldes

[12:52](#msg5e2edd261a883c61961a1ccd)You may explain it here ;-) :point\_up: \[27. leden 2020 13:36](https://gitter.im/red/parse?at=5e2ed967da04a624f49084ab)

hiiamboris

[12:53](#msg5e2edd619ad22d5bd5eb775f)No... that situation is beyond my abilities ;)

dockimbel

[15:10](#msg5e2efd671a1c2739e30c318c)@Oldes Yes, it is. What else did you expect? Allowing block rules as arguments to `to/thru` means exposing the inner search loop to the user.

Oldes

[15:12](#msg5e2efde91a1c2739e30c35b3)I was expecting error as in Rebol, but I have nothing against it. It is just my fault that I'm lagging behind not knowing all these new parse improvements.

[15:15](#msg5e2efe954c3dae24f5faf4b0)And I was a little bit confused by having the probe in front of the content check. (The original code was not mine.)

greggirwin

[17:11](#msg5e2f19cca9b30639e2f7b588)Noted in Parse wiki page.

## Thursday 30th January, 2020

Oldes

[15:00](#msg5e32ef77bfe65274eac52dad)

```
>> (make vector! [200 100]) / 2
== make vector! [100 50]
>> (make vector! [200 100]) * .5
== make vector! [0 0] ;<--------- should not be there make vector! [100 50] too?
```

[15:03](#msg5e32f03758f02e34974a584e)I understand, that decimal 0.5 becomes 0 integer, but still...

rebolek

[15:04](#msg5e32f064dc52c34ace2eebe2)Probably not, type of vector values is predefined and integer * float results in float, so it would need to change vector's type.

Oldes

[15:04](#msg5e32f077fe0e6f74e9e89440)It could just round. Like here:

```
>> (make vector! [33]) / 2
== make vector! [16]
```

hiiamboris

[15:05](#msg5e32f0afe8a8383559fea1c2)Let's think. If we make this work, it means we would have to: promote each vector item to float, multiply it with 0.5, and then demote back to integer. Quite a performance loss, no?

rebolek

[15:05](#msg5e32f0c0f301780b834ef90c)exactly

Oldes

[15:05](#msg5e32f0cfdc52c34ace2eed20)Yes.. that is what are the dark sides.. I'm just asking.. take it easy.

rebolek

[15:06](#msg5e32f0ddf6945f41ef434174)no problem

[15:06](#msg5e32f0f3d9895b17c3b75169)I guess that error would be better in such case

hiiamboris

[15:07](#msg5e32f1146f9d3d349806d2e6)It's a good thing to note anyway. Let's wait for @greggirwin to come and tell us where on the wiki this belongs to ;)

rebolek

[15:08](#msg5e32f172433e1d40397deaed)&gt; take it easy

Look @Oldes this is far too serious matter to take it easy!!!!!

Oldes

[15:09](#msg5e32f1ba73ddad4acd798b41)I take it, that there is consensus, that it is not a bug. Case closed.

rebolek

[15:10](#msg5e32f1e9433e1d40397dee04)IMO it should throw an error, so it can be considered a bug.

Oldes

[15:39](#msg5e32f8c0f6945f41ef4380d3)Btw... this is how it works in Julia:

```
julia> [2 3 5] .* 2.0
1×3 Array{Float64,2}:
 4.0  6.0  10.0

julia> [2 3 5] .* 2
1×3 Array{Int64,2}:
 4  6  10
```

greggirwin

[20:26](#msg5e333be858f02e34974c836f):point\_up: \[January 30, 2020 8:07 AM](https://gitter.im/red/bugs?at=5e32f1146f9d3d349806d2e6) Let's see...where should I tell you to put it...? ;^)

[20:29](#msg5e333c8c433e1d4039803359)https://github.com/red/red/wiki/Vector-Notes

[20:29](#msg5e333cc6dc52c34ace312215)I think a couple people here have tinkered with Julia, so that's a good place to put comparison notes as well. We do want to offer guides for those coming from other langs, so they are aware of differences early on.

hiiamboris

[20:34](#msg5e333de140da694c5ef4351b)Thanks ;)

[20:35](#msg5e333e26fe0e6f74e9eadf1c)Shouldn't the page have this boring '\[NOTES]' prefix?

greggirwin

[20:42](#msg5e333fa3dc52c34ace31339f)Ah, yes, probably. @gltewalt isn't around to clean up after me lately.

[20:44](#msg5e3340113aca1e4c5f4dfbd5)https://github.com/red/red/wiki/%5BNOTES%5D-Vector

## Saturday 1st February, 2020

hiiamboris

[15:15](#msg5e3596233aca1e4c5f5a11d4)@dockimbel is this by design?

```
>> do/next [a: 1 + 1 a] 'p ? p
P is a block! value.  length: 1 index: 5 [a]

>> preprocessor/fetch-next [a: 1 + 1 a]
== [1 + 1 a]           ;) I expected [a] here
```

[15:25](#msg5e35984cf6945f41ef51d5f5)And also that it does not account for lit-args/get-args:

```
>> f: func ['x] []
>> preprocessor/fetch-next [f f 1]
== []                  ;) expected [1]
>> do/next [f f 1] 'p ? p
P is a block! value.  length: 1 index: 3 [1]
```

[15:50](#msg5e359e32d9895b17c3c5dbac)Probably the most harmful/ignorant part:

```
>> f: func [x][]
>> preprocessor/fetch-next [f x: 1 y: 2]
== [1 y: 2]
```

[15:58](#msg5e35a02573ddad4acd87cd1f)Oh this is so R2-like :)

```
>> preprocessor/fetch-next [+ 1 2 3]
== [3]
```

## Sunday 2nd February, 2020

dockimbel

[00:05](#msg5e36124c433e1d40398db4cf)@hiiamboris `preprocessor/fetch-next` is meant to analyze conditional expressions in some of the preprocessor's directives. It does not need to support the full Red evaluation semantics. It could be extended to cover more rules if we think it is necessary.

greggirwin

[00:09](#msg5e36132558f02e349759cf4f)Should we doc it in more detail in https://doc.red-lang.org/en/preprocessor.html ?

dockimbel

[00:15](#msg5e3614bd15941335584e6dfb)Did anyone encounter any limitations when using preprocessor conditional directives?

greggirwin

[00:19](#msg5e36159d58f02e349759d42c)The only thing I know of is best practice question for checking interpreted/compiled state mentioned in Telegram chat with Toomas.

Is `fetch-next` meant as a public func, or should we note preprocessor elements that are for internal use only?

dockimbel

[00:21](#msg5e36160b594a0517c25fe9c1)@greggirwin We could mention that conditional expressions do not support set-words and some rarely used semantics like lit/get arguments fetching.

[00:22](#msg5e36164d3aca1e4c5f5b21c0)What makes you think `preprocessor/fetch-next` is meant to be a public function? If it was meant for that, it would be exposed in the global context.

greggirwin

[00:23](#msg5e36168c594a0517c25fea36)I don't, but I think @hiiamboris might. He pokes around a lot. ;^) We don't have a way to denote public/private bits yet.

dockimbel

[00:25](#msg5e3616f440da694c5e014880)What is meant to be public is exposed to the global context, or at least clearly mentioned in the documentation. Moreover, we usually add doc-strings to functions meant for public use. Such implicit rules are in use since the early days of Rebol.

greggirwin

[00:28](#msg5e3617c6e8a83835590e0145)We should document that convention.

[02:44](#msg5e3637ab15941335584ec354)A downside, of course, is that it means we're intentionally not documenting things to denote visibility, which doesn't seem like a great idea.

hiiamboris

[11:32](#msg5e36b35215941335584fb66b)@dockimbel `fetch-next` and `func-arity?` are leveraged not only by me, simply because language does not provide any other means (as of now) to satisfy the demand.

[11:33](#msg5e36b378e8a83835590f3dfc)I'm all for making versions with full Red support.

dockimbel

[14:06](#msg5e36d77e433e1d40398f5af0)@hiiamboris Providing full-featured expressions fetching is nice to have, but very low-priority. If you can extend those functions to make them more accurate without bloating the code, I would accept the patch. Otherwise, the future interpreter instrumentation should provide those features at low-cost.

hiiamboris

[14:33](#msg5e36ddd5433e1d40398f6a96)@dockimbel I'll see what can be done ;)  
For more context, I'm working on the view testing system, and at the same time - experimenting with high level tooling (inspired by HOF mindset no less ;). What I was able to do with these two functions yesterday (though I worked around their limitations) is a \[`trace-deep` function](https://gitlab.com/hiiamboris/red-view-test-system/blob/master/dope.red#L78), that works like this:

```
>> x: y: 2 f: func [x] [x * 5]
>> probe trace-deep :inspect [x + f y]
x                              => 2
y                              => 2
f 2                            => 10
2 + 10                         => 12
12
```

Point is, when a test assertion fails, not only I have the end result, but all the intermediate evaluation results as well (what was `x`? what was `y`? is it `f` that failed? etc). So I don't have to go torturing my test code to understand which part of it failed, because I can point my finger directly at it. Remember @giesse's idea that an ideal debugger should provide a way to go backwards in time? Well, this is not a time travel yet ☻ But it's somewhat along those lines.

greggirwin

[19:13](#msg5e371f5ae8a8383559103e01)Very cool @hiiamboris.

[19:16](#msg5e371ff2dc52c34ace4063b3)`where's-my-error?` :^)

hiiamboris

[19:17](#msg5e37202f594a0517c262414e)I thought you'd like it :D  
It tells me an exact expression that errored out (which can otherwise be hard to guess from the stack trace, esp. with generic names like `get`)

## Monday 3th February, 2020

dockimbel

[18:31](#msg5e386718594a0517c2651f82)@hiiamboris The Clipboard unit tests you wrote don't seem reliable. I often get a failure on `text-io-2` if I am using the Clipboard while the tests are running. That's really annoying as I keep getting false errors from time to time. If it's not possible to do such tests in isolation, maybe they should be removed?

hiiamboris

[18:45](#msg5e386a55159413355853ae21)is this tests malfunctioning or clipboard?

[18:48](#msg5e386ae9ea9ba00b84ac9ec1)okay, obviously clipboard

[18:50](#msg5e386b60fe0e6f74e9fd476f)@dockimbel you sure it's you who's using it? I don't suppose you can technically be that fast to copy something between Red executing `write-clipboard` and subsequent `read-clipboard`? ;)

dockimbel

[18:50](#msg5e386b69ea9ba00b84ac9fef)The issue is caused by external manipulations (hitting CTRL-C on the keyboard) while the Clipboard tests are running (or just before, I'm not sure if it needs to be synchronized).

hiiamboris

[18:51](#msg5e386b9afe0e6f74e9fd4850)I'll try to reproduce. You don't have any clipboard sync utilities running?

dockimbel

[18:52](#msg5e386bd1ea9ba00b84aca19a)Right, it's probably a remanence effect after using the clipboard, maybe leaving it in an unexpected state when the tests are passing.

[18:52](#msg5e386bd9159413355853b1a5)&gt; You don't have any clipboard sync utilities running?

Nope. Though, it's not excluded that it could be caused by some other app on my system...

hiiamboris

[18:52](#msg5e386bf8d9895b17c3cc0d9b)Okay, I'll look into it.

dockimbel

[18:52](#msg5e386bfbf6945f41ef582a66)I wonder if anyone else has experienced the same tests failure?

hiiamboris

[18:53](#msg5e386c3cf301780b8363c242)Off the topic, how do you `get` the value of a path in R2?

dockimbel

[18:54](#msg5e386c5af6945f41ef582b27)I don't remember any simple way to achieve that in R2...

greggirwin

[20:29](#msg5e38829cdc52c34ace43832d)It was pretty ugly in R2. My first hack...so long ago, was to convert to a block and prepend the correct number of `get/any in` calls before `do`ing it.

hiiamboris

[20:35](#msg5e388401dc52c34ace4386af)Interesting ;) I chose incremental `select` though, as `in` does not support series selectors

greggirwin

[20:38](#msg5e3884bfe8a83835591372b0)I can't defend my code, it was probably 2001/2 when first written. :^)

[20:41](#msg5e388580ea9ba00b84ace81b)Looks like I cleaned it up in https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5

hiiamboris

[21:13](#msg5e388ceed9895b17c3cc66de)@dockimbel `loop 100 [wait 1e-1 print [write-clipboard "" read-clipboard]]` starts always reporting false after the 1st external write to the clipboard. If I add a `do-events/no-wait` to the loop, then it's only false once when clipboard was in use. But that's in GUI console. In CLI console - it never fails ;)  
What a weird invention - Windows! ;)

dockimbel

[21:18](#msg5e388e18e8a8383559138afd)@hiiamboris Interesting. Well, clipboard being a global resource on Windows has always been a source of trouble.

[21:20](#msg5e388e93dc52c34ace43a1e3)@hiiamboris  
&gt; Interesting ;) I chose incremental `select` though, as `in` does not support series selectors

Right, you need to write a custom path evaluator in order to `get` the path. Now you realize how big of an improvement was `get-path!` in R3 and Red. ;-)

hiiamboris

[21:21](#msg5e388ec6ea9ba00b84ad02ad)&gt; Now you realize how big of an improvement was `get-path!` in R3 and Red. ;-)

Indeed! A life saver :)

greggirwin

[21:23](#msg5e388f39e8a8383559138d56)Wait! I \*can* defend my code, because it was specifically for object browsing. ;^)

hiiamboris

[21:26](#msg5e38901dbfe65274eada545a):turtle: :checkered\_flag:

## Tuesday 4th February, 2020

Oldes

[08:46](#msg5e392f69bfe65274eadba87c)In R3 and Red, `none = length? none`. Wouldn't it be more practical to return it `0`?

[08:56](#msg5e3931a858f02e349760d7ac)Although when thinking about it, it could introduce hard to find bugs, so probably it is good as it is...  
I can still write: `any [length? none 0]`, which is big improvement over R2, where it throws error instead.

dockimbel

[08:57](#msg5e3932126f9d3d34981d3e60)@Oldes I am not sure `length?` being none-transparent is a good idea in the first place, as it removes a valuable argument type-checking, `length?` being a very common action. Red follows R3 there, but I don't remember relying on that in my own code ever.

Oldes

[09:04](#msg5e3933a3594a0517c266eabd)I think that it is quite safe as it is, because if not treated correctly, it will fails soon enough, like in this case:

```
>> data: none bytes-needed: 16 + length? data
*** Script Error: + does not allow none! for its value2 argument
*** Where: +
*** Stack:
```

henrikmk

[14:41](#msg5e398296ea9ba00b84af35a7)some other series oriented functions, like CLEAR and REMOVE are both NONE transparent in R2. I'm not sure there is any consistency lost by having LENGTH? being NONE transparent. the code would still be compatible with R2.

dockimbel

[15:30](#msg5e398e206f9d3d34981e2c1a)`clear` and `remove` are used in common patterns `clear find...` and `remove find...` where letting `none`pass-thru avoids boilerplate code. For `length?`, I am not aware of any common pattern justifying weakening the type-checking.

greggirwin

[18:41](#msg5e39baf3d9895b17c3cf2d9b)`None` is a special case, if we consider scalars, which aren't allowed. That is, you could say the length of any of them is `none`. The funcs that allow none are fewer than those that don't, based on common patterns, as @dockimbel said.

[18:52](#msg5e39bd65f301780b8366dd86)It's a tough design call, and brings to mind some recent thoughts I had. Some "modern" langs support a `maybe` or `nullable` option for vars. I don't think we want to go down that path (no pun intended), but maybe we do something like a parallel to `attempt`, which catches `none` errors, but not others. So you can mark a particular expression as "I know nones may trip this up, so ignore that".

Oldes

[19:40](#msg5e39c898d9895b17c3cf52d2)I believe that reason why it was introduced in R3 is, that this is shorter (faster, better?):

```
data: none bytes-needed: 16 + any [length? data 0]
```

than:

```
data: none bytes-needed: 16 + either data [length? data][0]
```

hiiamboris

[19:42](#msg5e39c918433e1d403996605f)`16 + length? any [data []]`

## Wednesday 5th February, 2020

henrikmk

[19:53](#msg5e3b1d2cea9ba00b84b39966)a consideration could be, if having length? being NONE transparent is faster, which could be helpful in loops.

greggirwin

[20:11](#msg5e3b2171f301780b836a9474)

```
>> data: none  profile/show/count [[length? any [data []]][length? none]] 1'000'000
Count: 1000000
Time         | Time (Per)   | Memory      | Code
0:00:00.136  | 0:00:00      | 284         | [length? none]
0:00:00.285  | 0:00:00      | 440         | [length? any [data []]]
```

But if your data is potentially changing inside a loop, it may dwarf that difference.

hiiamboris

[21:53](#msg5e3b3948f6945f41ef5f4378)!\[](https://i.gyazo.com/9ca7fbc1fcfde3d947895103cdd37147.png)  
I'm curious if this extra padding is by design

[21:55](#msg5e3b39c6fe0e6f74e90460ad)looks like it was introduced 10th or 11th of December

[21:57](#msg5e3b3a5d594a0517c26c44ca)nevermind, I should update sometimes

## Friday 7th February, 2020

hiiamboris

[18:41](#msg5e3daf6737545d247d26bb85)Is `panel tight` option supposed to affect internal padding or what? I don't think it's doing anything at all:

```
>> view [panel tight [box 20x20 on-created [probe face/parent/size]]]
40x40
```

It's also undocumented

dockimbel

[19:52](#msg5e3dbfec3716b919ba046885)@hiiamboris From top of my head, it should be a shortcut for `origin 0x0 space 0x0`.

hiiamboris

[20:15](#msg5e3dc56d62e9db4bf7851c8f)Should I report it to the tracker then? Or it's a known TBD

dockimbel

[20:55](#msg5e3dceaf62e9db4bf785384b)See in `%VID.red` at line 321:

```
| 'tight	  (if opts/text [tight?: yes])
```

So, it relates to faces with `/text` facet set. It will trigger a tighter face size around the inner text. For a panel, the size is calculated from his child faces, so this option has no effect there.

hiiamboris

[21:16](#msg5e3dd3a7d4daaa26c18d798e)Hmm. Perhaps that was the plan, but I don't see no difference for `button`, `area`, `group-box`, `text`, `radio`, `check`, `drop-list` or `drop-down` styles (tight vs no tight)

[21:17](#msg5e3dd3db3716b919ba04a283)Still could be nice to apply it to the `panel`, don't you think?

dockimbel

[21:42](#msg5e3dd9caecfa4461c04876a1)There's clearly a difference for most of those face types. Use a high-contrast background color to see how the face size is reduced in `tight` mode (remember that automatic size calculations are disabled if you provide a fixed size).  
Though, we could change the behavior of `tight` keyword when applied to panels.

hiiamboris

[21:49](#msg5e3ddb65d4daaa26c18d8ad9)This is what I see on W7:  
!\[](https://i.gyazo.com/37d21eaadf0733ff7929d2a6d2ec5954.png)

[21:49](#msg5e3ddb6cdf1153705e205451)

```
view [
	backdrop green below return
	text tight blue "text" text blue "text" return
	button tight blue "text" button blue "text" return
	radio tight blue "text" radio blue "text" return
	check tight blue "text" check blue "text" return
	drop-down tight blue "text" drop-down blue "text" return
]
```

[21:51](#msg5e3ddbf145000661fca93013)`Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3`

dockimbel

[21:53](#msg5e3ddc5d37545d247d2734c7)I get the same result as you with your code, however, with a reduced version (W10):

```
view [radio "hello world" red tight radio "hello world" red]
```

hiiamboris

[21:53](#msg5e3ddc75340a8019bbab6023)Yes, this one works for me too

dockimbel

[21:53](#msg5e3ddc7663c15921f4668be0)\[!\[image.png](https://files.gitter.im/red/bugs/7gu5/thumb/image.png)](https://files.gitter.im/red/bugs/7gu5/image.png)

[21:54](#msg5e3ddca33716b919ba04b63e)It's even too tight in this case, as it does not account for extra space for radio button.

hiiamboris

[21:55](#msg5e3ddcc5d4daaa26c18d8d5f)Now I place `tight` after the text:  
!\[](https://i.gyazo.com/610f2b0de3c15431ca52e6086d4f9f32.png)

dockimbel

[21:55](#msg5e3ddcd537545d247d273587):-)

hiiamboris

[21:55](#msg5e3ddcdbf3718e705debf388)okay, it definitely has issues then :)

dockimbel

[21:56](#msg5e3ddd0e37545d247d273604)Just missing adjustments for widgets with extra graphics. It's really meant to be used for `base`, `text` and `field`.

[21:58](#msg5e3ddd6a62e9db4bf78558dc)You can open a ticket for the fact that it works only when put after the text string.

hiiamboris

[22:01](#msg5e3dde48ecfa4461c0487f5a)Sure :)

[22:05](#msg5e3ddf3dc900d747abef9a69)@dockimbel do you think it's possible for functions defined in contexts to be reported in the stack trace? it's pretty hard to locate the error source otherwise

ne1uno

[22:39](#msg5e3de719df1153705e206e81)#include too

dockimbel

[23:24](#msg5e3df1c462e9db4bf78588c8)@hiiamboris Do you mean a way to identify the context the functions are bound to?

hiiamboris

[23:28](#msg5e3df28637545d247d2769d0)Try this:

```
a: object [af: does [b/bf]]
b: object [bf: does [cf]]
c: object [set 'system/words/cf does [df] cf: none]
d: object [set 'df does [ff]]
ff: does [
	gf: does [do make error! "error"]
	gf
]
a/af
```

[23:28](#msg5e3df29e55b6b04bf69bdc7b)

```
*** User Error: "error"
*** Where: do
*** Stack: cf df ff gf
```

No `af` or `bf` (unless I also define functions with the same name in system/words)

[23:29](#msg5e3df2d455b6b04bf69bdd2c)I have a lot of functions in contexts, calling each other and they are all invisible to stack trace

[23:30](#msg5e3df3063716b919ba04e99a)It would be cool to also identify the context, but even knowing just their names would make a huge difference

[23:33](#msg5e3df3ad19597421f3b68d51)Not sure how this can be implemented without slowing down the whole :)

## Saturday 8th February, 2020

dockimbel

[00:13](#msg5e3dfd0c19597421f3b69f7e)@hiiamboris That's indeed very annoying. A \[quick look](https://github.com/red/red/blob/master/runtime/interpreter.reds#L752) in the interpreter shows that it logs the function's name on stack only if the calling value is a word. It should be possible to improve that for path calls, just extracting the last word (if refinements are also present, it can become much more expensive...). I'll give it a try tomorrow.

loziniak

[00:40](#msg5e3e0385cd2d737bb0649e1f)it'd be pure gold! :-)

[00:43](#msg5e3e044ccd2d737bb064a050)so, if you call a function with refinement, it's also not logged? what about logging whole paths? perhaps it could be faster than dividing them? we could perhaps keep context and refinement info this way...

hiiamboris

[11:43](#msg5e3e9ef6ecfa4461c049f3df)Refinements do not seem to affect stack trace. I guess that's because interpreter has to identify the function in a path anyway, before making a call.

## Sunday 9th February, 2020

dockimbel

[12:11](#msg5e3ff6ea62e9db4bf789acec)@hiiamboris I made an improvement to the interpreter to properly log locally bound calls in the stack trace, though, it conflicts with the way the compiler handles words (compiled code relies a lot on predefined word! values permanently stored in the root block, the change is modifying the context node of such words, creating troubles for subsequent usages). I could make a minor change in the compiler to make it work in those cases, but there is a better way that I'll try tonight. I'll push all the changes tonight.

hiiamboris

[12:22](#msg5e3ff96d62e9db4bf789b229)Thanks a lot @dockimbel !

Oldes

[13:19](#msg5e4006e519597421f3baea84)@dockimbel `put`'s series argument is defined to accept any `series!`, but I think it should be `any-block!` instead, because it is not implemented on `any-string!` types and `vector!`. And to be honest, I don't think it should be.

[13:20](#msg5e4007281d23aa47aa0350ec)Also... in the `block!` variant, wouldn't it be better if the \_key_ search would be done as with `skip = 2`, so only the \_key_ values would be found?

[13:29](#msg5e400945340a8019bbaffa4c)And `put` into an `object!` is working also just partially (only when the `key` exists`):`  
&gt;&gt; o: object \[a: 1] put o 'a 2 o  
\== make object! [  
a: 2  
]  
&gt;&gt; o: object \[a: 1] put o 'b 3 o  
\*\** Script Error: cannot access b in path none  
\*\** Where: put  
\*\** Stack:

\`

dockimbel

[15:35](#msg5e4026ce37545d247d2bd21e)@Oldes Objects cannot be extended, there is no exception for `put`.

[15:36](#msg5e4027013716b919ba09a375)`put` is meant to be the modifying counterpart of `select`, so it follows the same lookup rules.

Oldes

[15:37](#msg5e40273bdf1153705e2517c1)I think that the definition should be: `[any-block! port! map! object!]` instead of `[series! port! map! object!]`

[15:38](#msg5e40276f340a8019bbb03da1)I'm not sure with the object, because one can use simple: `o/a: 2` instead of `put o 'a 2`

dockimbel

[15:40](#msg5e4027ea45000661fcade015)That was the first spec IIRC, then someone complained that it should be defined for `series!` for sake of consistency....

Oldes

[15:40](#msg5e4027fb63c15921f46b4eef)But I think that `put` is very nice with `block`. Just I am not sure, if the key lookup should not use skip.

dockimbel

[15:41](#msg5e402821340a8019bbb03e9c)`put` is not very useful on objects, but as it is defined for maps...

hiiamboris

[15:45](#msg5e402900f3718e705df0af3d)`put` is much clearer than set-paths when used with expressions

greggirwin

[17:56](#msg5e4047eb340a8019bbb092ac)&gt; `put` is meant to be the modifying counterpart of `select`, so it follows the same lookup rules

This makes sense to me, but I'll lean toward @Oldes' thinking in that it should have `/skip` support.

Series support makes sense to me as well. We can do this after all:

```
>> s: "a1b2c3d4"
== "a1b2c3d4"
>> s/(#"b"): #"x"
== #"x"
>> s
== "a1bxc3d4"
```

So we just need to implement the action.

dockimbel

[22:39](#msg5e408a14df1153705e25f314)@greggirwin Agreed.

## Monday 10th February, 2020

rebolek

[08:57](#msg5e411af0c900d747abf6763d)Strange problem on mac: I compile gui-console, it runs fine. When I copy it to `/usr/local/bin` and run it from there, I get `*** Runtime Error 1: access violation`.

Oldes

[09:11](#msg5e411e3e340a8019bbb25f35)What about using debug build?

rebolek

[09:16](#msg5e411f6345000661fcaff3ee)I can try that.

[09:41](#msg5e41255c3716b919ba0bd53d)@Oldes thanks for the tip, now I'm much wiser ;-)

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

Oldes

[09:43](#msg5e4125b0df1153705e2727c0):)

dockimbel

[11:31](#msg5e413f26cd2d737bb06b9f5b)@rebolek Such crash reports usually mean that it crashed inside a system call. Try running it using `strace` and see if you can pinpoint the crashing system call.

rebolek

[12:01](#msg5e414605d4daaa26c194a5f0)@dockimbel  
Here’s full ouptut of `dtruss`:

```
~ ❯❯❯ sudo dtruss -f -t open gui-console                                                                                                                                                                                          ✘ 1
Password:
dtrace: system integrity protection is on, some features will not be available

	PID/THRD  SYSCALL(args) 		 = return

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
91956/0x1cca76:  open("/dev/dtracehelper\0", 0x2, 0xFFFFFFFFBFFFF0C8)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/Encodings/libLatin2Converter.dylib\0", 0x0, 0x0)		 = 3 0
91956/0x1cca76:  open("/usr/local/bin/gui-console\0", 0x0, 0x1FF)		 = 3 0
91956/0x1cca76:  open("/usr/share/icu/icudt62l.dat\0", 0x0, 0xFFFFFFFFBFFFE264)		 = 3 0
91956/0x1cca76:  open("/usr/local/bin/gui-console/..namedfork/rsrc\0", 0x0, 0x1B6)		 = -1 Err#2
91956/0x1cca76:  open("/var/db/timezone/icutz/icutz44l.dat\0", 0x0, 0xFFFFFFFFBFFFBDAC)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/SystemAppearance.bundle/Contents/Info.plist\0", 0x0, 0x1B6)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/SystemAppearance.car\0", 0x0, 0x1A4)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/DarkAquaAppearance.car\0", 0x0, 0x1A4)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/DarkAppearance.car\0", 0x0, 0x1A4)		 = 3 0
91956/0x1cca76:  open("/System/Library/CoreServices/SystemVersion.plist\0", 0x0, 0x0)		 = 3 0
```

dockimbel

[12:31](#msg5e414d22c900d747abf6fd0e)That's not the right tracing, it should show all the system calls in details before the crash happens, not after. \[This is](https://i2.wp.com/saurabhbadhwar.xyz/blog/wp-content/uploads/2016/08/strace.png?zoom=2&amp;resize=748%2C374) the typical output you should get. See https://www.howtoforge.com/linux-strace-command/

rebolek

[12:34](#msg5e414dba63c15921f46dbe45)@dockimbel I see. `dtruss` is recommended instead of `strace` for macOS as there's no `strace`. This is not a pressing issue, GUI-console runs fine, but just not from `/usr/local/bin/`. So I'm going to look into it, but it's not a high priority to me.

## Tuesday 11st February, 2020

Oldes

[14:10](#msg5e42b5f2340a8019bbb68430)@rebolek is this correct result?

```
>> clean-path http://red-lang.com/..
== %""
```

I was expecting `http://red-lang.com/`

rebolek

[14:34](#msg5e42bb6a3716b919ba0fc67b)@Oldes No, `clean-path` still has some problems, see @x8x's \[comment](https://github.com/red/red/issues/4258#issuecomment-578373733) and his `clean-path` implementation.

Oldes

[14:40](#msg5e42bce93716b919ba0fcaf6)Ok.. so known problem.. I see that @x8x 's version is better.. but:

```
>> clean-path http://red-lang.com/../
== http://red-lang.com/                                 <-- OK
>> clean-path http://red-lang.com/..
== http://red-lang.com/..                              <-- BAD
```

rebolek

[14:42](#msg5e42bd4cdf1153705e2af797)He describes it as `Quick try`.

Oldes

[14:42](#msg5e42bd6e62e9db4bf79032e6)I just want to know, if there is any consensus with results ;-)

[14:45](#msg5e42bdf955b6b04bf6a6740e)And what about this one:

```
>> read %/
== [%A/ %C/ %R/ %X/]
```

I think that it should be: `[%/A/ %/C/ %/R/ %/X/]`

rebolek

[14:45](#msg5e42be0f340a8019bbb69fba)I'm afraid that `clean-path` is not getting the attention it deserves. Good start would be writing tests for it, because even the test suite was broken recently.

Oldes

[14:46](#msg5e42be3a55b6b04bf6a6753d)I just noticed your `clean-path` pull request, so I tried it.

x8x

[14:46](#msg5e42be546709d166b8156f49)@Oldes last version should work fine, I will add `/limit` refinement before doing a PR, comments and bugs mostly welcome on the gist.

rebolek

[14:47](#msg5e42be64b612cc7bb15e3be8)It does not fix everything, just one particular problem I had.

x8x

[14:50](#msg5e42bf302682192a12d6a0ad)

```
>> clean-path http://red-lang.com/../
== http://red-lang.com/
```

what would you expect from above?

```
>> clean-path http://red-lang.com/..
== http://red-lang.com/..
```

That is a question if it should report invalid paths

hiiamboris

[14:58](#msg5e42c11ff3718e705df6a3f6)&gt; And what about this one:  
&gt;

```
> >> read %/
> == [%A/ %C/ %R/ %X/]
>
```

&gt; I think that it should be: `[%/A/ %/C/ %/R/ %/X/]`

`read` sort of returns relative paths ;) relative to `%/` in this case

Oldes

[15:02](#msg5e42c21663c15921f47141af)Ah... right, that makes sense!

dockimbel

[17:24](#msg5e42e33df3718e705df70659)@hiiamboris Using the last commit from master:

```
*** User Error: "error"
*** Where: do
*** Stack: af bf cf df ff gf
```

;-)

hiiamboris

[17:27](#msg5e42e403ecfa4461c0538a72)Nice! thanks ☻

[17:32](#msg5e42e545cd2d737bb06fd13e)So, compiled `a/b`, if `a` is a block, won't re-`select` it after the 1st use?

dockimbel

[18:05](#msg5e42ecec1d23aa47aa0a293a)The change I made only affects paths where objects accesses are present. So in `a/b`, if `a` is an object, the word `b` in the path will be rebound to that object. The lookup on second access will then be faster.

hiiamboris

[18:12](#msg5e42ee8c3716b919ba106a23)Why the change to recycle-test then?

[18:13](#msg5e42eed9b612cc7bb15ed05e)Path with words bound to that object somehow exist at the time of the call to `recycle`?

dockimbel

[23:43](#msg5e433c2a63c15921f4729b52)The change in that test is required because now the second words in the paths there are bound to the object context, so the GC pass will keep the object in memory despite the `ro2-o: none`, hence making the test fail.

## Wednesday 12nd February, 2020

Oldes

[07:18](#msg5e43a6b5c900d747abfcde26)On Windows in Red, same as in R2, `read %/` returns drive letters and `read %//` reads from root of the active drive. That is good, but it it ok, that `to-local-file` in both cases return same result?

```
>> to-local-file %/
== "\"
>> to-local-file %//
== "\"
```

[07:37](#msg5e43ab3bc900d747abfce9d1)This is also wrong:

```
>> to-red-file to-local-file %//GIT/
== %/GIT/
>> exists? %//GIT/
== true
>> exists? %/GIT/
== false
```

[07:37](#msg5e43ab53c900d747abfcea25)Windows (with its drive letters) is a big mess in this area :-(

[08:06](#msg5e43b1eb1d23aa47aa0bf846)I wonder if it would not be better to use `read %""` for reading drive letters, and so `%/GIT/` would mean current `%//GIT/`.

[08:07](#msg5e43b24e340a8019bbb8ff23)Because this is correct result:

```
>> to-local-file %//GIT/
== "\GIT\"
```

hiiamboris

[10:12](#msg5e43cf8337545d247d347de4)You have to call `clean-path` here:

```
>> to-local-file clean-path %//
== "d:\"
```

[10:12](#msg5e43cfaa45000661fcb6866b)%// is a hack and idk how will it play together with `\\share\rsrc` paths

Oldes

[10:29](#msg5e43d36c19597421f3c419fc)That is why I think, that the drive letters could be accessed using empty file instead.

hiiamboris

[10:36](#msg5e43d53363c15921f473fdd5)But how would you represent then a path with drive letters in Red?

[10:37](#msg5e43d558df1153705e2daf44)`read %/` is consistent with `%/c/windows` naming

Oldes

[10:43](#msg5e43d6e8b612cc7bb1610697)hm, I don't know :-( what about `%c:/temp` instead of `%/c/temp`? which would be same like `%/temp` if user is on drive `c` already.

[10:48](#msg5e43d81963c15921f4740729)But that would not work. Because one could construct invalid files just by joining them :-( So I give up.

## Thursday 13th February, 2020

endo64

[20:18](#msg5e45af023716b919ba17bc0a)See the error messages below, `test.red` file content:

```
Red []
halt
```

```
C:\red\build\bin>red --cli --catch test.red
(halted)
>> pick [a b] none
*** Script Error: body does not allow none! for its index argument
*** Where: pick
*** Stack:

>> pick [a b] none
*** Script Error: pick does not allow none! for its index argument
*** Where: pick
*** Stack:
```

hiiamboris

[20:32](#msg5e45b24345000661fcbb8875)https://github.com/red/red/issues/4260

endo64

[20:42](#msg5e45b4a4d4daaa26c19fd06b)Ah missed that one, thanks!

## Friday 14th February, 2020

rebolek

[16:54](#msg5e46d0cc0c50da598c0ec069)I've got a code like `z: #{0010} print [z]`. It's more complicated, so hard to reproduce, but `print` is the problem here. If I run this code with `z` like `#{0010}`, `print` turns it into `#{1000}`.

greggirwin

[18:20](#msg5e46e4e525f1d250fed84c3a)Can you dupe it with `form/mold`, to see if it's `serialize` that's the culprit?

## Saturday 15th February, 2020

meijeru

[19:50](#msg5e484b8fd56ddb68a4a921e3)On W10, it seems to work OK

## Sunday 16th February, 2020

rebolek

[08:10](#msg5e48f90ab401eb68a57e81dc)@greggirwin thanks for tip!

Oldes

[12:27](#msg5e49351d18ac9b0fb5c31a38)@dockimbel should it be possible to have nested tags?

```
>> load {<a<b>}
== <a<b>
>> load {<a<b>>}
== [<a<b> >]
>> append <a> <b>
== <a<b>>
```

endo64

[12:56](#msg5e493c0cc8da1343d45496b6)Same behaviours in R3. But not sure if it is valid in markups.

greggirwin

[17:32](#msg5e497cc60d257250fdee6a5c)There is currently deep core chat about lexical ambiguities related to tags. Red currently allows them in words, but they will likely become strict delimiters.

Will move to red/red for `append` chat.

## Monday 17th February, 2020

hiiamboris

[18:22](#msg5e4ad9e9b401eb68a5828af9)

```
>> view [do [1] backdrop white]
*** Script Error: VID - invalid syntax at: [backdrop white]
*** Where: do
*** Stack: view layout cause-error
```

Any reason this \*should not* work?

rebolek

[19:26](#msg5e4ae8e7ae97f129758198b1)@hiiamboris Some VID keywords must be at start.

greggirwin

[19:32](#msg5e4aea6346e99d431f80c251)It's an interesting question though, where `do` might be doing some setup in this specific case.

toomasv

[19:46](#msg5e4aed78b3023d5025f70934)`do` is "last resort" to put an aftertouch to setup. Window's `title`, `size`, `backdrop` and actors must come first, then everything else.

hiiamboris

[19:49](#msg5e4aee4d0c50da598c17aa55)Why? It's not that `do` hurts readability or affects any `layout` logic. Sure, I can put `do` after `backdrop` (which is what I did), but still don't see a reason for the limitation. In fact, it may be even more readable to have `do` before the layout description, otherwise it sort of splits it in two separate parts

[19:53](#msg5e4aef24b3023d5025f70d06)I guess the real reason is in keeping `layout` relatively simple.

toomasv

[19:55](#msg5e4aef9f48ca2e297458cdfe)It's how code is set up :) I believe, the logic behind it is, that you set things mostly up by styles and facets, `do` is for "any case" not easily provided by "normal" means.

dockimbel

[20:27](#msg5e4af74546e99d431f80e3d3)@hiiamboris VID code starts with \[container settings](https://doc.red-lang.org/en/vid.html#\_code\_structure) section where only a few keywords are allowed. `do` in VID is mostly there for post-processing needs (`view` starts the event loop, so you can't put it after the `view` call). We could extend VID to allow `do` in the container section, though in that case, you could as well have the code before `view` call.

hiiamboris

[20:59](#msg5e4afe99d3507e0fb6113f0b)I'm not pressing for the change, as it's easy for me to work around. Was just wondering ;)  
The use case is when you provide a view-block to a function (that will call `view` following it's own logic) and need to also do some initialization for it to work.

dockimbel

[22:55](#msg5e4b19e046e99d431f8131b2)@hiiamboris Pass two blocks instead of one (so you cleanly separate Red code from VID code), or pass the Red code embedded as first block in the VID code, `do` it, then do a `view next [[] ...VID code...]`. ;-)

## Tuesday 18th February, 2020

loziniak

[10:16](#msg5e4bb975d3507e0fb612c24a)For me it's better for readability. If you had `view [button [print "clicked"] size 10x10]`, you could assume that `size` refers to `button`, not `window`.

## Wednesday 19th February, 2020

hiiamboris

[22:41](#msg5e4db98d3ca8a67fb806a02e)I'm wondering if `do %file.red` supposed to be different from `do/expand load %file.red`?

[22:44](#msg5e4dba4689f30b126519ca99)It seems `do` resets the current directory after do-ing the script

[22:45](#msg5e4dba704609ce3a8812d69c)`1.red`: `Red [] print "loaded" change-dir %/`

```
>> do %1.red  pwd
loaded
%/D/devel/red/red-src/red/
>> do load %1.red  pwd
loaded
%/
```

## Thursday 20th February, 2020

proksi21

[07:11](#msg5e4e312140ac4a7fb9f72ab2)Hey guys, can someone check random/only function?

rebolek

[07:11](#msg5e4e313b8b2d4664ef12c59f) @proksi21 what's wrong with it?

proksi21

[07:13](#msg5e4e31918b2d4664ef12c680)I’ve played with it for a while and noticed some strange behavior. In interpreting mode it works as expected, but after compilation it returns the input string (not one random element)

[07:14](#msg5e4e31ceb662483a875234d5)Let me attach the code to make it clear

rebolek

[07:16](#msg5e4e324d4609ce3a8813c305)That would be great.

proksi21

[07:18](#msg5e4e32af40ac4a7fb9f72fc4)hastebin.com/nezocenaxo.red

[07:19](#msg5e4e3301dafa3029f63fff70)Just try to run it from Red GUI console (works fine), and then compile and run (doesn’t work as expected)

rebolek

[07:21](#msg5e4e3360d97c107ed263c022)I see. The problem there is not `random/` only, but that you have a function in a function. Compiler doesn't like that. Let me find releant issue for details.

proksi21

[07:22](#msg5e4e33d214b4d670a3374c6e)Thanks

rebolek

[07:23](#msg5e4e33eedafa3029f640024e)Here's one, https://github.com/red/red/issues/2485 there are more.

proksi21

[07:35](#msg5e4e36bb3ca8a67fb807a89d)Yes, I moved inner function definition and everything works as expected

[07:35](#msg5e4e36dda0aa6629f5ddaffe)Any solution for this issue? Or maybe any dirty hack :-)

rebolek

[08:09](#msg5e4e3ea0ff00c664eed3edd0)Given your function is already in context, just put inner function to that context. That's what I'm doing :)

proksi21

[08:19](#msg5e4e410eb662483a875257e2)So it’s all about definition of function, right? I can use recursion and other complicated stuff without problems?

rebolek

[08:20](#msg5e4e413d3ca8a67fb807c0b8)Yes, just don't define a function in function, compiler cannot handle it.

[08:23](#msg5e4e41f88b2d4664ef12eb30)@proksi21 in @dockimbel words: "Creating functions in functions is not a good pattern in Redbol. Better use objects to provide a local context."

loziniak

[08:28](#msg5e4e434adafa3029f64027c8)Maybe it's good info to be included in docs.

proksi21

[08:32](#msg5e4e442b89f30b12651adf04)Thanks, now it’s clear.

TheHowdy\_gitlab

[11:05](#msg5e4e68174609ce3a88145804)Can somebody confirm that the following is a bug?

```
>> foreach element #(a: 1) []
*** Script Error: foreach does not allow map! for its 'word argument
*** Where: foreach
*** Stack:
```

The map argument in this example is not 'word', it's 'series'. So the error message is a bug, right?

[11:07](#msg5e4e6857ff00c664eed47399)It should be

```
*** Script Error: foreach does not allow map! for its series argument
*** Where: foreach
*** Stack:
```

right?

toomasv

[11:12](#msg5e4e69b914b4d670a337de53)@TheHowdy\_gitlab  
You are right. Compare:

```
>> foreach el object [a: 1][]
*** Script Error: foreach does not allow object! for its series argument
...
>> foreach el true []
*** Script Error: foreach does not allow logic! for its series argument
...
>> foreach el #(a: 1)[]
*** Script Error: foreach does not allow map! for its 'word argument
```

hiiamboris

[13:19](#msg5e4e877c0c451412667a7da8)https://github.com/red/red/pull/4169

toomasv

[14:03](#msg5e4e91c0d97c107ed264c981)Ah, it's actually #3910  
And it's not wrong "series", although it is not series:

```
>> foreach [a b] #(x: 1 y: 2)[print [a b]]
x 1
y 2
```

greggirwin

[17:51](#msg5e4ec709c2c73b70a449c44a):point\_up: \[Note nested func issue in docs](https://gitter.im/red/bugs?at=5e4e434adafa3029f64027c8) Absolutely, for now in the wiki is fine. It's noted \[here](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#can-i-compile-functions-in-functions).

## Sunday 23th February, 2020

greggirwin

[22:51](#msg5e53020d89f30b1265275dfe)Can someone confirm (and ticket) that bad code in a console prompt kills the REPL?

```
system/console/prompt: does [append now " >> "]
```

Tried a couple other things, and any error seems to cause it. Console engine code just does `do prompt` right now. (`%engine.red@278`)

## Monday 24th February, 2020

ralfwenske

[00:23](#msg5e5317686053e67dc4e04501)@greggirwin on OS:

```
>> system/console/prompt: does [append now " >> "]
== func [][append now " >> "]
*** Script Error: append does not allow date! for its series argument
*** Where: append
*** Stack: ask string? prompt 
macmini:~ ralfwenske$
```

[00:31](#msg5e53194f40ac4a7fb9041baf)ticket #4301

greggirwin

[00:36](#msg5e531a7514b4d670a344076a)Thanks!

## Wednesday 26th February, 2020

Oldes

[10:23](#msg5e5647251c4f1707f8cf68d6)@dockimbel I don't know what is result in the `fast-lexer` branch, but is this really good one?

```
>> load {@a@}
== [@a @]
```

Wouldn't it be better to have an \_invalid email!_ error?

hiiamboris

[10:59](#msg5e564fab8f8af6553a055f5f)

```
>> load {@a@}
*** Syntax Error: (line 1) invalid character at @a@
*** Where: transcode
*** Stack: load
```

on fast-lexer (3 weeks old though)

## Thursday 27th February, 2020

Oldes

[09:07](#msg5e5786b95c32162f5b9f9ac3)What about this one:

```
>> a: 27-Feb-2020/10:04 b: a + 3:2:1
== 27-Feb-2020/13:06:01
>> b - a
== 0
>> a - b
== -1 ;<-------- why?
```

[09:07](#msg5e5786e75c32162f5b9f9d05)`a - b` in Rebol returns also `0` (number of days)

[09:09](#msg5e57876309aede7d924ba421)Also in the past there were requests, if subtraction should not return time as difference does.

```
>> difference a b
== -3:02:01
>> difference b a
== 3:02:01
```

toomasv

[10:00](#msg5e5793355c32162f5ba01a57)@Oldes Isn't it correct, that if you count 13 hours back from 10 then you end up in previous day?

Oldes

[10:23](#msg5e5798aa5c32162f5ba04bff)That makes some sense, so Rebol does not count with time.. still don't know, which result is more useful :-/

toomasv

[10:58](#msg5e57a0e4fcb6354d55ddce4b)If you need to calculate in days only:

```
>> a/date - b/date
== 0
```

Oldes

[11:03](#msg5e57a1e95c32162f5ba0af89)Ok. so Rebol is more limited. Noted. It always surprised me, how many details is solved in Red already.

hiiamboris

[11:08](#msg5e57a32cfcb6354d55dde6b6)&gt; Also in the past there were requests, if subtraction should not return time as difference does.

I'd object to this as it would make the type of return depend on the values of operands (rather than types of operands). Plus if day is different, the time would be lost anyway  
Or if it would always return time, never a date, that still would mean type inconsistency of the expression as the result of `a - b` would be of different type than `a` and `b`

[11:12](#msg5e57a41f5c32162f5ba0c4a5)I'd rather criticize the `difference` here (but since it's not an operator I won't ☻)

[11:25](#msg5e57a7405c32162f5ba0e971)On a second thought, integer result is not very useful or consistent either.

[11:28](#msg5e57a7d75c32162f5ba0f0c8)Why can't we return date+time? Dates in Red have a zero year and negative years.

Oldes

[12:14](#msg5e57b29aaaf81d4d54810806)How practical it would be?

hiiamboris

[15:42](#msg5e57e35618ae2a1ae763426a)Not sure yet ;) I'm more thinking from consistency's side right now, as I'm used to commutativity rules and expect `a - b + a` and `a + a - b` to be equivalent expressions

[15:45](#msg5e57e42daaf81d4d54832e90)With this, `date!` should be convertible to both `time!` (as a span since year 1 day 1 0:0:0) and `integer!` as a number of days within that span.

[15:47](#msg5e57e4a0fcb6354d55e0c984)

```
>> 1/1/0001 - 1
== 31-Dec-0000
```

This is not a Gregorian calendar (should be no year zero, 1AD follows 1BC that is `-0001`)... But it's convenient for computations.

greggirwin

[17:48](#msg5e5800d9fcb6354d55e20be7)&gt; Why can't we return date+time? Dates in Red have a zero year and negative years.

One of the ideas I had while thinking about Ren (the data format) was \*relative* date-time vs \*absolute\*. I don't know how much we can improve the current rules, so changes may just be a lateral move. If we want to return full date-time values for date math, we need to think of them as relative, which complicates things a bit, but could be useful in some cases. I haven't pushed for it in Red, because it still doesn't cover things like `2 weeks`.

dander

[19:59](#msg5e581f98a2ac636ae06566ab)I recently encountered a discussion on the go time format strings where they don't go above hours because things start to get fuzzy about what expectations should be. For example, should 1 week be 24 hours * 7, or do you also need to take into account leap-days or leap-seconds which may or not be present in the range and depend on when you are starting from? Their position was more less 'better to leave it up to the developer to decide what they really mean'

hiiamboris

[20:26](#msg5e5825e6a2ac636ae06577d7)Hmm. I don't think PC time systems ever account for leap seconds. And leap days shouldn't affect the 'week' time, only the number of days in a certain month. Am I wrong?

dander

[20:39](#msg5e58291f42e09c4f3c774f90)Yeah, I think you're right that the leap-day example doesn't apply there. I don't know that I was totally convinced by the argument that it should only support all possible interpretations or none, over only supporting the simple one

greggirwin

[20:50](#msg5e582b7fcb783440fcfd21ed)It's another case where something may be better than nothing. That is, if we can devise a system that works as people expect 95% of the time, and they can get around it the other 5%, that's a win. Most importantly, the behavior needs to be clear, so they know \*when* to work around it. e.g., what does 1 day/week/month/quarter/year from X mean?

There are aspects here. We can offer refinements in behavior, which leads to an entire calendaring library/dialect, but we don't need all that day one. Respond to needs, but plan for those variations. Another aspect is scale. If you say "next quarter" or "in 2 weeks", different rules and precision apply.

## Monday 2nd March, 2020

Oldes

[10:04](#msg5e5cda3e53fa513e2864183e)@dockimbel is it by design, that chars are always case-sensitive in map?

```
>> m: #("a" 1 "A" 2 #"a" 3 #"A" 4)
== #(
    "a" 1
    "A" 2
    #"a" 3
    #"A" 4
)
>> select m #"A"
== 4
>> select m "A"
== 1
```

dockimbel

[10:08](#msg5e5cdb26ca2f5a558d5e703f)@Oldes Looks like a bug. @qtxie can confirm.

qtxie

[12:18](#msg5e5cf99e4eefc06dcf2cea38)Should we make it case-insensitive? It's case-sensitive in other cases.

```
>> x: [#"a" #"b" #"A" #"c"]
== [#"a" #"b" #"A" #"c"]
>> find x #"A"
== [#"A" #"c"]
```

hiiamboris

[12:34](#msg5e5cfd503ca0375cb396959a)It's the annoying property of char type:

```
>> #"A" = #"a"
== false
```

rebolek

[12:54](#msg5e5d0203a157485cb46b528b)If it's always case-sensitive, what's the point of `select/case` ?

henrikmk

[12:59](#msg5e5d0328ca2f5a558d5ed528)Please have all functions be the same case behavior by default. Don't mix default case handling.

qtxie

[13:12](#msg5e5d0624376d882250c7a47c)OK. Then we're missing code in the runtime to handle it.

hiiamboris

[13:17](#msg5e5d07727fef7f2e89973a84)R3 has case-insensitive char comparison btw:

```
>> #"A" = #"a"
== true
>> #"A" = to integer! #"A"
== false
```

rebolek

[13:23](#msg5e5d08cfec7f8746aaaa4f28)As usual, I prefer R3 behavior.

hiiamboris

[13:24](#msg5e5d0921ca2f5a558d5ee6bb)Yes. I think it's more consistent than R2 behavior, as it satisfies an equation `S1 = S1` if `S1/:i = S2/:i` for all `i`

proksi21

[13:29](#msg5e5d0a3fb873303e2774f2e4)Wow, if R3 has case-insensitive char comparison, how to implement “to-uppercase” and “to-lowercase” functions?

rebolek

[13:30](#msg5e5d0a6e4eefc06dcf2d172f)@proksi21 there's `equal?` and then there's `strict-equal?`.

hiiamboris

[13:30](#msg5e5d0a72ec379e558e9e6371)@proksi21 in Redbol langs there are 3 types of comparison: `equal?`, `strict-equal?` and `same?`. We're talking about first here

rebolek

[13:30](#msg5e5d0a8d8e04426dd019c9f6)Ha, :mouse: strikes back!

hiiamboris

[13:31](#msg5e5d0a943ca0375cb396b480):D

proksi21

[13:31](#msg5e5d0a9853fa513e28649461)Oh, that’s nice, thank you guys!

qtxie

[13:38](#msg5e5d0c6bec379e558e9e688b)&gt; It's the annoying property of char type:  
&gt;

```
> >> #"A" = #"a"
> == false
>
```

I'm so surprised it has been like that since 2012!

dockimbel

[13:49](#msg5e5d0edbec379e558e9e6e23)R3:

```
>> #"A" = #"a"
== true
>> (to-integer #"a") = to-integer #"A"
== false
```

Red &amp; R2:

```
>> #"A" = #"a"
== false
>> (to-integer #"a") = to-integer #"A"
== false
```

rebolek

[13:52](#msg5e5d0f9fff6f6d2e887dfd3d)That's understandable and I'm fine with what R3 does.

meijeru

[13:53](#msg5e5d0ff17fef7f2e89975011)This is anyhow not the whole story

```
>> "A" = "a"
== true
>> (to-binary "A") = to-binary "a"
== false
```

rebolek

[13:54](#msg5e5d1014ec379e558e9e7249)

```
>> "abc" = "ABC"
== true
>> (checksum "abc" 'sha256) = checksum "ABC" 'sha256
== false
```

meijeru

[13:57](#msg5e5d10de8e04426dd019dbdc)What is against making all character and string equality comparisons case-sensitive??

[14:02](#msg5e5d1204a157485cb46b7b91)This still leaves word! and float! comparisons different for equal? and strict-equal? Also, equal? allows type differences between the two arguments. Thus it is not at all made superfluous.

hiiamboris

[14:04](#msg5e5d1256376d882250c7c299)Everyone will reinvent case insensitive comparison and parse then

[14:06](#msg5e5d12f64eefc06dcf2d2fbe)This must also be a bug:

```
>> select [1.0 2] 1
== none
```

[14:07](#msg5e5d13288e04426dd019e5fa)Same in R2.  
R3:

```
>> select [1.0 2] 1
== 2
```

rebolek

[14:09](#msg5e5d1387cb91b5224f06d650)If this should work then `/case` refinement should be changed to `/strict` to allow `3 = select/strict [1.0 2 1 3] 1`

hiiamboris

[14:13](#msg5e5d14927fef7f2e89975e6c)I am for more meaningful naming of refinements too. But it's not backward compatible..

rebolek

[14:15](#msg5e5d15078e04426dd019ecaa)It's not but Red is still alpha so ¯\\\\\\\_(ツ)\\\_/¯

Oldes

[17:27](#msg5e5d42098e04426dd01a5f83)Another one... `mold/part` on `date` is working strangely:

```
>> mold/part 12345678 3
== "123"
>> mold/part 12345678 4
== "1234"
>> mold/part now 3
== "2-Mar-2020/1"
>> mold/part now 4
== "2-Mar-2020/18"
```

hiiamboris

[17:31](#msg5e5d42deec379e558e9efc59)`form` too

[17:31](#msg5e5d42f6b873303e27758de4)add it here https://github.com/red/red/issues/4299, would you?

Oldes

[17:39](#msg5e5d44ccd045e258250cbfab)added.

hiiamboris

[17:52](#msg5e5d47d9a157485cb46c0af1)Thanks

greggirwin

[19:29](#msg5e5d5eac3ca0375cb397a0ed)I vote for case insensitive char comparison, by default. It's easy to be strict when you need to.

It probably hasn't come up because comparing them isn't common in Red, IME.

The docs say this:

&gt; Char! values represent a Unicode code point. They are integer numbers in the range...

This makes them a bit ambiguous. Technically, they \*are* integers, so comparisons should be sensitive to that. But those integers live in the realm of `text` (which I still like as an alias for `string!`, but that may never be possible in the core), which goes the other way.

&gt; What is against making all character and string equality comparisons case-sensitive??

@meijeru, it's a choice like everything else. On the human side, though I don't have studies to hand to back me up, it's more common \*not* to care about case. On the programmer side, due to how many languages work, it's the reverse. It does mean that Red is doing more work by default, but simply using `==` provides an easy option, and works to say `==` is "more equal" than `=`.

hiiamboris

[19:38](#msg5e5d60a54eefc06dcf2e1330)It has come up in fact (at least once by me and I remember by someone else). But was nobly defended by @9214 ;)

greggirwin

[19:50](#msg5e5d6386ec7f8746aaab50f0)You are uncommon. :^)

meijeru

[21:27](#msg5e5d7a59ec7f8746aaab947b)@Gregg Will you put in a REP for changing char comparison?

greggirwin

[21:36](#msg5e5d7c60b873303e27763633)Sure.

meijeru

[21:54](#msg5e5d807e2e398f46abd71c39)Thanks, saw REP #67 and added a reference in the spec document just now.

## Tuesday 3th March, 2020

hiiamboris

[15:44](#msg5e5e7b6db873303e27789f48)There's some inconsistency with tags loading I think:

```
>> as tag! { "}
== < ">
>> [<tag flag=">]
== [<tag flag=">]
>> {tag flag=""}
== {tag flag=""}
```

However both last 2 values inside a file:

```
Red []
[<tag flag=">]
{tag flag=""}
```

```
*** Syntax Error: invalid tag! at {<tag flag=">]{tag flag=""}}
*** Where: do                                                       
*** Stack: load
```

[15:46](#msg5e5e7bc13ca0375cb39a598d)Is there any escape mechanism for tags at all?

GiuseppeChillemi

[15:59](#msg5e5e7ef64eefc06dcf30da05)About the upper number of words limit. Does words in never evaluated blocks count for the limit?

hiiamboris

[16:04](#msg5e5e8026cb91b5224f0a6908)Indeed.

Oldes

[21:52](#msg5e5ed1a8b873303e277987ee)@hiiamboris I still think, that in cases like: `mold as tag! { "}` where result has backward unloadable syntax, the `mold` should use \_construction syntax\_, and so the result should be: `#[tag! { "}]`

[21:54](#msg5e5ed20eb873303e277988bf)And it is not only problem with tags :-/ Just cannot imagine, how much code would be needed to do all the tests.

[22:47](#msg5e5ede962e398f46abda87df)Checking some R3 bugs, I noticed this one:

```
>> img: make image! [1x1 1.2.3]
== make image! [1x1 #{010203}]
>> img/1
== 1.2.3.0
>> img/1/2
== 2
>> img/1/2: 42 ;<------------ should this be allowed?
== 42
>> img/1
== 1.2.3.0     ;<------------ it does not work anyway!
```

hiiamboris

[23:04](#msg5e5ee28ad045e2582510db2b)Yeah I recall it was reported... sec

[23:05](#msg5e5ee29d90a829582402644f)https://github.com/red/red/issues/3729

## Wednesday 4th March, 2020

Oldes

[12:22](#msg5e5f9d9e90a8295824044243)Ok than... anyway.. is there any good usage example for it? At least it is not buggy as R3-alpha, where it always modifies alpha.

## Friday 6th March, 2020

Oldes

[13:33](#msg5e62514517e80330db5010be)

```
>> 1.1.1 * 214748
== 255.255.255
>> 1.1.1 * 2147483648.0
== 0.0.0
```

Shouldn't it be both `255.255.255`?

hiiamboris

[13:35](#msg5e6251a85614985c976693ce)Looks like a bug

## Saturday 7th March, 2020

hiiamboris

[16:15](#msg5e63c89e8e42396957734a41)@dockimbel we seem to have arrived to quite esoteric bugfixes: https://github.com/red/red/commit/87d8f523b212cb059114c12d8ab9a49884a671a0 Although after @qtxie's fix the problem disappears, I think it's only hiding the root issue deeper.

How could last argument to an R/S function call affect the pointers in the data scanned by the GC? Why would this issue disappear when we override not a byte but a whole 32-bit word?

I don't think R/S stack is accessible to GC. And if it was, another pointer would only prevent memory from being freed. I can't at a glance make heads or tails from all the offset magick involved in the emitter, but if I understand it all correctly, during an R/S function call it pushes first the arguments, then moves the stack pointer up more to fit all the locals. So either R/S stack grows so big that it starts to override GC-scanned regions, or some misalignment between R/S calls occurs such that a call partly overrides stack contents of the parent function's stack. Can you have a deeper look at the problem?

9214

[17:17](#msg5e63d71c8e423969577373b2)@hiiamboris what makes you think it affects the GC pointers or has something to do with the stack growth? `append-char` expected an `integer!` codepoint as its last argument, not a `byte!`. So the questions are much more prosaic — why type checker let it slide, how this byte got promoted to an integer, and what happens when you allocate a string unit at buffer's tail and fill it with a mishmash of a passed byte and whatever was on the native stack at the moment.

Protip: the last question is rhetorical; likely it just trashes the encoding and throws a mojibake party in string's buffer.

hiiamboris

[18:18](#msg5e63e58dff8bf14a5440416f)&gt; what makes you think it affects the GC pointers or has something to do with the stack growth

@9214 I think that because there was an explicit `as-integer` before the patch, and I couldn't trick it into eating the garbage around my byte (I tried). Not saying that it's impossible though, esp. when used alongside macros. But then if it's an `as-integer` bug, we should expect remaining `as-integer #"'"` to also turn the back on us at times. In any case, this issue calls for an investigation.

9214

[18:23](#msg5e63e686ff8bf14a54404314)&gt; there was an explicit as-integer before the patch

Was it? I see only one in the alternate `either flat?` branch, and since you used `/flat` refinements it was never taken.

hiiamboris

[18:24](#msg5e63e6e08011bb652afbdb9d)Indeed.  
!\[](https://i.gyazo.com/6ba3d589f6dd8e824d800acfe62d934a.png)

[18:25](#msg5e63e70a5348b33231abe584)Another reason for my line of thought is that with `recycle/off` the problem goes away, although it's fair to expect trash in the stack regardless of GC state.

## Sunday 8th March, 2020

ldci

[18:23](#msg5e65383fff8bf14a54430ee7)A regression under macOS: area face can't be edited. Any idea?

hiiamboris

[18:48](#msg5e653e14a2897318a99696cb)Darwin version says only `Segmentation fault: 11` for me on a VM. But MacOS version does not respond to keypresses, although I can paste something there with mouse. Second attempt at `view [area]` outputs a lot of errors:

```
2020-03-08 21:44:07.832 console-view[1651:507] _createMenuRef called with existing principal MenuRef already associated with menu
2020-03-08 21:44:07.833 console-view[1651:507] (
	0   CoreFoundation                      0x905d2471 __raiseError + 193
	1   libobjc.A.dylib                     0x919f0091 objc_exception_throw + 162
	2   CoreFoundation                      0x905d238b +[NSException raise:format:] + 139
	3   AppKit                              0x957f2c9c -[NSCarbonMenuImpl _createMenuRef] + 69
	4   AppKit                              0x957f249d -[NSCarbonMenuImpl _instantiateCarbonMenu] + 161
	5   AppKit                              0x957f23e8 -[NSCarbonMenuImpl setupCarbonMenuBar] + 40
	6   AppKit                              0x957f08af -[NSApplication finishLaunching] + 1357
	7   console-view                        0x000d52a9 console-view + 869033
```

[18:49](#msg5e653e5785f81e18a8f2b162)I'm afraid only @qtxie can tell what happened ;)

qtxie

[23:28](#msg5e657f80cc10be22a073c096)I'll have a look at it. The macOS backend haven't been updated since a long time. So probably some changes in Red runtime or R/S causes the issue.

[23:52](#msg5e65854ca2897318a9972ebc)@hiiamboris  
&gt; we seem to have arrived to quite esoteric bugfixes: https://github.com/red/red/commit/87d8f523b212cb059114c12d8ab9a49884a671a0 Although after @qtxie's fix the problem disappears, I think it's only hiding the root issue deeper.

It's a known issue. And yes, it's only fixed this case, we'll need some deep changes in the GC to fix the root issue.

The GC will scan the R/S stack to check every 32-bit word, in order to find direct pointers point to Red series-buffer. If the memory was moved by the GC, the pointer's value will be changed accordingly. e.g. Direct pointers \[p1 and p2](https://github.com/red/red/blob/master/runtime/datatypes/binary.reds#L1357) here, the line `node: alloc-bytes len` a few lines after them may trigger the GC. The memory `p1` and `p2` points to may be moved.

[23:58](#msg5e65869a145f4d69562b86d6)In that bugfixes, `blank` was declared as a byte!, but it's stored as a 32-bit word on the stack. So there are 3 bytes garbage on the stack. Those garbage may make this 32-bit word looks like a pointer and changed by the GC. If we use `integer!`, we can ensure the 32-bit word won't be recognized as a pointer.

## Monday 9th March, 2020

hiiamboris

[10:45](#msg5e661e4780cc7b7924b1d16d)Wow that's dangerous.. so that means every `byte!` on the stack, and every `byte!` inside `struct! [] value` on the stack can be distorted by the GC, right?

[10:46](#msg5e661e7485f81e18a8f496ed)@qtxie ☻ thanks for the explanation.. makes sense now

[13:23](#msg5e66435ba2897318a99904f2)Also, I don't see any code in GC that would scan the data segment. That means if I store a pointer in a `declare`d struct, this pointer won't be updated, but if I store it in a stack struct (as `value`), then it will be. Can you confirm this discrepancy exists?

And wouldn't it be better not to update stack pointers at all? In all the series code I've had an opportunity to look through, GET\_BUFFER is always used after an operation that may cause a reallocation (and GC is only triggered by allocations or a manual call to do-mark-sweep).

ldci

[13:43](#msg5e6647efcc10be22a075a654)@qtxie Bug report

```
*** Runtime Error 98: assertion failed
*** in file: /Users/francoisjouen/Programmation/Red/OsteoFaces2/datatypes/common.reds
*** at line: 47
***
***   stack: red/alloc-at-tail 00000062h
***   stack: red/alloc-at-tail 0015E84Ch
***   stack: red/word/load 001674B8h
```

## Tuesday 10th March, 2020

qtxie

[00:25](#msg5e66de5fe203784a559987df)@ldci Thanks. I saw this error in another program. It's a recent change causes the problem.

[00:31](#msg5e66dfcc95b8ff0bbfa624c4)&gt; That means if I store a pointer in a declared struct, this pointer won't be updated

No, it won't.

toomasv

[09:58](#msg5e6764bf145f4d6956308245)Bug or normal?

```
>> to integer! c: #{00000080}
== 128
>> to integer! #{80}
== 128
>> while [c/1 = 0][c: next c]
>> c
== #{80}
>> to integer! c
== -2147483648
```

rebolek

[09:59](#msg5e67651f02dbe022a17a26d4)interesting

hiiamboris

[10:02](#msg5e6765b8cc10be22a078c0c9)Yeah that's fun

```
>> to integer! next #{0080}
== 8445114
>> to integer! next #{000080}
== 8436448
>> to integer! next next #{000080}
== -2135236433
```

pierrechtux

[10:04](#msg5e6766228e423969577c3644)@toomasv On Rebol 2, it is coherent:

```
>> about 
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> to integer! c: #{00000080}
== 128
>> to integer! #{80}
== 128
>> while [c/1 = 0][c: next c]
== #{80}
>> to integer! c
== 128
```

Yes, I know we're talking about Red here; I was just trying on both systems.

```
>> about
Red 0.6.4 for Linux built 10-May-2019/16:44:54+01:00

>> to integer! c: #{00000080}
== 128
>> to integer! #{80}
== 128
>> while [c/1 = 0][c: next c]
>> c
== #{80}
>> to integer! c
== -2147483648
```

[10:04](#msg5e67663985f81e18a8f8474d)@hiiamboris Quite funny, yes!

hiiamboris

[10:04](#msg5e6766458011bb652a0441be)https://github.com/red/red/blob/master/runtime/datatypes/integer.reds#L87  
It should be `- bin/head` IMO

TheHowdy\_gitlab

[13:27](#msg5e6795b747b42479253a7bca)Found some strange behaiviour:

```
replace/deep [A] quote A: 1
== [1 A]
```

Why does it get appended, but only when using `/deep`?

Also, can somebody confirm that

```
replace/all/deep [A] quote A: 1
```

doesn't return and than throws an out-of-memory error?

hiiamboris

[13:29](#msg5e67964e8e423969577ce1c2)https://github.com/red/red/issues/4174

[13:30](#msg5e67968ad17593652b7524c1)&gt; Why does it get appended

Because `/deep` implies `parse` currently, it's a known issue.

loziniak

[16:51](#msg5e67c594cc10be22a07a0545)Hi! I could spend some time on this one: #4190 . Does someone have a clue where to start? I think I'd need some guidance.

hiiamboris

[17:03](#msg5e67c85e47b42479253b2bd5)Start with the assertion obviously. Check the type. Find out why the type is wrong. Maybe stack magick fizzles somewhere.

[17:04](#msg5e67c8a3d17593652b75d943)https://gitlab.com/hiiamboris/red-codex is your friend too, although GTK may not be enough to run it yet.

## Wednesday 11st March, 2020

proksi21

[09:17](#msg5e68acc402dbe022a17d6617)Hey guys, can someone confirm that please

```
>> math [1 + 1 ** 2]
== 4
```

loziniak

[09:28](#msg5e68af5b47b42479253d6e4f)Confirmed (Linux/GTK)

proksi21

[09:29](#msg5e68af89d17593652b7811a5)Thanks, I'll create an issue

Oldes

[09:32](#msg5e68b019f046a30bbe58339b)wasn't `math` just a prove of concept experiment? If you do `source math`, you can see it deals only with multiply and divide.

hiiamboris

[09:33](#msg5e68b082e203784a559e4916)well, if it has no value other than proving a concept, why is it a part of runtime? ;)

rebolek

[09:35](#msg5e68b0e1145f4d69563438f5)Current implementation is just PoC, but `math` has its place in Red.If someone wants to get better at `parse`, any improvements are welcome :)

loziniak

[09:36](#msg5e68b117d17593652b7814bb)It's a pity that Android impl. is not treated that way.

[09:36](#msg5e68b12d5348b33231b7f363)Or GTK.

rebolek

[09:37](#msg5e68b152145f4d69563439b3)what way?

proksi21

[09:37](#msg5e68b169e203784a559e4b3e)Well, if Red is going to become production ready one day, math should be implemented correctly

loziniak

[09:38](#msg5e68b19547b42479253d728c)A "Let's put some immature code in official repo for others to try, explore, use and possibly improve" way.

[09:42](#msg5e68b27d8e423969577fcc0e)Anyway, I think the topic is ready for a chit-chat :-)

9214

[09:52](#msg5e68b4e9a2ccef3232e74650)@proksi21 no need for more tickets https://github.com/red/red/issues/2532. I'll push a new version in an hour or two (initially planned to do so with a writeup on its design, but it has stalled for a while). In the meantime, you can play with it on your own:

```
math: function [
	"Evaluates an expression using math precedence rules"
	body [block! paren!] "Expression to evaluate"
	/local match
][
	order: ['** * / % // + -]
	infix: [skip operator [enter | skip]]
	
	tally: [any [enter [fail] | recur [fail] | count [fail] | skip]]
	enter: [ahead paren! into tally]
	recur: [if (right?) skip operator tally] 
	count: [while ahead change only copy match infix (do match)]
	
	do also body: copy/deep body foreach operator order [
		right?:      lit-word? operator
		operator: to lit-word! operator
		
		parse body tally
	]
]
```

Like @rebolek said, initially it was intended as a minimal example of dialect creation/usage, aimed at the outsiders who for various reasons protest against Red evaluation rules ("your language cannot do math, you are Bad and you should feel Bad!"); it does not have any ambitions beyond covering PEMDAS rules and nor should it be used in production.

proksi21

[09:55](#msg5e68b5748011bb652a07e9ef)@9214 thanks!

hiiamboris

[09:58](#msg5e68b639cc10be22a07c2290)@9214 Usually (in all languages with operator precedence I've seen), `*`, `/`, `%` and `//` have equal priority, just as `+` and `-`.

proksi21

[10:00](#msg5e68b6baff8bf14a544c6000)Agree, `**` has the highest priority, then `* / % //` and then `+ -`

9214

[10:00](#msg5e68b6bcff8bf14a544c6003)@loziniak Android support is a major milestone and a potential killer feature (unlike `math`) so control over its release announcement, code quality and signal/noise ratio from contributors are expected; development branches are exactly for that — for development. So please refrain from such exaggerated statements in any chat room.

rebolek

[10:00](#msg5e68b6caf046a30bbe58480c)Guys, please move to chit-chat.

hiiamboris

[10:02](#msg5e68b72280cc7b7924b932ec)@9214 like here: https://dlang.org/spec/grammar.html#EqualExpression  
And we may consider `>>` and `<<` as well as all comparisons here.

9214

[10:06](#msg5e68b816e203784a559e5d61)@hiiamboris @proksi21 let's move to \[`chit-chat`](https://gitter.im/red/chit-chat).

rebolek

[10:50](#msg5e68c2778011bb652a081054)What is this?

```
>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
== {<!DOCTYPE html>^/<html class="client-nojs" lang="en" dir="ltr">^/<head>^/<meta charset="UTF-8"/>^/<title>List of United States counties and county equivalents - Wikipedia</title>^/<script>document.documentElement.classNam...
>> skip page 519200
== {ge-Newton,_MA-NH_Metropolitan_Statistical_Area" class="mw-redirect" title="Boston^@m^@e^@t^@r^@o^@p^@o^@l^@i^@t^@a^@n^@_^@a^@r^@e^@a^@"^@ ^@t^@i^@t^@l^@e^@=^@"^@C^@i^@n^@c^@i^@n^@n^@a^@t^@i^@ ^@m^@e^@t^@r^@o^@p^@o^@l^@i^@t^@a^@n^@ ^@a^@r^@e^@a^@"^@>^@C^@i^@n^@c^@i^@n^@n^@a^@t^@i^@,^@ ...
```

[11:13](#msg5e68c7d6a2897318a9a02a1a)`to string! read/binary` seems to be fine

hiiamboris

[11:17](#msg5e68c8b18e42396957800f53)can't reproduce

[11:17](#msg5e68c8b7cc10be22a07c52e4)tried with the latest build?

rebolek

[11:17](#msg5e68c8d6cc10be22a07c5328)on what OS?

hiiamboris

[11:17](#msg5e68c8db85f81e18a8fc3b28)W7

rebolek

[11:18](#msg5e68c8f980cc7b7924b968ce)I'm on macOS, I suspect this will be macOS/Linux only problem

[11:18](#msg5e68c90fff8bf14a544c9a3a)I have build from 10. 2., I'll try making new one and will see.

[11:22](#msg5e68ca0595b8ff0bbfab46ff)It's present in the latest build.

9214

[11:23](#msg5e68ca18a2897318a9a02f38)No null bytes on W10 either. @rebolek can you try with `write/info`or your `http-tools`?

rebolek

[11:24](#msg5e68ca5102dbe022a17daa39)@9214 It's the same with `write/info`

[11:25](#msg5e68caa88011bb652a082c80)As `send-request` uses `write/info/binary`, it's fine there.

9214

[11:26](#msg5e68caed47b42479253dbe7f)Even if you specify `UTF-8` as preferred encoding?

[11:28](#msg5e68cb51e203784a559e9b2c)I vaguely recall someone confirming that it also has to do with what you pass in `User-Agent`.

[11:29](#msg5e68cb86f046a30bbe5884b2)\[Here](https://gitter.im/red/red?at=5aa136d5c3c5f8b90d4a57b0) it is.

rebolek

[11:29](#msg5e68cbada2ccef3232e78c83)`User-Agent` would affect whole file, not just past ~520000 bytes

hiiamboris

[11:30](#msg5e68cbcc145f4d6956348fcb)@rebolek tried turning GC off?

9214

[11:30](#msg5e68cbe3a2897318a9a03307)Ah, then it indeed smells fishy.

rebolek

[11:31](#msg5e68cc07cc10be22a07c5b59)@hiiamboris good point! It's gone with `recycle/off`

[11:31](#msg5e68cc22ff8bf14a544ca316)I try it again in fresh console to be sure

[11:32](#msg5e68cc46145f4d695634913e)Yep, turning GC off fixed it.

[11:33](#msg5e68cc778011bb652a083233)I need to leave now, I add an issue once I'm back.

endo64

[11:46](#msg5e68cf7ba2897318a9a03e9a)Should there be `head` really? We would loose move in a binary series in that case (or have to use `copy/part`)

```
>> to integer! next #{FF   00 00 80 01   FF}
== 32769
```

But of course this should be fixed:

```
>> to integer! copy next #{0001}
== 1
>> to integer! next #{0001}
== 65536
```

9214

[11:53](#msg5e68d155a2897318a9a0432c)Tried on Linux box:

```
>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
*** Access Error: invalid UTF-8 encoding: #{A0208CF0}
*** Where: read
*** Stack:  

>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
== {<!DOCTYPE html>^/<html class="client-nojs" lang="en" dir="ltr">^/<head>^/<meta charset="UTF-8"/>^/<title...
>> skip page 519200
== {ge-Newton,_MA-NH_Metropolitan_Statistical_Area" class="mw-redirect" title="Boston-Cambridge-Newton, ...
...
>> page: read https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents
== {<!DOCTYPE html>^/<html class="client-nojs" lang="en" dir="ltr">^/<head>^/<meta charset="UTF-8"/>^/<title>List of United States counties and county equivalents -...
>> skip page 519200
== {^@^@/^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@w^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@i^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@k^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@i^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@/^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@D^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@o^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@t^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@h^@^@^@^@^@^@^@^@^@^@...
```

Relevant definition is \[here](https://github.com/red/red/blob/master/runtime/simple-io.reds#L1808).

hiiamboris

[11:54](#msg5e68d160cc10be22a07c670b)@endo64 `bin/head` in R/S equals `-1 + index? bin` in Red

endo64

[11:59](#msg5e68d29180cc7b7924b9868c)I see. Issue reported already or commented in a related ticket?

hiiamboris

[11:59](#msg5e68d29ca2ccef3232e7a220)Yes. https://github.com/red/red/issues/4325

[12:01](#msg5e68d32095b8ff0bbfab5dbc)@9214 Since we have a trigger happy GC modifying every integer that resembles a pointer, and are dealing with a long string here, I'm surprised we can't reproduce this bug on Windows ;)  
Every value bigger than 65535 is a possible target

9214

[12:06](#msg5e68d43ba2ccef3232e7a691)@hiiamboris `request-http` comes in two versions: for Win and for \*nix. Maybe you can spot the culprit by comparing the differences between them.

hiiamboris

[12:34](#msg5e68dab9a2ccef3232e7bc37)@9214 I would blame `load-utf8-buffer` and every call it does. `request-http` looks incidental to me (it's just a stroke of luck in this case). Your last result looks like it expanded a four-byte-encoded buffer into another 4-byte buffer, treating the source as single-byte. And then did it again, resulting in 15-byte padding of every character. Can't tell exactly what led to that though.

9214

[12:44](#msg5e68dd188011bb652a0862a8)There are plans to extend current garbage collecting method with ideas from Boehm GC, that would give more accurate heuristics for pointer detection.

hiiamboris

[13:09](#msg5e68e31b8e423969578061f8)@9214 I skimmed around, and I think that GC's safety comes from the fact that it only frees objects. It does not compact the memory after that so it doesn't have to actually modify any pointers. So what advantage does it have over our naive GC? I think it's not the detection heuristics that we should change first, or lookup speed, but first and foremost design memory management in such a way that relocations are not required, or are totally transparent to the code (i.e. pointers should not change).  
The OS solves that by virtualizing each program's address space. Not sure if Red can do that on it's own.

rebolek

[13:10](#msg5e68e33395b8ff0bbfab9680)I'm back, so I'm going to add the issue. Feel free to add any comments you find useful.

[13:47](#msg5e68ec0ee203784a559ef70b)https://github.com/red/red/issues/4329

## Thursday 12nd March, 2020

qtxie

[03:34](#msg5e69adb9145f4d695636e5e0)&gt; I would blame `load-utf8-buffer` and every call it does. `request-http` looks incidental to me (it's just a stroke of luck in this case). Your last result looks like it expanded a four-byte-encoded buffer into another 4-byte buffer, treating the source as single-byte. And then did it again, resulting in 15-byte padding of every character. Can't tell exactly what led to that though.

If it's `load-utf8-buffer`'s problem, why `to string! read/binary` works fine?

[05:56](#msg5e69cf2a8011bb652a0ad8d8)@rebolek I pushed a fix.

rebolek

[06:24](#msg5e69d585a2ccef3232ea49f3)@qtxie great, thanks!

hiiamboris

[10:36](#msg5e6a10c085f81e18a8ff87e6)@qtxie :+1: But if it was solely the missed index problem, how come the first 500k did align? ;)

qtxie

[11:30](#msg5e6a1d3f47b4247925413054)@hiiamboris Not the index problem. I added it just for safety. It's `bin/header: TYPE_UNSET` makes `bin` recycled by the GC.

[11:31](#msg5e6a1da18011bb652a0ba928)But I haven't test it. The Wikipedia is blocked here. :sweat\_smile:

hiiamboris

[11:46](#msg5e6a210385f81e18a8ffc840)Haha. I feel for you guys ;)

pekr

[11:48](#msg5e6a217ff046a30bbe5bfe01)I thought you are guys back in Europe?

hiiamboris

[11:51](#msg5e6a222402dbe022a180bb82)`bin/header: TYPE_UNSET` I've seen this pattern in a lot of places. Shouldn't we fix them all then?

qtxie

[11:52](#msg5e6a2287d17593652b7be9e4)&gt; `bin/header: TYPE_UNSET` I've seen this pattern in a lot of places. Shouldn't we fix them all then?

Nope. In many places we should set it to TYPE\_UNSET.

hiiamboris

[11:58](#msg5e6a23ff80cc7b7924bd086b)Won't those series also be collected?

[12:17](#msg5e6a2846d17593652b7bfaf0)@qtxie by the way in your fix `bin/node` is not set during GC run, as `load-utf8` did not return yet, so what could it possible deallocate?

dockimbel

[13:53](#msg5e6a3ecde203784a55a28fad)@qtxie  
&gt; @hiiamboris Not the index problem. I added it just for safety. It's `bin/header: TYPE_UNSET` makes `bin` recycled by the GC.

You mean "not recycled"?

qtxie

[14:07](#msg5e6a422a02dbe022a1812053)@hiiamboris @dockimbel The `bin` is the binary data read from the url.

dockimbel

[15:15](#msg5e6a5202a2ccef3232ebd63d)@qtxie Got it. I thought you were talking about the `TYPE_UNSET` we put to prevent the GC from prematurily collect some series under construction.

hiiamboris

[19:54](#msg5e6a938ed243a0017407a20c)`view [field field font-size 30 field font-size 30 "x"]`  
!\[](https://i.gyazo.com/d266e1c2ce8c0b67b6a3249ecc08a024.png)

[19:55](#msg5e6a9398a3c55848baeefdb8)Shouldn't the 2nd field be also big?

pekr

[20:23](#msg5e6a9a5be2d72155095f9daa)If you'll specify some text for it, it will :-)

hiiamboris

[20:27](#msg5e6a9b2a11971c214eaa7d5c)What if I want user to type the text? ;)

endo64

[20:46](#msg5e6a9fb842450048bb41d8d0)I think should. Otherwise we have to do some like `view [field font-size 30 "x" with [clear text]]` each time.

[20:47](#msg5e6a9ff62d3ff924fee46f2f)Or better `view [field font-size 30 "x" with [data: none]]`

hiiamboris

[21:09](#msg5e6aa4fe2d3ff924fee47d0f)I'll make an issue

greggirwin

[21:13](#msg5e6aa5dcf424b66a24468208)I think so.

hiiamboris

[21:19](#msg5e6aa777d243a0017407d9c7)https://github.com/red/red/issues/4333 https://github.com/red/red/issues/4334

## Saturday 14th March, 2020

hiiamboris

[19:20](#msg5e6d2e951f0d285eb27c05f3)A few more observations about the bug with GUI console instability:  
\- when I open a few more consoles and then close them, it highly raises the chances of the first console to crash  
\- I think it does not actually 'crashes', as quits - and does so after I input a command, press enter, and it displays the output (I can sometimes see it before it quits)  
\- when it quits, it also somehow kills the child processes started with `call` (whole process tree in fact - child processes of child processes too) (normal `quit` does not do that)

## Sunday 15th March, 2020

pepdiz

[18:07](#msg5e6e6ed169387244e393b311)hello

[18:07](#msg5e6e6ef2d86c595eb10517ba)I have a red view little programs using a main window (view) and some popups

[18:08](#msg5e6e6f0b391cb312fade8125)I test it in console and everything runs ok without an error

[18:08](#msg5e6e6f3a69387244e393b457)but after compiling it breaks out and closes suddenly when trying to open a popup

[18:09](#msg5e6e6f48d86c595eb105192e)when compiling to target MSDOS I got the error

[18:09](#msg5e6e6f568f26850487fb3d82)\*\** Runtime Error : access violation  
\*\** at: h

[18:10](#msg5e6e6f7d11a4ee04bbe201ba)any clue to help my debugging?

[18:11](#msg5e6e6fb469387244e393b4fb)program source is spspr.red in https://github.com/pepdiz/retro-tools/tree/master/tools/src

[18:12](#msg5e6e6ff2de52695245d6893a)red version is 0.6.3

9214

[18:16](#msg5e6e70f169387244e393b89e)@pepdiz you can start by updating to the latest build, and, if the crash is still present, by compiling with `-d` flag and observing the stack trace.

[18:17](#msg5e6e7149f55af7524415db6e)&gt; red version is 0.6.3

That pretty much sums it up, you are using build that is almost 3 years old at this point.

```
>> now/date - 18-Jul-2017 / 365.0
== 2.66027397260274
```

\[Here](https://static.red-lang.org/dl/auto/win/red-latest.exe) is nightly build for Windows.

pepdiz

[18:31](#msg5e6e7498391cb312fade8be4)ok thanks, will try

[18:33](#msg5e6e74e069387244e393c0d7)anyway I've got 064 and it doesn't crash but gets another error, this time :

[18:33](#msg5e6e74e19442097b254ae0b0)Script Error: tail? does not allow integer! for its series argument

[18:33](#msg5e6e74fcf55af7524415e485)in this function:

[18:33](#msg5e6e7505c8ddaf238c882f25)fl: func \[f s a] \[either tail? s \[a] \[r: fl :f next s (f a (first s))]]

[18:34](#msg5e6e7524034f6b7b24e34fcb)which is an attempt to make a fold function, it appears to works in console

[18:34](#msg5e6e7531034f6b7b24e34fe9)I will follow your advise and use -d flag

hiiamboris

[19:49](#msg5e6e86d39442097b254b16ab)compiler won't call your `f` function, and you should wrap that call in a `do` expression (or add `-e` flag to wrap the whole script)

## Tuesday 17th March, 2020

pepdiz

[09:06](#msg5e7092fb35dd880e67cb5894)latest release solved the problem, thaks

[09:08](#msg5e709399b88948369408c8a3)@hiiamboris Oh I didn't know of that, why is necessary a encap mode?

hiiamboris

[10:08](#msg5e70a18c30ea7f57f72c9d63)Compiler has to (1) know func's definition so it can actually compile it, (2) see the call to it at compile time to compile the call. In your `fl` function it cannot know that `f` will be passed a function at runtime, and what function that will be. So it will just use it as a value, and do nothing.

## Wednesday 18th March, 2020

loziniak

[22:54](#msg5e72a6bd42d407269c327687)

```
r: reactor [
	x: none
	f: does [self/x: 123]
]

abc: object [
	a: is [either none? x: r/x [none] [x]]
]

r/f
probe abc

r/x: 456
probe abc
```

Can anyone confirm that first \*probe* shows `make object! [a: none]`, when compiled, and `make object! [a: 123]` when interpreted?

## Thursday 19th March, 2020

ne1uno

[03:11](#msg5e72e2dc87ab397fdf8e916d)win7 month old \_latest, same

toomasv

[05:49](#msg5e7307f6f7268f29190e437b)@loziniak Confirmed on W10.

[06:29](#msg5e7311561fdf51291a20f4d3)But this works:

```
r: make reactor! [
    x: none
    f: does [r/x: 123]
]

abc: object [
    a: is [r/x]
]

r/f
probe abc

r/x: 456
probe abc
```

[06:54](#msg5e73170835607f4c5da0ad18)A bit of experimentation shows that all following methods of setting `x` from inside func

```
x: 123
self/x: 123
r/x: 123
put self 'x 123
put r 'x 123
```

work in interpreter, but only three last ones work when compiled (`self/x:` results in access violation).

Also, all these work in interpreter with `reactor` instead of `make reactor!` but `reactor` does not work at all when compiled.

hiiamboris

[15:04](#msg5e738a08671a621fe09dc0d8)This works: `view/options [on-time [print 'tick]] [rate: 1]`  
This doesn't:

```
view [rate 1 on-time [print 'tick]]
view [on-time [print 'tick] with [rate: 1]]
```

Should it be so? It's like VID forces me to put closely related parameters into different places.

dockimbel

[15:23](#msg5e738e557f9d323a02c6a51d)VID is returning a syntax error in the last two cases because you are specifying face properties without defining a face to attach them to. The first one works because that is the intended way to specify window's face properties.

[15:24](#msg5e738ec71e369d63dff56c44)The fact that the standalone actor definition is attached to the window face is an implementation side-effect. It should return a syntax error also in that case.

hiiamboris

[15:25](#msg5e738ee77f9d323a02c6a791)Oh. I thought it's by design ;)

dockimbel

[15:27](#msg5e738f78d5e8c756c532c016)Though, maybe we should introduce a keyword like `parent` to designate the window face, so that the VID properties could be attached to it like for any other face.

hiiamboris

[15:28](#msg5e738fb846e658435e9f9ad0)That would be welcome, as VID is cool :)

dockimbel

[15:30](#msg5e738fff54f26e12b52a840c)There's a lot of space for improvement in VID. ;-)

hiiamboris

[16:13](#msg5e739a141e369d63dff59643)Is this by design?

```
>> a: 420
== 420
>> get quote a:
== 420
>> get quote system/words/a:
*** Script Error: get does not allow set-path! for its word argument
*** Where: get
*** Stack:
```

meijeru

[17:15](#msg5e73a89ddfd5f12479c89ad4)See `help get`: the word argument has typespec `[any-word! refinement! path! object!]` . For consistency, one should perhaps allow `any-path!`.

hiiamboris

[17:56](#msg5e73b2360f0687340b41a2db)And that reminds me of another inconsistency:

```
>> get /a
== 420
>> set /a 999
*** Script Error: set does not allow refinement! for its word argument
*** Where: set
*** Stack:
```

greggirwin

[19:42](#msg5e73cb4054f26e12b52b4e47)Consistency is great, but constraints are also important. As well as convenience.

For `get`, with set-paths, it's easy enough to work around:

```
>> get in system/words quote a:
== 420
```

But it looks like `get` already supports `set-path!` values internally, and it's only the environment interface for it (%enivronment/natives.red) that prevents it. Same for `set`.

We also need to update the doc-string for `get`, since it only talks about words today.

Now, the question is whether there's value in constraining the types. If so, what is the use case, or need for supporting refinements today? They were clearly added to the spec, and we have to assume it was for a reason. Coming at it from the other direction, what happens if we remove constraints and change to `any-path!` and `all-word!` types? Now we have consistency, but also support for `issue!`. It was a string type under R2, but is a word type under Red.

In plain, boring code cases, the constraints don't limit us. But when working with dialects, they could be useful. Can we live without this feature? Sure. But consider that `'a` is a literal word form. In that light, so too are `/a` and `#a`. It's just that we think of the latter \*only* as literal values (until now :^).

My guess is that `get refinement!` is supported for us in function contexts. Can't say without more research. If we add `set` support, and `all-word!`, the very common case of objects comes up. Are we OK with refinements and issues being coerced, or is the constraint of "true" words helpful there? Refinements are easier to justify, due to path notation, but issues are harder. Remember, too, that once we enable a feature, it's very painful to take it away.

This is one @dockimbel has to weigh in on.

hiiamboris

[21:41](#msg5e73e715f5b9723ad9ae13ea)I don't see a reason to support issue here as it was never used to hold a value in my experience. But other words and paths - easily. Like, remember your `default` function? I'm using it with set-words as this makes it both properly syntax highlighted and allows `function` to collect it. But I have use for set-paths just the same. But `default` is such a minor convenience that for it to be adopted it has to have tiny performance footprint. Lack of set-path support doubles it's size. It's just an example. I've encountered some other examples, both during my current project and back in the CLI lib.

## Friday 20th March, 2020

hiiamboris

[14:05](#msg5e74cdb97f9d323a02ca0a06)More news on the console bug: I just saw 2 consoles quit at once while I was typing in the 3rd. One of them had another window open. That window closed all it's faces one by one before quitting - it's very easy to notice when you have 50+ faces in a window.

greggirwin

[18:00](#msg5e7504b903aa161d076187b9)Is this your view test engine running things?

dockimbel

[18:03](#msg5e7505844f537701a0b457eb)@hiiamboris R3 is supporting get/set on refinements, though, I haven't seen any use-case for that so far and that would be confusing for all the users who are struggling with understanding basic words/contexts relationship. So, I'm for removing it.

hiiamboris

[18:14](#msg5e7508006fd5e36176b99e83)@greggirwin One console was running view test engine, the other two were just me testing that or this command

greggirwin

[18:33](#msg5e750c7f546ed07a6e7f8fad)@hiiamboris if it's a newer build, it may be the GC bug.

[18:34](#msg5e750cb8b1a349586b9513b4)I doubt anyone is using `set` with refinements, so we can remove it. If we later decide to add it back, it won't be a breaking change.

hiiamboris

[18:36](#msg5e750d4b54f26e12b52eafdf)No, I don't think it's a GC bug, as I have GC being turned off in one of the \*startup* scripts. And it quits no matter if GC is on or off.

greggirwin

[18:37](#msg5e750d817f9d323a02cadb63)OK, thanks for checking that.

ne1uno

[19:59](#msg5e7520b49c5253145b728432)`s: "money? USD$12.34" do s` ;\** Script Error: money? is missing its value argument

## Saturday 21st March, 2020

greggirwin

[00:27](#msg5e755f7f54f26e12b52f6fc1)Is `money? USD$12.34` the same, or only when you `do` it?

ne1uno

[00:31](#msg5e756070606f2a79d3f77530)just `do`, many other things I tried work either way.

greggirwin

[00:32](#msg5e75609b89723051b6a539d8)@9214 :point\_up:

ne1uno

[00:32](#msg5e7560b04f537701a0b530bf)`round` was mentioned in the blog

greggirwin

[00:33](#msg5e7560c9f0528c1078a8d72e)Yes, it's TBD.

hiiamboris

[16:28](#msg5e7640a089723051b6a7049c)Funny bug with GUI console: https://i.gyazo.com/079d2602a69fbefd4c8421bf55092862.jpg  
Never seen it yet. All chars instantly became boxes (GC is off).

dockimbel

[18:36](#msg5e765e97606f2a79d3f991ac)@hiiamboris Try inputting high codepoints (16-bit ones, then 24-bit ones) to see if it's related to changes in output strings internal encoding.

hiiamboris

[19:23](#msg5e7669c41d73bb22eb9737ce)Unfortunately, closed the console already :(

[20:57](#msg5e767fb00c192537c60c93bf)Wait, I did it again! :)

[21:00](#msg5e768077e1bdad01ab4d5030)That font contains only latin and cyrillic symbols - they all become boxes. All symbols not supported by the font are okay.

[21:06](#msg5e7681d05831300e1e1e1962)That's an argument for replacing all words with emoji! ☻

[21:07](#msg5e76820f89723051b6a7a9c0)When I change the font to something else and back again - the bug persists.

[21:47](#msg5e768b89794f3a56b38b9eb9)GC can't be ruled out btw, as I'm manually doing runs to collect images.

## Monday 23th March, 2020

loziniak

[21:21](#msg5e79285cd95f5004210877ae)Found this:

```
Red [Needs: View]

bb: make face! [
	type: 'button
	text: "BYE!"
	actors: object [
		on-down: func [face [object!] event [event!]][
			print "clicked"
			face/byebye
		]
	]
	hello: function [par [object!]] [
		self/parent: par
		append par/pane self
	]
	byebye: does [
		print "byebye"
		remove find self/parent/pane self
	]
]

view [on-created [print "create" bb/hello face]]
```

On Linux/GTK when interpreted, works as expected: button appears, and when clicked - disappears. All `print`s fire.  
On Linux/GTK when compiled, button appears, but `byebye` function is not executed. "clicked" is printed, but not "byebye".  
On Windows when compiled, only a window appear, but without button. Tested under Win7 and Wine.

Can anybody confirm?

hiiamboris

[21:23](#msg5e7928ec924f940a3da9a91f)add `offset` and `size`

[21:27](#msg5e7929a4f985870ce94343e7)My result on W7 when compiled (-c) is:

```
create

*** Runtime Error 98: assertion failed
*** in file:
*** Runtime Error 1: access violation
*** in file:
```

-r:

```
create

*** Runtime Error 1: access violation
*** in file:
```

-r -d:

```
create

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/datatypes/object.reds
*** at line: 384
***
***   stack: red/object/fire-on-set 00000062h 0044C03Fh 00000000h 0018FB08h
***   stack: red/object/fire-on-set 02AE3050h 029D7804h 029E0244h 029E0234h
***   stack: red/object/fire-on-set* 029DAAD4h 029D7804h
***   stack: ctx||477~hello 02151B0Ch
***   stack: red/_function/call 029E0214h 02151B0Ch
***   stack: red/interpreter/eval-code 029E0214h 02CADCC0h 02CADCC0h false 02CADCA0h 02CADCE8h 02AE4E60h
***   stack: red/interpreter/eval-path 02CADCE8h 02CADCB0h 02CADCC0h false false false false
***   stack: red/interpreter/eval-expression 02CADCB0h 02CADCC0h false false false
***   stack: red/interpreter/eval 02CADC18h true
***   stack: red/interpreter/eval-function 029E01E4h 02CADC18h
***   stack: red/_function/call 029E01E4h 021934E4h
***   stack: red/interpreter/eval-code 029E01E4h 02C1C978h 02C1C978h false 02C1C948h 02C1C9B0h 02CA94B0h
***   stack: red/interpreter/eval-path 02C1C9B0h 02C1C958h 02C1C978h false false false false
***   stack: red/interpreter/eval-expression 02C1C958h 02C1C978h false false false
***   stack: red/interpreter/eval 029E01D4h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: show
***   stack: view
```

[21:32](#msg5e792aecb08f3e0abf8c0bf8)Crash is caused by `parent:` assignment. When compiled without it (and with offset+size), it appears but does not disappear. When interpreted - disappears. At least 2 bugs here.

loziniak

[21:36](#msg5e792bd6c77e71566786867a)@hiiamboris I'm compiling with https://github.com/red/red/pull/4351 , that's the reason of your crashes.

[21:38](#msg5e792c5ab08f3e0abf8c0f3e)Try replace `self` with `bb` everywhere.

[21:39](#msg5e792ca565bc2a6fa6853f79)

```
Red [Needs: View]

bb: make face! [
	type: 'button
	offset: 20x20
	size: 50x50
	text: "BYE!"
	hello: function [par [object!]] [
		print "hello"
		bb/parent: par
		append par/pane bb
	]
	byebye: does [
		print "byebye"
		remove find bb/parent/pane bb
	]
	actors: object [
		on-down: func [face [object!] event [event!]][
			print "sdf"
			face/byebye
		]
	]
]

view [on-created [print "create" bb/hello face]]
```

hiiamboris

[21:40](#msg5e792cdcb841845790bc3e40)Yes. With `bb` works as without `parent:` above.

loziniak

[21:42](#msg5e792d37f985870ce9434a26)And does button disappear?

hiiamboris

[21:43](#msg5e792d6cb08f3e0abf8c1265)Only when interpreted. Also when I change `face/byebye` to `bb/byebye`.

[21:43](#msg5e792d972e334e1b7aefeb5f)Compiler doesn't know what `face` is and leaves `byebye` as value in compiled code ;)

loziniak

[21:47](#msg5e792e5570a85655dfa16db5)That's strange.

hiiamboris

[21:48](#msg5e792ea4c77e715667868c03)https://github.com/red/red/issues/4201 same thing, just from a bit different angle

## Wednesday 25th March, 2020

Oldes

[15:59](#msg5e7b7fcd17db205e02bac472)I was checking source of PDF-maker and noticed that in Rebol2 there is:

```
>> head insert "" ["a" n]
== "an"
>> head insert #{} ["a" n]
== #{616E}
```

While in Rebol3 and Red the second one throws an error:

```
>> head insert "" ["a" n]
== "an"
>> head insert #{} ["a" n]
*** Script Error: cannot MAKE/TO binary from: n
*** Where: insert
*** Stack:
```

rebolek

[16:01](#msg5e7b8046af5fed77485fae5b)I'm not sure I like R2 behaviour.

Oldes

[16:02](#msg5e7b80b0f778a11920b1adad)PDF-maker depends on it heavily.

[16:06](#msg5e7b819817db205e02bacc0f)Ok... maybe not so heavily... maybe it's easy to change it just on one place, but still... if there is the error in second case, maybe it should be in the first one too?

rebolek

[16:07](#msg5e7b81b73cf9de712dfbdb1d)I see, that makes sense.

Oldes

[16:08](#msg5e7b81e8fb1252280f4931a1)But if there will be these errors, than one would have to write more verbose code.

rebolek

[16:08](#msg5e7b820551abce3ece0fe6ac)How often are you using such construct anyway?

Oldes

[16:11](#msg5e7b82b851abce3ece0fe837)I would not be using these constructs, but @giesse is in his code ;-)

rebolek

[16:12](#msg5e7b82ea3cf9de712dfbdf9f)to be fair, he \*was* using it in his 13 years old code ;-)

Oldes

[16:12](#msg5e7b82ecb5931e2afeed56cd)Another difference is that in Rebol2:

```
>> head insert #{} ["a" 1]
== #{6131}
```

While in Rebol3 and Red it is:

```
>> head insert #{} ["a" 1]
== #{6101}
```

rebolek

[16:12](#msg5e7b8303b5931e2afeed57b1)I hated R2 behaviour on this one.

pekr

[16:27](#msg5e7b86849ee489692834c44b) .... #MeeToo :-)

giesse

[18:05](#msg5e7b9d83af5fed7748600b3e)Well, aside from whether I should have made that assumption 13 years ago...  
The real question is, do we just assume UTF8 when mixing strings and binary or do we just give up and say that you can't insert a string into a binary?

[18:06](#msg5e7b9dadf778a11920b2108e)because, if you can do

```
>> head insert #{} "a"
== #{61}
```

and

```
>> head insert #{} form 'n
== #{6E}
```

then this is just there to annoy you:

```
>> head insert #{} 'n
*** Script Error: cannot MAKE/TO binary! from: n
*** Where: insert
*** Stack:
```

Oldes

[18:21](#msg5e7ba11845c46b22fa3d4b33)After playing with the 13 years old pdf-maker for a while (I never used it before), I see that bigger problem than need to add `form` in several places is, that PDF format seems not to support UTF-8... if I don't have wrong assumptions. So porting pdf-maker to Red (or Rebol3) would be more difficult than I fought. Because Red and Rebol3 assume UTF-8 when mixing strings and binary and PDF is binary format, although in its simple form looks quite readable.

## Thursday 26th March, 2020

giesse

[05:53](#msg5e7c435f6272237a39e9b171)It's been a long time since I looked at PDF specs, but IIRC you have to create your own mapping for the fonts you use. I just use Latin1 because that was the easiest thing to do for me at the time. Supporting Unicode would be quite a bit more work.

## Saturday 28th March, 2020

Oldes

[17:05](#msg5e7f83f3b407e11e3cbdfd2a)Just noticed that on Windows:

```
>> what-dir
== %/X/GIT/Red/
>> cd %/
== %/  ;<--- should be %/x/
>> what-dir
== %/  ;<--- should be %/x/
```

hiiamboris

[17:17](#msg5e7f86a48266bd21295b0359)Should it?

[17:18](#msg5e7f8702426d5b06bf91bc26)Although, funnily `read %/` and `cd %/ read %./` return different lists ;)

Oldes

[17:35](#msg5e7f8adfdbf843195f30e3bc)Because on Windows `cd %/` acts like `cd %/x/` (when on `X` drive). It just does not report correct name.

hiiamboris

[17:55](#msg5e7f8f74d7d8504dee717145)True enough. But since `%/` isn't the same as `%/X/`, and on Windows it's only possible to `cd` into some drive's root, should `cd` or at least `change-dir` throw an error when given `%/`?

[18:06](#msg5e7f9216770a892bfb18b8b2)Is this by design? I think it's annoying:

```
>> p: 2x3
== 2x3
>> p/x: 1.2
*** Script Error: float! type is not allowed here
*** Where: set-path
*** Stack:
```

Oldes

[18:25](#msg5e7f96836eb8380abce1032f)@hiiamboris Is it already implemented in Red? This is actually annoying (in fast-lexer):

```
>> 1.2x3
== 2642x3
```

hiiamboris

[18:25](#msg5e7f96978266bd21295b2fef)wow

[18:25](#msg5e7f96aaf465c801f876c653)No, I simply expected silent `to integer!` cast for me

[18:26](#msg5e7f96dddbf843195f31019c)@Oldes in my build (Red 0.6.4 for Windows built 3-Feb-2020/0:33:33+03:00 - what a nice timestamp):

```
>> 1.2x3
*** Syntax Error: (line 1) invalid float at 1.2x3
*** Where: transcode
*** Stack: load
```

Oldes

[18:27](#msg5e7f970b6eb8380abce1049c)My is `Red 0.6.4 for Windows built 22-Mar-2020/14:15:20+01:00`

hiiamboris

[18:27](#msg5e7f97256eb8380abce104b5)Looks like a regression, @dockimbel ^^

Oldes

[18:28](#msg5e7f9738f95592102b31829a)(still don't know, why my local builds don't get commit ids)

hiiamboris

[18:29](#msg5e7f977dd71a6e7e8d7cb883)You could have added your own commits - how would it know?

meijeru

[18:37](#msg5e7f997c770a892bfb18c98f)In the 18-Mar build, `1.2x3` is lexed as `1x3` (W10, commit `#101a64f`).

endo64

[19:42](#msg5e7fa8a0b407e11e3cbe5669)wd

[19:42](#msg5e7fa8b663c1c130d5cfb163)Ops, sorry.

[19:43](#msg5e7fa8e8dbf843195f313003)@Oldes It is same on R2:

```
>> pwd
== %/c/rebol/view/
>> cd %/
== %/
>> pwd
== %/
>> ls
c/
```

hiiamboris

[19:59](#msg5e7faca24a4f8e0a100fe372)It's not the same, it's correct (but also how it will work together with `call` that would use some \*real* startup directory?)

endo64

[20:05](#msg5e7fae1df465c801f876f81c)But on R3, it is different:

```
>> cd %/
== %/
>> pwd
== %/C/

> read %/
R2== [%c/]
R3== [%$Recycle.Bin/ %Boot/ %bootmgr %BOOTNXT ...
```

hiiamboris

[20:15](#msg5e7fb04af465c801f876fedd)So how does one on R3 get a list of drives?

dsunanda

[21:06](#msg5e7fbc71d71a6e7e8d7d1341)This is a cross between a pop quiz for those bored in lockdown, and a moan at behavorial inconsistencies in VID.

In the code in the next post. There are:  
\-- six types of "behavior" we'd like honored (Newline in text; Yellow color; Centre and Middle for text; Left click; Right click  
And we have four types of VID style:  
\-- button, box, text. rich-text

The question is: before running the code, which behaviors will be ignored by which styles?

[21:07](#msg5e7fbc836eb8380abce16161)

```
lo: copy [across]
foreach box-type ['button 'box 'text 'rich-text][
        append lo compose/deep [
		      return (box-type) 100x100 center middle yellow "Click^/me"
              [print ["left " (box-type)]]
              on-alt-up [print ["right " (box-type)]]
        ]
     ]
 unview/all view lo
```

[21:07](#msg5e7fbc94770a892bfb1925f9) Bonus question: what one magic word makes a style that will honor all six behaviors?

hiiamboris

[21:17](#msg5e7fbedd426d5b06bf9245ac)Yes, `box` was extensively tested by me. But `rich-text` supports everything too, it's just happens that it's default actor is kinda strange: `on-change`. You can insert `on-down` before your `left` code to make it work

endo64

[21:25](#msg5e7fc0c04a4f8e0a101014e4)&gt; So how does one on R3 get a list of drives?

@hiiamboris I don't know if it is possible (didn't use R3 much)

## Sunday 29th March, 2020

dsunanda

[07:41](#msg5e80511dc1880d2c9b4a417e)@hiiamboris -on-down (or on-up) for rich-text is the magic word!

[18:39](#msg5e80eb52ee51f444372d380a)The code below - which emulates repeated usage of CALL under Windows 10 works perfectly fine - unless you uncomment the PRINT (or in many other ways touch the results of the CALL). Then it will randomly fail after some iterations, One such failure is:

```
*** Script Error: reset-buffer does not allow vector! for its <anon> argument
*** Where: reset-buffer
*** Stack: do-file view do-events do-actor do-safe
```

[18:39](#msg5e80eb6c8a500e43b1be9999)

```
in-t: copy "/s" out-t: copy "" err-t: copy ""
unview/all view [
   counter: box 100x100
   button "run" 
          on-up [
             n: 0 
		     loop 100 [
			      n: n + 1 counter/text: form n
				  call/wait/input/output/error "dir"  in-t out-t err-t
				 ;;; print [in-t out-t err-t]
				 ]
             counter/text: "Done"
             ]
		]
```

[18:40](#msg5e80ebb9d71a6e7e8d7fafff)Other failure modes (in more complicated code from which the above has been extracted) include: DO-EVENTS loop going wild ; and total console crash.

hiiamboris

[18:42](#msg5e80ec0e922e6e03310ef20b)Doesn't crash for me on W7 (clicked like 30 times?)

[18:43](#msg5e80ec36922e6e03310ef23f)Anyway, the relevant issue is https://github.com/red/red/issues/4184

[18:52](#msg5e80ee72452eb266c891a458)I do get random crashes too, but nothing reproducible.

dsunanda

[19:09](#msg5e80f254d71a6e7e8d7fc11d)Thanks -- didn't find that issue, I was looking for ones related only to CALL. Stupid question, did you uncomment the PRINT? I've only ever been able to click RUN once; the highest count I got to before failue was 37.

hiiamboris

[19:13](#msg5e80f3586d0f2061cd2132d9)Riiight! I forgot sorry :) Yes I see now.

[19:15](#msg5e80f3d4ee51f444372d4bb1)As you can see from the issue text, it's something with GUI console printing too much.

dsunanda

[19:22](#msg5e80f56a49e7a8130cd7f3a4)Thanks for confirming....Any ideas for a workaround!? It current makes long-running apps that use CALL a form of Russian Roulette :)

hiiamboris

[19:35](#msg5e80f870452eb266c891bf98)Don't print it to the GUI console ;)

dsunanda

[19:52](#msg5e80fc9154cc6661559a0329)In real life we're not dioing that :) Problem is triggered by doing things with the out-t string, eg

```
if not find out-t  "run ok" [code to handle failure]
```

hiiamboris

[19:55](#msg5e80fd3ad71a6e7e8d7fdce3)Try `recycle/off`

dsunanda

[19:57](#msg5e80fdaa54cc6661559a0595)Good idea, thamks, but sadly, I need RECYCLEs in this app - otherwise we blow up when memory reaches 2gig (after recycle its a happy 150meg or so)

[20:00](#msg5e80fe43098e19329475f8dd)I found the start of a work around - it pushes the failure out to around 500 rather than 37. Simply copy and unset the OUT-T word, eg the main loop becomes:

```
loop 1000 [
    	      n: n + 1 counter/text: form n
              out-t: copy "" 			
	          call/wait/input/output/error "dir"  in-t out-t err-t
	          out-tc: copy out-t unset 'out-t
	          print [in-t out-tc err-t]
     	    ]
```

[20:38](#msg5e81074454cc6661559a1d4c)@hiiamboris &gt; it's something with GUI console printing too much ...... so I think the initial problem I was chasing (CALL damaging VID processing) is something completely different - and I stumbled over #4184 when adding too many PRINT statements for debugging).

Let's try again :) In the code below, the RES box stops being re-SHOWn after about 50 iterations. Adding SHOW manually makes no difference. (In the real app, the whole VID interface basically freezes).

[20:38](#msg5e81074d098e193294760fb6)

```
recycle/off     ;;; makes no difference having this
in-t: copy "/s" out-t: copy "" err-t: copy ""
unview/all view [across
   counter: box 100x100
   button "run" 
          on-up [
             n: 0 
		     loop 100 [
			 res/text: "please wait...."
    	      n: n + 1 counter/text: form n
	          call/wait/input/output/error "dir"  in-t out-t err-t
			  res/text: out-t
     	    ]
             counter/text: "Done"
             ]
		return
		res: text 300x500
		]
```

hiiamboris

[20:49](#msg5e8109bf922e6e03310f37a7)How do you know if it stops being re-shown?

[20:49](#msg5e8109f4ee51f444372d8517)My counter reached 100, but I notice it's slowing down after each tick

[20:51](#msg5e810a41c1880d2c9b4c15e0)Fixed your snippet by `call/wait/input/output/error "dir" clear in-t clear out-t clear err-t`

[20:53](#msg5e810ad80c2917051d67dbb3)Just how many files in CWD do you have that it freezes?

dsunanda

[21:04](#msg5e810d43770a892bfb1c145f)Thanks -- what I see (with my code) is "Please wait" alternating with the Dir listing up until about 50. Then just "Please wait" until the end.  
Other behaviors are possible - it is sensitive to the initial conditions.  
With your three CLEARs I see mostly "Please wait" all the way, with just a couple of brief flickers of the Dir display - so (for me) somewhat worse.  
And yes, I also see slowdowns.  
CWD?

hiiamboris

[21:07](#msg5e810e0c922e6e03310f417a)current working directory

[21:08](#msg5e810e5a8a500e43b1beeafc)&gt; With your three CLEARs I see mostly "Please wait" all the way, with just a couple of brief flickers of the Dir

do a `res/text: copy out-t` then

dsunanda

[21:10](#msg5e810ed12725b83acd528979)Thanks -- the DIR /S lists about 200 lines = length? out-t is 1397

hiiamboris

[21:11](#msg5e810f0e6eb8380abce465ab)I see. So after 100 calls you have 20000 lines and 140000 bytes text label.

[21:12](#msg5e810f39098e193294761ebf)I had &lt; 40 files so it actually finished 100 iterations ;)

dsunanda

[21:14](#msg5e810fa154cc6661559a2db6)? I am not doing an APPEND - out-t is 1497 after 100 loops

res/text: copy out-t -- not seeing any behavior changes (with or without the CLEARs)

hiiamboris

[21:15](#msg5e810fdb49e7a8130cd831d0)`call` does

dsunanda

[21:16](#msg5e811015452eb266c891f612)Yes! My mistake - I hink you are on to something. Let me have a play.....

ne1uno

[21:20](#msg5e8111286eb8380abce46988)what happened with new gui unblocking? old gui no longer builds, maybe modify cli needs: 'view and build local console?

dsunanda

[21:34](#msg5e81146fc1880d2c9b4c2da8)@hiiamboris Thanks for all your help - it's been a pleasure doing debugging with you....

.....Sadly, the app itself already CLEARs its CALL args; and writes nothing to the GUI console, unless debugging is on. And it'sGUI is still mishaving about about 30 CALLs (to 7zip if you are interested).....

......All of which means I've simply failed to isolate the root cause; instead spent several hours stumbling over irrelevancies. Life, eh?

hiiamboris

[21:36](#msg5e8114f4452eb266c8920354)Well, it would be cool if you could isolate the bug, since we can't fix what we can't reproduce ;)

dsunanda

[21:37](#msg5e81152e922e6e03310f57c8)True words!

hiiamboris

[21:39](#msg5e81158cee51f444372da524)Try also to build this branch (with `-d`) https://github.com/red/red/tree/f4546b96c255d2c8dd200f0d2289a2c7f3bfdb85

[21:40](#msg5e8115b7770a892bfb1c2f0b)Slim chance that it'll help, but who knows...

[21:48](#msg5e8117b6452eb266c8920ceb)Also try `recycle/off` and manually calling `recycle` at times when you need it (use `stats` to discover).

ne1uno

[22:13](#msg5e811d85ea686a4bbabcf704)'money!\` needs MEMGUARD

dsunanda

[22:45](#msg5e812527ea686a4bbabd080c)Thanks for the hints - I'll keep trying :)

## Monday 30th March, 2020

hiiamboris

[17:01](#msg5e8225f647c92241cfb6513d)Interesting. I see how a few simple draw commands during a minute corrupt system resources so much that OS first starts drawing other faces content over my Red window, the becomes almost completely unable to draw anything and you navigate mostly blindly ;)

[17:50](#msg5e823153c1880d2c9b4f3f52)https://github.com/red/red/issues/4373 let's hope I nailed it

ne1uno

[19:28](#msg5e8248766aa6632a35eafd7c)rebooting now. win7 completely lagged still 10 minutes after I managed to exit. money branch debug gui

## Wednesday 1st April, 2020

Tovim

[15:22](#msg5e84b1af302cd3685bdfb291)Expression \*\*round/floor A / B\** should "round in negative direction" (towards negative infinity). It is not always so:

greggirwin

[15:31](#msg5e84b3d41bca0e4c0ec663be)Example?

Tovim

[15:32](#msg5e84b40d987a3333241d7d30)... sorry

```
>> round/floor -5 / 3.0
== -2.0                   ; OK
>> round/floor -5 / 3
== -1                       ; wrong
>> round/floor -5:10:12 / 3:05:2
== -2                       ; OK
>> round/floor -5x2 / 3x4
== -1x0                   ; wrong
```

9214

[15:33](#msg5e84b43755d0d07c2d2e5ca5)How can it be wrong if `-5 / 3` is `-1` and `-1` is already a whole integer?

greggirwin

[15:33](#msg5e84b444cf8d521cd7002a73)Don't forget that `/` \*currently* performs integer division, but that is planned to change.

Tovim

[15:39](#msg5e84b59fac728e0f1fbd17b3)Isn't the \*\*round/floor\** function connected with the evaluation of \*\*remainder\** and/or \*\*modulo\** functions?

9214

[15:40](#msg5e84b5e6b2159a2dffb41d28)@Tovim it's not, it's not even a mezzanine.

Tovim

[15:45](#msg5e84b7164ed72e126b893430)OK, \*\*round/floor -5 / 3\** should be \*\*-2\** according to the declaration of the \*\*round\** function (in ../environment/actions.red).

9214

[15:48](#msg5e84b7e7a61b811a4f7532eb)@Tovim what makes you think it should be `-2`? `-5 / 3` is `-1`, which you round to the nearest multiple of `1`, towards negative infinity. `-1` is already such a multiple, the nearest you can get.

Tovim

[18:14](#msg5e84da06bda64f6a20e122e2)According to my text at 17:45 ::  
round/floor -5 / 3 = -2 because -5 divided by 3 is -1.666, which ("Round in negative direction") is -2.

hiiamboris

[18:38](#msg5e84dfa017c96e5e11c5e21e)

```
>> -5 / 3
== -1
>> round/floor -1
== -1
```

Tovim

[18:52](#msg5e84e2e9b5496402d8ae3072)No comment. I would like to be able to read the text behind the "#get-definition ACT\_ROUND" link in the \*\*round: make action! \**  
definition.

hiiamboris

[19:13](#msg5e84e7ca55d0d07c2d2ef042)What text?

[19:16](#msg5e84e8950c2a05136bfac120)If it's an action code you want, look into `datatypes/.reds` (integer in this case) and there look for `round:`

[19:17](#msg5e84e8ad8bb4966bc49cbf07)Or maybe @rebolek's `nsource` can help to fetch actions, idk.

Tovim

[19:22](#msg5e84ea0e9db77e1540c11be2)Well, I realy mean the code of ACT\_ROUND, mentioned in the \*\*round\** function declaration (../actions.red).

9214

[19:32](#msg5e84ec57b2159a2dffb4bacf)There's no "code" of `ACT_ROUND`, it's an action ID used to fetch a function pointer to a datatype-specific `round` implementation. In this case, the one in `integer.reds` is used, and it works as expected.

But what's the point of your inquiry? @greggirwin, me and @hiiamboris all told you that `-5 / 3` is `-1` (an integer division), and that `round/floor -1` is `-1`, while `-5 / 3.0` is `-1.6..6` and `round/floor -1.6` is `-2.0`.

Tovim

[19:41](#msg5e84ee7a1bca0e4c0ec71379)Now I understand, thank you . `-5 / 3` is `-1` (an integer division \*\*by default\*\*) and that explains all.

## Thursday 2nd April, 2020

greggirwin

[17:23](#msg5e861f92cce9e155f4409f4a)Just be aware that `/` will do decimal division in the future, and `//` will be the integer division symbol.

hiiamboris

[17:59](#msg5e8627ebf79ff847b32bacf8)What will `//` do when not both operands are integers?

meijeru

[18:50](#msg5e8634060be15b3164443590)

[18:52](#msg5e86346fcce9e155f440de47)And what will replace the "old" `//` ??

hiiamboris

[18:57](#msg5e8635b298959a4d483d11e0)@meijeru https://github.com/red/red/issues/2433

meijeru

[19:01](#msg5e86369daf5a3e33bb9ea52a)Thanks for the reference. Proposal from Feb. 2017, with no action as yet and -- as far as I can see -- no priority attached.

greggirwin

[19:18](#msg5e863a95252ae83163dde16c)@hiiamboris Peter's original notes, which I'm sure you read, say "both the dividend and the divisor must be integer", so the question is whether that's the most useful thing and if supporting other numeric types will produce confusing results. e.g., do we truncate everything that comes in, or `floor` the result? We can refer to it as "floor division", but I don't know if that helps. Maybe more technically accurate, but not more meaningful.

Doesn't seem that there's consensus across PLs. Seems useful to support more than integers, if the results aren't surprising.

hiiamboris

[19:31](#msg5e863d7c98959a4d483d27dc)Yes. One of the reasons it's still pending is because it's not finished at the design stage ;)

greggirwin

[19:33](#msg5e863df48f149739d32edc09)We can roll it out with integer-only support, because adding other features shouldn't break that.

hiiamboris

[19:33](#msg5e863e2798959a4d483d29c9)Yes. That perhaps makes most sense.

greggirwin

[19:35](#msg5e863e64f79ff847b32befda)Something is better than nothing. :^)

## Friday 3th April, 2020

meijeru

[11:18](#msg5e871b8ac82e2165d62ad4aa)I am checking the application of actions to types, and find that `to vector!` is not allowed. Is there a compelling reason, or just an oversight?

[11:52](#msg5e87238cc82e2165d62af3a8)Hardly an oversight, because the related `to-vector` definition is not made by the toolchain.

[13:07](#msg5e87350081a582042e97e3b2)Another one, that maybe has already been reported:

```
>> charset 1
== make bitset! #{00}
>> charset 1.0
*** Script Error: charset does not allow float! for its spec argument
>> make bitset! 1.0
== make bitset! #{40}
```

[13:08](#msg5e87355c26dafb36651fc724)Thus `charset` is short for `make bitset!` but with a restriction on the argument (`float!` is forbidden). Is `float!` useful for `make bitset!`? And what should it mean? I suppose the `#{40}` is just an accident.

hiiamboris

[13:31](#msg5e873a99b9052f4d9dcf3933)

```
>> charset #"1"
== make bitset! #{00000000000040}
```

well.. ;)

[13:31](#msg5e873ab826dafb36651fdebf)that 1.0 can't be by design ☻

meijeru

[13:49](#msg5e873ef3a95bc942564e70b5)Worth an issue?

Tovim

[14:34](#msg5e874976c82e2165d62b8462)To @greggirwin at Apr 02 19:23:  
The decimal division under `/` will be great. I have by chance run across this interesting article by \[Guido van Rosum](http://python-history.blogspot.com/2010/08/why-pythons-integer-division-floors.html).

meijeru

[15:23](#msg5e8754defac8f94c20e26104)Made an issue for `make bitset! 1.0` see #4378

Oldes

[15:25](#msg5e8755794e14eb618b9b6843)Should this be allowed?

```
>> to-path [1 #[none]]
== 1/none
```

meijeru

[15:26](#msg5e8755b33a802a49d8752b46)Another strange thing: ``find is not allowed, but the implementation of find says INHERITED_ACTION and object! is parent type of error!, so this will error out as well. Curiously, find has its own implementation of find but that has not been fleshed out yet. What is the poitn of all this? 15:29@Oldes There have been discussions about making (with make or to) some values that would not be regular values if present as literals in a Red program. However, these could be of use in some dialects, so AFAIK they haven't been forbidden. Oldes 15:31@meijeru don't understand.. I'm asking about the none value, not the path starting with integer. 15:32I mean... should not it be like: >> to-path [a 2] == a/2 >> to-path [a none] == a/none >> to-path [a #[none]] ** Script error: invalid argument: none 9214 15:34@meijeru find on objects was deprecated as being reduntant with in. 15:39Constructing syntactically invalid paths is a beaten up topic, why are we bringing this up again? >> collect [loop 3 [keep/only make path! 0]] == [ ] >> to path! [[]()#{}] == []/()/#{} meijeru 15:49@9214 I know find is deprecated on objects, so what is the point of having error inherit a forbidden action? The code needs to be tidied up, don't you agree? 9214 16:00Then submit a PR and find out whether it's needed or not. Oldes 16:08@9214 ok.. maybe I was not there, when it was being beaten... but I get this as a good reason why to keep it: >> type? second to-block to-path [a #[none]] == none! meijeru 19:03@9214 I am technically ill equipped to submit PRs. It is not a priority but may be forgotten easily. So how to remind ourselves? Saturday 4th April, 2020 meijeru 09:11@Oldes On the basis of this useful discussion, I have aadded the following to my spec document: Note also, that conversion with to may lead to values being created, that would not be allowed in a Red program, or even be interpreted differently. Such values may still be useful in dialects. Example: to-path [1 2 3] gives 1/2/3, and 1/2/3 in a Red program is the date! value 1-Feb-2003. loziniak 10:34Hello. When I use styles, everything I draw on a base inside panel, floats over another panel which is over it in z-order. 10:36[![obraz.png](https://files.gitter.im/red/bugs/Xzvz/thumb/obraz.png)](https://files.gitter.im/red/bugs/Xzvz/obraz.png) 10:37 Red [Needs: 'View] ccc: draw 20x20 [ fill-pen red box 0x0 20x20 fill-pen green circle 10x10 10 ] styles: [ drawing [ default-actor: on-down template: [ type: 'base size: 100x100 actors: [ on-created: func [face [object!] event [event! none!]] [ face/draw: [ image ccc 10x50 text 10x10 "TEXT" ] ] ] ] ] ] view layout/styles [ panel blue [drawing] at 40x0 panel red [] ] styles 10:40Hmm seems I need to set a color in template: color: white. Interestingly, when it's color: transparent, the error still exists. endo64 15:30@loziniak It is different on my PC (Win10) 15:30[![image.png](https://files.gitter.im/red/bugs/arEV/thumb/image.png)](https://files.gitter.im/red/bugs/arEV/image.png) hiiamboris 15:53https://github.com/red/red/issues/1823 @loziniak Oldes 19:51@meijeru I somehow feel, that to-path [1 2 3] should return result in construction syntax -> #[path! [1 2 3]] when it is not backward loadable as path. 19:53It is same like clear http:// should not return invisible result, but #[url! ""] 19:54(unfortunately to handle all cases is quite a lot work and there are other priorities, not mentioning that even Rebol does not handle it correctly) 19:56 >> length? probe reduce [tail http://] [] == 1 loziniak 19:56@endo64 @hiiamboris thanks! hiiamboris 19:59@oldes It's a mold issue though https://github.com/red/red/issues/4126 loziniak 20:01@hiiamboris it works ok when not using styles though: Red [Needs: 'View] ccc: draw 20x20 [ fill-pen red box 0x0 20x20 fill-pen green circle 10x10 10 ] view [ panel blue [ base 100x100 on-created [ face/draw: [ image ccc 10x50 text 10x10 "TEXT" ] ] ] at 40x0 panel red [] ] 20:02@endo64 mine was on Win7 hiiamboris 20:02@loziniak that's because >> ?? system/view/VID/styles/base system/view/VID/styles/base: [ default-actor: on-down template: [type: 'base size: 80x80 color: 128.128.128]] has color: 128.128.128 and you didn't provide it so it assumed color: none loziniak 20:15seems like having sense :-) Sunday 5th April, 2020 greggirwin 21:32@Oldes don't confuse console output, formed, or even molded results with the contents of a value. Can we, and should we, force every possible value to comply with standard lexical forms? head change http:// "not-a-url-anymore?" pick-path: func [blk path][ repeat i length? path [ blk: pick blk path/:i ] ] blk: [ [ [a] [b bb [b1 b2 b3 b4]] [c]] ... ] p: to path! [1 2 3 4] pick-path blk p We can say "Don't use paths for that.", but let's think outside the dialect box. Do dialects *always* need to be serialized, or could you construct their inputs programmatically, such that a human never sees them? keys: reduce ['blk p [x y z]] find keys path! This is getting out there, but it can go even further. Imagine a generative communication system that leverages as many types as possible, even those that are less convenient for humans. Messages still need to be serialized for wire transport, but that can be redbin based, or use custom save/load codecs that *do* force construction syntax. I'm not saying this is a good idea, but Red will let you do something like that, which opens up more areas of research and experimentation. meijeru 21:40:+1: Monday 6th April, 2020 Oldes 12:50 red >> to-hex/size 1 -5 == #456789ABCDEF >> to-hex/size 1 999 == #00000001 12:56Should not it throw out-of-range errors in both cases? meijeru 12:59Help! I have a curious problem: I downloaded the latest W10 exe: red-05apr20-c0f0fb619.exe and compiled the following program: Red [] write %build.txt mold system/build/git The result I got was: make object! [ branch: "master" tag: #v0.6.4 ahead: 987 date: 18-Mar-2020/13:57:39+02:00 commit: #101a64f3ef84f0376431bace08cc4547437d6008 message: {Merge pull request #4320 from 9214/issue-4318^/^/ FIX: issue #4318 ([Parse] SET and COPY work even without a sub-rule)} ] In other words, system/build/git shows that the latest is not really the latest ?!? What can I have done wrong? hiiamboris 13:10Something we should ping @x8x about. meijeru 13:14Why?? Is he the one that puts up the files on https://www.red-lang.org/p/download.html ? hiiamboris 13:15He has helped to find and solve this problem in the past. Files are uploaded automatically but something's broken there. meijeru 13:16@x8x See above please! x8x 13:17checking.. 13:59A glitch with a vm, should be fine now, please let me know if not. meijeru 14:08Thanks! Works now. Tuesday 7th April, 2020 TheHowdy_gitlab 12:32If you run view [rich-text data ["This" font 10 red " is " /font "strange"]] strange gets highlighted red. Is this a known limitation/bug? 12:41[![image.png](https://files.gitter.im/red/bugs/43Nh/thumb/image.png)](https://files.gitter.im/red/bugs/43Nh/image.png) 12:41Hm... the font size get's correctly resetted: view [rich-text data ["This" font 20 red " is " /font "strange"]] hiiamboris 12:43view [rich-text data ["This" font 10 red [" is "] /font "strange"]] this works though 12:44I'm really at big odds with this RTD though, maybe someone else will be able to tell whether this is how it should work or not. toomasv 13:20red is not part of font directive, but standalone, just stating that "start red-colored font from here until it is changed or to the end." 13:21@TheHowdy_gitlab >> view [rich-text data ["This" font 20 red " is " /font black "strange"]] >> view [rich-text data ["This" red font 20 " is " /font black "strange"]] >> view [rich-text data ["This" font 20 red " is " black /font "strange"]] >> view [rich-text data ["This" font 20 red [" is "] /font "strange"]] loziniak 22:57I faced a strange error. My project gets more complicated – more included files and more code. I was developing mostly with interpreter, but when I tried to compile, I started to see this: *** Runtime Error 98: assertion failed *** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/common.reds *** at line: 47 *** *** stack: red/alloc-at-tail 00000062h *** stack: red/alloc-at-tail 005FFAB8h *** stack: red/word/load 00608BD8h Also this happens with similar symptoms: *** Runtime Error 98: assertion failed *** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/common.reds *** at line: 47 *** *** stack: red/alloc-at-tail 00000062h *** stack: red/alloc-at-tail 00617310h *** stack: red/word/duplicate 00CF55F4h Interestingly, it's fairly easy to get rid of this by removing some code. Which code, is not specially relevant. I tried to extract minimal example, but at some point every code I remove results in error disappearing. 23:01When I put print somewhere, nothing gets printed, even if it's on first line of main file. 23:24This affects compilation with -d -r, and not -d -c -u. I cross compile from Linux with -t MSDOS option. Wednesday 8th April, 2020 greggirwin 01:47Is there any way you can compile directly on Windows or MacOS, to see if the problem occurs there as well? And is it only with the GTK branch? loziniak 06:09It happens also on master branch. 08:00When compiled under Windows, result is the same. hiiamboris 09:20Does it crash right on startup? loziniak 09:21Yes, before first line of code gets executed. hiiamboris 09:23I've had this one bug in one of my programs, where both the source file size and even file path affected whether it will work or error out ;) I did not compile though. But point is, sometimes you can't catch the Schroedinger's cat :) 09:26Try [this build](https://github.com/red/red/pull/4097/files) and see if it reports anything of use 09:32@qtxie what kind of stuff goes into the root block? can we do something to bloat it so much that it exceeds reserved size? TheHowdy_gitlab 09:42@toomasv thank you for explaining. May I ask why this design choice was made? Seems kinda inconsistent, at least for me, because all other "directives" (font, bold, etc) have a clear closing-tag / ending. toomasv 09:52@TheHowdy_gitlab I don't know about choice but it's per [grammar in section 2](https://doc.red-lang.org/en/rtd.html#_high_level_rich_text_dialect_rtd). loziniak 10:20@hiiamboris I'll try your PR, but it has conflicts, I'm not sure if I'll be able to resolve them right. Thanks! hiiamboris 10:22You don't merge it, just download and build. If it builds - okay, if not - no big loss ;) loziniak 10:31I tried to merge it. Let's see how bad it will be :-) https://github.com/loziniak/red/tree/red-pr4097 10:39I get the same error. hiiamboris 10:45Ok. Great. Then let's wait for Qingtian's answer ;) loziniak 11:41I tried with your downloaded PR #4097 . My error is gone, so the PR could fix it, or the error was introduced by one of 147 commits since October. qtxie 14:03@hiiamboris Mainly word! in root block. [This commit](https://github.com/red/red/commit/3178f42b714653c4f478a05f37f7f7f60c6b0279) creates many new words in root block. hiiamboris 14:52Thanks @qtxie . I was able to reproduce it with ~6000 set-words and -r -d. qtxie 15:03The compiler should be able to know how many slots were needed in root block in compiled time. https://github.com/red/red/blob/master/compiler.r#L4772 As you can see here, it's add 3000 extra slots for runtime usage. Somehow this commit https://github.com/red/red/commit/3178f42b714653c4f478a05f37f7f7f60c6b0279 broken it. loziniak 15:11How can using this limit be avoided? hiiamboris 15:12@qtxie Thanks for the info :+1: I'll report it. 15:21@loziniak wrap some words in a do [] block (or add -e flag) 15:24https://github.com/red/red/issues/4391 <-- @dockimbel loziniak 15:24only words, or all values in general? hiiamboris 15:25I haven't tried anything but words, can't tell ;) 15:25What do you have a lot of, in your code? loziniak 15:37I try to use contexts as much as possible 15:37and put words inside. hiiamboris 15:41I don't think that matters anymore greggirwin 20:05> May I ask why this design choice was made? Seems kinda inconsistent, at least for me, because all other "directives" (font, bold, etc) have a clear closing-tag / ending. @TheHowdy_gitlab keywords, like [font bold italic ...] are just that, keywords. They are fixed, and so can have a closing tag that matches. Colors, on the other hand, can either be direct tuples or words, and aren't limited to a fixed set of values (e.g. any word that refers to a tuple works, even those you define at runtime). If you use path notation to combine keywords, e.g. i/b/u/red you need to use a block after it. If colors worked like keywords, it opens up a couple questions, as well as complicating the parser: Are colors normalized? e.g. can you do red ... /255.0.0 or vice versa? And does Red need to support tuples in paths, so you can write i/b/u/255.0.0? If this makes sense, please add notes to a wiki page on rich-text or submit a PR to the docs that note it, along with any other clarifications we come up with here. Thursday 9th April, 2020 endo64 22:36Can anyone confirm below issue. If there is whitespace before the closing paren, newline markers are not respected: b: [ (a ) ;space (b) (c ) ;tab (d) (e ) (f) ] probe b output: [ (a) (b) (c) (d) (e) (f) ] 22:38this happens if there are words in the parens: b: [ ("1" ) ("2") ("3" ) ("4") ("5" ) ("6") ] probe b b: [ (1 ) (2) (3 ) (4) (5 ) (6) ] probe b output: ("1") ("2") ("3") ("4") ("5") ("6") ] [ (1) (2) (3) (4) (5) (6) ] Friday 10th April, 2020 toomasv 01:42@endo64 I can reproduce it on W10, and yes, it seems to affect only words in parens, but the reason is not whitespace before closing paren, but **lack of whitespace**. Consider this: c: [ (a) (b) (c) (d) ] == [ (a) (b) (c) (d) ] c: [ (a) (b ) (c) (d ) ] == [ (a) (b) (c) (d) ] c: [ (a ) (b ) (c ) (d ) ] == [ (a) (b) (c) (d) ] endo64 06:05Correct, lack of whitespace. Thanks for testing. dockimbel 12:04@hiiamboris > @loziniak wrap some words in a do [] block (or add -e flag) Will look at that issue this weekend. Saturday 11st April, 2020 meijeru 12:46@hiiamboris I address you specifically because you have found already many issues in View. I stumbled on the following: in an area face, the different lines are not guaranteed to be of equal height in pixels, e.g. with the default fontsize, they are randomly 13 or 14 pixels high, with size 14 they are randomly 20 or 21 pixels high etc. Is this serious in your opinion? IF so, has it already been signalled in an issue, as far as you know? hiiamboris 13:29What scaling factor do you use in Windows? 13:32And how to reproduce it? I am certain this has not been reported 14:03Here's how area looks on W7: ![](https://i.gyazo.com/75c127623b04549c017a1d5ef84117d4.png) 14:04If you zoom in and count pixels - you'll see that each line is equal, even though I'm using 125% scaling. meijeru 14:09My program is the following: Red [] caret-to-line: func [ text [string!] pos [integer!] /local res ][ res: either text/:pos = #"^/" [0][1] while [pos <> 0][ if text/:pos = #"^/" [res: res + 1] pos: pos - 1 ] res ] show-it: func [ /local offset caret line text old-line char ][ offset: 20x0 old-line: 1 old-offset: offset loop 200 [ caret: offset-to-caret test-area offset line: caret-to-line test-area/text caret if line <> old-line [ print [old-line offset - old-offset] old-line: line old-offset: offset ] offset: offset + 0x1 ] caret: 5 loop 7 [ offset: caret-to-offset test-area caret print [caret caret-to-line test-area/text caret offset] caret: caret + 10 ] ] view [ title "test offset-to-caret vv." test-area: area 300x600 {123456789 123456789 123456789 123456789 123456789 123456789 123456789 } font-name "Courier New" font-size 12 return button "Show" [show-it] button "Quit" [quit] ] view win ` 14:12In other words, I display 7 lines of equal text, all in a monospace font, and put the y-offset on every pixel from top to bottom, right through the middle. Then I count which line it is (by counting newlines backwards) and when the line number changes, I note the y-offset difference with the previous line. This is not constant. 14:12 14:16I also go the other way around, by putting the caret on each line, and noting the y-offset. The effect is minimal with size 12, but bigger with size 10, 14 and 18. hiiamboris 14:22I see. 14:24I think it should have to do something with your usage of caret-to-offset and offset-to-caret functions. These two are only implemented for Rich text right now, and will not align with what area displays in any case. I also believe Rich text, using D2D tech, does actually draw lines with subpixel precision, so it is expected to fluctuate a bit. meijeru 14:31Thanks. Fortunately, I do not need that precision anyhow, and I conclude that there is no need for an issue. hiiamboris 14:33:+1: meijeru 14:36I also hit on the following: size-text reports unequal width of single characters even with a monospace font, notably for space and soft hyphen. Shouldn't all chars be equally wixe? In the area even the spaces seem equally wide so it is aqyestion of size-text it seems. 14:36Wide hiiamboris 14:42See my comment here https://github.com/red/red/issues/4179#issuecomment-563967549 14:44To me it's both a Red design oversight (inability to tell what kind of size you want), and lack of flexibility on GDI+ side (which does not provide any "unconcerned" text size). 14:48What I did in Red Code Explorer is size-text on an RTD face of 100x100 chars - to get some approximation of a cell size https://gitlab.com/hiiamboris/red-codex/blob/master/redcodex.red#L159 Oldes 17:49@dockimbel it is now possible to set date's timezone as: >> d: 1-Jan-2000 d/timezone: -24 d == 31-Dec-1999/16:00:00-08:00 >> d: 1-Jan-2000 d/timezone: -100 d == 31-Dec-1999/20:00:00-04:00 >> d: 1-Jan-2000 d/timezone: -1000 d == 31-Dec-1999/16:00:00-08:00 Would not it be better to throw a range error? 21:06And this also does not look as a correct result: >> make time! [-1 2 3.4] == -0:57:56.6 greggirwin 21:53@Oldes the [docs](https://doc.red-lang.org/en/datatypes/date.html#__timezone) note many cases where dates are normalized. On the time! issue, Red follows R2 (closely anyway), where R3 does what I imagine you expect. >> make time! [-1 2 3.4] == -1:02:03.4 But since you didn't say what you think the correct result is, that's just a guess. Oldes 21:55@greggirwin I remember that Carl said, that R2's time! code was so bad and with so many issues, that he rewrite it for R3. This is for example in R2 now: >> make time! [-1 2 3.4] == -0:57:57.-399999999 21:56I believe that R3's result is more logical. greggirwin 21:59It may take some more thinking, as other rules differ as well: R3: >> make time! [-1 -2 3.4] ** Script error: cannot MAKE/TO time! from: [-1 -2 3.4] ** Where: make ** Near: make time! [-1 -2 3.4] Red: >> make time! [-1 -2 3.4] == -1:01:56.6 22:00If you'd like to write a proposal, that would be great. @meijeru can probably provide good input as well. hiiamboris 22:03What Red does makes sense from the 'building blocks in run time' point of view. A sum is predictable. greggirwin 22:04Another case where both options make sense, from different views. :^\ Oldes 22:21I'm happy that I don't have to construct time using this methods! Sunday 12nd April, 2020 hiiamboris 21:01 >> usd$ *** Runtime Error 98: assertion failed *** in file: /D/devel/red/red-src/red/runtime/datatypes/money.reds *** at line: 363 *** *** stack: red/money/set-digit 00000062h 4576441 4575362 *** stack: red/money/set-digit 00396F8Dh 17 244 *** stack: red/money/make-at 00396F88h false 0285F308h 0285F30Ah 00000000h 0285F30Ch *** stack: red/lexer/load-money 0018FC08h 0285F308h 0285F30Ch 0 true *** stack: red/lexer/scan-tokens 0018FC08h false false *** stack: red/lexer/scan 0284F884h 0285F308h 5 false true true false 0018FD58h 00000000h 0284F874h *** stack: red/lexer/scan-alt 0284F884h 0284F874h 5 false true true false 0018FD58h 00000000h *** stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1 *** stack: load *** stack: ctx||430~do-command 0036B910h *** stack: ctx||430~eval-command 0036B910h *** stack: ctx||430~run 0036B910h *** stack: ctx||430~launch 0036B910h *** stack: ctx||448~launch 0036B3A4h 21:01fast-lexer current 21:23Also for @dockimbel : >> 1'0000h *** Runtime Error 98: assertion failed *** in file: /D/devel/red/red-src/red/runtime/lexer.reds *** at line: 1953 *** *** stack: red/lexer/load-hex 00000062h 0047E1D4h 000000FFh 40 true *** stack: red/lexer/load-hex 0018FC08h 0285F309h 0285F30Dh 33554432 true *** stack: red/lexer/scan-tokens 0018FC08h false false *** stack: red/lexer/scan 0284F884h 0285F308h 7 false true true false 0018FD58h 00000000h 0284F874h *** stack: red/lexer/scan-alt 0284F884h 0284F874h 7 false true true false 0018FD58h 00000000h *** stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1 *** stack: load *** stack: ctx||430~do-command 002FB910h *** stack: ctx||430~eval-command 002FB910h *** stack: ctx||430~run 002FB910h *** stack: ctx||430~launch 002FB910h *** stack: ctx||448~launch 002FB3A4h >> -10h *** Runtime Error 98: assertion failed *** in file: /D/devel/red/red-src/red/runtime/lexer.reds *** at line: 1953 *** *** stack: red/lexer/load-hex 00000062h 0047E1D4h 000000FFh 46 false *** stack: red/lexer/load-hex 0018FC08h 0287F308h 0287F30Bh 2097152 true *** stack: red/lexer/scan-tokens 0018FC08h false false *** stack: red/lexer/scan 0286F884h 0287F308h 5 false true true false 0018FD58h 00000000h 0286F874h *** stack: red/lexer/scan-alt 0286F884h 0286F874h 5 false true true false 0018FD58h 00000000h *** stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1 *** stack: load *** stack: ctx||430~do-command 01F8B910h *** stack: ctx||430~eval-command 01F8B910h *** stack: ctx||430~run 01F8B910h *** stack: ctx||430~launch 01F8B910h *** stack: ctx||448~launch 01F8B3A4h greggirwin 21:23 >> usd$ == USD$4.00000 21:26On fast-lexer here as well. hiiamboris 21:28:) 21:28I'm using debug console! 21:28 >> load "1.#nan" == 1.#NaN >> 1.#nan *** Syntax Error: (line 1) invalid float at 1.#nan *** Where: transcode *** Stack: load 21:29This one I don't understand... Probably starting state is busted Monday 13th April, 2020 dockimbel 08:35@hiiamboris Thanks, good catches! 16:10All the above syntactic issues have been fixed. hiiamboris 16:18:+1: ;) 16:47@dockimbel why we don't allow negative hex number literals btw? like -10h dockimbel 17:52@hiiamboris Because we use literals hex numbers to represent unsigned 32-bit values. One common use-case is bit-maps. 21:01I meant "bit-masks". Tuesday 14th April, 2020 dockimbel 19:29@hiiamboris @loziniak I have pushed a fix for https://github.com/red/red/issues/4391, please confirm if it works for you too. hiiamboris 20:02@dockimbel works for me! dockimbel 20:04Great! :+1: Wednesday 15th April, 2020 Oldes 11:20Should find on bitset! allow case-insensitive lookup of chars? Now it is: >> find charset [#"A"] #"a" == none >> find/case charset [#"A"] #"a" == none Wouldn't it be more logical to have the first one return true? 11:29Related is: >> parse "A" reduce [charset "a"] == false >> parse/case "A" reduce [charset "a"] == false 11:29again, shouldn't the first one return true? As it is with: >> parse "A" [#"a"] == true >> parse/case "A" [#"a"] == false hiiamboris 11:33Maybe we should collect all our char-related designs into a wish ticket? meijeru 13:05The design intention, as far as I know, has been consistency, in that char! - char! comparison is always case-sensitive, but string! - string! comparison is case-insensitive by default. So the parse "A" [#"a"] example points to an internal inconsistency of parse where a rule that is a single character is treated differently from a rule that is a charset. This is still independent, in my mind, from the case-(in)sensitivity of find. dockimbel 14:21@Oldes No. A bitset is an array of bits. Char! values are used to individually name those bits. Each char! value maps to a single bit and each single bit maps back to a single char! value. They are not the only way to access them. >> to-integer #"a" == 97 >> to-integer #"A" == 65 >> b: charset [65] == make bitset! #{000000000000000040} >> find b 65 == true >> find b 97 == none >> b: charset [65 97] == make bitset! #{00000000000000004000000040} >> find b 97 == true >> find b 65 == true Oldes 14:38I know this, but as there is pick and find, maybe find could provide other functionality, couldn't it? meijeru 15:03@dockimbel What about the parse difference in treatment? That could become an issue? Or is it a feature? Oldes 15:41Btw... this was BrianH's comment on case sensitivity of bitsets with chars when using find (from year 2014): > as long as we limit the case-insensitivity to finding char! values, not finding integers. When you are finding chars, case-insensitivity is a thing, so it makes sense to be consistent with the rest of Rebol. But when finding integers, case is not a thing, and we should be sure to not make it a thing endo64 15:49But #"A" = #"a" is false, in that case this should also true, no? meijeru 15:59See my remarks above. They were based on an explicit question about policy. BTW this shows how the writing of a more formal specification leads to clarifications. dockimbel 16:39@meijeru > @dockimbel What about the parse difference in treatment? That could become an issue? Or is it a feature? I don't see any issue there, a bitset is not a string, nor a collection of chars (though, it's equivalent to a _set_ of chars). >> reduce [charset "a"] == [make bitset! #{00000000000000000000000040}] >> parse "A" reduce [make bitset! #{00000000000000000000000040}] == false >> parse "A" [#"a"] == true I don't see why matching a bitset! and a char! should be strictly equivalent when the two types are very different. 16:40Remember that charset "a" is no more than a friendly constructor. We could just restrict bitset values constructions to binary! and integer! values, and it would still work just fine. 16:46A bitset is often used for representing a map (so a 1 to 1 relation) of ASCII characters (R2) or Unicode codepoints (Red/R3), but that is just _one_ possible usage for bitsets. You could use it to map specific values in a series, and I don't think you would like that bit 65 returns true if bit 97 is set. ;-) hiiamboris 17:08Perhaps we could make 'charset' some kind of special bitset. I think the arguments above are about giving /case a meaning, which is a cool idea. But how to implement it without a loss of efficiency is another question. dockimbel 17:22I don't see which problem you are trying to solve. Supporting case-insensivity in bitset is simply done by including upper/lower case versions of a character. >> rule: reduce [charset "aA"] == [make bitset! #{00000000000000004000000040}] >> parse "A" rule == true >> parse "a" rule == true 17:24This approach even gives you the extra advantage of selecting which characters are matched in a case-insensitive way and which aren't. Oldes 17:45Ok, so the conclusion is, that bitset! is always treated like case sensitive, not matter if /case switch is used, right? greggirwin 18:29Maybe better to say that bitsets store bits, which have no case. In that case, we could have find/case throw an error when used on a bitset. Except that almost all the other refinements have no meaning there either. Red has some broad and powerful funcs, like find and select. They deserve deep treatment in the doc area. 19:09@meijeru, my rationale is that they are different, and use different rules. As @dockimbel noted, we could remove charset to make that clearer, but I don't think that will help. It's also easy to explain, in that using charsets you need to include both cases of a character, if that's what you want. If you parse a binary!, /case is implied, correct? >> b: to binary! s: "Ab" == #{4162} >> parse b ["AB"] == false >> parse b ["Ab"] == true How values are matched depends on those values. A bitset is not *really* a set of characters, though we can translate between them. Once made, a bitset is simply bits. To @Oldes' point, I don't think we should says bitsets are treated case sensitively, but more like matching a binary value. meijeru 19:10Thus the user has to realize that parse "A" [#"a"] is equivalent to " is there an a or A in "A" ", whereas parse "A" reduce [charset "a"] is equivalent to "is there an a in "A" " -- subtle difference! greggirwin 19:11For anyone using the latest build (fast lexer here, but may apply to master too), does the last line in the GUI console not scroll into view correctly? 19:12Yes, they do need to understand how bitsets work in parse. 19:12Seems my GUI console image example doesn't want to post. 19:13[![image.png](https://files.gitter.im/red/bugs/aJ3L/thumb/image.png)](https://files.gitter.im/red/bugs/aJ3L/image.png) dander 19:15Is there a way to get all case-variants for a given char? With something like that it wouldn't be too hard to switch between case sensitivity modes. I don't know if it is more complicated with non-latin alphabets. greggirwin 19:19There's nothing built in @dander, but you should be able to build it. Look at runtime/case-folding.reds runtime/case-folding-table.reds. dockimbel 19:34@greggirwin I get the same annoying issue. @qtxie ^--- Thursday 16th April, 2020 qtxie 01:23Maybe a rounding issue. (float line height convert to integer). 01:43Ah, because the change of /. page-cnt should be an integer!. >> probe gui-console-ctx/terminal/page-cnt 30.529411764705884 01:53All the divisions in the source code of the gui-console expects integer!. I pushed a commit to fix it. greggirwin 02:52I suspected that as the cause. Thanks for the quick fix @qtxie. Works fine here. ne1uno 05:32 community code-master\Scripts\tiger.red draw code regression? face mangled 05:33^fast-lexer 06:07view/no-wait [base snow draw [translate 40x40 spline -31x6 -17x8 8x-11 27x1 10x3 -10x22 -23x20 -31x5]] 06:07simpler example, shape different in some branches. not sure is same problem with tiger.red Oldes 10:13Is this correct output?: >> to-path %a/b == %a/b >> mold to-path %a/b == "%a/b" I would not expect the % decoration in these cases. As it is not there: >> to-string %a/b == "a/b" 10:14Btw... wouldn't it be useful, to split the file into path parts? Not it is: >> length? to-path %a/b == 1 10:20(I understand why it is how it is now.. that path! is just a different variant of block!). I'm just asking if it could not be better. dockimbel 10:23@ne1uno > community code-master\Scripts\tiger.red draw code regression? face mangled Thanks! @qtxie Please have a look. 10:57> Btw... wouldn't it be useful, to split the file into path parts? That's the role of split-path: >> split-path %a/b == [%a/ %b] We should probably tighten the number of types allowed when converting to path, though even R3 didn't bother with that. 11:00The number of values forms that you can create using make and to will always be greater than the number of loadable forms. We need this flexibility for supporting incremental value construction. Though, we need to better define the frontier for some types, to avoid security issues or just too confusing cases. Oldes 11:05Yeh... I see. and also path can be in a form like: %/a and so there would be empty slot in the path :-/ 11:12Hm... dealing with all these to-* combinations is really a big task :-/ dockimbel 11:21@Oldes Indeed: https://github.com/red/red/blob/master/docs/conversion-matrix.xlsx Oldes 11:44That is useful document, shame that one have to first download to see it ;-) 14:06What about this one? >> to percent! 1e+13 == 1e15% >> 1e15% *** Syntax Error: (line 1) invalid float at 1e15% *** Where: transcode *** Stack: load greggirwin 21:53@hiiamboris :point_up:, have you hit this one? hiiamboris 22:59I can reproduce it on the fast-lexer branch 22:59it doesn't accept 1eN% form Friday 17th April, 2020 greggirwin 00:52Breakpoint is e11. >> to percent! 1e+10 == 1000000000000% >> to percent! 1e+11 == 1e13% >> 1e1% qtxie 02:17There is a bug in fast-lexer branch when loading negative pair. >> -123x456 == -123x56 >> 123x-456 == 23x-456 02:51 >> +123x456 == 251123x456 >> 123x+456 == 123x251456 Oldes 11:41@greggirwin mentioned this example in red/red: >> round/to 123.4% 10 == 1 I don't get the result... should not it be 0 like when one do: >> round/to (probe to float! 123.4%) 10 1.234 == 0 11:43This type juggling is really mind screwing :-/ 11:45This one seems to be wrong too: >> round/to 123.4% 10% == 1.234 I expect it to be 120% toomasv 12:09It is worth to turn it back into percents: >> to-percent round/to 123.4% 50% == 123.5% >> to-percent round/to 123.4% 500% == 125% >> to-percent round/to 123.4% 100% == 123% >> to-percent round/to 123.4% 200% == 124% >> to-percent round/to 123.4% 1000% == 120% >> to-percent round/to 123.4% 10000% == 100% dockimbel 12:47@Oldes > What about this one? > > >> to percent! 1e+13 > == 1e15% > >> 1e15% > *** Syntax Error: (line 1) invalid float at 1e15% > *** Where: transcode > *** Stack: load > Scientific notation is not part of accepted input forms for percent!, but it can arise as a result of calculations, because percents use floats as internal representation. So you can still use expanded notation to represent big percent values (if you can find any use-cases for that): >> 10000000000000% == 1e13% 12:49@qtxie Thanks, will fix them asap. Oldes 12:50@toomasv if there is: >> round/to 123.4 50 == 100 I expect that than: >> round/to 123.4% 50% == 100% ;<--- not 123.5% 12:51(how it is in R3) 12:53 >> to-percent round/to (to-float 123.4%) (to-float 50%) == 100% 13:01(I don't say that R3 is correct in all cases - there are also inconsistencies, just that above percent results in Red seems to be strange to me) 13:03And although some type combinations may be very rare (or even without sense), I can imagine that rounding percents may be quite common need. hiiamboris 13:04@Oldes yeah I noticed that too... >> to percent! round/to 123.4% 10 == 100% >> to percent! round/to 123.4% 10.0 == 120% >> to percent! round/to 123.4% 1000% == 120% I think all three are wrong - should be 0, 0.0 and 0% (and then 0% after to) 13:06> This one seems to be wrong too: > > >> round/to 123.4% 10% > == 1.234 > > I expect it to be 120% I agree here as well. 13:14> Scientific notation is not part of accepted input forms for percent!, but it can arise as a result of calculations, because percents use floats as internal representation. So you can still use expanded notation to represent big percent values (if you can find any use-cases for that): > lisp > >> 10000000000000% > == 1e13% > @dockimbel though that makes percent values not round tripping in mold/load. And is a regression (it works in the master branch). BeardPower 13:14Is this a bug? @BeardPower Hey there. Does anyone know what is missing here? copy/deep is having the same effect. It does not create a copy: >> a: context [f: make face! []] == make object! [ f: make object! [ type: 'face o... >> b: copy a == make object! [ f: make object! [ type: 'face o... >> a/f/offset == none >> b/f/offset == none >> a/f/offset: 119x22 == 119x22 >> b/f/offset == 119x22 >> a: context [f: make face! []] == make object! [ f: make object! [ type: 'face o... >> b: copy/deep a == make object! [ f: make object! [ type: 'face o... >> a/f/offset: 119x22 == 119x22 >> b/f/offset == 119x22 13:15Nested object!s are not copied. hiiamboris 13:16https://github.com/red/red/issues/2167 13:17Also see the discussion here https://github.com/red/red/issues/2254 BeardPower 13:24So without I have to use manual copying/assigning ob data. 13:25I need to create a face factory so to speak. hiiamboris 13:31Yep ;) 13:38But let me ramble a bit more about percents... If we disable scientific notation, how do we mold things like mold/all 1e-500% ??? With 500 digits? ;) dockimbel 14:37@qtxie Fixed. 14:41@hiiamboris > though that makes percent values not round tripping in mold/load. And is a regression (it works in the master branch). Such round-tripping is desirable but not an absolute goal to reach. See :point_up: [April 16, 2020 12:57 PM](https://gitter.im/red/bugs?at=5e983a20c7dcfc14e2c0df60) A regression is an unwanted change, so that one is not a regression. ;-) 14:43@BeardPower > Nested object!s are not copied. There is no such thing as "nested objects". It's an illusion. Your object contains a reference to another object (a face! object), that's all. ;-) Therefore copy/deep does what it is meant for. Duplicating graphs of objects is beyond copy's scope. 14:46@hiiamboris > But let me ramble a bit more about percents... If we disable scientific notation, how do we mold things like mold/all 1e-500% ??? With 500 digits? ;) I don't have strong feelings about percent! ranges. I can't think of any usage of percentages that would require 13+ significant integral digits. The only case where a large range could help is for dialecting, when someone reassign different meaning to the percent! datatype. So for the sake of dialect expressivity, I'm not against reverting percent! literal values to full float forms. toomasv 14:47@Oldes I don't say, it is correct or wrong, just helps to understand its working: >> round/to 1234.56% 100.0 == 12.0 >> round/to 1234.56% 100'00.0% == 12.0 >> round/to 12.3456 1.0 == 12.0 >> round/to 12.3456 100% == 12.0 BeardPower 16:41@dockimbel Yes, but why not treating it as a copy and not as a reference? 16:43I have a button widget in a context. The button widget is a reference/not copied. So what is the usual way to go? Not using a context? Using an init/factory method, which will return a new face? 16:44Like button: [ ;context [ ;style button: base 160x90 255.255.255.0 init: do [ make face! [ ... 16:59init: [make face!...] do button/init 17:32I found a nice solution. I create the spec of my widger and then create the face with that spec. greggirwin 19:49@BeardPower, on object cloning, you just need to do it yourself. Red doesn't because then we'd need to add a way to *not* do it, and it's a heavy process to do by default. clone: function [ "Deep make an object" object [object!] /with spec [block!] "Extra spec to apply" ][ cloners!: make typeset! [object! map! bitset!] new: make object any [spec clear []] foreach word words-of new [ val: get in new word if find cloners! type? :val [ new/:word: either object? val [ clone val ][ copy/deep val ] ] ] new ] >> o: object [sub-o: object [b: "test"]] == make object! [ sub-o: make object! [ b: "test" ] ] >> oo: clone o == make object! [ sub-o: make object! [ b: "test" ] ] >> same? o/sub-o oo/sub-o == false >> same? o/sub-o/b oo/sub-o/b == false 19:56On percents and e notation, I haven't been able to think of a case where such huge percentage values would be useful. Even in dialects its questionable to me, because the meaning of the sigil is so clear, and extremely small values shift to parts-per notation even before the current limit we're talking about. When percents are based on a decimal type, rather than float, that type should also support e notation, so it shouldn't break anything. But we can also range limit percents to facilitate round-tripping. Or we can just warn people. :^) hiiamboris 20:00Personally, without round-tripping, I wouldn't use percents at all (because I would expect it to break, and I don't want my code to break). greggirwin 20:02Even if it worked 999999999999.99% of the time (ignoring float errors)? ;^) 20:05Round tripping is always high on my list, but there are a lot of ways to create non-loadable values. If we can't eliminate all of them, or choose not to, the next best thing is to know when they occur, so we can warn people "Don't *do* that!" 20:07On round, it would be *great* to have a matrix and notes on current behavior. Linear chat is bad for making progress on things like that. @Oldes would you start a wiki page and notes for that? 20:10Is anyone *against* range limiting percents? If not, what should the limits be? BeardPower 20:18@greggirwin Thanks! hiiamboris 20:20> "Don't do that!" Like, don't save percent values or you won't load them? ;) 20:21> Is anyone *against* range limiting percents? If not, what should the limits be? I am. Don't see any reason for such complication and performance loss. greggirwin 20:32Don't use percents for large values is what I mean. Usability is driven by complications and performance loss. :^) hiiamboris 20:35So how does it improve usability? greggirwin 20:39By eliminating e notation for percents, and guaranteeing round-tripping. 20:40Is there a domain where the two are used together? hiiamboris 20:42Spreadsheets? 20:44I'm using percents in Red where the value represents part of something. This part can be very small. greggirwin 20:48A spreadsheet will never, AFAIK, use e notation if a cell is formatted as a %. 20:49How small is very small, in your example? 20:51And we can still represent them without e notation, which I'm OK with. hiiamboris 20:58> How small is very small, in your example? Depends on what one is working on. I can't pretend to have exhausted all use cases in the world, can I? ;) If it's a pixel area, then smallest number is 1px of image size, so think 1e-6% tops. If it's geometric area, then can easily be near zero as trigonometry is never exact. If it's intensity of something then too you can expect any value between 0% and 100%, including near-zero variants. If it's profiling and percentage of full run time, then 1microsec / 1hour which is ~1e-8% is possible. Just first things that came to my mind. 21:01I don't see how even a dozen of zeroes makes things more readable or writeable. I can see however how a hundred of zeroes would make the saved or molded/all output look like garbage, so what's the win in usability? greggirwin 21:07We can't exhaust them, but we can look for evidence. I haven't found any yet. Good firings. I agree that huge literal numbers aren't nice to look at. That's why I suggested range limiting instead, because my brain says that e notation and percents don't go together. Find examples, and we can evaluate those. If they don't exist (i.e. we can't find them), that tells us something. Long strings of digits do tell us something visually though, which e notation does not. The difference between 1e-5% and 1e-15% may not jump out at you, but .00001% and .000000000000001% look very different. 21:10Once we find cases of extreme percent values, e-noted or otherwise, then we ask how common they are. If they happen .001% of the time, are they worth supporting? 9214 21:17Percent is a mathematical [notation](https://en.wikipedia.org/wiki/Parts-per_notation), first and foremost. There are also [per mille](https://en.wikipedia.org/wiki/Per_mille) and [per ten](https://en.wikipedia.org/wiki/Basis_point), which is an alternative way of how ratios can be molded. 21:30@9214 per ten thousand that is. hiiamboris 23:29> Long strings of digits do tell us something visually though, which e notation does not. The difference between 1e-5% and 1e-15% may not jump out at you, but .00001% and .000000000000001% look very different. So we can mold percents as fixed numbers while they're in range, say, 1e-9% <= x < 1e10% (personally I'm having troubles counting to more than nine ☻), and exp otherwise, but load any form given. greggirwin 23:38That doesn't answer the question of whether e notation has ever been used, by anyone, for percents. If not, do we support it just because it's a convenient side effect of the implementation? My problem with that is that Red's datatype forms help us think about what we're expressing. And if we decide to support e notation it's there *forever*. If we disallow it, supporting it later is a non-breaking change. 23:48And if we range-limit percents, that limit could be increased later, but not restricted more. It's an interesting look into dependent types, and the value (or pain) of constraints. Certainly we're glad to have more than 16 bits now, and don't use just 2 digits for years in dates, but computers can deal with things humans can't. Is there value is supporting more than 10'000'000'000%, or less than 0.000000001%? Is there a chance someone will type 1e-1%, when they meant 1e-15? Should probably be in red/red for this design related chat. 23:51This is all very interesting to me, because that's what strict typing aims to solve, but that's programmers living in our make-believe worlds and their rules, often with not thought about what makes sense in the real world. Saturday 18th April, 2020 qtxie 03:36@dockimbel Good! Tiger demo works fine now. 9214 09:35E-notation and percent notation are incompatible, and to me looks like an omission in percent!s mold, which is a thin wrapper on top of float!. The former denotes "10 to the power of", the latter denotes "ratio of 100", so using both at once is superfluous at best, because it means "10 to the power of X, but subtract 2 from X because of 100 in percent". Furthemore, ratios can be expressed in many ways, not just with percents, so that's also a questions of new datatypes and literal formats (e.g. 1/2 or 1:2). hiiamboris 09:36> Is there value is supporting more than 10'000'000'000%, or less than 0.000000001%? Precision and performance 9214 09:40It's float underneath, what kind of precision are you talking about? hiiamboris 09:45Well, if you do limit it to become e.g. zero if it's less than 0.000000001%, that would mean a precision loss, esp. in all intermediate results, as well as a cascade of unnecessary checks during each operation, if only to worsen the result. I don't know guys, to me the whole idea is self sabotage. 9214 10:06Since you talk about precision and performance, what stops you from expressing parts-per as two numbers, instead of dividing them and converting the result to a percent? hiiamboris 10:08What's stopping me from using just floats? Only that percent saves me a step or two and adds a meaning to the number. 10:14I'd also love if form percent stopped after 3 significant digits. I'd rather see 89.2% than 89.2161396515281%. For now I'm forced to apply a custom truncation. Oldes 11:14Should be noted, that Carl initially also [limited the percent value](https://www.curecode.org/rebol3/ticket.rsp?id=261), but it was changed back than so scientific notation is supported in R3. 11:15@hiiamboris it would be nice to be able set the number of decimal digits for formed values thru system/options hiiamboris 11:28R3 pretty molding range seems to be 1e-6% <= x < 1e15% >> 1.0e-6% == 0.000001% >> 1.5e-6% == 0.0000015000000000000002% >> 1e-7% == 9.999999999999999e-8% >> 1e14% == 100000000000000% >> 1e15% == 1e15% greggirwin 19:09@Oldes good find on that Rebol bug fix. > Precision and performance @hiiamboris, I will *almost* always push back on that at a general argument. If they come for free, that's great, but they often come at a cost. For performance, what are the most computationally intense uses of percents? Once we go to a decimal implementation, performance takes a bigger hit, but we *do* want to go decimal with it. Can we agree on that? > Only that percent saves me a step or two and adds a meaning to the number. Precisely. Once we've saved steps and added meaning with %, we throw it away again with e notation, because (agreeing with @9214 here) they aren't "compatible". I don't mean numerically compatible, but in how we think about them and use them. So I will ask once more, to find examples, *any* examples, where the two are combined in the real world, and the cases where the most precision is used with a percent (though I think we're OK here for now). If the former don't exist, there is no "use case", failing to identify a new and unique one, and it's not a necessary feature. Can we agree on that? hiiamboris 19:35You are clearly mixing the percent as an intermediate internal computation result, and percent as a pretty formatted output for the end user, and drawing conclusions from the latter onto the former. 19:38Look at it this way: suppose you decided on a range where percents are useful. Suppose, 1e-A to 1e+B. Within this range they are guaranteed to be molded as fixed point literals. And you'd rather write more code, knowing that by doing it you're harming precision - only to not let anyone use values *outside of the range you care about*? Why? greggirwin 19:48I *think* what I'm saying, at least what I intended, is that I would like to see where extreme percent values are used, if they are, so we can tailor percent to be most effective in its domain. Just as you ask for when they are formed. 19:51This is the part of design that is challenging, filled with overlap and gray areas. Constraints help us, enormously, until we run up against them like a wall. Then you need something that lets you get past the wall, but 90% of the time, the constraints eliminate a bunch of things you'd otherwise have to think about. 19:53This should probably all go in a wiki, or at least ref'd from one, so we can write out arguments and conclusions more effectively. It's a good chat though. 19:58Outstanding questions: - Once we go to a decimal implementation, performance takes a bigger hit, but we do want to go decimal with it. Can we agree on that? - If [e notation examples] don't exist, there is no "use case", failing to identify a new and unique one, and it's not a necessary feature. Can we agree on that? - Examples and performance critical use cases I'm pressing on this, to try and make progress. Otherwise we'll just keep going round and round. hiiamboris 20:04> Once we go to a decimal implementation, performance takes a bigger hit, but we do want to go decimal with it. Can we agree on that? What's the advantage of decimal, other than that it fixes one formatting issue? greggirwin 20:19Percents deal in 100ths, which FP doesn't. 9214 20:20Percent is already a pretty-printed floating number for that matter. hiiamboris 20:22> Percents deal in 100ths, which FP doesn't. And so the advantage is...? ;) greggirwin 20:33No floating point errors. 20:33Same reason money! doesn't use FP. hiiamboris 20:37Hmm ;) Have you had to deal with these floating point errors, ever? It seems to me you're pushing for a very ephemeral precision improvement with Dec64 (against the principle of pushing back on precision arguments), and then ready to discard it (and lose a good deal more) by limiting the percent range. 20:41Money is way less precise than FP. It's only advantage is more of a legal thing - in that it uses for calculations only what you see on the screen. greggirwin 20:49> Have you had to deal with these floating point errors, ever? Absolutely, directly, in depth. It's also a great irony to me that we gave up decimal precision when so much software deals with money. FP is great for scientific computing, but decimal accuracy works fine there too. :^) We also can't conflate precision with accuracy. 9214 20:51TL;DR is this: the whole point that @greggirwin makes, as I understand it, is to limit the range so that the e-notation doesn't creep in, which in turn is a by-product of internal floating-point implementation. If (or once) percent! becomes decimal-based, the issue will be gone, and the limit will become totally arbitrary. Then there's a question of how practical such astronomically small/large percentages really are, and if such impracticality is enough of an argument to limit the range — not only because of the formatting issues, but because otherwise it defies the intent of expressing accurate ratios by introducing floating-point errors. OTOH, if percent! is decimal-based, we will still face the problem of expressing too small or too big ratios nicely. Forbidding such ratios in the first place (by limiting the range) is a possible solution, but IMO impedes datatype's purposefulness. Then there's a question of use-cases and intentionality: why do we have percent! at all, and wouldn't it be better to have e.g. rational! for accurate and precise ratios? greggirwin 20:51> It's only advantage is more of a legal thing - in that it uses for calculations only what you see on the screen. Not so, which is why money! goes out to 5 places. We can argue that the world should change it's ways, but that's the world we live in, and will for some time. 20:54@hiiamboris if you want to push for e notation and keeping % as FP for full precision, please address my questions above. hiiamboris 21:02> Examples and performance critical use cases Any operation on a vector of percents. > If [e notation examples] don't exist, there is no "use case", failing to identify a new and unique one, and it's not a necessary feature. Can we agree on that? It is obvious that percent, being a *linear* representation of some whole part (considered to be 100%), won't benefit from astronomically small numbers as a final value. So I can't argue here. I'm only worried about cases where you have an x as percent, and in your formula maybe it uses x ** 4 then some intermediate calculations, then goes back to result ** 0.25. If you have 10 digits of precision after zero, for x ** 4 it's effectively 2.5. Thus, generality of this type suffers. Everytime you use it you would have to think - will it even work? If you don't clip it, but only prettify the mold output, you can't load the same value because it will not be what you molded/saved. In your vision, percent shifts from generally applicable number type to an output-only type. At least that's my understanding of it. mold/load issue can be solved by giving it a form #[percent! float-number]. But I don't see it any better than just float-number*100% 9214 21:03The whole point of percent is that you divide a thing into 100 parts and say how many of them are taken. Things like 200% and 23.5% happen when you divide the wrong thing; it's supposed to live in a 0-100 range. hiiamboris 21:07> The whole point of percent is that you divide a thing into 100 parts and say how many of them are taken. Things like 200% and 23.5% happen when you divide the wrong thing; it's supposed to live in a 0-100 range. Can't agree. If a is 10% of b then b is 1000% of a. You can compare the solar mass to that of the Earth and show in it percents (around 33300000%), especially if you are also displaying masses relative to other planets in the same table (or other planet masses relative to Earth's). 9214 21:11Saying that a:b = 10:100 = 1:10 is already enough, there's no need for 1000%. But yeah, it would be a crime against [memes](https://www.youtube.com/watch?v=SiMHTK15Pik) to forbid things like 9000% or 146%. We can't allow that. hiiamboris 21:11:D Oldes 23:08https://www.curecode.org/rebol3/ticket.rsp?id=1504 Sunday 19th April, 2020 greggirwin 20:11> Any operation on a vector of percents. Let me clarify. Concrete examples and performance criteria. e.g. a mortgage origination what-if system that has to process 4 scenarios (30 year term, some adjustable rate and bracketed calcs), ~.5M calcs, in ~1s. Now that's *very* specific, which is great but not required. For your example, where is an operation on a vector of percents used in the real world? That can guide us to "How big are the vectors? How fast does it have to be?" ("As fast as possible" is not a number. :^) While awaiting answers to my questions, I'll pose another view. If we range limit percent today, and forbid e notation, we can relax those rules later. That can create compatibility issues over time, so would be best to avoid it. But, if we don't range limit, and allow e notation, we can never go back. That would be a breaking change rather than an "extension". > Thus, generality of this type suffers. This comes back to constraints, and balance, and why I'm pressing for examples. Generality isn't a universal good. It has a cost. hiiamboris 23:41Is this right? >> length? [<"">] == 3 Monday 20th April, 2020 greggirwin 00:20Yes. >> print mold [<"">] [< "" >] 00:22R2 loaded it as a single tag, but Red matches R3 in this case. 00:24Docs need to be more precise. @meijeru, do you have this edge case (leading <") in your spec? 00:26Need to find the right link. I have old versions bookmarked here it seems. 00:29Got it. 00:30Yes, @meijeru has it in his spec. meijeru 07:56Section 5.2.11: A is written as one or more characters, not starting with a whitespace character or one of < = > [ ] ( ) { } " and not containing ;, enclosed in < >. hiiamboris 09:28Thanks. Tovim 15:08I agree with @9212 at Apr18 23:11. The expression, say 120% is in a semantic contradiction with the very term of percent (%): **1% = 1 part-per cent** (hundred). Is it still true to say that 120% = 120 parts-per cent? Maybe yes, but for parts less than one. It seems to me that only few languages use percent thing. Probably with a good reason. greggirwin 15:24You can easily have values greater than 100%, with no contradiction. More accurately than parts "per cent" is parts "per hundred". It is simply a proportion. We *could* (as I have pressed for constraints) make percent very tightly constrained, from 0 to 100, but that would force you to use another type for even 150%, which is a small (and quite common, range wise) ratio of 1.5:1. We could also say percent! is 0-100, and percentage! has a wider range, but then we need a separate form, and I think that would be more confusion. I think it's better to push the 0-100 rule into the area of dependent (constrained) types, where it can be a foundational example. 15:25More languages *should* support percent, IMO, because it's so widely used. They may not because it's less efficient, due to most langs using FP numbers and relegating decimal to bignum support if they have it. hiiamboris 15:25@tovim So I suppose you never zoomed an image to more than 100%, and never saw comparison graphs where the times were normalized to a minimal result. 15:26This talk starts feeling so surreal to me that I wanna pinch myself. greggirwin 15:30@hiiamboris welcome to playing God. :^) hiiamboris 15:32:) greggirwin 15:34We could make Rich Hickey happy and call it per-centum!. ;^) Tovim 18:24Parts-per cent has the same meaning as parts-per hundred. Apologies to all excited. Wednesday 22nd April, 2020 endo64 09:38Worth an issue I suppose: >> v: make vector! [1 2 3 4 5 6] == make vector! [1 2 3 4 5 6] >> extract v 2 == make vector! [0 0 0 1 3 5] >> extract v 5 == make vector! [0 1 6] >> extract v 20 == make vector! [1] >> extract v 1 == make vector! [0 0 0 0 0 0 1 2 3 4 5 6] hiiamboris 10:19indeed endo64 10:54https://github.com/red/red/issues/4409 👍 9214 14:27To fuel up the fire again. Master: >> to percent! "100" == 10000% >> to percent! "100%" == 10000% Fast lexer: >> to percent! "100" == 10000% >> to percent! "100%" *** Script Error: cannot MAKE/TO percent from: 100% *** Where: to *** Stack: Friday 24th April, 2020 meijeru 13:39Observation: to-string! will use UTF-8 decoding, whereby incorrect encodings will lead to an error, but trailing incomplete encodings will be ignored without warning, e.g. to-string #{E9} ==> "". Bug or feature? dockimbel 15:47Invalid UTF-8 encoding should result in an error. meijeru 17:33I conclude this should be an issue. see #4412 Saturday 25th April, 2020 Oldes 11:27@dockimbel I know that there is no modified? function yet and there is just the query _hack_ returning modification date of file (was it made by me?). I wanted to ask you, if it is good or not good to have the milliseconds there? >> query %/r/x.html == 24-Apr-2020/18:16:01.11 @greggirwin do you think that someone may need such a precision there? Also the date is now as UTC, without zone... again.. I wonder if it is user friendly or not :-/ dockimbel 12:24@Oldes > I wanted to ask you, if it is good or not good to have the milliseconds there? If it's available in the filesystem through the standard OS API, we should support seconds decimals. Oldes 12:44Hm... probably it is better to have the precision as one may want to use it not just for user output (as I'm now), but also for comparing if file is newer/older. 12:45There really should be some sort of date/time formatting, because doing it manually with all the padding is so annoying. hiiamboris 15:19Current ref! implementation works in console only. Any occurrence in source files leads to: *** Script Error: parse does not allow ref for its input argument *** Where: parse *** Stack: expand-directives expand 15:21Though it must be a known thing ne1uno 15:40silent exit in gui hiiamboris 15:56Let's wait for them to merge the PRs I guess rebolek 19:33 >> parse [1 2 3 4][collect [keep integer! collect [some keep integer!] keep integer!]] == [1 [2 3 4]] I was expecting [1 [2 3] 4]. hiiamboris 19:35You forgot keep before collect rebolek 19:36What do you mean? 19:36Oh , I see 19:37Now it's even more confusing: >> parse [1 2 3 4][collect [keep integer! keep collect [some keep integer!] keep integer!]] == [1 [2 3 4] [2 3 4]] hiiamboris 19:38Haha! that's funny indeed toomasv 19:39@rebolek Why did you expect [1 [2 3] 4]? hiiamboris 19:42I must be wrong, collect already works as keep, so no need in another keep. rebolek 19:43@toomasv There is outer and inner collect. What else should I expect? hiiamboris 19:43He means that some takes 4 as well toomasv 19:43some eats it all up. >> parse [1 2 3 4][collect [keep integer! collect 2 keep integer! keep integer!]] == [1 [2 3] 4] rebolek 19:43Oh. 19:43I'm stupid. toomasv 19:47Happens even to the best :stuck_out_tongue: greggirwin 20:56@oldes, file timestamp should have the zone, since we can easily get UTC from that. On formatting, feel free to review and play with [this](https://github.com/greggirwin/red-formatting) 21:21@hiiamboris ref! problem duped here. Monday 27th April, 2020 Oldes 09:58@dockimbel how is take/deep suppose to work? I was checking this @greggirwin 's [CC ticket](https://www.curecode.org/rebol3/ticket.rsp?id=171) . There was no copy in R3... and in Red there is: >> a: [2] b: reduce [1 a 3] probe head insert last probe take/part/deep b 2 'x a [1 [2]] [x 2] == [2] >> a: "2" b: reduce [1 a 3] probe head insert last probe take/part/deep b 2 'x a [1 "2"] "x2" == "2" But it looks that it does copy only on series... for example there is no copy of map!: >> a: #() b: reduce [1 a 3] probe put last probe take/part/deep b 2 'x 2 a [1 #()] 2 == #( x: 2 ) 09:58Is it by design? 10:01I could avoid the /part in above tests: >> a: "2" b: reduce [a] probe head insert probe take/deep b 'x a "2" "x2" == "2" >> a: #(x: 2) b: reduce [a] c: take/deep b c/x: 3 a == #( x: 3 ) 10:09It looks that Red does deep copy on simple series: >> a: [1] b: reduce [a] c: reduce [b] d: take/deep c append d/1 2 ? a ? d A is a block! value. length: 1 [1] D is a block! value. length: 1 [[1 2]] dockimbel 10:30@Oldes You should ask the person who implemented it (git blame), I was not aware of a /deep refinement for take. 10:34After a quick check, seems to be @qtxie. Oldes 11:43I think that it is ok how it is, just the doc-string should be modified, now it says: Copy nested values. while in R3 it was: Also copies series values within the block. qtxie 12:02> Is it by design? It's not. We don't have map! when take was implemented. Oldes 12:05@qtxie It is same with object. >> a: object [x: 2] b: reduce [a] c: take/deep b c/x: 3 a == make object! [ x: 3 ] 12:07I think that limit it only on series is better. You don't want to clone _faces_ (for example). hiiamboris 12:11copy/deep does not copy objects as well, so it must be by design rebolek 12:12There's an open issue about copy/deep. 12:13@hiiamboris which actually you commented on :) https://github.com/red/red/issues/2254 hiiamboris 12:14It's more of a wish issue though :) 12:15Do you guys have any thoughts on that design chat btw? greggirwin 19:38What is the purpose of take/deep? Just to replace copy take or copy/deep take? If so, I vote to remove it, because /deep does not affect take, which works against a series index. That is, /deep has no effect on how a value is found, whether nested or not, but that's what it reads like. Take simply takes one or more values. Easy to understand. What happens after that is outside its purview. 19:40A guiding principle for me is not saving typed chars, but saving brain cells. 19:43@hiiamboris ref issue fixed with @9214's latest PR. hiiamboris 19:50Cool! I'll be able to finally test the fast-lexer on my scripts :) dockimbel 19:53@greggirwin I guess it was added for specific needs in R3, but I fail to see the rationale for it. I'm also for removing it if we don't find any good reason to keep it. hiiamboris 19:58take/deep is not exactly copy/deep take: - if you take without /part, you have to check if the type you took is a series, then copy/deep it - if you used /part, you have already a shallow copy, which you copy again with copy/deep, so that's an extra copy :) But I've never had a use case for it ;) 20:02R3 had take/deep but removed(?) it: http://www.rebol.com/r3/changes-092.html My R3 still has it so it must have been resurrected 20:04No, it seems to have been just "disabled" - spec still defines it but it does nothing Oldes 20:05I would keep it how it is in Red and just change the doc-string. My understanding with R3 is, that Carl added the new function for copy/deep/types and didn't wanted to waste time on implementing it with take. greggirwin 20:08What is your use case @Oldes ? Oldes 20:08If it is there and working, why removing it? :point_up: [27. duben 2020 21:58](https://gitter.im/red/bugs?at=5ea7395261a0002f79521350) 20:10But it is true, that I don't remember using it... but that is probably because I found it by reading old Rebol issues. greggirwin 20:10That's not a use case. Oldes 20:11And it was your issue :) greggirwin 20:14Lang design is hard, and an ongoing process of refinement. Removing things is *really* hard, but sometimes makes sense. Just tinkering with things here, it doesn't seem easy to reason about. @hiiamboris' point about type checking is key but, quickly thinking about where and how I've used take, I want the exact value or range of values, or I'd just use remove. Tuesday 28th April, 2020 greggirwin 02:39I summarized my current thinking on #2254. Thursday 30th April, 2020 Tovim 19:01It looks like the typeset series! is not a part of the typeset default!. >> complement default! == make typeset! [unset! symbol! context! point! series!] Is that so? hiiamboris 19:38It is. 19:38 >> exclude to block! series! to block! default! == [] 19:39I think what complement does is just flips the bits, which is not correct here greggirwin 19:40Series! is itself a typeset. Also wondering why it shows up in complement. hiiamboris 19:40It must have a bit reserved for it 19:48Those are actually very intrinsic hidden things: >> ? symbol! No matching values were found in the global context. >> ? context! No matching values were found in the global context. >> ? point! No point values were found in the global context. Funny that they appear, while all other (but series!) typesets do not 19:51Question on the logic of complement on types/typesets is, should it work that way, or should it expand typesets and then flip only type bits. dockimbel 20:09On a quick look at the [code](https://github.com/red/red/blob/master/runtime/datatypes/typeset.reds#L404), I'm not sure what is wrong there. hiiamboris 20:17Could be a bug in typeset/form? dockimbel 20:20@hiiamboris Seems not. I think it's just the virtual types you've mentioned above that are causing confusion. There is an internal series! [type](https://github.com/red/red/blob/master/runtime/macros.reds#L56) in the Red runtime, that's the one returned by complement (and not the series! typeset...). Maybe we should mask them out... hiiamboris 20:21Makes sense. Sunday 3th May, 2020 endo64 20:41Shouldn't trim trims the head and tail by default? >> trim "^/x^/" == "x^/" >> trim "^/^/^/x^/^/^/" == "x^/" >> trim/head/tail "^/^/^/x^/^/^/" == "x" Why it keeps the last newline? This happens only to newline: >> trim "^-^-^-x^-^-^-" ; == "x" hiiamboris 20:53pretty weird behavior indeed endo64 21:08@rebolek Can you look at this issue? copy is missing somewhere: >> o: context [a: "x x"] == make object! [ a: "x x" ] >> to-csv values-of o == {"x x"^/} >> to-csv values-of o == {"""x x"""^/} >> to-csv values-of o == {"""""""x x"""""""^/} >> b: ["x x"] == ["x x"] >> to-csv b == {"x x"^/} >> to-csv b == {"""x x"""^/} >> to-csv b == {"""""""x x"""""""^/} 21:12Thanks @hiiamboris raised an issue: https://github.com/red/red/issues/4423 21:26@rebolek raised an issue to not miss https://github.com/red/red/issues/4424 Monday 4th May, 2020 greggirwin 02:57Will post on the ticket shortly, but @rebolek it looks like /header is not implied by /as-records in load-csv. Not sure how we missed that. >> s: "a,b,c^/1,2,3^/11,22,33" == "a,b,c^/1,2,3^/11,22,33" >> load-csv s == [["a" "b" "c"] ["1" "2" "3"] ["11" "22" "33"]] >> load-csv/as-records s == [#( "A" "a" "B" "b" "C" "c" ) #( "A" "1" "B" "2" "C" "3" ) #( "A" "11" "B" "22" "C" ... >> load-csv/as-records/header s == [#( "a" "1" "b" "2" "c" "3" ) #( "a" "11" "b" "22" "c" "33" )] 03:10Next, to-csv allows objects in the spec, but doesn't internally in the encode-map call. >> oo: object [A: 1 B: 2 C: 3] == make object! [ A: 1 B: 2 C: 3 ] >> to-csv oo *** Script Error: encode-map does not allow object for its <anon> argument *** Where: encode-map *** Stack: to-csv 03:16I'll have to go back to our design chat, to see what we decided about object support. load-csv never returns them, and since we're talking about data here, I think we can remove object support. endo64 05:58I prefer to keep object support because in that case headers can be used from words-of inside the load-csv. 06:03What is wrong in your example about as-record? it looks correct to me as explained, first row becomes columns header OR it uses A, B, C .. as headers. hiiamboris 09:45> What is wrong Have you noticed it used A B C as both header *and* values? greggirwin 21:07Which is the catch. If /header isn't implied, what do you use as field names? What @rebolek did here makes sense in that regard, as you have no other option really, so /header acts like remove on the result. 21:07But /header is much more meaningful. endo64 22:56> If /header isn't implied, what do you use as field names? I remember @rebolek wrote somewhere, field names will be A, B, ..., AA, AB, AC, ... just like in Excel, if /header is not given. Tuesday 5th May, 2020 TimeSlip 01:00 O:\>red -t Android-x86 android-test.v1.red -=== Red Compiler 0.6.4 ===- Compiling O:\android-test.v1.red ... ...compilation time : 2588 ms Target: Android-x86 Compiling to native code... *** Warning: OS_TYPE macro in R/S is redefined *** Compilation Error: invalid path value: image/extract-data *** in file: %/O/datatypes/binary.reds *** in function: red/binary/to *** at line: 1 *** near: [1030x7 proto: image/extract-data as red-image! spec EXTRACT_ARGB ] 01:01The code is simply a Print "Hello World", by the way. rebolek 06:14@endo64 Thanks for the report, I take a look at it. I'm sorry I wasn't available for this discussion, I had to deal with some housing problems. 06:14Anyway, here are the docs for CSV: https://github.com/red/red/wiki/CSV-codec 06:16And speed/memory tests for the curious https://gist.github.com/rebolek/e9c718175a0c60c1ec1a6e1a97d8cd2c 07:52Fix posted https://github.com/red/red/pull/4425 greggirwin 16:49Thinking through it, as I can't find notes to confirm anything, we may have *wanted* /as-records to imply /header originally, hence the doc string, but then how do you turn it off? The vast majority of the time, records means you'll have a header, to be sure, so it's a little extra typing when the intent should be clear. But to work around it, you then need to prepend a header line yourself to set the names. The way it is now is consistent, and also matches how you take/remove a header as the first item in the result, if you don't want it. If you all agree, I think all we need to do is document it, and modify the doc string. hiiamboris 16:57makes sense Wednesday 6th May, 2020 rebolek 05:50I agree, what do you suggest for the new doc string? 06:08I just removed the "implies /header" part - https://github.com/rebolek/red/tree/load-csv-docstring . Let me know if it's ok. 06:09As for the objects support, If it's easy to add, I'm for having it. I let you know how hard it is (IMO very easy). 06:19@greggirwin regarding your example on no-support for objects: oo: object [A: 1 B: 2 C: 3] to-csv oo This won't work with map anyway: >> to-csv make map! [a: 1 b: 2 c: 3] *** Script Error: length? does not allow integer! for its series argument *** Where: length? *** Stack: to-csv encode-map The reason is that it should be map! (or object!) of *columns*, so every value must be a block. It needs better error message, that's for sure, I'll add a check for it. 06:28Fixed behaviour: 1) throw error on invalid data: to-csv [a: 1 b: 2 c: 3] *** User Error: {All values in map!/object! are expected to be of block! type} *** Where: ??? 2) support object also: >> to-csv object [a: [1] b: [2] c: [3]] [a b c] make object! [ a: [1] b: [2] c: [3] ] == "a,b,c^/1,2,3^/" @greggirwin @endo64 let me know what do you think about it endo64 14:13According to my use case, I was expecting a one-line CSV when I useto-csv with an object. Something like: o: object [a: 1 b: 2 c: 3] to-csv/skip append words-of o values-of o length? words-of o ; == "a,b,c^/1,2,3^/" 14:14Sorry, two lines :) 14:15But this is not a general case for sure. rebolek 14:48The point of having blocks there is to fulfill this expectation: equal? to-csv load-csv/as-columns/header t: "a,b,c^/1,2,3^/" t I may add support for your use case, as it's not in conflict with the above condition. 14:49I'll try to add it to see how much code it is. If it's more or less a oneliner (as I expect), why not supporting it. endo64 15:17Even if it is just a one-liner, if it confuses users, then no need to add the above support. Most of the time I just need to get one line of CSV in that case I just use to-csv values-of object-or-map which is pretty easy. AugustoResende 19:02Compilation Error: undefined word to-json in file: C:\Users\augus\Documents\Projects\wallet\wallet.red near: [to-json body headers/cookie: cookie data res: attempt [ write network compose/only [ POST (headers) (to-binary data) ] ] ] 19:03https://github.com/red/wallet 19:03how to build without this compilation error? greggirwin 19:10@rebolek, for doc string, how about mathing /as-columns, as the behavior is the same, right? "...; default names if /header is not used." 19:11@AugustoResende I haven't built the wallet in a while. What version of Red are you using to compile it? 19:11Trying the automated build is always a good idea. AugustoResende 19:15latest @greggirwin 19:15latest automated build greggirwin 19:15I like the new CSV error message, and think we don't need object support at this time. I agree with @endo that we can provide examples for how to do that. We can always support it later, but it seems like a rare use case. AugustoResende 19:18yes but is in your showcase software 19:18need to be fixed hiiamboris 19:19@AugustoResende type about in Red console. What output do you get? greggirwin 19:21Reproduced here @AugustoResende. The team has been alerted. Thanks! AugustoResende 19:22@hiiamboris Red 0.6.4 for Windows built 6-May-2020/3:34:07-03:00 commit #6b1a117 19:25@greggirwin if possible alert about https://github.com/red/wallet/issues/64 too 19:25it's not possible to use the wallet if balance is not working hiiamboris 19:26I see json-test.red is not even included in all-tests.txt 19:27No wonder it's not working ;) greggirwin 19:28The Wallet team has been alerted about both issues. Seems we need tests for test inclusion. ;^) hiiamboris 19:29:D AugustoResende 19:30thanks @greggirwin 19:31I'm looking forward to using the red wallet hiiamboris 20:52@dockimbel found a funny bug in fast-lexer ;) It destroyed my console by doubling it's history size each time I run it, up to 2GB size :D >> load {"^^/"} == "^/" >> load "{^^/}" == "^/" >> load {{^^/}} ;) this is the culprit == "^^/" >> load load mold mold "^/012345678901234567890123456789012345678901234567" == "^/012345678901234567890123456789012345678901234567" >> load load mold mold "^/0123456789012345678901234567890123456789012345678" == {^^/0123456789012345678901234567890123456789012345678} >> load load load mold mold mold "^/0123456789012345678901234567890123456789012345678" == {^^^^/0123456789012345678901234567890123456789012345678} >> load load load load mold mold mold mold "^/0123456789012345678901234567890123456789012345678" == {^^^^^^^^/0123456789012345678901234567890123456789012345678} dockimbel 21:07@hiiamboris We have reported that console history bug internally to @qtxie, he will take care of it. 21:18@hiiamboris Here in fast-lexer branch, I get: >> load {"^^/"} == "^/" >> load "{^^/}" == "^/" >> load {"^^/"} == "^/" hiiamboris 21:18But {{^^/}}? 21:18It's not the console bug per se dockimbel 21:19 lisp >> load {{^^/}} == "^/" hiiamboris 21:20Interesting 21:20 >> about Red 0.6.4 for Windows built 1-May-2020/20:26:38+03:00 Let me update dockimbel 21:21@qtxie ^--- regressions on the wallet. hiiamboris 21:22Confirmed. No bug in most recent build (7 May). dockimbel 21:22@hiiamboris You are more than a dozen commit behind. ;-) hiiamboris 21:22;) 21:23Can't keep up with you ;) dockimbel 21:23We have some bursts of commits some days, don't miss them. ;-) Thursday 7th May, 2020 qtxie 01:06It's more like a Red compiler regression. The wallet haven't been changed since last year. rebolek 07:01FYI I found some other bugs in CSV. Expect more merge requests soon. hiiamboris 20:39@dockimbel now that there's no integer division, why not allow silent conversions, e.g. >> p: 1x2 >> p/x: 1 / 2 *** Script Error: float type is not allowed here *** Where: set-path *** Stack: >> t: black == 0.0.0 >> t/1: 1 / 2 *** Script Error: float type is not allowed here *** Where: set-path *** Stack: Boring, don't you think? greggirwin 20:57Do we have other silent, lossy conversions? Do you also mean that p/x: 0.5 should silently coerce? hiiamboris 21:15Well, a lot actually: >> p: 1x2 == 1x2 >> r: p / 2 == 0x1 >> s: p s/x: p/x / 2 *** Script Error: float type is not allowed here *** Where: set-path *** Stack: >> s: p s/y: p/y / 2 == 1 >> as-pair 0.5 1.5 == 0x1 >> 1.2.3 / 2 == 0.1.1 >> t: 1.2.3 == 1.2.3 >> t/3: t/3 / 2 *** Script Error: float type is not allowed here *** Where: set-path *** Stack: >> t/3: t/3 / 3 == 1 21:16Yes, I think it should coerce. dockimbel 21:31@hiiamboris For tuples, it should coerce. For pairs, it depends on what we decide for floats handling in pairs (maybe rather use a different datatype for that). hiiamboris 21:33Well, if pairs would support floating point, of course no coercion should be made. greggirwin 21:36There was the question of sub-pixel rendering, with the only downside to floating pairs being that they may be hard to read. If we use a new sigil for floats, to denote them from decimals, it gets worse. hiiamboris 21:40If we mold it to 1-2 digits after the dot - should be readable, no? 21:42Or you mean x doesn't look as a delimiter in this case? greggirwin 21:45I thought the same thing, about limiting molded output. It's just harder to see x in pathological cases. 3.141592653589793x2.718281828459045 I think we can live with that, but also have to decide on point! syntax, which exacerbates that, or uses another syntax entirely (Doc has proposed one). hiiamboris 21:48Do we want two point types, one integer, one float? Or point! will replace pair!? greggirwin 21:48Other solutions really start looking like hacks. e.g. 100_x_200. Though marginally helpful: 3.141592653589793_x_2.718281828459045. hiiamboris 21:49I would hate to type that _x_ thing 21:50Though underscore can be made optional... 21:51Anyway, I'd rather limit the mold output, and let mold/all produce the long one as it's not for readability anyway greggirwin 21:51Yup. Me too. But could be used only for float pairs. Still... Good point on mold/all. 21:53Pair is a special case of point, where /z is none. At least that's one way to look at it. :^) endo64 22:04[![image.png](https://files.gitter.im/red/bugs/quNl/thumb/image.png)](https://files.gitter.im/red/bugs/quNl/image.png) 22:04Ah, I tried to upload this to the thread 22:05[![image.png](https://files.gitter.im/red/bugs/6ITF/thumb/image.png)](https://files.gitter.im/red/bugs/6ITF/image.png) 22:12Here Excel doesn't quote 3 4 in the CSV output, but it does for 5^/6. greggirwin 23:06Spaces *might* have been included there because munge does, which we used as a reference point. Ashley (@dobeash) did a lot of research, and works with various systems, both SS and DB, where he aimed for compatibility. 23:06That's something we can research and revisit. Saturday 9th May, 2020 ralfwenske 06:36On macOS with Red 0.6.4 for macOS built 9-May-2020/1:48:06+10:00 commit #5a4401b I am puzzled with following inside my resize function: if (face/type = 'window) and (object? face/extra) and (size <> none) [ mins: to-pair select face/extra/options 'min-size maxs: to-pair select face/extra/options 'max-size ?? maxs ?? mins print [type? maxs] it produces (repeatedly) when resizing (as expected) maxs: 1400x1000 mins: 400x600 pair when I change the print statement to print [type? maxs maxs/x maxs/y] I get: *** Runtime Error 1: access violation *** at: 00038580h I experimented a fair bit with similar code without being able to find a pattern. Finally I ran the exactly (fairly complex) same code on Linux (via Dropbox) Red 0.6.4 for Linux built 8-May-2020/17:02:59+10:00 commit #2c41bd8 and here this one works as expected (even though with variations of this code I had crashes on Linux as well - hard to replicate as I cannot grasp a pattern) maxs: 1400x1000 mins: 400x600 pair 1400 1000 Any ideas? Feels like some bug... hiiamboris 07:23@ralfwenske tried recycle/off? ralfwenske 08:27Thanks @hiiamboris . That helped. As I am recursing and resizing myself I thought that resizing from parent to child might have triggered some memory consumption I then reversed and resized from the lowest child face upwards. But that didn’t make a difference. However recycle off did the trick. Is there documentation about this, is it a temporary restriction? Even though my view is a bit more than just a "Hello" button I don’t think I would be using too much memory. hiiamboris 08:35I can't say anything specific without seeing the code ;) But GC (being a simple temporary measure) is known to have false positives and randomly cause memory corruption in bigger or more memory intensive scripts 08:38By the way, if your layout is not complex, [this small script](https://gitlab.com/hiiamboris/red-elastic-ui) may handle resizing for you ralfwenske 08:38So I leave recycle off in there and remove it when GC is more sophisticated. Thanks Oldes 10:26@ralfwenske you should try to build Red with debug enabled -d and than you would have more informative error info - possibly pointing to place where it should be fixed. Sunday 10th May, 2020 Oldes 21:24I just noticed, that this is possible in Red: >> #{BADFACE} == #{BADFAC} @dockimbel is it really good to have it instead of an error? greggirwin 21:30That appears to be a regression @Oldes. Good catch. Please file a ticket for it. Are you on the fast-lexer branch? I am right now, so it may be that. hiiamboris 21:31On master: >> #{BADFACE} *** Syntax Error: invalid binary! at "#{BADFACE}" *** Where: do *** Stack: load 21:31On fast-lexer: >> #{BADFACE} *** Syntax Error: (line 1) invalid binary at } *** Where: transcode *** Stack: load greggirwin 21:31:+1: hiiamboris 21:32My fast-lexer is at commit e46d34d Fri May 8 18:49:29 2020 +0800 21:33Looks like I'm up to date dockimbel 21:40@Oldes Please always make sure you are using the latest commit before reporting any bug. greggirwin 21:45I was slightly out of date myself. Latest seems to catch it. Monday 11st May, 2020 Oldes 07:06I've noticed this in [@9214 's units test file](https://github.com/9214/red/blob/479ff1cb2ec8c44ca80dd43d1fcf2df5148991b8/tests/source/units/redbin-codec-test.red#L155), so I asked. @dockimbel I was not reporting a bug... just wanted to know, which version is supposed to be the right one. dockimbel 10:13Fast-lexer branch is the most advanced branch. I'll merge the latest commits from master in it today. rebolek 10:15I tried GTK branch on rPI and I get Unable to init server: Could not connect: Connection refused (view-console:1020): Gtk-WARNING **: 12:13:58.192: cannot open display: Anyone knows a solution to this? dockimbel 12:06@rebolek Looks like a regression, it used to [work fine](https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html). rebolek 12:58@dockimbel it's probably not a Red problem, but related to the fact that I'm connected to the Pi over SSH. loziniak 12:59have you tried X-forwarding? rebolek 13:02I tried ssh -X ... but then it opens the window on my local machine :-) I need to read about it a bit more. 13:32@loziniak the server has display but not a keyboard. I want to run View on the server over ssh connection. As I understand it, what X-forwarding does is to run run X apps remotely, but displaying on local machine. That's not what I want. loziniak 14:46@rebolek Yes, it's just how you describe it. Try this: DISPLAY=":0.0" xterminal btw let's move to chit-chat! 15:02Ooops sorry, the command is xterm. Anyway, it's just the command you want to run on your rPi. meijeru 15:26Has anyone else trouble with drop-list? Try view [drop-list data ["1" "2" "3" "4"]] and click on any value: it crashes on my W10 (latest commit). hiiamboris 15:28Confirmed crash on fast-lexer 15:28My master is a bit old (no crash there), let me refresh toomasv 15:28Confirmed on W10 master (May 8). hiiamboris 15:29It's a regression then, recent. Worked fine at March 18. meijeru 15:31I'll post issue. See #4439 toomasv 15:31Worked on Apr 6 build too. Tuesday 12nd May, 2020 vrescobar 08:01hello 08:02I wanted to maybe report a bug: the binary for mac os is apparently not executable on x86_64 08:03 09:59:38 ~/Downloads vresko@newhope $ sha256 red-12may20-18ccd9208 838679ab291213f8c51724d1248bfc958a62df9eb8089f6732a3e768e7cee0f0 red-12may20-18ccd9208 09:59:45 ~/Downloads vresko@newhope $ sh red-12may20-18ccd9208 red-12may20-18ccd9208: red-12may20-18ccd9208: cannot execute binary file 09:59:53 ~/Downloads vresko@newhope $ chmod +x red-12may20-18ccd9208 09:59:57 ~/Downloads vresko@newhope $ ./red-12may20-18ccd9208 -bash: ./red-12may20-18ccd9208: Bad CPU type in executable 10:00:00 ~/Downloads vresko@newhope $ This was the latest build, but the same happens for the 0.6.4 08:04machine type (macbook x86_64) $ uname -a Darwin newhope.local 19.4.0 Darwin Kernel Version 19.4.0: Wed Mar 4 22:28:40 PST 2020; root:xnu-6153.101.6~15/RELEASE_X86_64 x86_64 08:05the downloads were from the official webpage and the checksum was verified https://www.red-lang.org/p/download.html 08:08I just tried to install through brew (package manager for mac) and it seems that it just does not compile on the newest OS version (Catalina) $ brew cask install red ==> Downloading https://static.red-lang.org/dl/mac/red-064 ######################################################################## 100.0% ==> Verifying SHA-256 checksum for Cask 'red'. Error: This cask does not run on macOS versions newer than Mojave. 08:08not sure if bug or feature hiiamboris 08:09@vrescobar https://github.com/red/red/issues/4359#issuecomment-602205340 vrescobar 08:10ok thanks hiiamboris 08:12@vrescobar meanwhile you can run it in a VM or in docker vrescobar 08:19no UIs (easily), in my side it's ok as I wanted to just tinker a bit some ideas 08:19thanks anyway 14:04hello again 14:04now running with a debian 32 bit (x86:64) on a VM rebolek 14:04@vrescobar hi! great to see you have it running! vrescobar 14:05well, gtk doesn't work 14:05cmd is no problem tho 14:05I am running gnome so I don't think it is a library issue 14:06[![Screenshot 2020-05-12 at 16.06.09.png](https://files.gitter.im/red/bugs/QjXR/thumb/Screenshot-2020-05-12-at-16.06.09.png)](https://files.gitter.im/red/bugs/QjXR/Screenshot-2020-05-12-at-16.06.09.png) 14:06at least I can try some snippets 14:06any idea on that error? rebolek 14:06@vrescobar GTK branch has not yet been merged into master. vrescobar 14:06in google there are some results 14:07I thought the UI was working on linux 14:07isn't it supported on 064 yet? rebolek 14:08Right, it's not in 064. However you can test it. You just need to compile the GTK branch yourself (no big deal). vrescobar 14:09ok, I will check the instructions on how to do it, I hope they are in the docs rebolek 14:10@vrescobar you need Rebol executable to build Red, you can download it from http://www.rebol.com/downloads.html 14:11then switch to GTK branch 14:11run Rebol 14:12and do this: do/args %red.r "-r environment/console/CLI/view-console.red" 14:12it's in docs, but this way you don't have to look for it 14:13just ask me about details hiiamboris 14:16@vrescobar https://static.red-lang.org/dl/branch/GTK/linux/red-latest 14:16I haven't tried it though, does it work? vrescobar 14:18let me check, I was having my muffin moment... hiiamboris 14:18;) rebolek 14:19@hiiamboris thanks, I always forget there are prebuild binaries. vrescobar 14:30@hiiamboris thanks, the latest version works fine :) 14:32[![Screenshot 2020-05-12 at 16.31.58.png](https://files.gitter.im/red/bugs/Ixy7/thumb/Screenshot-2020-05-12-at-16.31.58.png)](https://files.gitter.im/red/bugs/Ixy7/Screenshot-2020-05-12-at-16.31.58.png) 14:32Compiled and interpreted, both ways 14:32thanks @rebolek too hiiamboris 14:34:+1: vrescobar 14:35by the way, does anyone know on whether there is a prepared docker container for docker which exports X-window system? 14:36I think that would be more practical for me than using a VM 14:36also would like to know the exact gtk dependencies for red (in case I have to build it myself) 14:40also I would like to know any other system dependencies on linux (if any)... rebolek 14:42@vrescobar IIRC @rcqls had docker images available, I'm not sure about the current status. For exact dependencies... basic 32bit GTK should be enough. greggirwin 20:20@vrescobar, welcome! As you tinker, you don't always have to use -r for release mode, which recompiles the runtime in full every time. -c is dev mode, which builds the runtime once, and keeps it external to your app, so you just compile your code, which only takes a second. Wednesday 13th May, 2020 vrescobar 00:02hi again, is there any way to contribute? I made a visual studio code template which includes a devcontainer preconfigured to install the extensions and a dev env docker with the GTK support: https://github.com/vrescobar/red-vscode 00:03it might need a bit of tunning but works quite well, and perhaps makes sense to promote it as an easy way to start using the language (IDE + dev environment preconfigured) as it happens in other programming languages 00:04just letting it know here as it was non trivial to put all pieces together (latest ubuntu doesn't want to run red, vscode dev dockers won't work i386 distros etc) 00:06for some reason the red language server doesn't work (crashes with no message) and there is room to add quite a few build scripts there preconfigured greggirwin 02:26Thanks @vrescobar ! Check out [guidelines](https://github.com/red/red/wiki/%5BDOC%5D-Contributor-Guidelines) for general contributions, add notes to [the VSCode wiki page](https://github.com/red/red/wiki/Visual-Studio-Code-Plugin), and see if any open tickets in [the extension repo](https://github.com/red/VScode-extension) match the crash you're seeing. I see it here as well, but haven't made time to investigate. rcqls 09:02@vrescobar You can visit this repo to have docker image ready for executing red:gtk (see https://github.com/rcqls/docker-red-gtk) Oldes 13:45@rcqls maybe you should enhance the readme... this is not much friendly message: > Just install docker (as a linux user you know what to do depending of your linux distribution). 13:46For example I'm occasional Linux user and I yet never tried Docker Thursday 14th May, 2020 vrescobar 08:02@rcqls my docker was already working, but I took at it anyway. By the way red + gtk wasn't working on the latest ubuntu, might be there a bug. Also my template already works better with the vscode extension now that I figured out how to configure it, just missing a couple of features more like prepared build for all major platforms etc rcqls 08:19@vrescobar I prepared this repo to prepare the first develpment of red-gtk. Now I am happy to see that the red team is fully involved in the development of red/gtk. What is funny is that as a macOS user I only created this repo for developping. Now since macOS does not support anymore 32bits I maybe need to change the goal of this project to only propose a solution to use it only as a launcher of red in the docker container. I’ll try to do it in the few next days. Your comments about the last ubuntu is surprising and I’ll try to test it since this project helped me too to check that the developments were working for on many distributions available in docker containers). hiiamboris 14:53@dockimbel v: view/no-wait [] append v/pane layout/only [base] looks like a regression in fast lexer (compared to master) *** Script Error: VIEW - invalid face type: none *** Where: do *** Stack: view layout table on-face-deep-change* cause-error greggirwin 15:16Maybe for @qtxie. 15:16To note for the merge. dockimbel 15:48@qtxie ^--- hiiamboris 19:08 >> s: [$1 $2] == [$1.00 $2.00] >> s == [1 2] == false >> s == [USD$1] == false >> s == [USD$1 0] *** Script Error: $1.00 not same denomination as USD$1.00 *** Where: == *** Stack: >> s == [...] >> length? s == 2 >> s = copy s == false >> s == copy s == false >> t: copy s == [$1.00 $2.00] >> t = s == true >> t == s == true >> s = t == false >> s == t == false ??? dockimbel 19:12Looks like the error handling is corrupting the block. You should open a ticket about it. It looks specific to money! type. hiiamboris 19:14And what about consistency? This part: >> s == [USD$1] == false >> s == [USD$1 0] *** Script Error: $1.00 not same denomination as USD$1.00 *** Where: == *** Stack: 19:16And this >> find/case t USD$1 *** Script Error: $1.00 not same denomination as USD$1.00 *** Where: find *** Stack: >> parse/case s [USD$1 skip] *** Script Error: $1.00 not same denomination as USD$1.00 *** Where: parse *** Stack: Both I and Gregg warned that this will break Red. dockimbel 20:27Those cases should obviously be working, so it looks like an implementation issue to me. Saturday 16th May, 2020 hiiamboris 12:25@greggirwin >> ? [] [] is a block! value. >> ? #() *** Script Error: get does not allow map! for its word argument *** Where: get *** Stack: ? help-string map? meijeru 13:31Looks like a genuine bug . Since the source of help looks perfectly OK, it must be in the argument passing of a literal map to a function with a lit-word argument. hiiamboris 13:42It's in show-map-help 13:43It starts with if map? get word [... 13:43Where word [word! path! map!] greggirwin 18:18Help is at fault, because get doesn't support maps. The question now is whether we want to file a bug report against help or a wish for get to support maps. Get just uses thevalues reflector for objects, and maps could work the same. If we change get, we should look at set too, so people can write with consistent patterns. It looks like maps support the set-many approach objects use, but doesn't support all the refinements currently. Fixing help will be a lot easier right now. Changing get/set` is a lot more work, but if we think supporting maps there is a win overall, it's worth considering. hiiamboris 18:27set on maps doesn't make any sense to me, as their key set is mutable (and unordered). greggirwin 18:28I was just thinking about that too. hiiamboris 18:29get might work, alright greggirwin 18:31Fixing help seems best. I'll note this about maps in the wiki, and @meijeru can note it in specs as well. I think maps will be a tricky thing for users to get right with set, and won't lead to cleaner code. hiiamboris 18:36I find this boring: >> get quote :system/script *** Script Error: get does not allow get-path! for its word argument *** Where: get *** Stack: >> get quote system/script: *** Script Error: get does not allow set-path! for its word argument *** Where: get *** Stack: Okay to make a ticket? greggirwin 18:40That would make is consistent with words, which makes sense. @dockimbel _point_up: ? dockimbel 18:44@greggirwin @hiiamboris Go for it. PR for that is welcome (including some unit tests). I can add compiler support for that get extension if needed. meijeru 19:15Having getwork on objects and maps, as a simple synonym for values-of seems rather superfluous, if you ask me. greggirwin 20:17@meijeru it allows some very clean patterns: o: object [long-name: 1 longer-name: 2 really-long-name-like-Java: 3] words: [a b c] set words get o ; <--- ; work with short words e: 2.718281828459045 a: pi * e b: a * c c: random 100 ; <--- set o reduce words ; <--- 20:18It's certainly not necessary, but the symmetry is nice. meijeru 21:31I now see that set already allows object! too, and -- curiously -- map is mentioned in the docstring: ARGUMENTS: word [any-word! block! object! path!] "Word, object, map path or block of words to set." value [any-type!] "Value or block of values to assign to words." greggirwin 21:42 >> m: #(a: 1) == #( a: 1 ) >> set 'm/a 2 == 2 >> m == #( a: 2 ) Sunday 17th May, 2020 meijeru 08:31If you read "map path" as one expression, then it makes sense. But then "path" is not mentioned separately, and it does figure separately in the typespec. So I read it as "map, path" and then "map" is separate while not being accepted... TheHowdy_gitlab 16:31[![image.png](https://files.gitter.im/red/bugs/SlGU/thumb/image.png)](https://files.gitter.im/red/bugs/SlGU/image.png) 16:31Minor thing: 16:32the doc for put mentions that it returns a [series! port! map! object!], so I would assume it returns the series after the modification. Instead, it returns the puted value, e.g. it behaves like set. 16:34Not sure which behaviour is the wanted one, but anyway the doc is wrong. If I'm not overseeing something, of course. greggirwin 17:03@meijeru [garden paths](https://en.wikipedia.org/wiki/Garden-path_sentence) happen. :^) 17:04@TheHowdy_gitlab the doc string says "...returns the new value." How is that incorrect? hiiamboris 17:12He means the last line greggirwin 17:19Ah, I see. We should fix poke as well then, as it has a similar issue. Take doesn't define a return type at all. 17:20Good catch @TheHowdy_gitlab! Tuesday 19th May, 2020 Oldes 10:30@dockimbel is there any reason why system/platform is a function and not just a word? dockimbel 10:40@Oldes It cannot be just a word, it depends on the platform. IIRC, when that was implemented, Red-level preprocessor was not capable enough (just having #include and no access to the compilation settings). So I guess now we can replace that function with just a #switch directive. Oldes 10:42I know it depends on platform, but maybe it could be defined in the build phase like version is, couldn't be? dockimbel 10:44Not worth the trouble, the preprocessor (with macros) should be able to handle that. Some other built-in directives from the compiler could also be dropped now and replaced by macros. greggirwin 17:59@Oldes is it just curiosity, or do you think it *should be* a word? If so, why? Wednesday 20th May, 2020 Oldes 11:35@greggirwin I have several reasons... first.. this should be a constant, because one should not suppose that platform is changing and second... I see help system as an entry point for deeper examination and so from aesthetic reasons, it should be next to version info. 11:37In R3 it is not a word, but a block... which is not good either, because in code using switch system/platform/1 [... does not look good enough... better would be just system/platform. luce80 14:42In latest Red version: >> view [field "a" with [selected: 1x100000]] ; ok >> view [field "a" with [selected: 1x1000000]] ; closes window immediatly Is this an intended limit? hiiamboris 14:43Report it. A crash is a crash, it needs a fix 14:43I confirm the crash on W7 endo64 15:08Crash on Win10 as well. greggirwin 16:43Thanks @Oldes. Aesthetics I get, but there are no constants in Red, so even making it a word (especially without protect) doesn't make it any moreso. System/build is an object, with a lot of details. While I don't see this as important enough to change right now, relative to other things, it's something we can and should note for the future. Metadata about apps can be valuable, to introspect in deployed systems, so the easier we can make it to do that correctly and consistently the better. If we don't have a "Future Thoughts" wiki page, please create one and add it there. Oldes 16:45I know there are no constants, I'm not a newbie. Still think that have it just a word is better than have a function which returns always the same word. greggirwin 16:46Sorry, I meant no offense. I know *you* know that, but sometimes think out loud, and also write things for the larger audience watching here. Oldes 16:48I know.. no problem... I think that to have this important info deep inside system/build is also not much friendly... it is really something which is used quite a lot. greggirwin 16:51I thought about this recently, and the historically named about func. A passing idea was to extend it, so it could return info about modules, but could also apply to other values. hiiamboris 17:01It was fixed so no point arguing ;) https://github.com/red/red/commit/2a31ab268592e93e9e97ffc418deaa1ec6771f51 Oldes 17:09Fine... let's talk about something totally different... Is this by design, not-yet-implemented or just a bug? >> append #{} "^(2190)" == #{E28690} ;<---- so far it is good... but... >> append/part #{} "^(2190)" 1 == #{E2} ;<---- I quite not sure if it is useful as it is ... maybe it should use the length in code points and so the result should be same? luce80 17:12Scrolling all to the right in a text-list does not show full line text on Windows 7. Is it a W7 limit ? >> view [text-list 40x100 data ["aaaaaaaaaaaaaaaaae" "b" "c"]] greggirwin 17:16@luce80 I see about half the final e on Win10. hiiamboris 17:20![](https://i.gyazo.com/0c093866be44c958bac067526b1cdba5.png) W7 greggirwin 17:35@Oldes it can be justified either way, so there are both reasoning and usefulness aspects. If we think of it as "The value is first coerced to a type compatible with the series, then the part is taken." we get what we have now. Easy to understand. This is similar: >> append/part {} 'a/b/c 2 == "a/" Where the path is first formed, then part of that taken. Knowing this behavior, we can add a doc note that shows how to work around it if you want to append full chars to binaries. e.g. >> append #{} copy/part "^(2190)XYZ" 1 == #{E28690} luce80 17:50@hiiamboris Exactly. Can you **fully** see the last "e" ? If it was an "o" you will see a "c". hiiamboris 17:54Let's ask @qtxie if it's an OS limitation or some R/S rounding issue Oldes 19:43@greggirwin I know it can be justified either way... that's why I'm asking... if there is any consensus which behaviour is more useful. greggirwin 19:49If it changes, how do you work around it the other way? That is, how do you append just N bytes to a binary from a char or string? Something like this? >> append/part #{} to binary! "^(2190)xyz" 1 == #{E2} Which seems worse than the alternative above. Oldes 20:01@greggirwin hm... sounds logical. So the answer on my question is _by design_, right? greggirwin 20:04I think so. Even if by accident, it's a lucky one. :^) hiiamboris 20:07It's an interesting and important question in the series model though greggirwin 20:09Yeah, I noticed neither of us jumped in with a really quick answer. :^) hiiamboris 20:10Proposed slicing part function would be unambiguous on that it works like copy/part, i.e. part is attributed to the argument, not the result greggirwin 20:11Agreed. Note that if it isn't already. hiiamboris 20:11I will Oldes 20:27And what about this: >> append "a" "b" == "ab" >> append next "a" "b" == "ab" >> append #{00} #{01} == #{0001} >> append next #{00} #{01} == #{01} ;<---- inconsistent with the string cases above! hiiamboris 20:32This is a bug (#{01}) greggirwin 20:32*That* looks like a bug to me. 20:32R2 does it correctly. hiiamboris 20:32And I believe it's not reported ;) Thursday 21st May, 2020 qtxie 02:04> Let's ask @qtxie if it's an OS limitation or some R/S rounding issue Looks like missing some padding pixels. Oldes 14:33It is possible to save data into binary and _chain_ such a saves... Red and R2 does not append a newline while R3 does... I think, that there should be the newline appended, else one can get wrong results, like in this case: Red & Rebol2 >> b: #{} save b [1 "a" 3] save b [4 "b" 6] load b == [1 "a" 34 "b" 6] ;<----- should be [1 "a" 3 4 "b" 6] instead Rebol3 >> b: #{} save b [1 "a" 3] save b [4 "b" 6] load b == [1 "a" 3 4 "b" 6 ] 14:37(not that I ever used this feature, but I think it deserve a though) @greggirwin any logical reasons why not to append the newline? hiiamboris 14:41 >> repend "" [mold/only [1 2 3] mold/only [4 5 6]] == "1 2 34 5 6" greggirwin 18:571) If we include a newline, how do you omit it if you *don't* want it? 2) Why does it append at all? It doesn't for files, does it? >> b: %save-test save b [1 "a" 3] save b [4 "b" 6] >> read b == {4 "b" 6} >> load b == [4 "b" 6] 3) Ummmm >> b: {} save b [1 "a" 3] save b [4 "b" 6] b == "#{31202261222033}#{34202262222036}" Save clearly has some issues. There is heavy redbin work underway, so now is a good time to define the behavior, document it, and make sure we have tests for it. Friday 22nd May, 2020 dockimbel 01:42@greggirwin It's b: #{} instead of b: {}. greggirwin 03:22@dockimbel my point was that saving to a string and getting binary values in it doesn't look right to me. Oldes 07:50Saving to string should not be allowed imho. 08:45@greggirwin when you mention _redbin_, is there any documentation/specification or there is only the _redbin_ branch? 08:47I wonder why the string! _target_ was introduced in R3... because it is not supported in R2. rebolek 09:49There was a wiki page on Github but that seems to be gone. meijeru 09:59@Oldes For Redbin, see [this](https://doc.red-lang.org/en/redbin.html) page Oldes 10:01Thanks... I wonder if there are already any results how faster can be loading of the system from redbin instead of just a string. 10:09Looking at the spec quickly, I think that any-string! values should use _string table_, instead adding the data directly into the _value_. 10:10(but that is out of topic in this room) hiiamboris 10:43If you mean, zero-terminated strings, what would be the point? save is not for low level API interaction anyway, and where else is it useful? dockimbel 10:51@greggirwin @Oldes I can't see either why string! is allowed as target in R3 too. Red's save was a direct port of the R3 version. Oldes 11:27@hiiamboris now I'm not sure on which topic you were reacting.. my any-string! comment was related to redbin format... and I somehow expected, that redbin format could be used not just for saving/loading data, but also for fast loading of Red code with possibility to handle references.. like in this case: >> str: "aha" blk: reduce [str str] == ["aha" "aha"] >> same? blk/1 blk/2 == true >> blk2: load save #{} blk == ["aha" "aha"] >> same? blk2/1 blk2/2 == false ;<--- could be true with proper redbin implementation hiiamboris 11:33Ah, I see. greggirwin 20:20Saving to strings can be useful with some patterns, where you pass around names of storage areas, as you can write more generic code that way. e.g. using strings as temporary files in memory, with a consistent API. The main thing, for me, is that the append vs overwrite behavior needs to be consistent as well. Monday 25th May, 2020 hiiamboris 15:48Can someone else reproduce this crash? Red [needs: view] do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red recycle/off b: [[][][][][]] s: reactor [x: 10 y: 2 t: 0 re: [this/t: that/x + that/y + that/t / 10]] repeat i 5 [clock compose/deep [clear pick b (i) loop 1000 [append pick b (i) make s [re: copy/deep re]]]] prev: s repeat i 5 [clock compose [foreach r pick b (i) [react/link/later r/re: func [this that] r/re [r prev] prev: r]]] clock [s/t: 1] repeat i 5 [clock compose [foreach r pick b (i) [react/unlink :r/re 'all]]] clock [recycle] Outputs me: 31.0 ms [clear pick b 1 loop 1000 [append pick b 1 make s [re: copy/deep re]]] 34.0 ms [clear pick b 2 loop 1000 [append pick b 2 make s [re: copy/deep re]]] 49.0 ms [clear pick b 3 loop 1000 [append pick b 3 make s [re: copy/deep re]]] 37.0 ms [clear pick b 4 loop 1000 [append pick b 4 make s [re: copy/deep re]]] 41.0 ms [clear pick b 5 loop 1000 [append pick b 5 make s [re: copy/deep re]]] 188 ms [foreach r pick b 1 [react/link/later r/re: func [this that] r/re [r p 449 ms [foreach r pick b 2 [react/link/later r/re: func [this that] r/re [r p 917 ms [foreach r pick b 3 [react/link/later r/re: func [this that] r/re [r p 841 ms [foreach r pick b 4 [react/link/later r/re: func [this that] r/re [r p 2403 ms [foreach r pick b 5 [react/link/later r/re: func [this that] r/re [r p 558 ms [s/t: 1] 928 ms [foreach r pick b 1 [react/unlink :r/re 'all]] 714 ms [foreach r pick b 2 [react/unlink :r/re 'all]] 519 ms [foreach r pick b 3 [react/unlink :r/re 'all]] 321 ms [foreach r pick b 4 [react/unlink :r/re 'all]] 113 ms [foreach r pick b 5 [react/unlink :r/re 'all]] root: 4720/6799, runs: 0, mem: 49337420 *** Runtime Error 19: stack error or overflow *** in file: /D/devel/red/red-src/red/runtime/collector.reds *** at line: 88 *** *** stack: red/collector/keep 0034AF1Ch *** stack: red/collector/mark-values 04C92AB8h 04C92BA8h *** stack: red/collector/mark-block 04C92A90h *** stack: red/collector/mark-values 04C92A90h 04C92AA0h *** stack: red/collector/mark-block 04C92980h *** stack: red/collector/mark-values 04C92980h 04C92A20h *** stack: red/collector/mark-block 04C928D8h *** stack: red/collector/mark-values 04C928D8h 04C92928h *** stack: red/collector/mark-block-node 04BEDE1Ch (many more lines like that) toomasv 16:26Here it works up to clock [recycle], with that it silently dies. hiiamboris 16:27Are you using GUI or CLI mode? toomasv 16:28GUI hiiamboris 16:28Okay reproduced then. Thanks. toomasv 16:28:+1: Wednesday 27th May, 2020 ldci 05:12test with last red-27may20-3e9a77243: using libRedRT built on 27-May-2020/5:04:33 *** Red Compiler Internal Error: Syntax Error : Invalid decimal -- 3e9a77243b6d283ff9e4dc41378833e7d5398ab7 *** Where: none dockimbel 10:47@ldci Where is 3e9a77243b6d283ff9e4dc41378833e7d5398ab7 coming from? A binary series? 12:08@ldci Can you give me a way to reproduce it? hiiamboris 14:05Someone found a way >> https://github.com/red/red/issues/4470 ldci 14:19@hiiamboris Thanks for the link 14:21@dockimbel Probably macOS specific hiiamboris 14:22No, that issue reporter uses Windows. dockimbel 14:57@hiiamboris @ldci I cannot reproduce the issue on Win7. 14:57@ldci Did you do a red clear before using the new Red executable? ldci 18:53@dockimbel Of course dockimbel 19:05@ldci I'll post a fix for it in the next hours. Friday 29th May, 2020 ldci 06:31@dockimbel Red 0.6.4 for macOS built 29-May-2020/6:18:50+02:00 commit #2106a82 works fine now. Thanks. dockimbel 09:47@ldci :+1: Saturday 30th May, 2020 hiiamboris 10:37@dockimbel I have found this issue with the preprocessor: >> preprocessor/fetch-next [object/no-ref] *** Macro Error: unknown refinement *** Where: object/no-ref (halted) >> type? try [preprocessor/fetch-next [object/no-ref]] *** Macro Error: unknown refinement *** Where: object/no-ref (halted) >> type? try/all [preprocessor/fetch-next [object/no-ref]] *** Macro Error: unknown refinement *** Where: object/no-ref == error! i.e. it's probably okay that it throws error, but it throws a halt error, and there's no way to silence it's output 10:37Should I post it to red/issues or it won't be fixed? 17:39Also, why map doesn't accept datatype keys? >> make map! reduce [integer! 100] *** Script Error: datatype type is not allowed here *** Where: make *** Stack: greggirwin 19:18It looks like _hashtable supports them, so just that map/preprocess-key doesn't. Although, they hash the same as objects and logics, which also aren't supported. @qtxie? Sunday 31st May, 2020 qtxie 06:31@hiiamboris I don't remember. No datatype! key in the document. https://doc.red-lang.org/en/datatypes/map.html #(<key> <value>...) <key> : hashed key, accepted types are: scalar!, all-word!, any-string! <value> : any-type! value 06:32We can add it if it's useful. hiiamboris 07:33It can be worked around with type?/word, but it would be nice to have raw datatypes as well. endo64 21:00Can someone confirm below crash, it was working before merging fast-lexer: Red [] face1: make face! [ type: 'base size: 100x100 offset: 10x10 color: blue ] face2: make face! [ type: 'base size: 100x100 offset: 130x130 color: red ] win: make face! [ type: 'window size: 800x600 pane: reduce [face1] ] view/no-wait win ;append win/pane face2 ; this works insert win/pane face2 ; this crashes show win do-events hiiamboris 21:20 *** Runtime Error 98: assertion failed *** in file: /d/devel/red/red-src/red/modules/view/backends/windows/gui.reds *** at line: 232 *** *** stack: gui/get-face-handle 00000062h *** stack: gui/get-face-handle 02A3A024h *** stack: gui/change-parent 02A3A024h 02A39FE4h *** stack: gui/change-faces-parent 02A3A004h 02A39FE4h 02A3A024h 0 1 *** stack: gui/OS-update-facet 02A39FE4h 02A39FF4h 02A3A004h 02A3A014h 02A3A024h 0 1 *** stack: ctx||460~on-change-facet 02A39FE4h 02A39FF4h 02A3A004h 02A3A014h 02A3A024h 0 1 *** stack: on-face-deep-change* *** stack: red/_function/call 02A39EA4h 003C3884h *** stack: red/interpreter/eval-code 02A39EA4h 02E42CC8h 02E42CC8h false 00000000h 00000000h 02B24138h *** stack: red/interpreter/eval-expression 02E42C38h 02E42CC8h false false false *** stack: red/interpreter/eval 02E42BC0h true *** stack: red/interpreter/eval-function 02E3DDE0h 02E42BC0h *** stack: red/_function/call 02E3DDE0h 008C1350h *** stack: red/object/fire-on-deep 02B7BC20h 02B7BC30h 02A39E14h 02A1E0E4h 02A39E24h 0 1 *** stack: red/ownership/check 02A39E14h 02A1E0E4h 02A39E24h 0 1 *** stack: red/block/insert 02A39E14h 02A39E24h 02A39E04h false 02A39E04h false *** stack: red/actions/insert 02A39E14h 02A39E24h 02A39E04h false 02A39E04h false *** stack: red/actions/insert* -1 -1 -1 *** stack: red/interpreter/eval-arguments 02B1FEC8h 02E336A0h 02E336D0h 00000000h 00000000h *** stack: red/interpreter/eval-code 02B1FEC8h 02E33680h 02E336D0h false 00000000h 00000000h 02B1FEC8h *** stack: red/interpreter/eval-expression 02E33680h 02E336D0h false false false *** stack: red/interpreter/eval 02A39DE4h true *** stack: red/natives/catch* true 1 *** stack: ctx||557~try-do 003E1DA4h *** stack: ctx||557~launch 003E1DA4h *** stack: ctx||590~launch 003E14F8h 21:20W7 Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb endo64 21:24Thank you @hiiamboris 21:38Shouldn't I see two boxes? system/view/auto-sync?: true face1: make face! [ type: 'base size: 100x100 offset: 10x10 color: blue ] win: make face! [ type: 'window size: 800x600 pane: reduce [face1] ] view/no-wait win append win/pane make face1 [offset: 150x150 color: red] show win do-events view/win instead of view/no-wait show do-events works as expected. 23:09About ref! datatype: >> "a" = @a == false >> @a = "a" == true Monday 1st June, 2020 hiiamboris 07:28show isn't meant for that I think, only for updating faces meijeru 08:41@endo64 that is a real bug if you ask me endo64 11:51@hiiamboris if there are many faces need to be updated in one go, show with window face might be necessary. and it was working before, and should not be crashed anyway. hiiamboris 11:52Yes, you're right. I misread the code ;) meijeru 21:37Can anybody confirm the following: latest commit is #217c43e, but system/build/git/commit, done in that latest version, is #ef39a37. 21:47I get the impression that system/build/git/commit is gotten from the wrong source, OR it is random. ne1uno 21:53I got red-latest-source.tar.gz from red-lang.org about 12h ago, the commit message was from 3 days ago, hash random, date current Tuesday 2nd June, 2020 meijeru 12:48Now solved, see x8x's message in red/red. Oldes 14:49@dockimbel is this backward incompatibility by design? Red: >> load "a {^M^/}" == [a "^M^/" ] Rebol2 & Rebol3: >> load "a {^M^/}" == [a "^/"] @greggirwin which version is more useful? hiiamboris 15:19The old lexer: >> load {"^M^/"} *** Syntax Error: invalid value at {"^M"} *** Where: do *** Stack: load I don't think it's a valid string: should be "{^^M^^/}" Oldes 15:35@hiiamboris yes... that seems to be related bug. giesse 18:56Hmm, why would load mess with line terminators in any way? In practice you shouldn't be loading something like that in the first place, but if you were, wouldn't you expect load to not mess with it? Friday 5th June, 2020 meijeru 11:13@greggirwin I think you are the maker of decode-url. It accepts a string! argument according to the spec, but since the implementation applies mold -- for good reasons -- the parsing of that molded string will fail consistently. What can we do about it? Drop the possibility of providing a string? hiiamboris 19:02@qtxie worth raising an issue about scroller not remembering it's initial facet values? or is it eternally TBD? e.g. view [s: scroller with [selected: 0.5] button "set" [s/selected: 0.5]] Saturday 6th June, 2020 dsunanda 18:06Auto-sync does not appear to work for updating text in FIELD, RICH-TEXT, or BOX (does work in TEXT). And SHOW doesn't help....I need to do a SHOW of the parent face to get a change displayed. This is under Windows 10, recent Red nightly: view [ b1: Rich-text 100x100 Red b2: Box 100x100 Blue b3: Field 100x100 Forest b4: Text 100x100 Teal return button "Count" [ n: 20 until [ n: n - 1 b1/text: b2/text: b3/text: b4/text: form n wait 0.1 ;; show [b1 b2 b3 b4] <-- makes no difference ;;show b1/parent ;; <-- magic line to update all displayed faces n = 0 ] ] ] hiiamboris 18:08@dsunanda https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/do-queued-events.red dsunanda 18:11@hiiamboris Cool - thanks! Works in the above code. I got some other, deeper, code where updates seem to get lost....I'll try it on those later..... Monday 8th June, 2020 rebolek 09:16Have I missed something? Red now doesn't autoconvert CRLF to LF? Or am I doing something wrong? hiiamboris 09:25 >> write/binary %1 rejoin [cr lf cr lf] >> read %1 == "^/^/" 09:26Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb rebolek 09:26@hiiamboris try this: read https://qcode.us/codes.html hiiamboris 09:27 >> s: read https://qcode.us/codes.html == {<!doctype html>^/<html lang="en">^/ <head>^/ <meta charset="utf-8">^/ <meta http-... >> find s rejoin [cr lf] == none rebolek 09:28Interesting, I got {^M^/^M^/ ^M^/ ^M^/ ^M^/ hiiamboris 09:28linux read bug then rebolek 09:29MacOS actually, but they're both curl based, so it's probably related hiiamboris 09:29See https://github.com/red/red/issues/4427 also 09:29I guess the fix was incomplete rebolek 09:30That may be related. @qtxie ? hiiamboris 09:32If @qtxie actually comes around --> also :point_up: [June 5, 2020 10:02 PM](https://gitter.im/red/bugs?at=5eda96ab7da67d06faf46a13) Oldes 10:16@rebolek I'm getting CRLF when read it in Rebol3 on Windows, so I think that server is sending it. 10:22@hiiamboris should the read convert CRLF to LF by default? rebolek 10:51@Oldes yes, read should convert to LF and write to whatever your platform uses 10:54@Oldes you can try in Rebol2 (with http:// version): read http://qcode.us/codes.html qtxie 11:40> @qtxie worth raising an issue about scroller not remembering it's initial facet values? or is it eternally TBD? > e.g. view [s: scroller with [selected: 0.5] button "set" [s/selected: 0.5]] IIRC, it's TBD. 11:43> That may be related. @qtxie ? Yes. Maybe. hiiamboris 16:46@qtxie both GUI & CLI consoles started eating RAM recently (between May 28 and June 8) 16:47New console: ![](https://i.gyazo.com/4566bc82a40d014a269e5e8ed1cda52d.gif) Older: ![](https://i.gyazo.com/98b27e9970a3e781370fee8d6e6918a8.gif) 16:47view [text rate 10 on-time [face/data: stats]] 20:20Actually it's not the console, it's Red. Nevermind. I'll tell Nenad. Tuesday 9th June, 2020 greggirwin 01:57@meijeru since I don't remember when/why string support was added, we'll either need to check, or decide if we only mold when the arg is a url!, but leave it as is if it's a string!. meijeru 09:57String support does not seem necessary, since we can always do to-url on the argument before calling, I suppose? 09:58On the other hand, that would mean a double passage if the argument is available as a string in the first place... planetsizecpu 15:38This occurs on today's build on pressing CTRL+L to clear console (after clear) pressing any key 15:38[![about.jpg](https://files.gitter.im/red/bugs/tlIY/thumb/about.jpg)](https://files.gitter.im/red/bugs/tlIY/about.jpg) hiiamboris 15:45Confirmed on W7 greggirwin 20:03I don't see decode-url being used with strings in the code base. @rebolek or @Oldes, do you know if there's a reason we need to support strings there? Wednesday 10th June, 2020 Oldes 08:11@greggirwin sorry, I was not following probably... is there any reason, why it should not allow string input? 08:13I can imagine, that when I parse raw HTML, I may need to decode some urls... I know that I could use decode-url to-url something, but that is one more action to type. 08:15And I think that this raw html parsing is something, which you will not see in many public code bases, but still may be quite common. rebolek 08:15I agree it makes sense to allow strings, especially in parsing Oldes 08:21@greggirwin I can imagine it could support also binary!... R3 is buggy btw as it has no limit.. R2 handles binary correctly: >> probe decode-url to-binary http://localhost:3/a make object! [ user: none pass: none host: "localhost" port-id: 3 path: none target: "a" ] rebolek 08:30Also decoding query would be nice feature to have :) Oldes 08:34@rebolek what do you mean? rebolek 08:44that a=1&b=2 would be decoded to #(a: 1 b: 2) Oldes 08:54ah.. right:) meijeru 12:00:+1: Thursday 11st June, 2020 greggirwin 19:55We would need to make decoding the query an option, or just add a helper. Not all query data is key-value. 19:57It should be a simple change to support strings properly. I tend to ask "Do we need this?" when it comes from a bug. 20:06Not sure how useful binary support would be, even more than strings. Decode-url is a specific name, and the extra calls are not terribly onerous to type. If all it does is add to url!, the added code isn't bad, but then the user is presented with more questions. Do I need to dehex or percent encode strings or binarys before passing them in? If it only takes a URL, that goes away. Friday 12nd June, 2020 rebolek 04:38Not all web pages are in 7-bit ASCII/UTF-8 unfortunately, so I usually read/binary them before parsing. It's not binary! technically, but must be in Red greggirwin 04:50I'm just talking about the URLs, not the content. 04:56If it's a URL (as binary) *in* content, then you still have to identify it first, to pass it to decode-url. rebolek 04:57Yes, but if we support strings in decode-ul, supporting binary makes sense also. greggirwin 05:00Since I think it shouldn't support strings, I'll agree. ;^) rebolek 05:00:-) giesse 08:31> Yes, but if we support strings in decode-ul, supporting binary makes sense also. Actually, it doesn't, because you need to know the encoding (charset) in order to handle binary! as well. If you are reading a non-UTF-8 page as binary, you will have to decode it to string! before you pass it to decode-url anyway. 08:33I guess it's also time for me to post this again: https://giesse.github.io/rebol-power-mezz/parsers/uri-parser.html greggirwin 08:36:+1: Sunday 14th June, 2020 GiuseppeChillemi 13:18I suppose it is a bug: quantities: ["1" "2" "3" "4" "5" "6" "7" "8" "9"] view [text-list 100x80 data quantities on-select [probe face/selected]] Click on for the first time, result is -1, then I get the correct index hiiamboris 13:19on-change GiuseppeChillemi 13:22Thanks, I have missed that "old" word in the documentation Tuesday 16th June, 2020 dsunanda 16:18The code below - if run under Rebol (and with the line run-mode: 'rebol) will display a window with a button that says "hi". If run under Red (and run-mode: 'red), it displays two separate windows. If you dismiss one of them, and type anything in the GUI console, it'll crash). Red [] Rebol [] run-mode: 'red ; run-mode: 'rebol unview/all panel-contents: layout [button "hi"] main-window: layout [panel-face: panel 300x300 []] either run-mode = 'red [attempt [view/no-wait main-window]][attempt [view/new main-window]] append panel-face/pane panel-contents show panel-face This changed line almost (but not quite) fixes the problem: main-window: layout compose [panel-face: panel 300x300 (copy [])] hiiamboris 16:23Can't reproduce the crash 16:23Wait, I succeeded 16:26No, nevermind. It crashed one of my modified builds, not the one from master branch. 16:28Also I believe you should be using layout/only, otherwise you kinda put a window inside another window, which is a hack. dsunanda 17:36Thanks! Easy when you know how :) For the record I should have said: latest nightly, under Win 10. LAYOUT/ONLY looks good -- seems to work. Even better (from my perspective) is: append panel-face/pane panel-contents/pane As that seems to work in both Red and Rebol. Still, it'd be nice to have an error code rather than an uncontrolled crash - I've been muttering curses about unstable Red for a couple of days as I've chased this down in a large code base :(- hiiamboris 17:37:D I know the feeling... not a day without a few more bugs reported... 17:37Can anyone reproduce the crash on W10? @toomasv @greggirwin dsunanda 17:38Bugs are signs the code is being used :) - so good in a way. toomasv 17:56Here it doesn't crash, at least not at once - I have to close the window as it gets stalled. With layout/only it works. Also with panel-contents: make-face/spec 'button ["hi"] When window is closed, there is "face not linked" error. With last line changed into do-events there is no error. (W10) greggirwin 18:01No crash here either. 18:02@dsunanda perhaps add a note to https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol. dsunanda 18:15@greggirwin Have you tried typing something in the console after displaying the View? That's when it crashes for me. hiiamboris 18:16That's the catch 18:17Reminds me of the reset-buffer error ;) 18:20Doesn't crash here, but locks up and scrolls infinitely 18:24Reported. greggirwin 18:24@dsunanda yes. Tried closing each window first as well. Will try again. I'm on a local build, which may be the difference. 18:28Aha! It's not just typing anything. If I press Enter, to eval, then I get unending output that never shows (GUI console). Spinning the CPU but not eating memory. 18:29Same as @hiiamboris. hiiamboris 18:31:+1: toomasv 19:22Same here. Wednesday 17th June, 2020 planetsizecpu 10:19Just found this on today's build about Red 0.6.4 for Windows built 17-Jun-2020/10:34:50+02:00 commit #2ffb932*** Script Error: invalid part argument: none *** Where: copy *** Stack: about But console still run loziniak 10:29Today I found this. I wonder if anybody can reproduce it, and if it's of any importance, given that IO2 is near. --== Red 0.6.4 ==-- Type HELP for starting information. >> probe write http://httpbin.org/put [HEAD] "" == "" >> probe write http://httpbin.org/put [HEAD] *** Runtime Error 1: access violation *** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/string.reds *** at line: 932 *** *** stack: red/string/alter 09F72284h F528EE78h -1 0 true 0 *** stack: red/string/concatenate 09F72284h F528EE78h -1 0 true false *** stack: red/simple-io/request-http 125 09F72254h 09F728A4h 00000000h false false false *** stack: red/url/write 09F72254h 00000000h false false false false 09F72244h 09F72244h 09F72244h 09F72244h *** stack: red/actions/write 09F72254h 09F72264h false false false false 09F72244h 09F72244h 09F72244h 09F72244h *** stack: red/actions/write* -1 -1 -1 -1 -1 -1 -1 -1 *** stack: red/interpreter/eval-arguments F54F3D30h F534F8D0h F534F8D0h 00000000h 00000000h *** stack: red/interpreter/eval-code F54F3D30h F534F8B0h F534F8D0h true 00000000h 00000000h F54F3D30h *** stack: red/interpreter/eval-expression F534F8B0h F534F8D0h false true false *** stack: red/interpreter/eval-arguments F54F91F0h F534F8A0h F534F8D0h 00000000h 00000000h *** stack: red/interpreter/eval-code F54F91F0h F534F8A0h F534F8D0h false 00000000h 00000000h F54F91F0h *** stack: red/interpreter/eval-expression F534F8A0h F534F8D0h false false false *** stack: red/interpreter/eval 09F72214h true *** stack: red/natives/catch* true 1 *** stack: ctx||561~try-do F7EFC7CCh *** stack: ctx||561~do-command F7EFC7CCh *** stack: ctx||561~eval-command F7EFC7CCh *** stack: ctx||561~run F7EFC7CCh *** stack: ctx||561~launch F7EFC7CCh *** stack: ctx||579~launch F7EFC310h *** stack: ***_start rebolek 10:31AFAIK current problems with write url! [] aren't going to be fixed. pekr 12:16Who said IO2 is near? Thursday 18th June, 2020 dsunanda 10:57@greggirwin subpanel bug -- Note added to Differences page as requested - https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#vid-panel Demo code in note is safe to run as it does not crash console (it raises a FOREACH error instead). The code below does still lose me an entire console session when window is dismissed: main: layout [ h1 "Subpanel Examples" button "Panel 1" [clear panels/pane append panels/pane panel1 show panels] return panels: panel 220x140 [] ] panel1: layout [h2 "Panel 1"] view main hiiamboris 18:37I think it's the same as your previous example. Window/pane abuse ;) greggirwin 19:14I wonder if this is related to the [dynamic tab crash](https://gist.github.com/greggirwin/c4ba0b07e73b7e050b0f1df6bd80c15a) reported not long ago. planetsizecpu 19:40On today's build I noticed elevators and kart rate processing speed increment, now run normal as they did before fast lexer merge, so the arrangements I made to adjust temporal behavior on kart now are giving ultra fast travel speed :-) hiiamboris 19:48Hm. So if one buys a faster PC, one then must keep up with it's new speed? That would extend Moore's law to brainpower ;) greggirwin 20:37That was a real issue with some early games, which were written for a specific machine. e.g. early 8086 PC with an 8Mhz clock rate. If you got a 286, it was instantly "Game Over". hiiamboris 20:59Like pacman ;) greggirwin 21:03[This](https://en.wikipedia.org/wiki/The_Ancient_Art_of_War) was one of my favorites. Friday 19th June, 2020 planetsizecpu 07:10Yes, it may be an issue if things go much more faster. I currently test with two machines, a slower 4-core pentium at home and a more modern core i5 at work (sig), the values are located in the middle ground to make it playable. I usually tend to test things with slow machines, this helps to locate errors that would otherwise go unnoticed, it is a oddity that I drag from the vt100 times, where a simple cleaning of a scroll area could take several seconds, unnoticed on console but time wasting on terminals :) dsunanda 08:42@hiiamboris Pane abuse.....Technically, it's an example of a one-liner that works in Rebol while crashing Red. Still searching for a compatible one-liner that crashes both :) hiiamboris 09:31@dsunanda I see that rebol adds not the window face, but it's pane in this case. But I guess in Red a design decision was never made - should we make special case to add the pane? or raise an error? or should we support windows attached to other windows? it might make sense actually, although unsure how portable it will be and how much extra work will require dsunanda 11:57@hiiamboris Thanks. There are loads of interesting design decisions about how far either Red or Rebol should go to detect and/or report errors. And getting the balance is tricky, and won't satisfy everyone. Right now, my experience is that Red has a lot to learn from Rebol in this respect - and that makes Rebol currently much better for app developers. In an ideal Gitter, we'd have an app-developer Red chat room to curate such issues - for now, I'll hop over to chit-chat. See you there! hiiamboris 12:00I guess I'll fill a REP page for that as a reminder. pekr 13:48@dsunanda there is a channel for developers and it is called red/red Monday 22nd June, 2020 Oldes 11:29 red >> to-string #{C2E0} *** Access Error: invalid UTF-8 encoding: #{C2E00000} *** Where: to *** Stack: to-string Shouldn't there be just #{C2E0} in the error message? Tuesday 23th June, 2020 rsheehan 08:33On macOS on-enter doesn't seem to work: view [input-field: field on-enter [print ["works"]]] Oldes 12:37Is this by design? >> length? probe to-ref #{010231} @1 == 3 12:37(hm... here there are the 2 chars visible, but not in Red console) 12:38[![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/48JG/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/48JG/image.png) hiiamboris 12:44That's how I see it: ![](https://i.gyazo.com/4a00bd5b7e4584de1f4321e3bad05c7d.png) meijeru 13:20Needs an issue in my view. to-string #{010231}" gives "^A^B1" and to-ref "^A^B1" gives an error message. So your code should also error out. Oldes 13:39It needs also some documentation imho. So ref! should contain just a subset of chars? 13:40Btw... in my version to-ref "^A^B1" does not throw an error. 13:41 red >> equal? (to-ref "^A^B1") to-ref #{010231} == true 13:48This also does not look correct: >> length? probe append @abc lf @abc == 4 13:52It should be: @abc^/ or error. 13:54I'm more for the error and limit ref! a little bit. hiiamboris 13:57Don't forget as may coerce strings around. Oldes 14:01ok... so it should be using the missing construction syntax in such a cases... like: #[ref! "abc^/"] 14:04The true is, that I wanted to use ref! as a pdf's _name object_, which can be obscure: [![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/infX/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/infX/image.png) meijeru 14:33ìt is true that to-ref "^A^B1" does not give an error but: >> @^A^B1 *** Syntax Error: (line 1) invalid ref at @^A^B1 *** Where: transcode Oldes 15:19Right... I would expect: >> to-ref "^A^B1" == #[ref! "^A^B1"] >> to-ref "AB1" == @AB1 Sunday 5th July, 2020 setop 08:53To not screw my 64bit system, I'm trying to run red in a container 08:54I have dl the red-064 binary, and try the following : FROM debian:buster-slim RUN dpkg --add-architecture i386 RUN apt-get update RUN apt-get -y install libc6:i386 libcurl4:i386 WORKDIR /app COPY red-064 ./red RUN /app/red CMD [ "/app/rep" ] 08:54but is is stucked here : docker build -t red . Sending build context to Docker daemon 11.72MB Step 1/8 : FROM debian:buster-slim ---> 2dae943fc808 Step 2/8 : RUN dpkg --add-architecture i386 ---> Using cache ---> a8c5967ea86a Step 3/8 : RUN apt-get update ---> Using cache ---> 4c1267860895 Step 4/8 : RUN apt-get -y install libc6:i386 libcurl4:i386 ---> Using cache ---> ae232bd20ed0 Step 5/8 : WORKDIR /app ---> Using cache ---> c972fd5f45dd Step 6/8 : COPY red-064 ./red ---> Using cache ---> 7b2ab432d7d4 Step 7/8 : RUN /app/red ---> Running in 21a28f89b4b4 Compiling compression library... Compiling Red console... ^C 08:54burning the CPU ... :( 08:55any idea ? rebolek 09:13compilation takes some time, you probably need to wait a bit setop 09:14any idea on how long on a quite recent CPU (Intel(R) Core(TM) i7-7600U CPU @ 2.80GHz) 09:15? rebolek 09:24I'm on i5-8250U and it usually takes between 30-60 seconds setop 09:25ok 09:25for sure I let it run longer. 09:25I'll retry with 5 minutes. 09:25is there a way to have more information on the progress ? rebolek 09:26yeah, I never encountered endless loop when compiling, it either compiles or throws an error, so just wait a bit more 09:28you can run the compiler in verbose mode to get more info on what's happening setop 09:42ok, my bad, I didnt get that there is a compilation each time we lanch the console. 09:43it works but 60s is very long to get a prompt 09:43is there a way to cache the "compiled console" somewhere ? rebolek 09:46Certainly, I build the console myself, it's easy and you have full control, I don't use red.exe at all. setop 09:47ok, I'll have to dig into it... rebolek 09:50- clone the Red repo - download Rebol from http://www.rebol.com/downloads.html and put the exe into Red repo directory - run Rebol and type do/args %red.r "-r environment/console/CLI/console.red" - wait some time - now you have compiled console for your platform greggirwin 10:04@setop once the console is built, you can run it directly. If you don't rebuild Red itself, the previously built console should be used automatically. setop 10:06I was using ephemeral container, that's why. 10:06I did what @rebolek suggest and it work 10:06I have a console in my docker image 10:07is there a way to do it with the compiler ? 10:17honestly, I had bad experience using 32bit executables on my debian 64bit machine. that's why I was trying to use docker for Red but it is complicated. you should really target linux x86_64 in addition to 32bit. cross compilation was appealing (I have an old 32bit server in the basement) but it is not cross compilation as it does not compile for 64bit. 10:23if I create software with Red, I don't want to ask my user to install an other architecture on their laptop. rebolek 10:2464bit support is of course important and will come sooner or later. setop 10:24great ! 10:25what are the blokers ? 10:25 > rebolek 10:32It means *a lot* of architectural changes, like the size of value cells that needs to e expanded to support 8-byte pointers. setop 10:34And, there is no way to encapsulate the 32bit version in 64bit exe with the mandatory library that are brought by "dpkg arch x86" ? if you see what I mean ... rebolek 10:39This probably may be possible on Linux, but AFAIK there are no such compatibility libraries on macOS. setop 10:40selfishly, I don't care about macos :) rebolek 10:43:-) macos is actually the most problematic 64bit platform as unlike Windows and Linux, they do not provide any 32 compatibility layer (that's why I still have Mojave on my Hackintosh and don't want to upgrade) setop 10:44:) 10:45That's why IMHO someone (not me as I don't have enough skill * time to do it) should try to tackle linux 64bit before trying a more general approach. rebolek 10:45so we need to wait. 64bit Red will come certainly, but it's a big effort. setop 10:47BTW, it remembers me when I was tinkering rebol on my imac bondi, 1st gen. 10:48(too many years ago) rebolek 10:49nice machine :) setop 10:51indeed, still in my attic. Should still boot... 10:55actually my idea of encapsulation is a bit stupid as the exe produced by the compiler (32bit encapsulated for 64bit, hypotetically) will still be 32bit exe. 10:56do you think intermediate representation such as LLVM-IR could facilitate the job of porting the compiler ? rebolek 11:08I believe so Oldes 12:01Is this ok? In Rebol: >> type? %ab@c == email! In Red: >> type? %ab@c == @c Bitsoma 12:07Hello Red Community 12:10Up until a couple of weeks ago I had no problems with 'read https://www.kessler.de' Now however I get a timeout. Something probably change at our hosting company. I can read from other websites without any problem. Another one which isn't working is 'https://www.1und1.de'. I tested this with the latest RED from 2-Jul-2020. Any help? hiiamboris 12:12Hi @Bitsoma ☻ No problem reading those sites on W7. What platform are you on? Bitsoma 12:22W7 as well. Most other sites are just fine. hiiamboris 12:23Are you able to read those sites in the browser? Bitsoma 12:23Sure, that is no problem. hiiamboris 12:24Installed this fix? https://github.com/red/red/wiki/%5BNOTES%5D-Enable-TLS-1.1-and-TLS-1.2-on-Windows-7 Bitsoma 12:28Thanks for the suggestion I will need to investigate this. 12:41The update was already installed but not the Easy Fix. This did the trick. Thanks a lot for your help. Greatly appreciated. hiiamboris 12:44You're welcome :+1: greggirwin 20:08@Oldes Rebol didn't use @ except in emails, and also used percent encoding for files. In Red we now have ref!, and new file! rules that require quoting rather than using percent encoding. There was a lot of design discussion about the pros and cons each way on Rebol's design in that regard. Rebol: >> foreach val probe reduce [%ab@c %ab %ab@ %"ab@c"][print [type? val tab val]] [«@c %ab «@ %ab@c] email «@c file ab email «@ file ab@c Red: >> foreach val probe reduce [%ab@c %ab %ab@ %"ab@c"][print [type? val tab val]] [%ab @c %ab %ab @ %ab@c] file ab ref c file ab file ab ref file ab@c Looking at https://en.wikipedia.org/wiki/Filename, only a couple older systems disallow @ in filenames. Unfortunately, old FAT systems fall there. But the use cases for writing to those should be very rare these days, and we need to look ahead not back. Does anyone see, or know a reason why we should disallow @ in file! values? You can work around it with quoting today, but my gut says it should be supported without quotes. Give it some thought, considering how ref! applies too. Oldes 20:12I simply don't like that @ in Red now works as a delimiter: >> load {%xx@xx} == [%xx @xx] hiiamboris 20:14But if was not a delimiter, %xx@xx would be ambiguous: is it a file or an email? 20:16Still odd: >> a%01@b *** Syntax Error: (line 1) invalid word at a%01@b *** Where: transcode *** Stack: load >> a@b%01 == a@b%2501 >> a@b%2501 == a@b%252501 >> a@b%252501 == a@b%25252501 Oldes 20:18In Rebol, the email has precedence... my example with %ab was unfortunate... >> %31b@c == 1b@c >> to-email " a@b" == %20a@b greggirwin 20:19@Oldes so you *like* the design where something that looks like a file, because it starts with % is not always a file? Oldes 20:21I don't know... that's why I'm asking... anyway.. I'm inclining, that @ should not work as a delimiter in some cases. hiiamboris 20:21Question though remains, how does one write an email that starts with a percent encoded char. Oldes 20:22in Red: >> to email! " b@c" == %20b@c greggirwin 20:23Oy. I guess we need to hit the email RFC along with URLs now, for percent encoding rules. hiiamboris 20:25I guess this will need a serialized form to work because the molded value is unloadable. Monday 6th July, 2020 giesse 08:40wait, is percent encoding allowed in email addresses? https://en.wikipedia.org/wiki/Email_address#Syntax greggirwin 23:05No, it is not from all we found. Boris found a round-trip issue, which Nenad fixed quickly. email/mold used url/mold, which is shouldn't have. Thursday 9th July, 2020 Oldes 13:41Is it by design, that system/options/boot is returning string! with local file instead of file!? greggirwin 20:05Yes. For now. %environment/functions.red@extract-boot-args simply breaks up the args from the OS but doesn't convert them to Red values. Red follows R2 here, with the exception that it keeps options/boot consistent with the rest of them, by not changing it. Options/path, OTOH, is changed by change-dir, so it *is* a Red file. That said, it's something I'd like to revisit. R2's design here confused me more than once. It's true that system/script/args is just the raw string, which you can load, but the naming doesn't make it clear for a feature that should be used quite heavily. Since they current options don't limit you, the way we'll probably deal with this is to hide them behind a CLI dialect. Saturday 11st July, 2020 Oldes 16:46@greggirwin interesting... I was asking because I found it inconsistent with R2, where all the paths and files are file! types. Friday 17th July, 2020 Oldes 20:26It's possible to crash Red when used sort/compare on vector with floats: >> sort make vector! [1.0 3.0 2.0] == make vector! [1.0 2.0 3.0] ;<--- OK >> sort/compare make vector! [1.0 3.0 2.0] func[a b][a > b] ;<---- CRASHes 20:31Also, is it by design, that sort does not accept all any-string! types? If so, than its specification should not claim that it accepts series! >> sort %cbd *** Script Error: sort does not allow file for its series argument hiiamboris 20:38I don't think these 2 were reported. Oldes 22:48Also Red's block sorting looks quite messy with comparison with Rebol: Red: >> sort reduce [1 1.0 #"c" integer! 1x1 $1 <tag> e@mail "str" %file ()] == [integer! unset "str" %file #"c" 1x1 <tag> e@mail $1.00 1.0 1] R2: >> sort reduce [1 1.0 #"c" integer! 1x1 $1 <tag> e@mail "str" %file ()] == [unset integer! 1 1.0 $1.00 #"c" 1x1 "str" %file e@mail <tag>] R3: >> sort reduce [1 1.0 #"c" integer! 1x1 $1 <tag> e@mail "str" %file ()] == [unset! 1.0 1 $1 #"c" 1x1 "str" %file e@mail <tag> integer!] Saturday 18th July, 2020 hiiamboris 09:22How is it "messy"? Just different type ordering Monday 20th July, 2020 Oldes 09:14I prefer ordering _small_ values (like numbers) first. greggirwin 17:49 >> sort reduce [12345678 123456.78901 #"c" integer! 9999x999 $123456 <tag> e@mail "str" %file ()] == [integer! unset "str" %file #"c" 9999x999 <tag> e@mail $123456.00 123456.78901 12345678] 17:50@oldes, seems either you want to sort by formed length, or assume how large certain types of values will be. Is that correct? What's the use case? Tuesday 21st July, 2020 toomasv 12:28:question: >> v: make vector! [1 0 2 0 3 0 4 0] == make vector! [1 0 2 0 3 0 4 0] >> extract v 2 == make vector! [0 0 0 0 1 2 3 4] rebolek 12:30I would say a bug. toomasv 12:30Ah, found #4409 13:16Another, seems not reported? >> v: make vector! [1 444] == make vector! [1 444] >> sort/compare v func [a b][(length? form a) > (length? form b)] == make vector! [1 444] >> sort/compare v func [a b][probe reduce [a b] (length? form a) > (length? form b)] [#"Ƽ" #"^A"] == make vector! [1 444] >> sort/compare v func [a b][(length? form to-integer a) > (length? form to-integer b)] == make vector! [444 1] hiiamboris 13:19I thought it should crash 13:23Not sure where I saw the crash though :/ can't find it ldci 13:54 v: make vector! [1 0 2 0 3 0 4 0] extract to-block v 2 == [1 2 3 4] 9214 14:06extract's logic is faulty, the output: make series ... part. 14:07 text >> a: make vector! [1 0 2 0 3 0 4 0] == make vector! [1 0 2 0 3 0 4 0] >> b: make vector! divide length? a width: 2 == make vector! [0 0 0 0] 14:08Or maybe it's vector!'s fault because it's the only series datatype that mixes pre-allocation with initialization. greggirwin 17:17The ticket brings up a couple important points. For those who remember the list! type in R2, it was devilish because it was *close* to other series behavior, but not exactly the same. Any benefit you might have gotten from it (linked list vs array) was lost in bugs and extra logic in mezzanines that had to be aware of the differences. Red is a high level language, and I would much rather have consistent behavior than a little extra performance, agreeing with @hiiamboris' notes in the ticket. Friday 24th July, 2020 Oldes 17:22Is this acceptable? >> load {'<<<} == ['< <<] 17:47And this one? >> type? load {'/a} *** Syntax Error: (line 1) invalid refinement at '/a *** Where: transcode *** Stack: load >> type? load {'//a} == lit-word! ;<-- I expected invalid refinement! too 9214 18:15> Is this acceptable? https://github.com/red/red/issues/4562 Sunday 26th July, 2020 Dobeash 05:58I think I may have posted about this before, but COMPRESS seems to produce a "non-standard" result in Red. Red> compress/deflate "12341234123412341234" == #{3334323641C700} R2> head clear at tail remove/part compress "12341234123412341234" 2 -8 == #{333432363144C300} R3> head clear at tail remove/part compress/gzip "12341234123412341234" 2 -8 == #{333432363144C300} such that I can write functions in R2/R3 to produce a compressed XML file that, say, Microsoft Word can read ... but not in Red. greggirwin 08:19@qtxie @bitbegin :point_up: qtxie 13:30IIRC, we only support [fixed Huffman codes](https://www.w3.org/Graphics/PNG/RFC-1951#fixed), maybe Word cannot decode it. Friday 31st July, 2020 planetsizecpu 06:26Yesteday installed last automatic build: Red 0.6.4 for Windows built 29-Jul-2020/15:33:29+02:00 commit #9fbddcb I compiled my game and found the executable it's having a different behavior, some funcs are not working properly as for example gravitational func and some other, but it doesn't crash. Then I complied my forms app, that works properly on intepreter, and found it crash while opening the main window in view ... This is an example of the running exe game: 06:27[![cavetest143.gif](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/sFHc/thumb/cavetest143.gif)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/sFHc/cavetest143.gif) 06:29It is a way to download older builds? as for example 2020-7-29-48830 ? I have lost that build 06:29So I could test rebolek 06:31@planetsizecpu do you have some examples of functions not working properly? planetsizecpu 06:33Not now, the fact is that I do test on console, and some times I get a new exe, so will be difficult to investigate because it runs well when interpreted. 06:35I will try to isolate what is going wrong when time permits, but I would like to get a new exe from the previous builds to give some clue. rebolek 06:40That would be helpful, thanks! planetsizecpu 13:55I found it! foreach-face GameData/CaveFace [ if face <> f [ if overlap? face f [Ret: face exit] ] ] I wrote that exit while testing, knowing that in addition to exiting the function it breaks the foreach-face loop. I forgot to remove it, strangely in the console it works fine, ignored? By removing it then the exe works as expected. 9214 14:08Can anyone dupe this? >> do %./red/tests/source/units/regression-test-red.red ~~~started test~~~ regression-test *** Script Error:   has no value *** Where: do *** Stack: do-file Also got some sporadic crash which I am no longer able to reproduce. *** Runtime Error 1: access violation *** in file: .../red/runtime/unicode.reds *** at line: 145 *** *** stack: red/unicode/cp-to-utf8 115 00EFF000h *** stack: red/unicode/to-utf8-buffer 0289A464h 00EFF000h 58781 *** stack: red/lexer/scan-alt 0289A474h 0289A464h 58781 false true true false 0019FAACh 00000000h *** stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1 *** stack: load *** stack: do-file *** stack: red/natives/do* false -1 -1 -1 *** stack: red/interpreter/eval-arguments 0289A274h 030F5630h 030F5630h 00000000h 00000000h 02DE0BA8h *** stack: red/interpreter/eval-code 02DE0BA8h 030F5620h 030F5630h false 00000000h 00000000h 02DE0BA8h *** stack: red/interpreter/eval-expression 030F5620h 030F5630h false false false *** stack: red/interpreter/eval 0289A254h true *** stack: red/natives/catch* true 1 *** stack: ctx||560~try-do 027D1DACh *** stack: ctx||560~do-command 027D1DACh *** stack: ctx||560~eval-command 027D1DACh *** stack: ctx||560~run 027D1DACh *** stack: ctx||560~launch 027D1DACh *** stack: ctx||594~launch 027D1528h endo64 14:59 >> do %tests/source/units/regression-test-red.red ~~~started test~~~ regression-test *** Runtime Error 1: access violation *** at: 7750C23Eh 9214 15:52Thanks @endo64, looks like a lexer problem to me. Palaing 21:02On windows with red-23jul20-171adb6f4.exe, with the following code: view [box white [request-file] box blue [print "ok"]] after clicking the white box once, the blue box and gui windows buttons (close/maximize...) all trigger the white box action (request-file) This did not occur until version red-29apr20-db7f36ac4.exe 9214 21:05@Palaing I can reproduce that if I open the file selection dialog and then close it with or without selecting a file. meijeru 21:06Confirmed on W10 with 29-Jul-2020 version. Monday 3th August, 2020 9214 14:47@Palaing would you like to follow through and open an issue? endo64 18:59Is this a bug? >> scan ";test" == error! >> load ";test" == [] 19:00Or better: >> transcode/scan ";test" == error! >> transcode ";test" == [] 9214 19:21I don't think so. A comment is not a value, so scan fails to infer any literal form from the string you give to it (because there's no valid literal, strictly speaking). What would you expect as a result? comment!? endo64 23:55No, I was expecting none as for scan "" because (I thought) it strips all the comments and there will be an empty string left. Tuesday 4th August, 2020 ldci 13:49Bug macOS? img: load tmp b/image: img prog: copy rejoin ["exiftool " form tmp " > exif.txt"] call/wait/shell prog clear a/text a/text: read %exif.txt this code works perfectly with -c or -r compiler options. But with -t macOS, external program is not called. /wait refinement seems the problem. Any idea? greggirwin 14:34I pinged @dockimbel on it @ldci. Not on Mac here, so can't confirm. ldci 14:35Thanks Gregg. I'm testing ... greggirwin 14:35It's ironic that what seems like it should be a simple thing is one of the trickier functions in Red. Call has a *lot* of code in it. MacOS uses the POSIX logic, so there may be a difference there from other *nixes. 9214 14:35@ldci IIRC -t macOS packs the binary into macOS bundle, whereas -t Darwin (which I think is also a default target) avoids that and gives just an executable. greggirwin 14:36@9214, that shouldn't affect the internal logic though. 9214 14:37It might if tmp is a relative path. Ditto %exif.txt. greggirwin 14:37Ah, subtle and interesting point! ldci 14:43@9214 : Yes I know the difference for compilation options. I wrote a lot of code before without problem. This problem is new. I'll check the file path. Thanks :-) greggirwin 14:43What is the return code of call when it fails? ldci 15:10@greggirwin : 1 @9214 : You're right. We must absolutely use complete paths for files: home: select list-env "HOME" appDir: rejoin [home "/Programmation/Red/Virginia/"] exifFile: to-file rejoin[appDir "exif.txt"] change-dir to-file appDir and idem for the external program: prog: copy rejoin ["/usr/local/bin/exiftool " form tmp " > " exifFile] 15:12It seems that Red is less permissive than by past. 9214 15:16I think exiftool should work OK, provided that /user/local/bin is in your $PATH. But relative paths to files will become wrong once binary is packed inside a bundle, that's one extra folder to /../ over. Palaing 15:31@9214 I've opened issue #4602 greggirwin 15:38If we have a MacOS wiki page, someone please add a note there about the path issue. Others are sure to hit this one. ldci 15:42@9214 Yes Vladimir all programs referenced in /user/local/binsuch as Tesseract, ExifTool ... work. Thanks very much for insight. 9214 15:48@ldci you're welcome! 15:48@Palaing nice, thanks! Saturday 8th August, 2020 Tovim 13:09Hi, I have run across a nice way, how to accommodate an illegal word in a paren: >> to-pa: to paren! [one 2 "three"] == (one 2 "three") >> type? first to-pa == word! >> li-pa: (one 2 "three" 4:00) *** Script Error: one has no value Is it an omission or an intention? 9214 13:16@Tovim paren! is evaluated, and so is one inside it. Use quote to suppress evaluation. >> li-pa: quote (one 2 "three" 4:00) == (one 2 "three" 4:00:00) Sunday 16th August, 2020 ne1uno 00:07https://github.com/red/red/issues/3677 seems fixed sometime after Aug/9 02:37forgot, it was already working ok win10. no change win7 Monday 17th August, 2020 dsunanda 15:20Website bug? Just had MalawareBytes block access when trying to browse www.red-lang.org. Message says "Website blocked due to trojan" MAB does let me see the main webpage; it claims to have found badness in https://static.red-lang.org/ - and presumably blocked that content. This is the "paid for" version of MAB that includes real-time protection (for some reason they'd given me a 14-day free trial). If I bypass MAB, I don't see anything obviously dangerous in static.red-lang.org Ironically, MAB defines trojans as "programs that claim to perform one function but actually do another" - like a realtime protector that acts like a PSTD'd nanny. dander 18:38@dsunanda Does MalwareBytes have a false-positive submission form? They are probably triggering on the red exes there. It's possible that having enough submissions, they may eventually fix their heuristics. dsunanda 19:21@dander They do https://forums.malwarebytes.com/forum/122-false-positives/ I'll leave it to the Red-team to report it - otherwise I could find myself in the middle of what should be a 2-party conversation. As far as I know, MAB has never triggered on the Red executables - unlike AVAST and some other low-grade AV products. dander 22:46@dsunanda I wouldn't consider it inappropriate for you to report it, since you are essentially a customer of them, and they are blocking a product you are using. However, I understand if you don't feel comfortable about it. The Red team has plenty on their plate, so I don't know how well they are able to chase things down like this Tuesday 18th August, 2020 Palaing 12:03this code crashes my console: res: make hash! 40 loop 40 [insert res "ok"] ; ok up to loop 30, crashes from 40 up Red 0.6.4 for Windows built 5-Aug-2020/18:58:49+02:00 commit #696ae43 9214 12:11https://github.com/red/red/issues/4335 Palaing 15:08ok 9214 15:11@hiiamboris :point_up: should be reopened, methinks. hiiamboris 20:11I can't reproduce on Red 0.6.4 for Windows built 17-Aug-2020/6:17:33+03:00 commit #0084083 20:12Oops, reproduced with 8000 Wednesday 19th August, 2020 Oldes 10:37Is it by design, that decimal value in path is now working as select instead of as index as it was in Rebol2? R2: >> b: [1 2 1.0 3] b/1.0 == 1 >> b: [1 2 1.0 3] b/2.1 == 2 >> b: [1 2 1.0 3] select b 1.0 == 3 Red: >> b: [1 2 1.0 3] b/1.0 == 3 >> b: [1 2 1.0 3] b/2.1 == none >> b: [1 2 1.0 3] select b 1.0 == 3 11:06Related is how the decimal is used with vector! type: >> v: make vector! [1 2 3] == make vector! [1 2 3] >> v/1 == 1 >> v/1.0 == none ;<-- if cannot be used as index, than it should throw an error like bellow >> v/a *** Script Error: word type is not allowed here *** Where: catch *** Stack: loziniak 13:42Hi! Are single quotes around system/script/args intended? % ./red sdf *** Access Error: cannot open: sdf *** Where: read *** Stack: --== Red 0.6.4 ==-- Type HELP for starting information. >> probe system/script/args "'sdf'" == "'sdf'" >> probe system/build/date 15-Jul-2020/13:52:00 == 15-Jul-2020/13:52:00 In my earlier builds of Red it used to be without single quotes. greggirwin 18:16@Oldes Red's behavior seems more useful here, and less implicit, doesn't it? I agree that if it's not supported for vectors, an error makes sense. 18:19@loziniak what platform are you on? Single quotes aren't there for me on Win10. hiiamboris 19:00@greggirwin however in light of integer/float division unification, indexing might be more foolproof 9214 19:02Foolproof, he-he: >> block: [1 1.0 2] == [1 1.0 2] >> block/1 == 1 >> block/1.0 == 2 hiiamboris 19:03Yeah that's what I'm talking about. Esp. cases like block/(x / y) 9214 19:04Ah, my bad, I missed the original message from @Oldes, he already mentioned that. hiiamboris 19:06Personally I would hate to hunt this kind of bug :D 9214 19:06> if cannot be used as index, than it should throw an error like bellow Why? If it works like select, then the result is expected. >> select make vector! [1 2 3] 1 == 2 >> select make vector! [1 2 3] 1.0 == none greggirwin 21:18@9214, I misthought, and agree with you on error. For some reason I thought vectors were a special case on series' select. On float indexes, as far as bugs, it's just a different set of tradeoffs. Do we want floats to work like all non-int values that can be used (e.g. pair!, issue!, percent!) and select, or do we want to coerce it implicitly and have it pick. Right now I vote for select, so integer! is the only picker. Thursday 20th August, 2020 loziniak 13:57@greggirwin I'm on Linux. 13:58Anyway, it seems like a bug then, I'll raise a ticket. 9214 14:08https://github.com/red/red/issues/3581 14:10And there are plenty of other tickets related to command-line argument processing. loziniak 14:27:-o 14:45new ticket: #4635 Monday 24th August, 2020 PeterWAWood 03:44[![Screen Shot 2020-08-24 at 11.41.07.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/AMHX/thumb/Screen-Shot-2020-08-24-at-11.41.07.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/AMHX/Screen-Shot-2020-08-24-at-11.41.07.png) 03:44The getting started instructions indicate that View is not available in the macOS console. This appears to be no longer the case^^^^^ 03:45You might need your magnifying glass to see the View Window though ;-) Wednesday 2nd September, 2020 rebolek 13:42In Rebol, when I save a block with one value and load it back, I get a block: >> save %delme [1] >> a: load %delme == [1] in Red, when I do the same, I get just the value: >> save %delme [1] >> a: load %delme == 1 it's annoying as it needs special handling. Is there any reason behind this behavior? toomasv 13:43 >> save %delme [1] >> a: load/all %delme == [1] rebolek 13:45That's a workaround, not an explanation. endo64 19:21I've complaining about it while ago, it is stated in the official Rebol docs Note that if the file only contains a single value like an integer or date, the result will be that value. but no explanation why it is like that. R2's behavior doesn't look good though: >> save %delme [1] read %delme == "[1]" ; <-- shouldn't be "1"? >> save %delme [1 2] read %delme == "1 2" 19:22See also https://github.com/red/REP/issues/44 19:24Another workaround is transcode read %delme ; == [1] guaracy 20:14Sorry. Another workaround is write >> write %delme [1] load %delme == [1] >> write %delme [1 2 "end"] load %delme == [1 2 "end"] >> write %delme 23 load %delme == 23 Thursday 3th September, 2020 toomasv 04:25For me it seems kinda natural, that you'll get single value when you load single value, and a block of values when you load several values. Saving block and loading it is similar to loading from string: >> load "1" == 1 >> load "1 2" == [1 2] >> load "[1]" == [1] >> load "[1 2]" == [1 2] rebolek 05:04It may seem natural, but then saving [1] *should* save it as [1] and not 1 - that would be also more natural, don't you think? giesse 07:35REBOL *intentionally* saves 1 as "1" and [1] as "[1]" so that the can be distinguished. toomasv 07:37@rebolek In a way, yes. And it is how write treats it. But from the other side, there is logic also in current save behaviour. When saving a block, I am saving data in the block. If there is single element in the block, single element is saved. If I need saving data always as block (not just data in the block) I should either write the block or wrap it into another block. rebolek 07:37@giesse That's what I expect. However, Red does not: >> save %delme [1] >> print read %delme Rebol== [1] Red== 1 07:38 @toomasv > If there is single element in the block, single element is saved. If I want to save single element, I can save first block. But I'm not doing that, I am saving block!. guaracy 14:36I must agree with @rebolek . He is saving apple and loading orange i dont see any problem with save a block enclosed by brackets. Saving #{01} is not saved as "01". GiuseppeChillemi 17:58Here: https://gist.github.com/GiuseppeChillemi/b9a23523450090a094ca306adf951aa4#file-test-list-test1-red If I select an item in the list and click EDIT and modify it, the text list is not updated but the original list is. There is also a version 2 which does not work too. @ToomasV supposes it is a bug: :point_up: [September 3, 2020 7:16 PM](https://gitter.im/red/help?at=5f5124f79566774dfe50b233) toomasv 18:00Wrong ref. Right one is little bit lower there. GiuseppeChillemi 18:08I have changed the reference on the fly before the EDIT option has expired. toomasv 18:27Good! Sunday 13th September, 2020 Palaing 15:15This: loop 5 [prin "x"] prints "xxxxx", that's normal; but this script %test.red: Red [] loop 5 [prin "x"] when called from command-line (red test.red), prints "xxxxxxxxxxxxxxxx" (that is 16 times "x")... I'm on Red 0.6.4 for Windows built 12-Sep-2020/1:32:50+02:00 commit #0663cfc Edit/precision: no trouble if I have it print #"x" instead of "x" ne1uno 16:07 win10 16x, win7 5x, gui versions built few days ago. console versions work ok. try --cli Palaing 16:53@ne1uno yes it works fine with --cli . endo64 17:30Confirmed on Win10. On GUI console, works --cli. 17:45Red 0.6.4 for Windows built 12-Sep-2020/2:32:50+03:00 commit #0663cfc Tuesday 22nd September, 2020 rebolek 09:03Bug? >> parse "a" [if (true) "a"] == true >> cond: quote (true) parse "a" [if cond "a"] *** Script Error: PARSE - unexpected end of rule after: if *** Where: parse *** Stack: I would expect if cond to work. 09:04I can do if (cond) but anyway Oldes 10:01@rebolek >> cond: quote (true) parse "a" reduce ['if cond "a"] == true 10:01In your case, cond is just a word. rebolek 10:02So? I can use words that hold rules basically anywhere in parse Oldes 10:02Right.. I think it may be a bug. rebolek 10:03For example: >> steps: 1 parse "x" [steps skip] == true bubnenkoff 10:31I am not sure, but possible it's bug. I looked at issues with text-list but did not find nothing similar: f: func[] [ loop 500 [append t/data "aaa"] ] view [ t: text-list 200x400 data [] button [f] ] After 15 click on button app is crush. If increase "aaa" from 3 letters to 100 crushing happens earlier endo64 19:39For me it crashed after 22 clicks with error: *** Runtime Error 1: access violation *** at: 00433735h I also tested creating a block with 50000 strings to supply data for text-list, it didn't crash in that case. So it works if you do system/view/auto-sync?: false and show after append. 19:45@bubnenkoff if you raise a bug ticket please add my comments there or add a link to here. Wednesday 23th September, 2020 greggirwin 02:59On save/load, feel free to propose a better design. Be sure to include behavior for load + /all /part /length. And if someone can test load/into that would be great. Doesn't work here right now. rebolek 06:34@greggirwin as a first step it would be great just to return to Rebol behavior - saving a block saves a block. 08:00@greggirwin looking at the source, out is defined [here](https://github.com/red/red/blob/master/environment/functions.red#L418) but then redefined [here](https://github.com/red/red/blob/master/environment/functions.red#L446) so I'm not sure what's the point of /into greggirwin 17:51I prefer we think through the design, as just going back to what Rebol did doesn't answer your "why?" question. The second link seems to be the problem, where out gets set to a new result, rather than using the buffer that may have been passed in. The unless line above it might also be clearer, where it returns a single value, by using system/words/all [all ... giesse 17:54IMHO, if you save a block, you should load back a block. REBOL does this correctly. Thursday 24th September, 2020 rebolek 04:32@greggirwin Is there anything that can justify the change? Any reasoning behind the though: "what about, instead of saving a block, we will save just the content?" greggirwin 22:011) It's likely not a bug but a design choice, as save uses mold/only. This is the behavior in question. We don't know Carl's original reasoning either. 2) /all is not the same behavior for save and load. That is, we have two formats that can be used when saving, and loading handles both without a refinement. 3) You don't know how data was saved, only what the data is. e.g., the contents of a file. In a single app, it's easy to think only about the current environment, where all is controlled by one mind. 4) Load is smart enough to not "double block" (by default). >> s == "a: 1 b: 'test" >> load s == [a: 1 b: 'test] >> ss == "[a: 1 b: 'test]" >> load ss == [a: 1 b: 'test] >> load/all ss == [[a: 1 b: 'test]] 5) Mold/only may be a poor refinement name, because /only normally means "treat as a single value", it does the reverse here, omitting brackets for blocks. That makes it redundant with form, but there is no form/all. mold/all/only = form mold/all. Removing mold/only would be a breaking change, but it's only used a few places in the codebase. Save is 2 of them. However, form and mold are the user and source form serializers, when it comes to intent in reading code. When I see form, I think of human consumption as the goal, and when I see mold I think of load and programmatic consumption. 6) When you save a map!, you get a map literal. When you save an object, you get a series of values that you have to reduce to get an object again. 7) Being able to save and get a friendly file is a nice feature. Intent plays a part here too. I tend to use save/load for anything Red, and read/write if I'm dealing with non-Red data. For config files, we don't want the extra block characters in there, because lines of key: value pairs is clean and human friendly. 8) Exceptions in behavior based on content can either be wonderfully helpful or a pain because they're inconsistent. A) If save saves a block as a block, what does the (common) case look like to save without brackets? >> save %delete-me form b >> read %delete-me == {"a 1 b 2"} Add save/only to match mold/only, but is backwards from other /only uses? Save/all could do double duty, which makes more work if you want serialized for with no brackets. Then we have /header. Does it change how blocks are saved? >> save/header %delete-me b [header: 'data] >> read %delete-me == {Red [^/^-header: 'data^/]^/^/a: 1 b: 2} If brackets are used for blocks, you'd get: Red [ header: 'data ] [a: 1 b: 2] Which we certainly don't want, but that's what R2 does. We've just traded one implicit behavior for another. We could argue that saving Red scripts is an edge case, but almost any data file benefits from having a header (if it doesn't overwhelm the data itself), so it *shouldn't* be an edge case. I think @toomasv has the right answer for loading. If you are loading data and always want a block, use load/all. If you don't use /all you *may* get a single value, and that's also a really handy feature. No, it's a vitally useful feature. Whew! :point_right: **What if we add save/only, which saves blocks as blocks?** That still leaves mold/only as backwards in my mind, but I can honestly say it's never bothered me. One of those things that isn't quite right if you think about it, but works fine in use. The alternative is to find a new refinement name, which is probably why Carl chose it. :^) Friday 25th September, 2020 giesse 09:07> 1) It's likely not a bug but a design choice, as save uses mold/only. This is the behavior in question. We don't know Carl's original reasoning either. I disagree. Carl's intent is easy to see: the only reason REBOL strips [] when saving a block with length greater than one is because it is not really desirable to force programmers to put [] around their scripts. So, if you load a script and then save it you don't get extra [] around it. 09:12Ie. this is a "user friendly" kind of extra work that both save and load are doing. In principle, none of this is necessary, things just get a little uglier. Assuming we don't want things to get a little uglier, REBOL's behavior seems to be the best approach. I can't see any reason to have save/only. I can't see any benefit at all from save %file [1] writing "1" instead of "[1]". pekr 09:23+1 Monday 28th September, 2020 loziniak 08:15@giesse maybe for the sake of consistency and being predictable? >> print [1] 1 >> a: [a b c] insert a [1] == [a b c] >> a == [1 a b c] giesse 10:06@loziniak I don't see what that has to do with save and load. loziniak 10:11They're all Red functions :-) The more functions work similarly, the less you have to look at docs, ant the fewer mistakes you make. Unless, of course, you're a Rebol programmer. giesse 10:12... I beg to disagree :) save writing "1" only creates more confusion and more work for the programmer. loziniak 20:29Hi! When I compile simple script like this: Red [] print "sdf" using latest master sources with -r, -e and plain compilation, I get an error: REBOL/Core 2.7.8.4.3 (6-Jan-2011) Copyright 2011 REBOL Technologies REBOL is a Trademark of REBOL Technologies All rights reserved. Finger protocol loaded Whois protocol loaded Daytime protocol loaded SMTP protocol loaded ESMTP protocol loaded POP protocol loaded IMAP protocol loaded HTTP protocol loaded FTP protocol loaded NNTP protocol loaded Script: "Red command-line front-end" (none) Script: "Encap virtual filesystem" (21-Sep-2009) ** Syntax Error: Missing ] at end-of-script ** Near: (line 1703) ][ 9214 20:50It's a recent regression: https://github.com/red/red/commit/a0b15df04567c41c285114912b25ec0d19c0395f. I surmise closing ]disappeared during conflict resolution. 21:03Or rather this is two related PRs, https://github.com/red/red/pull/4452 and https://github.com/red/red/pull/4149, mashed together in a hasty conflict resolution: the topmost case misses ] and belongs to the case further down below. Tuesday 29th September, 2020 loziniak 10:59Looks like merges need a review too, Git merge hell ! ;-) Saturday 3th October, 2020 luce80 13:59set-word!s inside draw block placed after a keyword are not parsed as expected: >> about Red 0.6.4 for Windows built 3-Oct-2020/14:36:02+02:00 commit #0879e83 >> view [box white draw [pen red line 0x0 end: 20x20]] *** Script Error: invalid Draw dialect input at: [0x0 end: 20x20] *** Where: ??? endo64 19:31It's a limitation of draw dialect. view [box white draw [pen red a: line 0x0 20x20]] would work, and you can access as a/3. Monday 5th October, 2020 rebolek 06:16I smell a bug here: ; this works as expected: >> take/part back tail block: [a b c d] find block 'c == [c] ; I expect to get [c d] here, not NONE >> take/part tail block: [a b c d] find block 'c == none dsunanda 07:45 Why is there a THROW error for ending a script from the console with a HALT? (Windows 10, recent Red): write %halt-test.red "Red []^/halt" do %halt-test.red *** Throw Error: no catch for throw: halt-request *** Where: do *** Stack: do-file Worse, probably, attempt to suppress the error crashes the console: write %halt-test.red "Red []^/halt" attempt [do %halt-test.red] Tuesday 6th October, 2020 mikeyaunish 04:54It appears react/unlink fails in the following scenario: link-text: function [ text-tgt text-src ] [ text-tgt/text: text-src/text ] == func [text-tgt text-src][text-tgt/text: text-src/text] >> F1: make reactor! [ text: "F1" ] == make object! [ text: "F1" ] >> F2: make reactor! [ text: "F2" ] == make object! [ text: "F2" ] >> G1: make reactor! [ text: "G1" ] == make object! [ text: "G1" ] >> G2: make reactor! [ text: "G2" ] == make object! [ text: "G2" ] >> probe re-res: react/link :link-text [ F1 F2 ] func [text-tgt text-src][text-tgt/text: text-src/text] == func [text-tgt text-src][text-tgt/text: text-src/text] >> probe re-res: react/link :link-text [ G1 G2 ] func [text-tgt text-src][text-tgt/text: text-src/text] == func [text-tgt text-src][text-tgt/text: text-src/text] >> probe re-res: react/unlink :link-text [ G1 G2 ] none == none This behaviour of not unlinking properly is dependent on the order that the unlinking takes place. IE. unlink F1-F2 then G1-G2 and it works fine. Not sure if I am doing something wrong here or if this is a genuine bug? Wednesday 7th October, 2020 Oldes 13:43currently: >> save %/r/test.txt new-line/all [1 "a"] true >> to-string read %/r/test.txt == {^/ 1 ^/ "a"^/} I would prefer to have a result {1^/"a"} (without indentation and new lines at head and tail)... what about others? 13:44Also I must question myself, if there should not be CRLF on Windows. 13:50hm.. I can use write/lines to have what I want, but still don't know, if there should be the indentation when save is used. 9214 13:56This type of formatting is always applied when molding values (and can be disabled with mold/flat). Since save works on the level of textual data format, it makes sense for it to apply indentation and preserve new-line markers. I would personally prefer tabs instead of spaces though, because that would be consistent with the official style guidelines, but that's a nitpicking. Oldes 14:11The thing is that I don't want it _flat_, that is the reason why new-line is used. Anyway.. write/lines is good enough. It came to my attention because the LF vs CRLF. 14:14Maybe write/lines/binary could always use LF and write/lines system dependent newlines (CRLF on Windows). 14:56But somehow I still feel, that saving (using save) into *.txt file, should use host's line endings. rebolek 15:37IIRC Rebol used host's line endings, didn't it? Thursday 8th October, 2020 endo64 05:49Yes Rebol uses host's line endings. Monday 12nd October, 2020 rebolek 10:28I'm not sure why, but suddenly my Red session lost ability to do any file access: >> quit *** Access Error: cannot open: %/Users/sony/.red/.Red-Console/console-cfg.red *** Where: write *** Stack: quit _save-cfg save >> ls *** Access Error: cannot open: %/Users/sony/Code/csa-scrapers/ *** Where: read *** Stack: ls list-dir 11:44I was able to reproduce the bug (I still need to isolate it), it happens when doing read-thru or some other operations with cache. 12:52I have a simple example, if anybody can confirm it, I would appreciate it: repeat i 1000 [link: probe rejoin [http://duckduckgo.com?q= i] read-thru link query path-thru link] 12:53On macOS, this will fail with timeout when i = 249: (...) http://duckduckgo.com?q=249 *** Access Error: cannot connect: http://duckduckgo.com?q=249 reason: timeout *** Where: read *** Stack: read-thru 12:54When running the same line again in the same session, the bug will happen after four reads: >> repeat i 1000 [link: probe rejoin [http://duckduckgo.com?q= i] read-thru link query path-thru link] http://duckduckgo.com?q=1 http://duckduckgo.com?q=2 http://duckduckgo.com?q=3 http://duckduckgo.com?q=4 *** Access Error: cannot open: %/Users/sony/.red/cache/19/1936D57409D65FDF0B03BB7EF5EC641F *** Where: read *** Stack: read-thru 12:55After that, you can't do any file access, nor quit Red (as it wants to save console history) 9214 13:21@rebolek confirmed on macOS Mojave 10.14 with the latest build, same symptoms as you describe. rebolek 13:24I've tested this on Linux with a different result: on Linux, Red is able to run the first loop (caching all 1000 pages). On subsequent run, it fail with timeout when i = 21. When trying it again, it fails with timeout on first read (remember this is reading from cache, so timeout error makes no sense). However, unlike on macOS, it's possible to read from local filesystem. 13:25@9214 Thanks! I'll open a bug for it. 13:26Both numbers, 249 on macOS and 1021 on Linux are suspiciously close to powers of 2. 13:29@9214 can you test it on Windows? 9214 13:36@rebolek everything is OK on W10, so it's a *nix-specific issue. 13:44And on Linux it cached 1k pages, then failed on 15th iteration (rather than 21st) with a timeout, then on the first read. quit, ls etc work fine after that. rebolek 13:45@9214 thanks, same experience here, Windows seem to be fine, Linux can do almost 2^10 read-thrus then fails, but doesn't lock down whole IO. 13:46Feel free to improve the description https://github.com/red/red/issues/4675 greggirwin 21:09Really good catch @rebolek and @9214. Tuesday 13th October, 2020 mikeyaunish 02:48Just wondering if anyone has had a chance to look at my react/unlink problem posted Oct. 5th. On further investigation maybe my reuse of the reaction function is not valid. Can anyone comment? greggirwin 03:44I haven't, but reusing reactors is a suspect to be sure. We have some other notes [here](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity). 03:44Have you tried dumping the reactions and inspecting them? 03:48One really nice thing about react is that it's implementation is small, and all mezzanine level. Makes finding bugs much easier. mikeyaunish 04:09Thanks @greggirwin - this answers my question. Got caught by the "copy" again. Oldes 08:13Is this the best result? >> find [100% 1 1.0] 1.0 == [1.0] If there is find/same maybe pure find could be more forgiving, couldn't be? greggirwin 17:19I assume you mean you want it to match 100%. If so, what about this? >> find ["a" %b @c] @c == [@c] What is your use case? 17:21/same isn't a great fit, though the best of the current refinements, as scalars don't have an identity. Wednesday 14th October, 2020 Oldes 07:17Sorry @greggirwin , but I don't understand your find ["a" %b @c] @c argument. How it is related? 07:17My logic is: >> 1 = 1.0 == true >> 1.0 = 100% == true 07:18While: >> "a" = @c == false 07:22And... >> same? 1 1.0 == false 07:22 red >> ? find ... /same => Use "same?" as comparator. ... 08:10The true is, that I don't have any real use case. It is just that Carl introduced this behaviour in R3 (just without percent, which was just not yet done in that time). So I'm just asking, if this is wanted or not. rebolek 08:57@Oldes I agree, find should be more forgiving when have find/same. greggirwin 17:10@Oldes my point was that the underlying values may be seen as equal, but the datatypes differ. > Returns the series where a value is found, or NONE. We don't say "where an equivalent value is found", and internally there is a COMP_FIND comparison which is different than checking basic equality, so there is design intent here IMO. We could add a /strict refinement as a way to force type checking, but find already has a lot of refinements. Without a use case, I vote to keep it as it is. rebolek 17:20@greggirwin then what is the point of /same? 17:21It says Use "same?" as comparator. but as @Oldes proved, that's not true, as simple find uses same-like comparison. What is in code is not a proof IMO, you could dismiss any bug with such reasoning. greggirwin 17:35This is not a bug. I found it interesting that floats have a check for same just like strict-equal. This is a convenience, but also...hmmm. Scalars have no identity, which is what same? is all about. So there's overlap here. 17:36/same is for identity comparisons on series and objects. e.g. >> a: b: "123" c: copy a == "123" >> same? a b == true >> same? a c == false 17:37(I know you know this, just including it for lurkers and completeness in the discussion) rebolek 17:43@greggirwin ok, fair point. You suggested /strict but also mentioned that find already has a lot of refinements. Which brings me to a design problem that refinements aren't good fit for flexible functions like find. Maybe, after having two or three refinements, we just should stop, look at we are doing and rethink the function design and probably switching to some find dialect instead of a function with 10 refinements. greggirwin 17:48The interface of refinements is one thing, but the implementation is another. Every combinatorial feature makes it harder to get right, and to test. This is where /compare for sort strikes a nice balance, which could also work for find. You'll take a performance hit, but then you have total control. For this discussion, I'll ask again for a use case or rationale. What makes it better rather than just different? I don't remember this ever coming up before, and I know I've never run up against it myself. rebolek 17:52The rationaly is consitency IMO. Hard to talk about use case for me, as I don't use block fin very often. It's shallow, I would need /deep refinement most of the time, so I usually switch to parse instead giving me more control and having more readable code than find with its 10 refinements. For strings find is great though. greggirwin 17:57Ha! Just realized that my example was borked above. Sorry for the confusion @Oldes. >> find ["c" %c @c] @c == [@c] >> "c" = @c == true >> %c = @c == true So, for @Oldes and your (@rebolek) logic, find ["c" %c @c] @c should match "c", correct? rebolek 17:58Correct. 9214 17:58https://github.com/red/red/issues/4327, https://github.com/red/red/issues/4165, https://github.com/red/red/issues/4092. greggirwin 18:01Thanks @9214. :+1: @rebolek that will be a massive breaking change, *and* be Rebol incompatible to boot. rebolek 18:02I don't doubt that. But I care about Rebol compatibility less and less with every passing year. You can't run Rebol scripts without subtle-to-massive changes anyway, so what's the point. greggirwin 18:05Ignoring Rebol compatibility is fine. But we care about Red compatibility, right? I'll come back to this again: >Returns the series where a value is found, or NONE. The current behavior is clear to me, and not surprising in any way. I would argue, for consistency, that it might be better for scalars not to be supported by same?. That solves the problem too, yes? 18:08I'm all for consistency, of course, when it helps. But I also look at this being a non-issue for 20 years and with no other argument for it as a weak case for change. Remember that (again, I know *you* know this) Red is for humans, and strict consistency is not always best for us. 18:11I admit this is a tricky case as well. 18:18Red also follows R3 on words in this regard, which makes /case overlap with /same for matching specific word types. 18:22> /case => Perform a case-sensitive search. Maybe we deprecate /case and use /strict as its new name, which is more accurate for general use. 18:25@9214 @hiiamboris @meijeru I think we have an equality comparison table somewhere, but do we have one that includes find/select, so we can look at everything in one place? hiiamboris 18:59not that I recall.. 9214 19:04There is plenty of find-related issues on the bug tracker, that's all I know. Both searching and sorting need to be thoughtfully reviewed and axiomatized at some point. greggirwin 19:34Agreed, though I think you just made up "axiomatized". ;^) Atomized axioms? hiiamboris 20:31:D Thursday 15th October, 2020 giesse 08:34one way to make find/compare not too bad performance-wise would be to accept a word! (in addition to function!) and select one of the fast internal comparators (eg. equal?, strict-equal?, and so on...). though... performance should be the job of the compiler (I'm going to keep repeating this every chance I get :P) greggirwin 18:05:^) Nice idea. rebolek 20:50I don't want a compiler. I want 100% pure interpreter. Well, most of the time. Some things need a compiler. But if I want a compiler, it has to be a good optimizing compiler. Oldes 21:30@giesse which comparator should be the default one? Friday 16th October, 2020 greggirwin 01:23@rebolek and I think alike. I always push for more mezz level, but understand that the core needs speed. I always wanted to see a pure redbol threaded interpreter, ala Forth, to see what that would look like. I think implementations of other language paradigms, for teaching purposes, were a missed opportunity for Rebol. The fact that they could be practical for a lot of uses is icing on the cake. giesse 10:07@rebolek why? because it's fun to spend time optimizing code? 10:09@Oldes I'm not a marketing person :P - I assume whatever it's default right now is fine for most people. Saturday 17th October, 2020 meijeru 13:12On comparison used by find the spec document says Note that the function find uses an equality test which differs from strict-equal? in that it ignores case differences in values of types in any-word! and any-string! Sunday 18th October, 2020 hiiamboris 16:07I'm testing Red on Ubuntu under WSL2 on W10. Good part is that GTK works for me with vcxsrv ![](https://i.gyazo.com/f121e84d8404949e9950d3679edd17f2.png) https://i.gyazo.com/f121e84d8404949e9950d3679edd17f2.png But Red behaves weird on a mounted FS: $ cat 1.red Red [] print "hell-o" $ red --== Red 0.6.4 ==-- Type HELP for starting information. >> ls >> read %1.red == {Red []^/print "hell-o"^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@... >> do %1.red *** Syntax Error: script is missing a Red header: 1.red *** Where: do *** Stack: do-file cause-error Any ideas? litew 16:15Can't find any mentions about this bug in room's history so: >> ? system/words *** Runtime Error 1: access violation *** at: 0809BD98h I'm using latest automated build (**red-16oct20-df54dcdf6**) on Fedora 32 x64 hiiamboris 16:19Just tried - it crashed for me on Ubuntu/WSL2 too. No crash on Windows. Please fill an issue report ;) litew 16:41@hiiamboris done :) https://github.com/red/red/issues/4685 hiiamboris 16:47:+1: Tuesday 20th October, 2020 endo64 05:45I remember there was a discussion about this, but don't remember the conclusion: >> to float! %1 == 1.0 Shouldn't this be 0.01? And do I miss something here? >> %0 < %100 == true >> %1 < %100 == true >> %2 < %100 == false >> %99 < %100 == false >> %101 < %105 == true >> %99 < %105 == false >> %104 < %105 == true >> %104 < %190 == true >> %5 < %190 == false rebolek 06:59@endo64 yes, you do ;-) 07:00 >> type? %1 == file! >> type? 1% == percent! endo64 10:39:))) shame on me :) %N is Turkish format for percent, it looks natural to me :) 10:54@rebolek What about to float! %1 is 1.0 and not 0.01? rebolek 11:02@endo64 still the same reason, it's file!. 11:02However: >> to float! 1% == 0.01 endo64 11:14dammit :)) pekr 11:31:-) Thursday 22nd October, 2020 rebolek 07:54This one is really funny: https://github.com/red/red/issues/4686 endo64 10:48Commented 10:58Output to console is incomplete if there is a url!: >> load "a b/c d://e/f 6" == [a b/c d://e/f >> load "a d://e(x)f g" == [a d://e rebolek 15:29@endo64 thanks for the comment, the result is bit different on Windows but still buggy. Great to know it's not only me :-D 15:31for your load problem, there's some weirdness in url handling, I've reported an URL-related problem https://github.com/red/red/issues/4687 and obviosly there are others also. Friday 23th October, 2020 jflipp 20:57Hi! It seems to me that on my Windows 10 machine I can't invoke Red via the path. More specifically, I'm talking about the following. Suppose my PATH environment variable looks like this (vastly simplified :-): PATH=C:\Windows\system32;C:\Tools and the folder C:\Tools\ contains the file red-064.exe Suppose further that I have a command line open in the folder C:\Project\ Then I can do the following at that command line: C:\Project>where red-064 C:\Tools\red-064.exe You see, I get the expected output - Red is found on the path. But when I invoke Red, I get the following. C:\Project>red-064 PROGRAM ERROR: Invalid encapsulated data. C:\Project> No GUI console opens. This is not expected behavior. Also: C:\Project>red-064 --cli PROGRAM ERROR: Invalid encapsulated data. C:\Project> Again, not expected behavior. But I can invoke Red by specifying the complete path to the executable. Both C:\Project>C:\Tools\red-064.exe and C:\Project>C:\Tools\red-064.exe --cli produce the expected result: Red starts the GUI console resp. the CLI REPL. Has anybody seen this behavior before? Is this a known bug? Is there a solution? Is this related to anti virus software? I already have an anti virus exception on the folder C:\ProgramData\Red Thanks for your help! endo64 21:16@jflipp It is a known issue and related to Rebol encapsulator (current compiler written in Rebol temporarily) You need to be in the same path. Alternatively you can create a .bat batch file with full path of Red and put that file in your PATH. Here is my batch file named rc.bat I put that in my PATH: @echo off c: cd C:\Users\endo\Documents\Red\red\build\bin red --cli --catch user.red This executes Red/CLI console and executes my user.red file which I have a bunch of helper functions I use regularly. 21:18Another workaround could be, go to C:\ProgramData\Red, copy the latest console executable AND crush DLL into your PATH. Then you can start it from any path. But remember, it is not the Red compiler, it is the Red console itself. Saturday 24th October, 2020 dander 00:35 @jflipp An added benefit to [installing Red with Scoop](https://github.com/red/scoop-bucket) is that it shims the red toolchain exe for you. greggirwin 00:55@dander we have that linked in a wiki page, yes? I found https://github.com/red/red/wiki/%5BDOC%5D-Installing-Red-and-Getting-Started, which is still clearly a stub. I know we have at least one more complete page with setup resources, but can't find it at the moment. @9214 probably has it in his pocket. 00:56I always optimistically hold out hope that searching the wiki by title in Github will work. I'm a slow learner. :^\ dander 06:58@greggirwin hmm, I thought it was on the main download page near the reference to Chocolatey, but I guess it isn't after all 9214 12:25@greggirwin not that I know of. The above-mentioned issue is described in the readme file. > Note: Running the Red toolchain binary from a $PATH currently requires a wrapping shell script (see relevant tickets: #543 and #1547). greggirwin 18:16Sounds like a little hole we can fill. Monday 26th October, 2020 Oldes 16:13What about this one? >> type? first [/a:] == set-word! ;<=== really? toomasv 16:1723-Sep Windows build: >> type? first [/a:] *** Syntax Error: (line 1) invalid refinement at /a:] endo64 16:33 >> type? first [/a:] *** Syntax Error: (line 1) invalid refinement at /a:] >> about Red 0.6.4 for Windows built 23-Oct-2020/20:58:48+03:00 commit #d95df53 Oldes 17:21hm.. I should update my Red:) 20:19I think that this error message could be better: >> o: object [a: 1] == make object! [ a: 1 ] >> make o #(b: 2) *** Syntax Error: b: 2 invalid construction spec at none *** Where: make *** Stack: And also wanted to ask, if it would hurt, if the map! would be supported in above objects construction. The same way like if manually converted to block: >> make o to-block #(b: 2) == make object! [ a: 1 b: 2 ] ` 20:21Hm... to answer myself, as map is case sensitive and object is not.. it would be probably unsafe :-/ greggirwin 20:26Maps can also have non-word keys. What do you propose for an improved error message? Oldes 20:46 Script error: object does not allow map! for its spec argument 20:47? 20:48This is also strange message: >> make object! #() *** Syntax Error: invalid construction spec at none *** Where: make *** Stack: 20:49Although it is same like the above, just without formed map. 20:50But the idea with the map was, that now it's also possible to construct object like: >> make object! [1 2 b: 3] == make object! [ b: 3 ] 21:24Last bug today... GUI console loses input after using alert "hello". One must quit it. 21:26Regarding the object construction error, it should be probably similar to: >> make date! ["a"] *** Script Error: cannot MAKE/TO date! from: ["a"] *** Where: make *** Stack: 21:27so it would be: *** Script Error: cannot MAKE/TO object! from: #() *** Where: make *** Stack: 21:29Although I still prefer to have this: >> make object! #() == make object! [ ] >> make object! #(a: 1) == make object! [ a: 1 ] >> make object! #(1 2 a: 1) == make object! [ a: 1 ] greggirwin 22:00Spec blocks can have other content in them, but maps cannot; they are always key value pairs. And there is still the case sensitivity issue even if we check for only word keys. Unless you have a strong, specific use case, I'm for leaving it as is right now. cannot MAKE/TO object! from: #() looks good to me. 22:03On GUI console, I get this on WIn10: >> alert "hello" *** Script Error: img needs a value *** Where: set *** Stack: alert 22:07Hang on, that may be my local alert at work. 22:09Confirmed. If that's not already ticketed, please report it @Oldes. It sounds familiar. 22:12Thanks for finding that my alert broke with a set change in Red. :^) Tuesday 27th October, 2020 giesse 07:37> Unless you have a strong, specific use case Until adding words to objects becomes possible, there is a strong use case. See https://github.com/giesse/red-topaz-parse/blob/master/ast-tools.red#L243 I've complained about this a few times before :P hiiamboris 15:27how is this func better than to map! to block! obj? 9214 16:00https://github.com/red/red/issues/1231 giesse 19:40@hiiamboris it's map to object, not object to map :) hiiamboris 19:42Right! :D 19:43Then how is it better than construct to block! map? ;) Wednesday 28th October, 2020 greggirwin 02:45@giesse is the current behavior blocking, or just less convenient? 02:48We can argue that most maps will use words as keys, and unique ones at that, so it does save some overhead for a common case. 02:50For your AST example, what is the driving force behind converting from maps to objects? giesse 09:20Again, building the map a word at a time while parsing, then being able to bind to it (so conversion to object). If I could build the objects incrementally this would not be a problem. 09:25@hiiamboris edge cases. so it depends on what you're dealing with. 09:26 >> m: #(a: 'a b: b: c: :c) == #( a: 'a b: b: c: :c ) >> construct to block! m == make object! [ a: 'a b: :c c: :c ] 09:26(that was actually a problem for me in that code as I do handle set-words as values in the maps) 09:27I've also posted here about this around that time - should construct try to be smart here? I think that the whole point of construct is not to do things like that. bubnenkoff 09:43repost from /help. Stackoverflow on next example: o: object [ parent: self number: 1 c: object [ number: parent/number name: "Apple" ] ] to-json o result: >> to-json o *** Internal Error: stack overflow *** Where: = *** Stack: to-json 09:54The ticket: https://github.com/red/red/issues/4691 greggirwin 17:35> building the map a word at a time while parsing, then being able to bind to it (so conversion to object) Got it, thanks. I think construct should not try to be smart. 17:36@bubnenkoff I commented on the ticket. hiiamboris 18:26I also think construct should be dumber. greggirwin 18:43OTOH, that will make it work quite differently than make, so you wouldn't then be able to easily mix, or change, safe and unsafe object construction, as the results would be very different. Whereas, if you need that (much rarer) behavior, you can wrap this logic to achieve it. object [ a: quote 'a b: quote b: c: quote :c ] giesse 19:02Thing is, if I give you a block and I tell you that it's pairs of keys and values, and values can be any type at all (eg. coming from untrusted source), then you have to write stuff like I did rather than just use construct. The other use case for construct [a: b: c: none] doesn't seem that likely, since if you're doing that then object works just fine. hiiamboris 20:12I also don't get it why construct/only is not the default behavior of construct. 20:14And @greggirwin this example of yours is called fighting the language design ;) greggirwin 21:51Well, here we have to choose whether to break with Rebol's design and treat object specs as strictly key value pairs. That means you also can't have unreferenced code, e.g. object [a: 1 print "Hello!" ]. To me, object specs are not strictly key value pairs, but a dialect. Do we want to change that? construct's default behavior is also a compatibility point. Thursday 29th October, 2020 rebolek 07:34If object specs would be just key-value pairs and not a "dialect", I'm going to fork Red and keep the current behavior. It's so useful. construct is a different thing and can have different behavior, I'm not aginst change there. giesse 09:22Nobody wants to change make object!... construct was added to R2 exactly because of that... (in particular, R2 already had the code for it for loading the REBOL header, it was just made available as a native). 09:22alternatively, to object! for map would solve this problem a different way (and wouldn't break anything) rebolek 09:23@giesse I was replying to @greggirwin who wrote "To me, object specs are not strictly key value pairs, but a dialect. Do we want to change that?" - No, I don't want to change that. giesse 09:23you can throw an error if there's a non-word key, or, just ignore it. 09:23@rebolek mine was to both of you i guess :) rebolek 09:23Ok :) giesse 09:23ie. i don't remember anyone ever saying make object! should be changed :) rebolek 09:24I believe I saw something like that in some room here recently. giesse 09:25ah, well, that i think is something else entirely... not sure if it's a real problem, i have yet to see evidence of that JakubKoralewski 12:31[![obraz.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/b9mw/thumb/obraz.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/b9mw/obraz.png) 12:31Hello everyone. I'd like to ask if the drop-down widget shouldn't instead of resizing to fit any data, instead have at least an ability to have a fixed size and instead have horizontal scrolling (without scrollbar, but by using left/right arrows and holding and dragging pressed mouse button to the right). 12:31And if the widget's data is set programmaticaly then the part that is longer than the widget's current size/x gets cut of. 12:33I see that field already works like that (horizontal scrolling without scrollbar) so I think drop-down should behave the same? hiiamboris 16:16Just set the size you want. view [drop-down 100 "long long long long long loooooong text"] If you have to scroll your drop down text sideways then you should rethink your UX. JakubKoralewski 18:03This isn't UX, it just happens so that some strings are longer than they can be displayed. There's not much UX you can do to fix this. 18:03[![obraz.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/sXy4/thumb/obraz.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/sXy4/obraz.png) 18:03Windows does it. Browser's URLs do it. Ctrl+F does it... hiiamboris 18:19OK I see your point. Please raise an issue on the tracker. I've seen this bug with field once when I specified wrap flag for it, so this must be another face flag got wrong. I think drop-down should allow both entering text longer than it's size and allow you to navigate this long text. 18:20Right now view [drop-down 100 data ["long long long long long loooooong text"] wrap select 1] won't let me scroll the "long long" string or enter more characters than fit 100 pixels. It allows editing it but shows the caret in the wrong place (before the last visible char regardless if it's further away) JakubKoralewski 18:35Ok I will open issue in github. Looks like [this](https://github.com/red/red/blob/de9d15b820710cd395df04d01b060aa79dcbf29b/modules/view/backends/windows/gui.reds#L1433-L1436) is the part that controls the drop-down and looks like what's missing compared to field is ES_AUTOHSCROLL. I dunno though how the behavior on other view backends behaves. hiiamboris 18:40Rather CBS_AUTOHSCROLL, but thanks for looking into it. 18:41Should be a quick fix then. JakubKoralewski 18:42That would be great :) I guess if it takes longer to make the issue than it is to fix it then it's everyone's dream :D hiiamboris 18:43You've done the hardest part - finding the cause of the bug ;) 19:08Let's ping @qtxie maybe he'll fix it ;) greggirwin 19:40> alternatively, to object! for map would solve this problem a different way (and wouldn't break anything) @giesse this seems like a good solution. Friday 30th October, 2020 rebolek 14:13I am trying to compile Red for Raspberry PI but I get "Driver Internal Error" (first time I see this): >> do/args %red.r "-o redpi -t rpi environment/console/CLI/console.red" Script: "Red command-line front-end" (none) Script: "Encap virtual filesystem" (21-Sep-2009) -=== Red Compiler 0.6.4 ===- Compiling /home/sony/code/red/environment/console/CLI/console.red ... Compiling libRedRT... ...compilation time : 1536 ms Compiling to native code... *** Driver Internal Error: Math Error : Math or number overflow *** Where: emit-prolog *** Near: [emit-i32 to char! shift/left 1] greggirwin 21:38Sounds like a possible regression. @respectech, have you seen this? Saturday 31st October, 2020 Oldes 10:10In Red and Rebol it's possible to save into binary like: b: #{} save b 1 save b 2, but in Rebol the result is #{310A320A} while in Red just: #{3132} (no LF). I wonder what is more useful? 10:11Hm.. now I see that in Rebol2 it is like in Red. 10:14I personally think, that R3's version: >> b: #{} save b 1 save b 2 save b #{03} print to-string b 1 2 #{03} is better than R2's & Red's: >> b: #{} save b 1 save b 2 save b #{03} print to-string b 12#{03} 10:44I also believe, that saving into string should not be allowed: >> s: "" save s 1 save s 2 == "#{31}#{32}" greggirwin 16:46Saving to a string as binary doesn't make much sense to me. Can anyone see a use for that? Monday 2nd November, 2020 loziniak 10:55Hello! I get some strange results when compiling script with write/info under Linux, using latest build (~/prj/red/red-02nov20-3147cac13 -c -d write_test.red, compilation with -r always gives same results). When I compile this: probe 7 write/info https://google.pl/ [GET] the result is: ./write_test 7 *** Runtime Error 1: access violation *** at: F7E537D1h But when compiling this: write/info https://google.pl/ [GET] i get: ./write_test *** Access Error: invalid UTF-8 encoding: #{EA706E61} *** Where: write *** Stack: Sometimes also when I change url, results change. For example compiling this: write/info https://quitter.pl/ [GET] results in clean run: ./write_test Generally the behaviour is very erratic. 11:03When running with interpreter, I get no errors in any case. 11:05Anybody can confirm? toomasv 11:28Same on Windows (Septemper 23). Tuesday 3th November, 2020 loziniak 11:03Thanks @toomasv ! Submitted an issue: https://github.com/red/red/issues/4712 11:09> I also believe, that saving into string should not be allowed: > > >> s: "" save s 1 save s 2 > == "#{31}#{32}" > @Oldes @greggirwin I'd expect something like: >> s: "" save s 1 save s 2 == "1 2" >> s: "" save s to binary! "1" save s to binary! "2" == "#{31}#{32}" This seems to be even more interesting: >> s: "" save s "5" == "#{223522}" 11:25> Saving to a string as binary doesn't make much sense to me. Can anyone see a use for that? From *Red By Example* ( https://www.red-by-example.org/#save ) I get that save is the oposite of load. So, after loading saved data we should get same data. When we save integer to a string, then after loading that string we should get an integer, not a binary data containing string representation of that integer right? >> s: "" save s 1 == "#{31}" >> load s == #{31} >> type? load s == binary! toomasv 11:40Interesting: >> save s: #{} 1 == #{31} >> load s == 1 >> save s: "" 1 == "#{31}" >> load load s == 1 >> save s: {} to-binary "abracadabra" == {#{237B363136323732363136333631363436313632373236317D}} >> load load load s == abracadabra Oldes 13:17Thanks @loziniak , so I'm not the only one who find it confusing. I still think, that it's better to add a newline after each save... maybe not when the value is empty. 13:19s: "" save s 1 save s 2 could result in: 1^/2^/ (I'm not sure, if it should not also use os line breaks, so it could be 1^M^/2^M^/ on Windows) 13:21Although the os line-breaks make sense more when the target is binary and not a string. Wednesday 4th November, 2020 hiiamboris 12:32https://github.com/red/REP/issues/44 Tuesday 10th November, 2020 xoltar 17:56Hi folks, it seems the mac binaries on the download page are not actually 64 bit, and as a result, don't actually run on a current Mac: > $ file `which red` [±dev ✓] /Users/bkeller/.local/bin/red: Mach-O executable i386 bkeller@bkeller-mac19 ~/src/plfa [9:51:25] > $ file /usr/bin/grep [±dev ✓] /usr/bin/grep: Mach-O 64-bit executable x86_64 rebolek 18:08Hi @xoltar unfortunatelly there's no 64bit version of Red yet. xoltar 18:29OK, @rebolek that makes sense then. Thanks! GiuseppeChillemi 22:16I think I have encountered a bug: >> obj: make object! [a: none b: none] == make object! [ a: none b: none ] >> obj2: make obj [b: 22 set 'a 'x] == make object! [ a: 'x b: 22 ] a shoud be x and not 'x hiiamboris 22:51It's a feature of mold object 22:51a is indeed x but is shown like this on mold GiuseppeChillemi 23:03Two different values being visually represented the same way is, IMHO, a source of a lot of confusion and uneeded bug hunting for future Red coders. >> obj2: make obj [b: 22 set 'a 'x] == make object! [ a: 'x b: 22 ] >> obj2/a == x >> obj2: make obj [b: 22 set 'a quote 'x] ;<---- NOTE, it is quoted, so it is a LIT-WORD! == make object! [ a: 'x b: 22 ] >> obj2/a == 'x I would not call it a feature ;-) 23:14I remember when I have encountered [make object![....]] inside a block and I have thought for a lot of time that the make object! instruction was inside that block. Instead it was Rebol object. The confusions happened because the instruction to make it and the molded object visually identical. The same has happened for functions. Wednesday 11st November, 2020 giesse 09:07this is a remnant of the days when R2 didn't have mold/all... and because Red wants to be compatible and it doesn't have mold/all itself... otherwise, mold would be useless for objects (which are often saved and loaded back). backwards compatibility can be evil... maybe one day we can tuck it safely behind a flag. rebolek 09:09IMO compatibility in such implementation details makes no sense. Red shouldn't have mold/all at all, it should be the default behavior. But now we have Redbin which would be more useful for saving objects, so meh. Oldes 10:48@rebolek as mold is the final formatting for console output, having mold/all as a default would be very frustrating in situations like: >> mold/all tail "very long series" == {#[string! "very long series" 17]} hiiamboris 15:28It's worse ;) >> mold/all "йцукен" == {"^^(439)^^(446)^^(443)^^(43A)^^(435)^^(43D)"} GiuseppeChillemi 17:28So, mold output this block which seems a prototype ready to be parsed by make object!. Was this the original purpose? greggirwin 19:04If you ... load mold (aside from the extra steps needed as mold doesn't give you just the object spec), it should round-trip cleanly unless you have cycles. What makes this all hard to change is that someone needs to do a *complete* design that covers all existing types, and show that it *solves* the problems we have now rather than just pushing them around. It's like holding ping-pong balls underwater with your hands. You can do a few, but as you add more, when you go to grab the new one, others start to pop out. 19:05But since we don't have mold/all yet, and serialized syntax is not frozen, now is a good time to think about this. GiuseppeChillemi 21:31It's a discourse for the Pros, I can intervene there just with an opinion from the mouth of a standard developer. Sunday 15th November, 2020 luce80 14:33Not really a bug but: ; R2 >> make string! none == "" ; R3 >> make string! none ** Script error: cannot MAKE/TO string! from: none ** Where: make ** Near: make string! none ; Red >> make string! none *** Script Error: cannot MAKE/TO string! from: none *** Where: make *** Stack: I like the R2 behaviour because it gives me another option to choose from, other than form or to. Oldes 14:58Isn't better to use copy ""? 15:00I think that make string! was meant mainly for series preallocation with integer value and so when there is none, it should warn you, that there is probably some problem with your code. 15:03Using R3's delta-profile: >> dp [make string! ""] == make object! [ timer: 0:00:00.000002 evals: 2 eval-natives: 1 eval-functions: 0 series-made: 1 series-freed: 0 series-expanded: 0 series-bytes: 8 series-recycled: 0 made-blocks: 0 made-objects: 0 recycles: 0 ] >> dp [copy ""] == make object! [ timer: 0:00:00.000002 evals: 1 eval-natives: 1 eval-functions: 0 series-made: 1 series-freed: 0 series-expanded: 0 series-bytes: 8 series-recycled: 0 made-blocks: 0 made-objects: 0 recycles: 0 ] 15:04You can see, that the second version saves you one evaluation. 15:07Here you can see the preallocation in action (again using R3's profiler, but it will be same in Red): >> select dp [make string! 100] 'series-bytes == 128 ;<-- resulted series with space for 127 bytes (the last one is internally used for null byte) Monday 16th November, 2020 henrikmk 17:10When you use copy "", aren't you really making two strings? Oldes 19:31The one which you copy is already created. >> select dp [""] 'series-made == 0 >> select dp [copy ""] 'series-made == 1 >> select dp [make string! 1] 'series-made == 1 19:33If you want to be nice with the system, preallocating is the preferred way.. at least when you know how much bytes will be needed. Because you avoid series expansions. 19:34Using just make string! none does not give you any advantage.. and I believe that is the reason, why it's not supported in R3 even when it was in R2. Tuesday 17th November, 2020 greggirwin 02:52> Using just make string! none does not give you any advantage.. and I believe that is the reason, why it's not supported in R3 even when it was in R2. :+1: Oldes 14:05Playing with the syntax a little bit, I noticed this strange result: 14:05[![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/TSBf/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/TSBf/image.png) 14:06better this one: 14:06[![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/JX35/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/JX35/image.png) 18:34 >> #a/b *** Syntax Error: (line 1) invalid issue at #a/b *** Where: case *** Stack: load >> #@ *** Syntax Error: (line 1) invalid issue at #@ *** Where: case *** Stack: load >> #a@b == @b ;<------- there should be error like above 18:46Although... #foo@somewhere.com may be valid email :-/ greggirwin 18:56@Oldes if that console molding issue isn't in a ticket, please make one. Duped here. 19:00You can't have an empty issue. In Red, even if the email RFC allows them to start with #, that's an issue! in our world. @b is a valid ref!, so that's not a bug. >> [#a@b] == [#a @b] >> type? second [#a@b] == ref! Oldes 19:06@greggirwin so you really think, that @ should be a delimiter? greggirwin 19:08You can't start a word with it. Oldes 19:08With the same logic I could say, that /b is valid refinement and so #a/b should not be error. greggirwin 19:09That one I have to think about...seems (instinctively) like it should lex as [#a /b]. Oldes 19:10I prefer error in both cases.. who else can share an opinion? hiiamboris 20:16I don't care, just make it consistent ;) Oldes 20:26@hiiamboris how? 20:27In [documentation](https://github.com/red/docs/blob/master/en/datatypes/issue.adoc#3-literal-syntax) is: _A pound sign # followed by a sequence of characters. Issue! values are terminated by whitespace, semicolon, or a delimiter marking the start of a new value (e.g. [ starting a block)._ 20:28Is @ delimiter? greggirwin 20:28It is now, because of the ref! type. Oldes 20:29I don't think so. greggirwin 20:30OK, not a base delimiter, I was reading it in the context of issues. Multitasking. Will stop now. :^) Oldes 20:32 >> 1:0[] == [] >> 1:0@a *** Syntax Error: (line 1) invalid time at 1:0@a *** Where: case *** Stack: load 20:33I will create an issue.. only Nenad can decide and he does not come here anymore. Wednesday 18th November, 2020 Oldes 12:29Is this known issue? >> 1.1x3 == 2641x3 rebolek 12:37I can't find it in issues, so probably not. I guess it was introduced with fast lexer. greggirwin 18:44Nice catch @Oldes. Thursday 19th November, 2020 Oldes 08:05There is another lexing inconsistency: >> type? load {/<} == refinement! >> type? load {/>} == refinement! >> type? load {>:} == set-word! >> type? load {<:} *** Syntax Error: (line 1) invalid word at <: *** Where: transcode *** Stack: load 08:07I guess that the last case should be allowed. It's not good to redefine < op, but that should be protected using protect once available. 08:12And when I'm in it... I'm not sure, if it's good to have this inconsistency: >> type? load {/2nd} == refinement! >> type? load {'2nd} *** Syntax Error: (line 1) invalid word at '2nd *** Where: transcode *** Stack: load 08:20@greggirwin what's your opinion on this? I think that /2nd should not be allowed... as is not allowed: >> type? to refinement! {2nd} *** Syntax Error: (line 1) invalid integer at 2nd 08:37Although when thinking about it... refinement! is not part of any-word! in Red. hiiamboris 14:51@Oldes https://github.com/red/red/issues/650 14:51It should be forbidden in the recent builds. Oldes 16:31it isn't >> /1 == /1 >> about Red 0.6.4 for Windows built 18-Nov-2020/3:13:59+01:00 commit #8ee5a9f 16:34@hiiamboris the fix for the mentioned bug is solving only use of these refinements in function hiiamboris 18:07/1 may be useful in dialects I guess 18:12I had an idea of such dialect myself greggirwin 21:05It becomes an interesting question, because I invariably think in terms of opaque values by datatype. But we can be more refined, inspecting the contents, when needed. @rebolek showed some experiments on dependent types, which could apply here. They may be used for good or evil of course. The good is that they aid communication and enforce constraints; the evil is that they may add complexity where it's not needed. The hard part is that we can't see the future to know when we cross the line in either direction. To on refinement is simply because it inherits it from word, while issue overrides it. @Oldes please open a ticket for that. If something loads, to should work as well. This raises the any-word/all-word question again. I don't think any of us will argue that #123-456 should be disallowed and @Oldes' ordinal example is a really nice one. /2nd vs #2nd looks and reads better to me. Nice to have for dialect use? Absolutely. Causes issues if wanting to convert to any-word! types? Same as issue!. Some design choices are easy, because things shouldn't be supported if they make no sense. That is, explaining to another person how one value maps to another, and providing use cases for a feature. Others are tied to the implementation, and there's no way around that. Every language deals with this in their own way. As a form-based value-centric language, leaking those details hurts us more than others perhaps. We have to answer "Why are these values both 'words', but have different rules?" 21:19Coming back to dependent types, we always have to look for the point of diminishing returns. There is nothing to prevent us from creating an any-refinement! typeset, with alpha-refinement!, numeric-refinement!, alphanum-refinement!, and can-start-with-num-refinement! types in it. But what we also have to keep in mind is...the human mind. How we group, store, and process information. It's like choosing between walking across a typeless expanse of land, and having to pick 17 locks simultaneously to get through one door and move on to the next problem (but you know if it compiles it will run). Our job with Red is not to drain every bog or put up toll gates, but to help people reach their destination. Provide landmarks and some basic infrastructure, signposts and a map. 21:22Coral snakes, bullet ants, and brown recluse spiders aren't common, and most people don't need to worry about them; just like numeric refinements. But if they go where they might be, they do need to know they exist. hiiamboris 21:53:+1: Friday 20th November, 2020 rebolek 07:45@greggirwin > dependent types (...) may be used for good or evil... That's like saying that limiting arguments in function specs to just some types as Redbol supports already may be used for good or evil. Does it add complexity where it's not needed? Oldes 10:54So /1 and /2nd are by design supported, right? 10:57Btw... what about this: >> to-word "a b" == a >> to-string to-word "a b" == "a" Is the truncation by design? Because in Rebol2 it was: >> to-word "a b" == a b >> to-word "a{b}" == a{b} rebolek 13:32I would say that Red is bit better than Rebol in this case (no spaces in words) but to word! should throw an error in such case IMO. greggirwin 19:07> That's like saying that limiting arguments in function specs to just some types as Redbol supports already may be used for good or evil. Does it add complexity where it's not needed? @rebolek, they can be, yes. Take "evil" with a grain of salt. ;^) This comes back to the gradient of usefulness. I have a *lot* of small scripts with no types spec'd in functions, which falls on the "typeless landscape" side of things. From there you add types, then doc strings. Your fast-and-loose, tiny, flexible script now needs more maintenance, and is locked into those type decisions and descriptions. Our languages should help people, but they aren't one size fits all. Simply adding the concept of types is an initial barrier to programming. 19:09I agree that space handling in to there is a bug, and an error is probably best. That doesn't mean we'll be able to plug every hole for creating non-lexable values through type coercion. Monday 23th November, 2020 ldci 16:29Hi everybody. There is a problem with macOS version (21-nov20-3cf54998a) Compiling compression library... Compiling Red console... *** Compilation Error: incompatible operand types in math or bitwise operation *** in file: %/Users/francoisjouen/modules/view/backends/macOS/delegates.reds *** in function: exec/gui/render-text *** at line: 1205 *** near: [temp 2] hiiamboris 17:13Better report that on telegram ;) 17:13Probably why Travis fails as well 17:15Nevermind, reported myself. Tuesday 24th November, 2020 ldci 12:52@qtxie : Thanks a lot for the fix 12:58@qtxie : Really sorry. Still a compilation problem Compiling to native code... *** Compilation Error: incompatible operand types in math or bitwise operation *** in file: %/Users/fjouen/Programmation/Red/Virginia/libs/core/rcvCore.red *** in function: exec/rcvConvert *** at line: 2514 *** near: [ g: as integer! ((gf / sf) * 255) b: as integer! ((bf / sf) * 255) ] Wednesday 25th November, 2020 qtxie 04:28@ldci The compiler is more strict now. You have to change 255 to float. ldci 12:51@qtxie Thanks for information 13:18@qtxie : A lot of work for me. I have to check all routines in redCV. Oldes 13:50That is price for the chance to be working with alpha versions ;-) rebolek 13:51It's unfortunate but makes sense and should probably have been in R/S from the beginning. Oldes 13:51Btw... you should create and use unit tests! greggirwin 19:03@ldci is 255 (or 1) the most common, or do you use other values a lot as well? 19:04Rather, are there general math calcs that are all over, or mainly pixel value related calcs. GiuseppeChillemi 22:54I was experimenting on function context passing between functions on Rebol and tried the following code on Red (just for curiosity): >> g: func [ctx] [probe ctx] f: func [/local a b c] [g context? 'a] == func [/local a b c][g context? 'a] >> f I have supposed to receive a context not available outside function type error, instead stack overflowed and console printed the following data: *** Internal Error: stack overflow *** Where: ctx *** Stack: f g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p robe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p robe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p robe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p robe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p robe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g probe g p ... I suppose I have encountered a bug, do you confirm? Thursday 26th November, 2020 greggirwin 01:35You can avoid the stack error by not evaluating the context in g. >> g: func [ctx] [probe :ctx] f: func [/local a b c] [g context? 'a] == func [/local a b c][g context? 'a] >> f func [/local a b c][g context? 'a] == func [/local a b c][g context? 'a] You're recursively evaluating the context, because it has a call to g in it. ldci 10:53@greggirwin redCV includes a lot of general math routines with integer and float types, not only pixel access 14:33redCV libs are now compatible with the new strict Red compiler. Next step: test all samples and update documentation before a new release. rebolek 15:56:+1: greggirwin 19:50Thanks for updating @ldci. Nenad owes you a coffee. :^) GiuseppeChillemi 21:16@greggirwin In Rebol I received an object, in Red I receive a spacial function object. So, they have different type of context. I am trying to find a way to create an object from a function context which is not a function, but just its words and values. Do you know what can I do? (Answer to Red/Help if you want) greggirwin 21:18Rebol doesn't have context? does it? GiuseppeChillemi 21:49No, it has bound 21:50But I am interested in Red 21:56Making an abject context having a function one as base is not so straightforward as I have thought! Friday 27th November, 2020 loziniak 00:42Hi. Under Linux if I run a script like this: Red [file: %pwd.red] probe to file! get-env "PWD" probe what-dir ... from an upper folder, like using red scripts/pwd.red, I get two different results: %/home/red/ %/home/red/scripts I'd expect, that what-dir returns curremt directory, not script's directory. Or is there any other way to check current dir? 00:58Or that one: >> to date! to string! now *** Script Error: cannot MAKE/TO date! from: "27-Nov-2020/1:58:08+01:00" *** Where: to *** Stack: Oldes 10:05@loziniak I think that if you do a script in directory scripts/ than what-dir must return this directory (as it does), so any do in this script is relative to this location. 10:14You are probably asking to get the directory, where you were just before calling the script, right? 10:17Should Red modify environmental variables (like PWD) when changes its directory? 10:25I think that bug is , that Red does not set system/script fields when do %some/script.red is called. 10:45Having %/r/dir1.reb: Red [title: "dir1"] Rebol [title: "dir1"] print "==[1]==" current-dir: what-dir ? current-dir ? system/options/path ? system/script/path print "" do %subdir/dir2.reb print "" and %/r/subdir/dir2.reb Red [title: "dir2"] Rebol [title: "dir2"] print "==[2]==" current-dir: what-dir ? current-dir ? system/options/path ? system/script/path Testing in Rebol: >> what-dir == %/C/Users/Oldes/Downloads/ >> do %/r/dir1.reb Script: "dir1" Version: none Date: none ==[1]== CURRENT-DIR is a file of value: %/r/ SYSTEM/OPTIONS/PATH is a file of value: %/C/Users/Oldes/Downloads/ SYSTEM/SCRIPT/PATH is a file of value: %/r/ Script: "dir2" Version: none Date: none ==[2]== CURRENT-DIR is a file of value: %/r/subdir/ SYSTEM/OPTIONS/PATH is a file of value: %/C/Users/Oldes/Downloads/ SYSTEM/SCRIPT/PATH is a file of value: %/r/subdir/ But in Red: >> what-dir == %/C/Users/Oldes/Downloads/ >> do %/r/dir1.reb ==[1]== CURRENT-DIR is a file! value: %/r/ SYSTEM/OPTIONS/PATH is a file! value: %/r/ SYSTEM/SCRIPT/PATH is a none! value: none ==[2]== CURRENT-DIR is a file! value: %/r/subdir/ SYSTEM/OPTIONS/PATH is a file! value: %/r/subdir/ SYSTEM/SCRIPT/PATH is a none! value: none 10:48Rebol does not modify the system/options/path, it uses system/script/path. 10:50And Red should not use 2 line breaks in its ? output (at least for value info) hiiamboris 11:21I raised the same question some time ago. @greggirwin likes it this way for some reason. loziniak 13:30@Oldes > You are probably asking to get the directory, where you were just before calling the script, right? Yes, exactly. Seems, there is no way to do this. I have to test it with compiled binary, but it seriously blocks possibility of programming system-wide utilities, like ls for example. I like the Rebol way of dealing with this. > Should Red modify environmental variables (like PWD) when changes its directory? mc for example does modify *PWD* variable when switching folders, although when exiting mc, user is back where she started, also *PWD* is back to state before mc launch. I think Red console should work the same way. Although, with vim . when browsing directories, executing :!echo $PWD or :!touch abc.txt acts, as if we were still in the directory, where Vim was started. @hiiamboris > I raised the same question some time ago. Do you have any link to the discussion? Perhaps creating an issue would be a step forward. hiiamboris 13:39I meant the ? output, sorry ;) loziniak 13:39Ah, that's clear :-) hiiamboris 13:45@loziniak Can you try to get PWD from a bash call? e.g. call/wait/output "echo $pwd" s: "" 13:46I wonder if PWD actually changes but was just cached by Red, or it doesn't. 13:54Fun: Red [file: %pwd.red] probe to file! get-env "PWD" probe what-dir probe (call/wait/output "pwd" s: "" to-red-file trim/lines s) probe (call/wait/output "echo $PWD" s: "" to-red-file trim/lines s) test@AURA:/home$ red ./test/pwd.red %/home %/home/test/ %/home/test %/home 13:54So pwd and echo $PWD do differ too 13:55whaat a meesss loziniak 14:01 >> what-dir == %/home/red/ >> get-env "PWD" == "/home/red" >> call/wait/output "echo $PWD" s: "" s == "/home/red^/" >> cd prj == %/home/red/prj/ >> what-dir == %/home/red/prj/ >> get-env "PWD" == "/home/red" >> call/wait/output "echo $PWD" s: "" s == "/home/red^/" hiiamboris 14:05Curiously, on Windows all what-dir, call/wait/output "cd" s: "" and call/wait/output "echo %cd%" s: "" give the same output - and it *does* change with cd and do from Red. 14:23The discrepancy between pwd and echo $PWD is really strange. Google tells that they should be equal (except for symlink handling). Can anyone explain it? 15:28I guess kernel calls used by Red don't care about any variables at all, only shell changes them, so even commands Red calls inherit the wrong $PWD. It makes sense for Red to update PWD then to minimize the number of surprises. greggirwin 19:08We have [this wiki page](https://github.com/red/red/wiki/%5BDOC%5D-File-Dir-Path-related-functions), but it doesn't speak to this in detail. I also didn't get a ticket filed for request-dir changing the working dir, which it shouldn't. This is an important topic, as I know @toomasv had to deal with it in DiaGrammar, and we all will at some point. Modules, include systems, dynamic systems, all need to have clear docs and predictable behavior when it comes to directory changes and references. loziniak 23:06> I have to test it with compiled binary And so I did, results adding to the mess: Red [file: %pwd.red] probe to file! get-env "PWD" probe what-dir $ scripts/pwd %/home/red %/home/red/ $ red scripts/pwd.red %/home/red %/home/red/scripts/ 23:16I'd consider all of these a bug(s). Saturday 28th November, 2020 ldci 11:32redCV: more than 200 samples are now compatible with the new Red compiler version. Compiler is less permissive but faster. GitHub repository will be updated next week :) pekr 12:11That's just great 🙂 greggirwin 21:51:+1: Monday 30th November, 2020 ldci 09:06@greggirwin @pekr : Done! RedCV is here: https://github.com/ldci/redCV Oldes 16:18I don't want to disturb the _parse_ channel... so I'm posting it here, although it's not a bug... Currently one can (must) write: >> parse ["abc"] [set s string!] s == "abc" but it's not allowed to use set-word! for the set and copy parse commands. That is common source of variable leaks when used in function definition, which is not able to find these words in parse rules... like: >> s: 1 f: function[][parse ["abc"][set s string!]] f == true >> s == "abc" ;<--- s was redefined! One must manually define s as local in function definition: >> s: 1 f: function[/local s][parse ["abc"][set s string!]] f == true >> s == 1 Would it be a big problem to allow set-word! after set and copy (so it would be collected by function scanner)? parse ["abc"][set s: string!] toomasv 16:41You can also do >> s: 1 f: function[][parse ["abc"][s: set s string!]] f == true >> s == 1 Although it is not as clean.. Oldes 16:47I can do many things.. but in IDE with color syntax... it simply looks better with set words: 16:47[![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/KNds/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/KNds/image.png) rebolek 18:04If your IDE was context sensitive enough it would know it's in parse rule ;) giesse 18:50I promise, it's the last time I mention this: [set-word! values are used to extract data rather than the set keyword; also copy returns the copy rather than setting a word; note that this solves the problem of automatic locals when using function](https://github.com/giesse/red-topaz-parse) hiiamboris 19:02@giesse Have you proposed this change to Nenad? ;) 19:06Also, what is your solution to a problem of keep copy _ rule? (where rule matching a single char otherwise makes a char! result, matching more chars - string! result) Oldes 19:09If Nenad is not open to do two [single line](https://github.com/red/red/blob/3ea60a37edf3c06b2939e763278791f5f0d3a0c4/runtime/parse.reds#L1833) changes, how he could be open to complete parse rewrite? 19:12@giesse I like your topaz-parse, but it's quite overkill (in many cases) if you need to convert it first into old parse format. greggirwin 23:11> If Nenad is not open to do two [single line](https://github.com/red/red/blob/3ea60a37edf3c06b2939e763278791f5f0d3a0c4/runtime/parse.reds#L1833) changes, how he could be open to complete parse rewrite? @Oldes it's not fair to say he's not open to that, as he's not even involved in the discussion yet. My quick thoughts: - As with VID, we don't have to have just one parsing dialect. I expect we'll have more, but I thought that with VID (which is coming up again) and it didn't happen as I thought it might. - This relates to @giesse's Topaz version, which nicely lists where it's not parse compatible. Compatibility is an issue, a big one. If Red's parse isn't Rebol compatible, all code that uses it has be reviewed and updated. With fast lexer out now, it's less of an impact but still not free. I don't see that happening in the near future. - We need to balance variants against limitations and legacy compatibility. - I'm all for Topaz-parse being a module and another parsing dialect option. This brings us back to modules. :^\ @giesse @hiiamboris should we try again to nail that down, maybe in a month or so when I hope to have some breathing room? Oldes 23:16@greggirwin I know it's not fair... sorry.. but it's a shame that he is not involved, because it's not something new https://github.com/red/REP/issues/60 and change is trivial. greggirwin 23:26On @Oldes' original request, which @hiiamboris noted was a dupe of REP #60, I have an uneasy feeling about it. Yes, it helps to catch leaked words. On that we can all agree. And set supports set-word!, but inside parse, by adding *only* set-word support it's still a bit of a mismatch with set in Red itself. Of course parse is a dialect so that's technically fine. But you use set set-word! very rarely in Red, and not inline, where this pattern would see heavy use in parse' s context. The great and terrible thing about these choices is that you don't know if they're a net win until it's too late. I *love* how Topaz parse simplifies some common tasks, and have been less than enthusiastic about some of the new features in parse. The "great power" thing. However, they *can* simplify some patterns for power users. A less powerful (e.g. things Gabriele left out of his version) but more accessible dialect is a good thing IMO. Oldes 23:32I was not requesting _only_ set-word!, but to _allow_ set-word! instead of throwing an error. 23:37If I go thru my use of /local words in function definitions... these are mostly there just because of set and copy words from parse rules.. and as @hiiamboris noted in his request... it is really hard labour work to maintain these in more complex situations. 23:43Btw... here is similar request from year 2013 https://www.curecode.org/rebol3/ticket.rsp?id=2023 greggirwin 23:56@Oldes thanks for clarifying. It broadens the issue at the user level, of not being able to scan for set/get-word! values and instantly trust that they are doing just one thing. So the change may be easy in the code, but have an effect on all users and readers of parse code. Tuesday 1st December, 2020 pekr 06:30@greggirwin I don't prefer having variants, I do prefer advancements. In the past, you very often pointed out, that for some feature or decision, you would like to see a hard data, not just anectodal guesses. So my question is - do we have any poll, or hard data, on the compatibility? I think not. Just make a poll, how many ppl here prefer compatibility and having more than one engine, to eventual enhancements, which might breakt some of the old code. I am not to going mention R2 here, but even R3 last development happened almost 10 years ago ... rebolek 06:32I don't think that allowing set-word! in parse rules solves anything. It's fine, ok, if your parse rules are simple enough to be kept inside a function. But if your rules are bigger, it's better to move them outside of the function and keep them in a context and now you need to manage locals manually, be it words or set-words. pekr 06:41My comment is not related to the particular parse REP. Reading the link from Oldes already shows, that it might get more comples with something like x: y: integer!, first being a position marker, second one a set-word! and readability being an issue. I just pointed out, that R2 compatibility is imo not an issue. Well, of course, there is already existing Red code, and here compatibility might surely matter .... rebolek 06:57R2 compatibility is vastly overrated and Red compatibility can be broken as Red still not out of alpha. greggirwin 07:21> Just make a poll, how many ppl here prefer compatibility and having more than one engine, to eventual enhancements, which might break some of the old code. Unfortunately, design doesn't work quite that way @pekr. Data for *specific* use cases, feature requests, and design proposals is different than general compatibility choices. In this case, we have two very easy options. 1) Someone, like @Oldes, makes a PR, puts together some examples of how the change helps, and does some tests to see if it's a breaking change in any way. 2) We play with @giesse's Topaz parse variant, and write up comparisons. It is *known* to have different rules, but we don't know what existing code will break if tested against Red's current parse syntax. So we can test that too. 07:22The best way to convince the design team (I just made that up :^) is to make it easy to see that your suggestion is better than what we have now, and make it hard to shoot holes in your proposal. giesse 10:22> I don't think that allowing set-word! in parse rules solves anything. It's fine, ok, if your parse rules are simple enough to be kept inside a function. But if your rules are bigger, it's better to move them outside of the function and keep them in a context and now you need to manage locals manually, be it words or set-words. Another thing that topaz-parse does, it can build objects (well, maps, because of current object limitations) for you, so you don't need any of the words used to be made local externally. Ie. you don't really need to manage locals manually ever. (Unless you specifically choose to do so for some other reason.) 10:25> @giesse I like your topaz-parse, but it's quite overkill (in many cases) if you need to convert it first into old parse format. the reason it's a compiler is so that you can compile in advance and have no runtime penalty from using topaz-parse over parse (otherwise, it was much slower... but you could roll back to the previous interpreted version if needed). that being said, I don't consider topaz-parse to be production ready, so i'm not saying "just use this", i'm saying, i've been trying to raise awareness about these issues you mention for a long time (i designed topaz-parse in 2011). 10:25(note, the current compiler doesn't do any optimization, so there are runtime penalties... but that could be fixed in principle) 10:27> Also, what is your solution to a problem of keep copy _ rule? (where rule matching a single char otherwise makes a char! result, matching more chars - string! result) keep will keep whatever is the result of the following rule; so if you use copy, it's a string, because copy always returns a string when parsing a string. if the next rule is one that returns a char, then you get a char. IMHO it's so much easier to model and predict what's going to happen instead of having a huge list of exceptions and special cases. rebolek 10:28@giesse I haven't look at topaz-parse yet, but if it builds objects (maps) wit locals, I'm sold :) giesse 10:30 >> do %topaz-parse.red == func [ {Parse BLOCK according to RULES; return last result from RULES if it matches, NONE otherwise} block [binary... >> topaz-parse [1 2 3] [object [a: integer! b: integer! c: integer!]] == #( a: 1 b: 2 c: 3 ) >> a *** Script Error: a has no value *** Where: catch *** Stack: 10:30this is the no.1 reason it was created Oldes 12:08This looks like Red's parse bug: >> parse [1 2 3][p: 1 skip set x 1 skip to end] == true ;<--- OK >> x == 2 ;<--- OK ;-- using :p in the middle of set rule: >> parse [1 2 3][p: 1 skip set x :p 1 skip to end] == true ;<--- I believe there should be error instead! >> x == none ;<--- ? 12:17@giesse it's a shame that topaz-parse is not written directly in Red/System. hiiamboris 16:11> > Also, what is your solution to a problem of keep copy _ rule? (where rule matching a single char otherwise makes a char! result, matching more chars - string! result) > > keep will keep whatever is the result of the following rule; so if you use copy, it's a string, because copy always returns a string when parsing a string. if the next rule is one that returns a char, then you get a char. IMHO it's so much easier to model and predict what's going to happen instead of having a huge list of exceptions and special cases. @giesse So, in Topaz it's the same keep rule / keep pick rule / keep copy _ rule, just without the underscore? 16:28> But you use set set-word! very rarely in Red Thanks for the tip @greggirwin ;) I just rewrote every set 'word in my code as set [word:] and it certainly helps simplify the code and it's maintaining. Should I mention that I found some leaked words in the process or this is *too* obvious? :D 16:33Problem is, it won't work with block values: set [x:] block unrolls the block. So, very limited. giesse 18:54@hiiamboris >> topaz-parse "abc" [skip] == #"a" >> topaz-parse "abc" [copy skip] == "a" 18:54does that help? 18:56> @giesse it's a shame that topaz-parse is not written directly in Red/System. i intended to eventually have the compiler emit Red/System code... if anybody wants to work on that, they'll have my support :) greggirwin 20:06@hiiamboris set/only. 20:08It's an interesting chat. Only time will tell, and also vary by personal aesthetics, how bending set-word use works. hiiamboris 20:09Oh great! Wednesday 2nd December, 2020 Oldes 19:58@greggirwin since when there is remove/key? In the doc-string there is _Removes a key in map._, but it works with any series... and I'm not sure that this was expected result for me: >> remove/key "abcd" #"b" == "ad" rebolek 20:05remove/key is there since none was allowed in map! Oldes 20:07That is the reason why I found it... since when none is allowed in map!? rebolek 20:10For about a year I believe Oldes 20:14Hm... almost 2 years already https://github.com/red/red/commit/ab3dc0c8bbf976bd41b4fee053dcc46e9a37f3f5 rebolek 20:16How the time flies :) Oldes 20:56Anyway.. if used for non map! series... now it is: >> remove/key [a b b c] 'b == [a c] Wouldn't it be better to have it == [a b]? So it would more work as a shortcut for much longer: >> if pos: find/skip blk: [a b b c] 'b 2 [ remove/part pos 2 ] blk == [a b] Thursday 3th December, 2020 greggirwin 04:47@Oldes that's what I would expect too, and obviously haven't tested it with series before now. If someone is willing to make that change and write tests, I will propose it to Nenad directly before we open a ticket, just to make sure he didn't do that by design. toomasv 04:51As block is not strictly key-value pairs and element at any position can be used as key for the next value, I don't think it is good to enforce skip 2 on blocks while removing with /key. (Compare e.g. to select) pekr 06:11Wha would be even better, if such function would have /skiprefinement, where you would be able to skip by the record length. Why do we expect the key-value being only option as pairs? Oldes 09:16@toomasv I really would like to see a use case where you have a block with not key-value pairs and you need to remove 2 values from it using lookup for the first one. 09:17Also select & find have a /skip.. I don't think it should be in remove action. 09:19I would personally allow remove/key only on map! and block! (where with block! it would work like if mentioned find/skip lookup)... Maybe also paren! could be allowed as it does not hurt so much as using remove/key on string! or path! toomasv 10:11E.g. remove matrix [...] from Draw block. Draw block is not key-value pairs, but may contain some. Manipulating it (or some different dialect) surely doesn't *need* remove/key but might use it. Oldes 10:29Although is sounds logical, I don't think remove/key will be ever used (and is not used) in such a situation, because it is case sensitive and so it's not good to be used with dialects, which are supposed to be user friendly and so case insensitive. 10:30 >> remove/key [a b c] 'A == [a b c] 10:37So... I think that: remove/key [a 1 b 2] 'b is better to be used as equivalent to longer: head remove/part find/skip/case [a 1 b 2] 'b 2 2 than current: head remove/part find [a 1 b 2] 'b 2 hiiamboris 15:47I agree that the proposed remove/key behavior is subjectively more useful than what we have. However I find the whole remove/key thing inelegant, and though I don't see a better design for maps, promoting remove/key use on series is not something I would like to see. Just as the whole /skip thing is not a design, it's a horrible crutch, that should be forgotten and replaced with human-friendly table API. pekr 15:53Don't touch /skip, unless it is replaced by something bettter! :-) greggirwin 18:50Can we agree that the most common case for /key is the key-value pair scenario (i.e. /skip 2)? I'll guess *by far* the most common. I think it's also the least surprising, and lets you safely change from maps to blocks without needing to know if values might also be keys. I don't think any of us *like* remove/key, but it was the best we could come up with. I view /skip as I do a number of things. It's a low level design feature that lets you build things on top of it. It's better than nothing, but we clearly have some consistency issues with find/select. I'm anxious for table/tree work to continue, which ties also to HOF and markup codec. Then we can tie it all together and make HOSS, the Higher Order SpreadSheet. :^) pekr 19:13Should change/key work then too? greggirwin 19:25It's a slippery slope. Change doesn't work for maps today. Let's get this one out of the way first. I've pinged Nenad on it. hiiamboris 19:49change/key or rather put/key? greggirwin 20:58OK, after chatting with Nenad, here's the design stance: > If people need an associative array, with an enforced key/value model, they should use a map! and not a block!. There is no perfect solution. The semantics are currently mixed, because /part 2 is implied, but it's a closer match to how put/select work. Now we just need to decide whether to remove series support for /key. He said it wasn't there, but someone requested it. By design it's a shortcut for the remove/part find 2 idiom. Now, about that table design... hiiamboris 21:36I guess the minimal thing to do would be to embed skip (row length) into the block itself. And allow pair addressing for blocks as we have for images. It's not a table replacement, just a saner block/hash interface that is still low-level. Oldes 21:40@greggirwin to be precise, now it is by design a shortcut to: head remove/part find/case 2 Friday 4th December, 2020 greggirwin 21:30@Oldes we should note that somewhere, maybe in the block! doc page? @hiiamboris do you mean as metadata in the R/S struct, or with mezz wrappers? hiiamboris 21:58skip? as part of the R/S cell. The most annoying thing about it is that it is a part of the block (logically), but you have to carry it around manually as if it was a part of operation you perform on data. Imagine if Red values didn't carry their type, and you had to write the type every time you access a value? It's the same kind of nonsense that's happening here. 22:12mezz-wrapper solution is like a crutch made of smaller crutches greggirwin 23:06So we'd use the extra field, which is reserved for different uses in other block types? My brain is split right now, so will need to let it digest. It opens up a lot of questions WRT other funcs. Saturday 5th December, 2020 pekr 05:48@hiiamboris How do you solve the case, when the block is not a record lenght ordered storage, but just a list of values you need to store? Then skip value would be 0 or none? 05:50Maybe that's why Doc hesitates to have /key for blocks? I wonder, where array and table stand? We have e.g. array in R2, but I never liked to use it, dunno why. Maybe I don't like HOFs and fear of slowness ... hiiamboris 10:10@greggirwin to be precise, it would be not in the cell! itself, but in the series! buffer, together with block's length. So there should be enough space and also applicable to hash and vector. 10:11@pekr 0 is the sanest reserved value on R/S level. What it would translate to in Red is a matter of convenience (and none seems also sane). greggirwin 16:42@hiiamboris that will be a lot of work, given all the things that reference the underlying series at the R/S level. If it's the skip/row size, the default could also be 1. Could prototype it as a block clone of the current code, but I'd still start at the mezz level to see how the interface works out. But we also need to consider that there is another approach now, which is to use nested blocks for each record. This is where the design part comes in, and where a dialect may still win. With nested blocks you don't have keys at all, they can vary in length, and can be arbitrarily nested. A table model also doesn't think in terms of keys, but indexes, so the find /skip 2, assuming a key for n-sized records is something to play with. Yet another model is column store. This gives you both keys and efficiency for a large number of records, but needs an API for dealing with entire records rather than fields. load-csv has a refinement for that format. 16:45 >> load-csv "name,rank,id^/1,2,3" == [["name" "rank" "id"] ["1" "2" "3"]] >> load-csv/as-columns "name,rank,id^/1,2,3" == #( "A" ["name" "1"] "B" ["rank" "2"] "C" ["id" "3"] ) >> load-csv/as-columns/header "name,rank,id^/1,2,3" == #( "name" ["1"] "rank" ["2"] "id" ["3"] ) Sunday 6th December, 2020 dander 07:30The certificate for progress.red-lang.org has expired endo64 15:55@dander It looks fixed. greggirwin 19:02Looks like it renewed today. Thanks for the report. Monday 7th December, 2020 Oldes 12:50It's not possible to write binary values with escaped characters in console: >> load {[#{00^/01}]} ;<-- this is ok == [ #{0001} ] >> [#{00^/01}] ;<-- this will enter into multi-line input! { (escape) >> [#{00^-01}] ;<-- this will enter into multi-line input! { (escape) hiiamboris 12:52>> [#{00^/01}] typed in console is actually "[#{00^^/01}]" isn't it? Oldes 12:53 >> {^/} == "^/" >> #{^/} { 12:54the escaped char is not terminated (when used in binary) hiiamboris 12:54Funny though, it never quits the multi-line mode. That's certainly a bug: >> [#{00^/01}] { } { } { } { } { } loziniak 18:05https://github.com/red/red/issues/4743 Maybe we could treat it as a bug in Windows then, since Mac and GTK versions act the same? ;-) hiiamboris 18:11ask @toomasv ;) toomasv 18:11Nooooooo! hiiamboris 18:12lol 19:50Shouldn't these be equivalent? >> make "" 1.1 * 100 == "" >> make "" 110% * 100 == "11000%" >> make "" 100 * 110% == "" Oldes 19:56They are equivalent in R3 (preallocated string) 19:59I think that source of incompatibility in this case is that Red has 110% * 100 = 11000% 20:24What this one? >> to integer! #0F == 15 >> to integer! #F == 0 ;<--- ???? >> to integer! #XX *** Script Error: data not in correct format: #XX 20:25Ah... it ignores unfinished pair: >> to integer! #FFF == 255 20:29I don't think it's useful as it is. I think that more interesting would be to have: 16777215 = to integer! #FFF hiiamboris 20:33it makes sense in VID (hex-to-rgb), but generally? not sure Oldes 20:33Or 4095 how it is in Rebol2&3 greggirwin 20:37How about simply disallowing odd numbers of chars? Oldes 20:38That would also work... I don't think anyone is using it anyway. 20:39But 0 is really strange. greggirwin 21:13My gut says that hex values with an odd number of chars are malformed, and trying to guess at what they mean will lead to bugs and surprises. 21:13If others agree, we can open a ticket for it. hiiamboris 21:27Silent ignoring alone warrants a ticket IMO. greggirwin 21:37Agreed, but how do you feel about errors instead? hiiamboris 23:024095 is ok, error is ok too, but less ok (because FFF is a valid base 16 number if we abstract from byte thinking) greggirwin 23:06Is there value in supporting non-byte thinking? If so, does it outweigh byte thinking being far...far...far more common? Tuesday 8th December, 2020 Oldes 09:38And today we can extend it with this inconsistency: ;current behaviour: >> to block! "abc: def" == [abc: def] ;<---- I think this should be ["abc: def"] >> to block! #{00} == [#{00}] ;<--- this is OK 09:39@greggirwin what is your opinion today? Still same like was there -> https://www.curecode.org/rebol3/ticket.rsp?id=2056 ? 09:54Also: >> to paren! "foo" == (foo) ;<--- I think that it should be ("foo") instead hiiamboris 16:05> Is there value in supporting non-byte thinking? If so, does it outweigh byte thinking being far...far...far more common? The value is simplicity. When you write 1234 you don't think "how many bytes is this?". Why should you think about that when you change the radix from 10 to 16? greggirwin 19:19@oldes, yes I still think that's a good change. We have other ways to load, and round-tripping should be lossless if to is used both ways. That's something to create a matrix for, and see what other holes there are. >> to string! to block! "abc: def" == "abcdef" >> form to block! "abc: def" == "abc def" 19:42@hiiamboris good argument. But my feeling right now is that hex notation is synthetic, and designed for computers rather than people. So when you use it, you're speaking computer. And today that means in 8 bit bytes. Let me ask another question though. If we analyzed all the hex values in every bit of code, or recall them from our own anecdotal histories, how often are an odd number of hex digits used? Now remove 0 as a special case. My guess is that the number is vanishingly low. Given that, it's more likely that an odd number of hex digits is a mistake. The next special case is a single hex digit. We use those for chars, but it's not allowed for Red's hex notation. e.g. Ah is not allowed. But you *can* use an odd number of digits there. >> FFFh == 4095. So we have literal hex values and issue conversion. Just noticed this too: >> to integer! #12345678 == 305419896 >> to integer! #123456789 == 305419896 To only honors 8 chars max, silently truncating. That's bad. I'll say that clearly lies behind the use case of hex colors, but that should throw an error too if the issue is too long. If someone would ticket that, I'd appreciate it. 19:48Creating an integer from an issue relies on binary/decode-16, so what do binaries do? >> to integer! #{FF} == 255 >> to integer! #{FFF} *** Syntax Error: (line 1) invalid binary at } *** Where: case *** Stack: load >> to integer! #{FFFF} == 65535 19:50integer/from-binary also silently truncates at 4 bytes. hiiamboris 21:21Well, that's also interesting. 21:22If our integer becomes 64-bit, we can store all 16 digits, so why limit at 8? 21:23https://github.com/red/red/issues/4750 Wednesday 9th December, 2020 toomasv 04:55Some more interesting stuff: >> 1000000000 == 1000000000 >> 2000000000 == 2000000000 >> 3000000000 == 3000000000.0 >> 4000000000 == 4000000000.0 >> 5000000000 == 705032704 >> 6000000000 == 1705032704 >> 7000000000 == 7000000000.0 >> 8000000000 == 8000000000.0 >> 9000000000 == 410065408 >> 5000000000 = 705032704 == true >> 6000000000 = 1705032704 == true greggirwin 05:29Oy. That's a big ticket item. Good find. :+1: toomasv 08:33https://github.com/red/red/issues/4751 giesse 09:55@greggirwin my question here simply is... is handling an odd number of hex digits really more work? max length is another issue, but this odd/even digits thing sounds either like a bad case of premature optimization, or just a silly artificial limitation Oldes 10:43Here is a crash bug: transcode/into "a" none ;<-- will CRASH! 10:43(btw.. I wonder why there is /prescan and /scan?) hiiamboris 11:13see https://github.com/red/docs/blob/master/en/lexer.adoc#scanning-values Oldes 13:24I understand that prescan will be faster than scan.. but I wonder if there are any real use cases. 14:22Another console multi-line issue: >> %%%{...}%%%1 { } { }%%% { (escape) >> load "%%%{...}%%%" == "..." >> load "%%%{...}%%%1" *** Syntax Error: (line 1) invalid string at %%%{...}%%%1 14:25I think it should recognize end of raw-string in the same way how normal string is closed: >> load "{...}1" == ["..." 1] 15:21And last one for today.. I promise! ; making a series with position past tail... >> a: [1 2 3 4] == [1 2 3 4] >> b: skip a 3 == [4] >> remove/part a 3 == [4] >> b == [] ;<--- looks empty >> empty? b == false ;<--- but its not? >> [] = b == false ;<--- b is past tail, so it's false, but should it be? hiiamboris 15:23https://github.com/red/red/issues/3369 15:23I fixed it all a year ago ;) still waiting for review Oldes 15:26And in your solution... is the last [] = b from my code truthy? hiiamboris 15:26Indeed 15:26But [] =? b is not truthy (IIRC :D year is a long period) greggirwin 18:45@giesse I don't care about internal optimization in this case. I care about what's best for users. 18:49@Oldes I agree that raw strings should terminate at their last matching sigil, but have a bit of hesitation as well. e.g. %%%{...}%%%%file is pretty ugly, and hard to see as an error if you're one sigil short at the end. So, worst case, the current behavior is just a bit strict. Something good to note, but probably fine as is. Oldes 18:51It's not fine, because it should throw an error in console and not to enter multiline input which is not able to end (except hitting ESC) greggirwin 18:52OK, I agree that it's a console issue. I was talking about the load issue. 18:52But you still can at least hit escape. :^) Thursday 10th December, 2020 giesse 10:58> @giesse I don't care about internal optimization in this case. I care about what's best for users. right, but, why is even number of digits better for users? I'm all for removing features that don't bring enough value... but this seems just an extra arbitrary restriction that would only make sense in a very low level environment. just MHO zwortex 13:19Hi everyone, I managed to get the room for bug pre-submission. And I'd like to submit the following. What do you think ? Thanks. **Halt from within a view** Halt from within a view triggers an error and does not return to input prompt when run from the gui console. view [ b: button "The Button" [ halt ] ] gives the error : *** Throw Error: no catch for throw: halt-request *** Where: = *** Stack: view do-events do-actor do-safe halt The same in Rebol2 returns to the input prompt. In Rebol 2 : view layout [ b: button "The Button" [ halt ] ] 13:41Hi, close to the previous one, is this one. However there is already an issue regarding errors in general that are less meaningfull as compared with Rebol (#4532). Does it fall in that category and I could add a comment on it, shall I create a specific issue for this one or none is needed ? Thanks ! **Error from within a view provides no detailed indication as to the location** view [ b: button "The Button" [ 1 / 0 ] ] Gets the following error : *** Math Error: attempt to divide by zero *** Where: = *** Stack: view do-events do-actor do-safe The same with Rebol 2 view layout [ b: button "The Button" [ 1 / 0 ] ] Gets a more targeted message : ** Math Error: Attempt to divide by zero ** Where: func [face value][1 / 0] ** Near: 1 / 0 14:25Hi, I got this minor issue as well. Is it a bug ? **Seconds in time!** When displaying seconds with milliseconds... t: 10:05:12.8 print t print [t/hour t/minute t/second] ; (1) Extra digits are added, (1) returns : 10 5 12.80000000000291 Rebol 2 returns as expected 10 5 12.8 Platform : Windows 10 x64 / Red 0.6.4 rebolek 14:28This is an artifact of IEEE floating-point handling. See this https://0.30000000000000004.com/ hiiamboris 15:00@zwortex ;) on halt - it's a bug right, and I don't believe it was reported, so feel free to do so on errors - probably no point, it's a well known issue that will be improved in due time (but if you encounter error reports where even stack trace gets you nowhere - please add those to #4532) on floating point output - you got your answer, I'll just add that t is time and is formatted accordingly, but t/second is a float, so mold output with maximum precision is expected for it zwortex 18:51@rebolek, @hiiamboris, thanks for the reply. I created the issue #4757 for halt. Ok for error message. For time, I disagree. 19:04For the time issue, float is perfectly capable of representing 12.8 without weird digits. This is just the underlying implementation whatsoever, that is surfacing when calling /second. Beyond a certain number of decimals, a fraction of a second is meaningless. If you perform to-float on the time value, there is no such floating lost digits. So in my opinion, whatever the reason those digits appear, they should not. t: 10:05:12.8 print 12.8 ; no weird decimals print to-float t ; no weird decimals either The documentation needs reviewing as it indicates that time! holds milliseconds (0.001), see [https://github.com/red/docs/blob/master/en/datatypes.adoc], though this is not further mentioned in [https://github.com/red/docs/blob/master/en/datatypes/time.adoc] where only decimals of seconds are mentioned. When testing however, it appears decimals of seconds are rounded to a precision of fraction of a millisecond (0.0001) t4: 17:57:35.1123 ; fraction of millisecond accepted ! probe t4 ; and displayed as such t5: 17:57:35.11236 ; fraction of fraction of millisecond accepted probe t5 ; but rounded to a fraction of millisecond I would assume that this the max precision intended. If so, when requesting the seconds, I would expect to get the same. Be aware however that Rebol2 has a bigger precision of max 9 decimals. I don't know why this value was retained, but in any case, it always shows that number of precision if needed and no more. t6: 17:57:35.112362 ; 6 digits accepted in rebol2 probe t6 ; same number displayed as time probe t6/second ; or as second t9: 17:57:35.141592653 ; max precision in rebol2 - 9 digits - works alike probe t9 probe t9/second t10: 17:57:35.1415926535 ; more digits are silently gotten rid of probe t10 ; probe t10/second Still in Rebol2, things do not get messy either when performing an addition. t6: 17:57:35.112362 t9: 0:0:0.141592653 p: t6 + t9 probe p probe p/second Final point worth mentioning, though unrelated, I noticed a weird problem in the following case, where mold and form display slightly differently the float value. t3: 17:57:35.112 ; this one outputs with a rounding difference 99 => 100 probe t3/second ; => 35.11200000000099 print t3/second ; => 35.112000000001 t4: 17:57:35.1123 ; this one outputs alike probe t4/second ; => 35.11230000000069 print t4/second ; => 35.11230000000069 ` hiiamboris 19:11This is by design that mold outputs with better precision than form. It was done to get rid of "weird decimals" as you call them ;) 19:14I'll show you a trick. Maybe you'll understand. It lifts off all your confusion when you get it ;) >> t: 10:05:12.8 == 10:05:12.8 >> to-float t == 36312.8 >> to-float 10:05:00 == 36300.0 >> 36312.8 - 36300.0 == 12.80000000000291 zwortex 20:32Hi @hiiamboris, I was not commenting on float arithmetic (i.e. what @rebolek provided as well). In red, similar commands as yours t1: 10:05:12.8 t2: 10:05:00 d1: to-float t1 d2: to-float t2 d1 - d2 t: t1 - t2 t/second output >> t1: 10:05:12.8 == 10:05:12.8 >> t2: 10:05:00 == 10:05:00 >> d1: to-float t1 == 36312.8 >> d2: to-float t2 == 36300.0 >> d1 - d2 == 12.80000000000291 >> t: t1 - t2 == 0:00:12.8 >> t/second == 12.80000000000291 Similar commands in Rebol2 : t1: 10:05:12.8 t2: 10:05:00 d1: to-decimal t1 d2: to-decimal t2 d1 - d2 t: t1 - t2 t/second give : >> t1: 10:05:12.8 == 10:05:12.8 >> t2: 10:05:00 == 10:05 >> d1: to-decimal t1 == 36312.8 >> d2: to-decimal t2 == 36300.0 >> d1 - d2 == 12.8000000000029 >> t1 - t2 == 0:00:12.8 >> t/second == 12.8 Float arithmetic the same, however, the last command returns the seconds neatly rounded, for anyone to enjoy, whereas, in Red you have to round them first. On top of that, the mold string for time rounds seconds at 0.0001 precision, and the documentation is inconsistent... hiiamboris 20:35R2's time format is not a float IIRC. 20:35As such it simply doesn't have that kind of precision. Hence, truncated "pretty" output. greggirwin 21:10@zwortex the time issue is indeed due to float being used, which may not be that way forever, but it's there now. Something to note for users. @hiiamboris' note about subtraction applies because that's what time! does internally when you ask for t/second. When taken as an entire time! value, different formatting rules apply. Once you ask for just seconds, it becomes a float (currently). If you need to display seconds separately, you can use round to control the precision. Friday 11st December, 2020 zwortex 13:15Hi @greggirwin, @hiiamboris, no problem. I introduced the issue as minor. Case is closed as far I am concerned. I understand that you don't view that as a bug, at least for now. There is no definite specification, the job is done and the user can perform the conversion by himself as you've said. I had a quick look at the java specification [https://docs.oracle.com/javase/8/docs/api/java/time/package-summary.html][https://docs.oracle.com/javase/8/docs/api/java/time/Duration.html]. For them the minimum duration is the nano-second, the same as in Rebol (64bits for storing the seconds, and 32bits for the milliseconds). I guess both made the same reasoning and implementation. When I said weird digits, it is because, in my opinion, at the application level, these should not come up. When you ask for seconds, you should have seconds, and not seconds with the tiny bits that come with it because, underneath, float is used. It does not look neat. The thing is where do you set the boundary between Red/system stuff (c like stuff) and Red stuff : what is low-level and what is high-level. But this is a more general debate... hiiamboris 13:38You can go way beyond nanoseconds there in precision, it all depends on your timescale... >> century: 100 * 365.25 * 24:0:0 == 876600:00:00 >> to-float century - (century - 0:0:0.000001) == 9.5367431640625e-7 >> to-float century - (century - 0:0:0.000000001) == 0.0 As you can see, even microseconds are inexact on a century scale, whereas nanoseconds are nonexistent 13:42More astronomic timescale eats whole seconds :D: >> manvantara: 3067200 * century == -2147483648:00:00 >> to float! manvantara - (manvantara - 0:0:5) == 4.0 >> to float! manvantara - (manvantara - 0:0:1) == 0.0 13:43So here seconds become "weird decimals" already 13:47Should we get rid of seconds and display only minutes? Who's in a rush anyway... Numeross__twitter 14:58Hello ! This gives me trouble: >> append [] 'a/b == [a b] and not == [a/b] What I try to do is to turn [1 bla 2] into [1 bla/result 2]. Using collect/keep is the same 15:09Oh I have to put it in a block like append [] [a/b] hiiamboris 15:18append/only, keep/only rebolek 15:20@Numeross__twitter actually there's a reason for it and the reason is the difference between series and atomic values. The reason why append works as it does is so you can do this: >> append [John Paul] [George Ring] == [John Paul George Ringo] getting [John Paul [George Ringo]] is certainly not something you wanted. It may seem counterintuitive when appending path!, but path is series! also so you need to use append/only as @hiiamboris pointed out. hiiamboris 15:22Not just series! in this case, but a block type (any-block!) rebolek 15:22Right, thanks for correction. Numeross__twitter 15:23That makes a lot of sense, thanks ! toomasv 15:30Although, I'm not sure if append needs to append os to words. @rebolek, may be you should rise an issue :stuck_out_tongue_winking_eye: greggirwin 21:40@hiiamboris +1. Always take the long view. ;^) > When you ask for seconds, you should have seconds, and not seconds with the tiny bits that come with it because, underneath, float is used. @zwortex you and I agree 100%. I feel the same way about floats pretty much everywhere. Why does anyone use them? And yet, everyone does. Funny side note, many years ago I needed an indexing system for date-time values, which would allow searching for ranges in both dimensions. e.g. 01-jan-2020 to 01-feb-2020 / 9:00 to 17:00. I ended up using tuple! values to represent each time segment. e.g. CC.YY.MM.DD.HH.MM.SS.XX. A bit wasteful in some ways, but worked well. Monday 14th December, 2020 toomasv 12:26Lexer bug? >> .5 == 0.5 >> .5 ;4 == 0.5 >> .5;4 *** Syntax Error: (line 1) invalid float at .5;4 *** Where: case *** Stack: load zwortex 12:54Hi everyone, is this a bug? ; when merging objects, the second object takes precedence in case of conflicts a: object [ val: 1 ] b: object [ val: 2 wal: 3 ] c: make a b ; works also with functions a: object [ show: does [print "hello"] ] b: object [ show: does [print "chau"] ] c: make a b a/show b/show c/show ; but not when mixed... a: object [ val: 1 show: does [print val] ] b: object [ val: 2 wal: 3 show: does [print [val wal]] ] c: make a b a/show b/show c/show hiiamboris 13:21It is. See also my notes above https://github.com/red/red/wiki/[DOC]-Object-Notes#return-in-spec-blocks 13:23Please report it to https://github.com/red/red/issues/. 13:27R2 fares even worse, lol: >> a: make object! [ val: 1 show: does [print val] ] >> b: make object! [ val: 2 wal: 3 show: does [print [val wal]] ] >> c: make a b >> a/show 1 >> b/show 2 3 >> c/show ** Internal Error: Stack overflow ** Where: wal ** Near: wal 13:28What a mess.. toomasv 14:11Depends on the order: a: object [ val: 1 show: does [print val] ] b: object [ val: 2 show: does [print [val wal]] wal: 3] c: make a b c/show ;>> 2 3 zwortex 14:34@hiiamboris, @toomasv, added #4765 taking into accounts your remarks. For the return in the spec - Had read it already. How is it related to this very case ? hiiamboris 15:32> my notes above https://github.com/red/red/wiki/[DOC]-Object-Notes#return-in-spec-blocks *above* is the keyword here zwortex 16:12Ok, I will read that through. Regards. greggirwin 23:47@toomasv .5;4 looks like a regression. Used to work, so likely something in fast lexer. Wednesday 16th December, 2020 zwortex 19:58@hiiamboris, still on the same subject of obj functions with global words that are not rebound when copied. I've seen it is the very subject of #3365, that's why I put it here (rather than help where the conversation started). In this issue, you suggest that only words that were local to the source object should be rebound to the new object. However, this behaviour leaves the new object out of sync with its specification, at least as written and made apparent when calling mold. x: 0 a: make object! [ f: does [print x] ] a/f ; >> 0 - a/x is global b: make a [ x: 1 ] b/f ; >> 0 - no rebound of f because f/x is meant global c: do mold b ; create a new object from b spec c/f ; >> 1 - though c/x is set after c/f, x in f and c/x now refer to the same context It is not wysiwyg and it breaches the mantra : code is data and data is code. In the new object, the code that is really executed is not the one reflected in the data. If the "old" global variables were to be kept, at least, that should be made visible in the code : all words that are global but hidden by local variables should be rewritten as system/words/<var> or similar trick to emphasise they are global variables. The lack of synchronisation between the spec. and the running object may have implication on serialization or other similar issue, but I haven't put further thoughts in that matter. Personally, I'd rather have all the source object code rebound with all the local variables, both old and new (the other behaviour can be left as a refinement for advanced users that manipulate mixed objects). That has the benefit of keeping the code unchanged and that might also be useful when overwriting global functions, and not just values. In #3365, the test is the following. If one applies the same rule of thumb, that is to expect a wysiwyg behaviour against specs, it leaves c, d and e as noks : unset [a b x c d e f g h i] a: context [x: 1] b: context [f: does [print x]] x: 0 c: make a b d: make b a e: make b [x: 2] f: copy d ; R2 error no copy of object g: copy e ; R2 error no copy object h: make d [] i: make e [] b/f ; 0 == OK c/f ; 0 == NOK - expecting 1 d/f ; 0 == NOK - expecting 1 e/f ; 0 == NOK - expecting 2 f/f ; Red 1 - R2 error - R3 - 0 == OK 1 g/f ; Red 2 - R2 error - R3 - 0 == OK 2 h/f ; Red 1 - R2 1 - R3 - 0 == OK 1 i/f ; Red 2 - R2 2 - R3 - 0 == OK 2 hiiamboris 20:37I prefer not broken code over wysiwyg code (which is not wysiwyg anyway because words have *hidden* context). But I'm not pushing for make specifically in that ticket. I'm pushing for copy. 20:40You should be able to serialize your binding with Redbin btw. Numeross__twitter 21:14Is this normal ? x) >> to-set-path reduce ['input to-set-word 'x] == input/x:: 21:15It seems to work well as a set-path tho hiiamboris 21:18It is. 21:19https://github.com/red/red/wiki/%5BDOC%5D-Path!-notes Numeross__twitter 21:22Woah that's trippy, thanks Friday 18th December, 2020 loziniak 22:36view [button "cancel" button "show another"] buttons overlap in Windows 10 and in Wine. Can anybody confirm? greggirwin 23:01Confirmed, due to OS metrics application of the Cancel button. Worth a ticket. 23:02If you change the title of the Cancel button, you can see the difference. Oldes 23:46Actually it is because the extended width of the "show another" button. 23:48I'm quite not sure if I like how Red's View wants to be clever and swap button positions. greggirwin 23:54https://www.red-lang.org/2017/07/063-macos-gui-backend.html shows how you can easily disable it. 23:57Without this feature, it's a lot of work for the user who wants to honor OS GUI guidelines. And the rules can be improved. So even better than a ticket would be a PR in this case. Saturday 19th December, 2020 loziniak 14:18PR is always better than issue! 14:21> I'm quite not sure if I like how Red's View wants to be clever and swap button positions. It's out of language's responsibility, and also unpredictable behavior for me. Oldes 16:19Is this known crash case? body-of :is or any not native op! rebolek 16:20I believe it has been reported, wasn’t it? Oldes 16:20This also does not look good: >> body-of :print == 23 16:21(although it is probably just a native index) hiiamboris 16:21I do not recall such crash report rebolek 16:21actually I believe that’s intentional hiiamboris 16:23crashes on all non-native ops Oldes 16:24Right. hiiamboris 16:25and it's a regression btw 16:25 >> body-of :is *** Internal Error: reserved for future use (or not yet implemented) *** Where: reflect *** Stack: body-of >> about Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37 16:25same, May 2020 16:26August not crashing too Oldes 16:28reported greggirwin 19:14On system metrics and GUI features in general, it will always be a work in progress. We can probably all agree that having View use default margins, spacing, and face size by style is a good thing. Otherwise we have to pick one OS as the rule and the others lose out. For more advanced rules, as noted you can disable them. But here's another way it's a good feature. As soon as you see it happen, you ask "Why?" Once you know why (this comes to docs of course, but people can hit this easily in simple scripts), it's easy to fix, but what makes it helpful in another way is that you *learn* that there are guidelines for each OS and can improve your UIs to match them accordingly. Sunday 20th December, 2020 raimundasa 09:43>> request-file *** Runtime Error 1: access violation *** at: 0807915Dh >> request-dir *** Runtime Error 1: access violation *** at: 0807915Dh >> about Red 0.6.4 for Linux built 19-Dec-2020/14:56:50+02:00 commit #d082313 Oldes 17:00I was reviewing request-dir today and I believe it does not work as it should.... now it is (in fresh console): request-dir ; starts in default directory (%/C/Users/[name]) ;== %/C/Users/Oldes/ request-dir/keep/dir %/c/ ; this starts again in default dir but I think it should be in %/C/ ; when I select some folder in above requestor... like %/C/Dev than... ;== %/C/Dev/ ; and I use again: request-dir/keep/dir %/c/ ; than is starts in %/C/Dev but /dir should be used and so it should be in %/C/ 17:02In other words... when /keep is used with /dir than /dir should be used as a start and /keep should just store the result. When used only /keep than it should start in the last stored location. 17:20Also the dialog looks quite ugly if there is no title.. maybe there should be used some default text when title is not defined by user. 17:24Although the dialog is ugly even with a single line title. hiiamboris 19:14I think /keep/dir should: - navigate to given dir when first invoked - navigate to saved dir afterwards Then we control the starting directory but allow user to change it on subsequent calls without interfering with it Monday 21st December, 2020 Oldes 10:08When thinking about it.. it could keep last dir always (no need to use /keep) and the /dir would always set starting dir. Using /dir with none would force to use root as a starting dir. 10:10Also.. I'm not sure if it's possible on mac or linux.. but win api allows to specify directory root... (allow only paths in given folder) hiiamboris 10:32What if you for some reason want to reset the last dir? With implied /keep you can't, right? Oldes 11:07Yes... that is the issue:) I think that if one explicitly use /dir than the dir should be used and not some previous one, which may be unrelated. 11:09But hard to say.. to be honest.. I was not using request-dir so far. That is the reason why I try to discuss it here ;-) hiiamboris 11:44I see ;) Well, then in this model you'll have to reinvent the /keep/dir logic in your program likely, by using /dir for the first request and then with no refinements after that. loziniak 13:08@hiiamboris thanks for reporting [that](https://gitter.im/red/bugs?at=5fdd2eeb93af5216fc4d3925)↑. I'm always a little late :-P hiiamboris 14:17Sure. Bugs are easy to forget about, so better to report them asap ;) Friday 25th December, 2020 raimundasa 11:43 >> 3:3:3.3 == 3:03:03.3 >> 3:3:3,3 *** Syntax Error: (line 1) invalid time at 3:3:3,3 *** Where: case *** Stack: load >> about Red 0.6.4 for Linux built 25-Dec-2020/1:08:25+02:00 commit #98f31b5 greggirwin 16:37Good catch. It lexes in R2 and earlier Red versions, so it's a fast-lexer regression. Please see if a ticket already exists, and create one if not. raimundasa 20:59Done greggirwin 21:02Thanks. Saturday 26th December, 2020 raimundasa 10:01 >> to-date [2020 12 26] == 26-Dec-2020 >> to-date "2020-12-26" *** Script Error: cannot MAKE/TO date! from: "2020-12-26" *** Where: to *** Stack: to-date >> about Red 0.6.4 for Linux built 25-Dec-2020/1:08:25+02:00 commit #98f31b5 toomasv 11:40From string use load: >> load "2020-12-26" == 26-Dec-2020 greggirwin 19:58[Date docs](https://github.com/red/docs/blob/master/en/datatypes/date.adoc) discuss a few subtleties, like to normalizing and that you can use epoch time conversions between integers and dates. raimundasa 20:58Strange when i can do it >> to-time "20:12:26" == 20:12:26 but not to-date "2020-12-26" greggirwin 23:10Support can be added. Time values just load the string internally, and dates could do the same. Does anyone know if we have a ticket for this already? Sunday 27th December, 2020 Oldes 12:12I'm sure it's a bug. 12:15I would not recommend use of load for such conversions as load is very high level function. If needed, it's better to use low-level transcode. >> transcode/one "2020-12-26" == 26-Dec-2020 mikeyaunish 17:43I have been experiencing crashing using offset-to-char. If you click on the area in this example the window closes. view [ a1: area on-down [ x: offset-to-char face 0x0 ] ] hiiamboris 17:50I asked a few years back, these functions were meant for rich-text only IIRC 17:51probably worth raising an issue as a reminder that they're still crashing on other faces greggirwin 20:52@oldes, good point. I was going to say "just use load", and that's still fine for 99% of cases I imagine, where you're loading a single value, or just a few. e.g. in a GUI data exchange scenario. But for large data transformation uses, where you may be doing it millions of times, it will make a huge difference. Memory pressure increases with load, but not transcode. Count: 10000 Time | Time (Per) | Memory | Code 0:00:00.004 | 0:00:00 | 484 | [transcode/one "2020-12-26"] 0:00:00.005 | 0:00:00 | 484 | [transcode/one "12:34:56"] 0:00:00.007 | 0:00:00 | 440284 | [to time! "12:34:56"] 0:00:00.015 | 0:00:00 | 2320440 | [load "2020-12-26"] 0:00:00.021 | 0:00:00 | 2320284 | [load "12:34:56"] Time!'s to action uses load-value internally, which maps to load-single-value, which then uses lexer/scan-alt. Transcode also boils down to lexer/scan-alt. 21:00For conversions where load-value is used today, it would be a win to use transcode internally...I think. Those copy the cells today, with a comment that load-value changes the spec. If that copy is safely avoided, it's a lighter hit. In the meantime, people who benefit can use transcode/one or wrap it with a more human friendly name. Oldes 23:34Right... still I think that it should be possible to do just to date! "2020-12-26" as it is in Rebol. Monday 28th December, 2020 greggirwin 00:15Agreed, my thoughts were just to add that it could be more efficient internally as well. Tuesday 29th December, 2020 pepdiz 22:56hi 22:56I've discovered a weird issue, maybe a bug, in red-064 for windows 22:57maybe it's not thant important because it affects red-064 32bits in windows XP (don't know if affecting other windows too) 22:58the problem is I had a gui program in red compiled as .exe file 22:58yesterday when running it all texts just dissapeared rebolek 22:58@pepdiz hi, I believe that XP is not a supported platform anymore pepdiz 22:58no text in buttons, neither labels, nor lists 22:59to solve it I had to explicity define styles for every face setting the font-name 22:59I know, xp is not a supported platform but this issue may be serious enough if affecting other windows 23:00What is the default font coded in red ? 23:01another issue is console blows out when trying to "parse system", I suppose it's a memory issue but very unpolite ;-) 23:02sorry, not "parse system" but "probe system" hiiamboris 23:15@pepdiz can you paste the output of ? system/view/fonts ? 23:16and are you using a nightly build? built when? pepdiz 23:37ok, let me see and I post it Wednesday 30th December, 2020 pepdiz 00:07here you are 00:07>> probe System/View/fonts make object! [ system: "ﺠ^R鐰粀~" fixed: "Courier New" sans-serif: "Arial" serif: "Times" size: 0 ] == make object! [ system: "ﺠ^R鐰粀~" fixed: "Courier New" ... >> system/version == 0.6.4 >> system/build == make object! [ date: 30-Nov-2019/1:40:31+01:00 git: make object! [ ... greggirwin 01:18@pepdiz what is your locale setting for XP. It may be a combination of the OS and the system font for the locale. 01:20probe system works in both consoles on Win10. I don't know of anybody else on XP at this point, so may be hard to debug. Fortunately, probing the system isn't a critical path issue. Would be nice if it just said "out of memory" though. pepdiz 01:52yes it would 01:53anyway it doesn't happend in my windows 10 so I suppose it's too related to xp and lack of memory in the machine 02:02my locale setting for XP is spain/spanish 02:02one strange thing is you see nothing if using view gui facets 02:03but if you set some font property for any facet, for example, font-size, then everithing works right, even for facets without font-setting 02:03it seems like font is not set up right initially and first reference to font property forces a font load 02:04anyway, weird enough hiiamboris 10:05ﺠ^R鐰粀~ looks like garbage to me greggirwin 11:01It certainly doesn't look like Spanish. pepdiz 23:50sure it doesn't look like spanish but it's a task for red console to assign right locale isn't it? 23:51I mean, red console should read the right locale from OS and set its own word properly 23:51anyway I assume no one is using xp nowadays so it's not a real problem 23:51unless begin to happen in modern windows 23:52because I didn't do anything strange, simply one day begin to fail Thursday 31st December, 2020 greggirwin 00:15Yes, Red should do the right thing of course. But I don't know if the deep core team is still testing on XP, and it could be quite a bit of work to dig into. So chances are that it won't get fixed unless someone using XP narrows it down. Given that, we can doc it in a GUI related wiki page, so others are forewarned. pepdiz 00:17ok 00:18let me introduce an off-topic question (not bug) 00:19is there any way of "disassembling" a red executable? I mean to get the red code from a red compiled .exe greggirwin 00:21No. When you compile Red, it is first converted to Red/Sysem, and machine code is generated from that. It would be possible with encap mode, as that doesn't really compile. pepdiz 00:39what is encap mode? I suppose it's a kind of wrap of rebol core with your source hiiamboris 10:16> rebol core red core ;) greggirwin 20:29The --encap command line switch for the compiler causes the code to be embedded basically as-is, and interpreted at runtime. This allows you to distribute a single EXE that contains code which is too dynamic for the compiler to handle, or to work around compiler limitations. You can see all the compiler options in the readme of the main Red github repo.``
