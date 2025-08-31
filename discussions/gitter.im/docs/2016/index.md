# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2016

## Saturday 7th May, 2016

greggirwin

[13:48](#msg572df218b51b0e29484ffee3)When I started doc ideas a couple years ago, I ended up basing the model on the gitbook layout IIRC. I just colored it red (need a Red term for REBOLized :-). i.e. you have a %.book file that is like %book.json and a little make-book script that compiles all the %.md files into one.

[13:48](#msg572df2403170252648f4cf58)That was in 2014, and I think the gitbook editor and toolchain was weak at the time.

dockimbel

[13:49](#msg572df25f682b8fdf3c8cad7d)Gitbook still has some rought edges, but it is usable for our needs.

[13:50](#msg572df28eaa92b14772cb71b6)I'm currently reviewing the \[Asciidoc](http://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) format, which is a much more powerful alternative to Markdown, as both formats are supported by Gitbook.

[13:50](#msg572df2ba682b8fdf3c8cad81)Especially for PDF output, Markdown is really lacking proper support for correct layouts.

[13:52](#msg572df320b16b91060f79b740)I'm not very glad to have another (big) file formatting spec to learn, but it seems the resulting quality of the Red documentation would be significantly higher, so that it is probably worth the extra effort.

qtxie

[13:55](#msg572df3cdf36daf63798d6c67)Yes. Markdown is lack of standard. :worried:  
http://ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/

nodrygo

[17:53](#msg572e2baa3170252648f4db51)For doc you have also the Racket \[scribble](https://docs.racket-lang.org/scribble/index.html) not so bad but yes it is another format to learn, and not interpreted by Gist \*(for book Racket have pollen and for presentation slideshow)*  
now `Asciidoc` seem good compromise

greggirwin

[18:36](#msg572e35b0f9a53a60793ca390)Markdown isn't perfect, nor was makedoc, nor, likely, is AsciiDoc. I haven't been able to find an AsciiDoc grammar definition. Whether AsciiDoc is better depends on your goals, needs, and acceptable toolchain. Many years ago, I thought DocBook was the best back end format to target for document generation (Yes, O'Reilly), and I'm still OK with that. I agree that Markdown was never meant to go to print.

[18:42](#msg572e370af36daf63798d79cc)I wrote \*most* of a markdown parser, for a project to convert Blueprint to Swagger. It's a pain. But I don't see AsciiDoc being any better in that regard, if the need arises. Unless someone finds a grammar.

[18:44](#msg572e377812fa465406eac63b)Glancing at AsciiDoctor, some of their recommended practices make no sense to me:

[18:45](#msg572e37bef9a53a60793ca3ed)- Don't wrap text at a fixed column width.  
\- Instead, put each sentence on its own line, a technique called \_sentence per line\_.  
\- This technique is similar to how you write and organize source code.  
\- The result can be spectacular.

Really? Put each sentence on its own line? I don't know about anyone else, but I can't imagine writing that way, or reading things written that way.

[18:46](#msg572e3800a351d8310951d303)Maybe I'm just old-fashioned. :^)

## Sunday 8th May, 2016

dockimbel

[04:18](#msg572ebe2ac2a86dcf791971db)@greggirwin Well, I would be glad to stick to Markdown or even Makedoc (though, it would need many extensions), but for generating a big documentation, Asciidoc seems to be more appropriate . About the practices, we can pick up what fits best our needs and leave the rest. ;-)

[04:20](#msg572ebe86682b8fdf3c8cb17d)I would be glad to have an extended Makedoc or even our own flavor of Markdown, but a) I don't have any spare resource for working on that, b) it wouldn't work with Gitbook.

[04:22](#msg572ebeee682b8fdf3c8cb17e)@nodrygo Thanks, the Rebol world has already its own format called \[Makedoc](http://www.rebol.net/docs/makedoc.html), but Gitbook supports only Markdown and Asciidoc.

greggirwin

[04:47](#msg572ec4d1b51b0e2948501fd6)We are on the same page @dockimbel

nodrygo

[05:11](#msg572eca78ed393f3409b0b354)@dockimbel Rebol/makedoc with a auto html night build toward a static site may be a solution ? or you want doc directly readable from gist ?  
reading Makedoc but seem not to have side TOC (Asciidoc have it). Personally I prefer side toc ;-)

dockimbel

[05:22](#msg572ecd25682b8fdf3c8cb18b)Makedoc is too limited, it lacks many formatting options, especially for tables. And it also lacks emiters for different output formats. We don't have the resources to build all that.

PeterWAWood

[05:24](#msg572ecd7c12fa465406eada46)@dockimbel \[Leanpub](https://leanpub.com) is marked-down based (with extensions for publishing books) and could offer an alternative to Gitbook.

dockimbel

[05:25](#msg572ecdbec2a86dcf791971f0)@PeterWAWood Does it support building docs from a Github repo, along with versioning based on tags?

PeterWAWood

[05:25](#msg572ecdd9f9a53a60793cb7fa)Github - yes

[05:27](#msg572ece57b51b0e294850208a)I'm not sure about versioning on tags ... probably not ... it also probably lacks tools for indexing though.

[05:28](#msg572ece71a351d8310951e6ff)An example of a LeanPub book in github - https://github.com/nzakas/understandinges6

nodrygo

[05:30](#msg572ecefcb51b0e2948502098)hum seem more book oriented than live doc oriented.

PeterWAWood

[05:30](#msg572ecf02f9a53a60793cb813)LeanPub are working on an \[open Markdown Plus for Book Publishing] (http://markua.com).

It may not materialise as they haven't started using it with LeanPub.

ghost~5680c5f416b6c7089cc058a5

[05:32](#msg572ecf67a351d8310951e71e)@dockimbel \[Sphinx](http://www.sphinx-doc.org/en/stable/) using ReStructuredText?

nodrygo

[05:35](#msg572ed03db51b0e29485020bc)don't know Sphinx but I worked a lot with Python (professionally) and the doc is not bad. that said I still prefer the Racket one because it's search engine ;-)

PeterWAWood

[05:43](#msg572ed1ea12fa465406eadaa6)@nodrygo I not quite sure what you mean by "live doc oriented"? If you are referring to documents created automatically from source and available on line, LeanPub would not be a good choice. I didn't thought @dockimbel was referring to the human written documents that are available.

nodrygo

[05:46](#msg572ed2a9f9a53a60793cb871)@PeterWAWood what I mean is in a doc like Racket you have both table of content on left and search engine so you find very fast things (also true in DrRacket IDE). In a book oriented you have pages oriented (like javascript doc you linked) .. don't know if my explanation is good enough  
The doc I would like to have will look like Rebol Word Browser .. but in html ;-)  
of course that would be a big work and I have no enough knowledge yet to help

[05:59](#msg572ed5b5f9a53a60793cb8bc)ooops Sorry I have wrote in French in bad entry .. you should look the better doc tool \[PANDOC](http://pandoc.org/). Probably have anything you want and considered one of the best ;-)  
Après il existe le plus célèbre ! \[PANDOC](http://pandoc.org/) mais je ne connais pas trop et jamais utilisé mais il devrait répondre à tout ce que vous cherchez ..

dockimbel

[06:27](#msg572edc39aa92b14772cb75df)For the Red doc, I want to use an online tool/service, I don't to waste my time on setting up complex and heavy toolchains locally.

nodrygo

[06:29](#msg572edccd3170252648f4f2e1)with Pandoc you may have all of that (take any kind of entry to any kind of output and some services for online) .. now may be Markdown is the way to follow

dockimbel

[06:31](#msg572edd29c2a86dcf791971f7)@nodrygo I don't see any support for online processing and publication on pandoc.org.

[06:32](#msg572edd60c2a86dcf791971f9)Markdown is insufficient for a big technical documentation.

nodrygo

[06:32](#msg572edd63a351d8310951e84b)not sure it's for free \[one of them] (https://foliovision.com/seo-tools/pandoc-online)

dockimbel

[06:33](#msg572eddab682b8fdf3c8cb19f)@nodrygo I think you don't understand what I mean, you should have a look at http://gitbook.com to get a feeling of the needed features.

[06:34](#msg572ede04682b8fdf3c8cb1a1)@PeterWAWood Leanpub is really for books, our main publication format is the web.

nodrygo

[06:39](#msg572edf3fb51b0e29485021ec)@dockimbel so you want to write a book ok no problem

dockimbel

[06:40](#msg572edf6cb16b91060f79bb67)@nodrygo Not a book: https://www.gitbook.com/book/dockimbel/red/details

nodrygo

[06:42](#msg572edfbab51b0e29485021f5)

PeterWAWood

[06:46](#msg572ee0d9a351d8310951e89b)@dockimbel You can publish a complete book on the lean pub website, without charge. Users can also download ebooks as I believe you can with got books.

[06:47](#msg572ee0f212fa465406eadbdd)gitbooks

[06:49](#msg572ee17df16c08510661ae11)I would concur with @nodrygo that if you are only thinking about online docs having a clickable contents tree and search on each page is the way to go.

nodrygo

[06:49](#msg572ee195f36daf63798d8f7e)so use gitbook. What is the problem with it ? the pricing ?  
you could do the same with pandoc except the direct online conversion (night build could help here)

PeterWAWood

[06:50](#msg572ee19ea351d8310951e8a6)Just to clarify, you can publish the full text

[06:50](#msg572ee1cea351d8310951e8ab)Of a lean pub book in HTML on their website.

[06:55](#msg572ee2d8f9a53a60793cb9cc)\[Apple's docs](http://documentation.apple.com) use a similar approach.

[06:55](#msg572ee2fd3170252648f4f36e)to that of Rackett.

nodrygo

[06:57](#msg572ee351a351d8310951e8c8)@PeterWAWood yes good doc but if I well understand @dockimbel want to have some tools converter on line (doc, book, ebook , pdf ..)

dockimbel

[07:02](#msg572ee48daa92b14772cb75f3)@nodrygo I didn't say I had any problem with Gitbook, and it already supports exporting the docs in different formats (in addition to HTML). I just said that it has rough edges, like hackish versioning support and limited built-in search results reporting.

PeterWAWood

[07:04](#msg572ee4f712fa465406eadc3f)I'm trying to avoid learning yet another markup language

dockimbel

[07:04](#msg572ee51bc2a86dcf7919720b)@PeterWAWood Me too, but Markdown is really not up to the job, and Markua is just yet-another-flavor of Markdown. In such case, using a more wide-spread format like Asciidoc looks safer to me.

PeterWAWood

[07:06](#msg572ee566f36daf63798d8fe1) ,

[07:08](#msg572ee601b51b0e294850227d)Agreed. Though if I have to learn another markup format might as well learn Latex 😷

nodrygo

[07:14](#msg572ee762a351d8310951e92e)looking Asciidoc .. seem not too bad .. and perfection doesn't exist ;-)

PeterWAWood

[08:31](#msg572ef961a351d8310951eb07)I noticed this on the Gitbook page: "Books are written using Markdown or Asciidoc. LaTeX support is planned."

[09:10](#msg572f0272ed393f3409b0b8ae)Is one of the first tasks on the docs to convert the markdown to asciidocs?

dockimbel

[09:21](#msg572f0506682b8fdf3c8cb1e7)@PeterWAWood Yes, but it will probably be a minimal effort as Asciidoc supports the basic Markdown syntax.

PeterWAWood

[09:48](#msg572f0b8b3170252648f4f7c6)@dockimbel Looks like I'll be reading \[this](http://asciidoctor.org/docs/asciidoc-writers-guide/) shortly.

## Thursday 12nd May, 2016

nodrygo

[16:22](#msg5734addee2996a5a42c7c6e4)@dockimbel don't know if you are interest but if you want convert your markdown to asciidoc `pandoc` do that very easily like test here (having problem with gitter direct link ) `https://gist.github.com/nodrygo/2a3040da038f5633fd2b58a036df374d`

dockimbel

[16:26](#msg5734aeab8b845b284193e4f8)@nodrygo Thanks, good to know we won't have to do it manually. I'm still reluctant to learn a new markup format, so I need time to admit I have to. ;-)

## Wednesday 25th May, 2016

rebolek

[14:12](#msg5745b2b78fba4a053f1ae6c3)I found some typos in the Red Gitbook:  
\* some internal links do not work: Fill-pen Line-width Line-join Line-cap Anti-alias  
\* External link https://msdn.microsoft.com/en-us/library/windows/desktop/ms534148(v=vs.85 (in Line-join chapter) does not work.

dockimbel

[14:18](#msg5745b44f8fba4a053f1ae6dc)@rebolek Internal links are working from here (using latest Chrome).

rebolek

[14:19](#msg5745b4758fba4a053f1ae6e0)@dockimbel Interesting. Rest of links works fine, I'll check in another browser.

dockimbel

[14:24](#msg5745b585a0fc3091611b011a)External link lin Line-join fixed now.

rebolek

[14:24](#msg5745b5b2548104867b68128b)@dockimbel when I look at source, link is `Fill-pen` but the element is `Fill-pen`

dockimbel

[15:10](#msg5745c05a8fba4a053f1ae776)I have `Fill-pen` here.

## Wednesday 8th June, 2016

iArnold

[19:17](#msg57586f48a1be01c01a780eed)What about making the summer months the months of documentation? Document all about how Red is now and how Red 2.0 will be? Answer all question asked and celebrate holiday season on the beach in the afternoon after answering some questions?

## Saturday 18th June, 2016

ghost~5680c5f416b6c7089cc058a5

[05:13](#msg5764d85ffeaf6cd222acaa68)rST vs MD -&gt; http://zverovich.net/2016/06/16/rst-vs-markdown.html

dockimbel

[08:39](#msg576508b791d56ac9155c5421)@nc-x The thing is that gitbook gives us the choice only between MD and Asciidoc, so rST is not among the possible choices. I think Asciidoc is fine, and lowers the effort for porting existing MD docs.

ghost~5680c5f416b6c7089cc058a5

[11:45](#msg576534614227fdc922982bb5)okay :smile:

## Friday 1st July, 2016

gunnarahlberg

[14:50](#msg5776831e1dceb2373152ab5e)so I made a small pull request https://github.com/red/docs/pull/9

## Saturday 2nd July, 2016

meijeru

[17:07](#msg5777f4d56a8f789e4a0846a4)Minor issue in `%reactivity.md`: the link leading to the `react?`description is broken. It goes to `#react-` instead of to`#react?`.

dockimbel

[17:09](#msg5777f53835bfead3796343be)@meijeru I don't know what is the rule for converting `?` in that case. I don't have time this weekend to look for that, could you please have a look into the relevant documentation to find the answer?

greggirwin

[17:33](#msg5777faf45c023e194f5fb5ad)At a glance, since I don't know the rules either, the TOC in gitbook is using "react-", while MD in guthub has this "&lt;a id="user-content-react-1" class="anchor" href="#react-1"..."

[17:36](#msg5777fb856a8f789e4a089770)It's probably trying to map to a valid URL but failing somewhere.

[17:48](#msg5777fe8035bfead37963c11c)"react-1" works in the URL.

[17:51](#msg5777ff2b26ff03984aafa246)PR made.

[17:52](#msg5777ff6926ff03984aafa30a)Thanks for catching that Rudolf.

## Sunday 3th July, 2016

dockimbel

[03:38](#msg577888ae26ff03984ab58a54)@greggirwin It doesn't seem to work.

greggirwin

[17:15](#msg5779483926ff03984abde848)Hmmm. I tested it on github in my fork and it did, but not in gitbook. :^(

[17:18](#msg577948ce5c023e194f6d4b9a)Now gitbook has `id="react"` for it.

## Monday 4th July, 2016

dockimbel

[04:14](#msg5779e28ed4b6d5012ec8174c)MD applies special conversion rules for creating anchors.

## Friday 8th July, 2016

meijeru

[14:50](#msg577fbd9fbdafd1910739906e)@dockimbel I am inspired for the following remark by the Gitbook chapter on maps. It says there that accesses are possible in the form `m/k` or `get 'm/k`. This goes of course for all types that have selectable components. Now I notice that for objects, a third access method is possible: `get in o 'f` (o is an object and f is a field name). This is presumably specific to objects. Is there an explanation of the proper usage of `in` somewhere?

greggirwin

[16:51](#msg577fda237aeb080527814447)http://www.rebol.com/docs/words/win.html

## Saturday 9th July, 2016

ghost~5680c5f416b6c7089cc058a5

[03:59](#msg578076b6c9b49c1d6fe2fe52)@dockimbel Will http://static.red-lang.org/red-system-specs.html be converted to gitbook?

[04:00](#msg578076e4bdafd1910742c152)Because all the official documentation at a single place feels better than all scattered here and there :smile:

dockimbel

[05:13](#msg578087edc9b49c1d6fe37e3e)@nc-x I would like it to be a gitbook too, though, I don't have any spare time to do such conversion myself. It would be great if someone could contribute that.

meijeru

[15:28](#msg5781182cc9b49c1d6fe8ed46)@greggirwin On `in`, your reference is alright in the supposition that, unless stated otherwise, the semantics of Red primitives is exactly the same as that of the equally-named Rebol primitive. I think we already know of several examples where the Red semantics is different (better?) than the Rebol one. I notice you edit a Wiki page on these differences. How complete do you feel this is, or will be in the near future?

greggirwin

[18:32](#msg578143343eaf66535e5d369d)We fill in pieces when they come up. Only Nenad and Qingtian could do it systematically. Brett Handley did a lot of work on differences between R2 and R3, and doc'd them on his site.

## Sunday 10th July, 2016

greggirwin

[03:35](#msg5781c2851ca34a944eda8708)I'll take a crack at converting the R/S spec.

[18:12](#msg5782900f064f828707040434)Here's where I am so far: https://github.com/greggirwin/red-docs/blob/master/red-system-specs.md

Need to see what to replace makedoc `/note` with and what to do about directives that start with `#` for TOC. Might be as simple as removing `#` in the TOC entry.

[19:35](#msg5782a3961ca34a944ee30589)Is the standard for MD docs to wrap them at col X or expect that the user will have a word-wrapping editor?

[23:10](#msg5782d5e259cfbd4c5e6efc4a)I'll pull the object ownership text from the blog and put that in a doc as well.

## Monday 11st July, 2016

dockimbel

[07:08](#msg578345f1c9b49c1d6fffbfc4)@greggirwin You should have a look at Asciidoc for a solution to `\note`, as we should move to it anyway in the future. I don't think there is a standard for wrapping or not by default.

[07:09](#msg578346411ca34a944ee94de4)For the ownership doc, it's incomplete doc on a incomplete work. The API will change in the future.

greggirwin

[12:41](#msg578393f7bdafd19107631dda)OK. So you don't want ownership doc'd for the time being?

rebolek

[12:42](#msg5783944dc28788ec73cad45f)Just a question, why ASCIIDOC is the preferred solution? Instead of i.e. MarkDown?

dockimbel

[12:44](#msg578394933eaf66535e74a13e)Right, it's a work in progress, so the doc will have to be largely changed.

[12:44](#msg578394c47aeb080527a7ff7e)If you want to doc something, Parse info from my blog article "Introducing Parse" would be much more helpful, as we need to incorporate also latest additions.

greggirwin

[12:49](#msg578395f0bdafd19107632c75)I plan to pull that too. More formatting to figure out in that, with your nice looking table section in the middle.

[12:50](#msg578396133eaf66535e74bb5a)I thought ownership would be good, because it's something other langs don't do AFAIK.

[13:14](#msg57839b9ec9b49c1d6f03578b)Updated https://github.com/greggirwin/red-docs/blob/master/red-system-specs.md. HTML is stripped, so NOTE: admonitions, per ASCIIDOC's approach, as just plain text.

[13:17](#msg57839c613eaf66535e751675)@PeterWAWood would you scan it and tell me what you think? The typecasting matrix is still HTML, but I don't know what we'll gain by converting it. We lose the nice colors of the original, but I suppose we'd have to make an image to get around that in gitbook.

dockimbel

[14:34](#msg5783ae637aeb080527a96653)@greggirwin Isn't HTML accepted by Asciidoc? We would need a way to keep the colors, though, yes, maybe using a (zoomable) image instead would be a good option.

[14:39](#msg5783af8fc9b49c1d6f0485cb)@greggirwin Went through it, looks good. Well done! Though, a way to emphasis the \*notes* would be welcome.

[14:40](#msg5783afe43eaf66535e76285d)While reading it, I stumbled upon the `[custom]` attribute for function, I had totally forgotten about its existence, I had to read the description to see what it was doing (very cool feature by the way). :-)

[14:42](#msg5783b05c7aeb080527a980fa)The JNI bridge for Java uses it a lot.

greggirwin

[16:54](#msg5783cf47064f82870712c3a4)I'll take a look. I had &lt;u&gt; around NOTE: and it didn't show up in github when rendered. We could emph them and add hrules above/below, though that's a hack we won't want forever.

[16:56](#msg5783cfa5064f82870712c4c2)At one time I thought about doing a Fortune Cookie app that would pick random features to show you about the language. I'm glad I'm not the only one who forgets all the cool things hidden in there.

dockimbel

[17:04](#msg5783d1a159cfbd4c5e7b0aca)Well, Red is already a \*big* world. ;-)

pekr

[17:05](#msg5783d1f3b79455146f955f79)Red gains some traction. Even FB group has 4 new joins in a week or two. I wonder, if it can hurt us, as we are still not at 0.7.0, but my overal feeling as, that the attitude is overal and mostly positive.

greggirwin

[17:10](#msg5783d30c1ca34a944ef0f8b2)People mostly seem to be patient about missing features.

[17:11](#msg5783d32d59cfbd4c5e7b22a3)And thanks for managing the FB group Petr.

pekr

[17:15](#msg5783d4247aeb080527ab8ec2)Well, there's a low interactivity in FB group, mostly a news Feed. But - maybe the thing is, that we've got a few nice tricks with 0.6.0, mostly a simple-io is a winner, because it allows us to do some real stuff already and GUI is usable too ...

PeterWAWood

[23:41](#msg57842ea17aeb080527b00a30)@greggirwin The Red/System Specification looks pretty good apart from losing the document section numbering. I think numbered sections are a big advantage in a reference document of this length.

[23:46](#msg57842fce064f828707179be8)It would seem that we will need to convert the Specification to ASCIIDoc to get numbered sections.

## Tuesday 12nd July, 2016

dockimbel

[00:30](#msg57843a3f064f8287071814ca)Ah, indeed, we need sections numbering.

greggirwin

[06:16](#msg57848b3cbdafd191076fbc08)I'll try to make time to read up on ASCIIDoc.

## Monday 1st August, 2016

gour

[14:02](#msg579f565e9684847b3742c3da)have you settled to use Asciidoc for docs?

dockimbel

[14:50](#msg579f61c0e2ff9ec76e4d12e9)@gour We have only two possible choices offered by Gitbook platform: Markdown and Asciidocs. As Markdown is not sufficient for technical docs (it's missing many features), only a single choice remains.

gour

[15:39](#msg579f6d2e0bd017c16e327fc3)i see...i was considering to use AsciiDoc (or RST) for my writings, but then settled on flat-CMS which only does Markdown Extra...

dockimbel

[15:53](#msg579f706ce2ff9ec76e4d41d8)@gour One thing that we miss in MD is numbered headers.

gour

[15:57](#msg579f7159836d2d02115ae3e6)@dockimbel somewhere i saw there is some rst support for gitbook

[15:59](#msg579f71e71c2bf6621bb2cb0c)@dockimbel Pandoc's md extension has `--number-sections` options

[16:06](#msg579f738b836d2d02115aea01)\[this](http://casual-effects.com/markdeep/) is also interesting - no lack of 'different' md versions :-)

dockimbel

[16:48](#msg579f7d5147659bfb1085b297)@gour We can only use the basic MD on Gitbook. MD's extensions are not standardized. Indeed, rST is supported too, not sure if it has any advantages over Asciidoc (which supports a subset of MD).

gour

[17:16](#msg579f83d51c2bf6621bb2fe1d)@dockimbel for me, i prefer using python over fiddling with Ruby gems...moreover, Sphinx/rst is nice combo

[17:24](#msg579f85d0c915a0e426b375f7)rST is also nicely extansible via role mechanism

dockimbel

[17:40](#msg579f89a247659bfb1085d367)If I have to script a doc framework, I prefer to do it in Red (or at least Rebol). ;-) If I have to use Python or Ruby, it's a no-go for me. I need a ready-to-use system.

gour

[17:43](#msg579f8a44c915a0e426b381da)i can understand :-) otoh, it's way too early for me to consider contributing to the Red project via docs :walking:

## Wednesday 3th August, 2016

ifgem

[08:19](#msg57a1a8fe1c2bf6621bb7bf59)@dockimbel what do you think about draem(format)? It seems to be nice and flexible way to write docs for Red.

dockimbel

[08:28](#msg57a1ab1100663f5b1b46bd39)@ifgem That format is very limited and addressing specific needs of his author. For a doc format truly designed for Rebol languages, see: http://www.rebol.net/docs/makedoc.html

gour

[09:18](#msg57a1b6fc836d2d02115fdb2f)MakeDoc is, I suppose, written in REBOL? what about porting it to Red?

geekyi

[09:24](#msg57a1b844836d2d02115fde3a)@gour I \*think* the reason is it's not universally used. There are advantages to using something that works right now, for the moment

dockimbel

[09:24](#msg57a1b84f00663f5b1b46d909)@gour Yes, written in Rebol, and designed by Rebol's creator. We could port it to Red, though, we have no resources for that in the forseable future, so it needs to be contributed.

gour

[09:28](#msg57a1b9529e85d3e82682bdc4)@geekyI i understand that, but, iirc, @dockimbel would like to have something that works everywhere without too much deps, so MakeDoc looks great...i recall that e.g. author of fpGUI toolkit for FreePascal uses old docview from the era os OS2 and it seems people are still using it :-)

dockimbel

[09:36](#msg57a1bb2be2ff9ec76e526e1c)@gour Makedoc is still not good enough for our needs, support for tables is limited, output formats are limited, no inter-document links support. It's ok for a single doc, but not good enough for a full manual composed of many docs. We can improve it in the future, though, to cover all those needs, but for now, I prefer writing docs rather than building a doc system.

gour

[09:39](#msg57a1bbc200663f5b1b46e125)sure...does Gitbook's Asciidoc supports old (Python) version or new Asciidoctor (Ruby based)?

## Friday 5th August, 2016

gour

[09:35](#msg57a45dfe47659bfb1090c4f3)it would be nice to have something like REBOL's Core Users Guide for Red

greggirwin

[10:09](#msg57a465eefb162b752ca02e39)I think we all agree on that. And I can't be the only one with outlines for docs.

geekyi

[10:14](#msg57a4671d978997001e98623a)How to do without duplication of content?

gour

[10:16](#msg57a46778978997001e98633f)Users Guide states "Copyright REBOL Technologies. ", any info what is its license?

geekyi

[10:16](#msg57a46788857442dc0f554c19)I guess where we should start is differences between the versions right? Hmm.. I think I should really get on with the rebol to red converter.. need to do more research tho

[10:17](#msg57a467d0483751d50f2b739b)I don't know yet if red is closer to rebol2 or rebol3, and ren-c looks like it might help in the conversion if so.. haven't tried it yet

gour

[10:18](#msg57a467e2978997001e9863ca)i believe that Red is going to be interested not only for ex-REBOL users, so it should have its own set of docs (tutorials, users guide, references etc.)

geekyi

[10:19](#msg57a4684a6bf4dff61d357d92)@gour I agree, I'm not an ex-REBOL user :smile:

[10:22](#msg57a468f5d097eb6b2cc744cb)Learning rebol was more helpful than I first expected tho. Initially, I was afraid of having to 'unlearn' things too.. or where to start.. but rebol2 is mature and stable, while the rest of the things are constantly changing. Need to account for that amongst others

greggirwin

[15:07](#msg57a4abb948422f8b4971c256)We just have to duplicate content. Rebol Tech won't let their stuff be used, when last requested. We can learn from them though, along with other language books and docs.

[15:08](#msg57a4abd548422f8b4971c2ae)Rebol does do a \*very* nice job of hiding the details, and looking like a normal language, when you start out.

gour

[15:08](#msg57a4abf948422f8b4971c346)@greggirwin thanks. it makes things clear...is Rebol still used commercially?

[15:09](#msg57a4ac226bf4dff61d362b21)otoh, it seems it would be nice to provide some rought outline for the Red docs?

[15:10](#msg57a4ac7efb162b752ca0e6ac)iirc, sometime ago I saw author of PyQt/PiGo books fiddling with Red...who knows, maybe we're going to see Programming in Red in the future ;)

greggirwin

[15:12](#msg57a4acca978997001e991338)We can certainly get ideas from it. I have a few different outlines, based on that and some books.

I use R2 commercially, but I don't think Rebol Tech is selling licenses any longer. I would bet good money that old apps written with it are still used. I know Respectech uses it to run their business.

gour

[15:15](#msg57a4ad8ad097eb6b2cc7faca)@greggirwin do you believe that Red can be made suitable for writing apps having requirements for numerical computing as well? (for some parts I'd use bindings (Red/System) for 3rd party C lib (Swiss Ephemeris) and then write custom modules/libs in Red..?

[15:18](#msg57a4ae51978997001e991755)@gour thinks it would be nice to have those wiki articles compiled into some sort of pre-book

greggirwin

[15:22](#msg57a4af2f6bf4dff61d363405)I'm certain Red will be great for scientific computing. Numerics are getting a lot of thought, which is tough when you have the full stack design to consider. Red is actually pretty close to WDF in many ways.

[15:23](#msg57a4af7f6bf4dff61d3634ea)Once a numeric user with low level coding skills has a need, they can write the deep part in Red/System (R/S) and the rest in Red, dialected so it works best for their domain.

gour

[15:26](#msg57a4b01dd097eb6b2cc801ba)@greggirwin that's good to hear...before Red i was strongly considering Racket as well some other statically-compiled languages...Racket was an option due to its 'integrated GUI' and that's what has pulled me to Red along with it AOT compilation

geekyi

[16:13](#msg57a4bb3e48422f8b4971ef32)&gt; Red is actually pretty close to WDF in many ways.

Wolfram Data Framework?

greggirwin

[16:29](#msg57a4bee5483751d50f2c5b30)Yes.

## Thursday 18th August, 2016

geekyi

[19:38](#msg57b60ec7cd00bdff6e5e6b51)Opinions? http://stackoverflow.com/tour/documentation

[19:40](#msg57b60f1f6981f5f269fbb9fb)tl;dr do to documentation, what stackoverflow did to Q&amp;A. Red may or may not benefit from user contributions

greggirwin

[19:54](#msg57b612585ffbca3e3cf2cfd0)Worth reviewing @geekyI. I'll take a look when I can.

## Monday 5th September, 2016

geekyi

[14:27](#msg57cd80c377c1b70d7fe936dc)@endo64 I think this is a better place to continue the conversation on docs

[14:29](#msg57cd81608965597230415f11)I'll check SO in an hour or so

endo64

[15:07](#msg57cd8a2af33967fc643002b8)Yes somehow I missed this room and message on the help room.

[15:09](#msg57cd8a92cdbf820f7f9c6578)My point is to prepare a place for people who are not familiar with Rebol or Red.

[15:12](#msg57cd8b761baa312a6bd72121)Not let Doc writes another document. Populating useful functions to show usefulness and simplicity of Red to non-rebolers.

## Wednesday 7th September, 2016

geekyi

[21:51](#msg57d08be668f483b41cadc6b3)I realise I forgot to update on this.. I tried to setup for red (perhaps @endo64 tried this too?) and it says  
&gt; This tag is too new, or too low activity, for Documentation to be created for it.

http://stackoverflow.com/documentation/red/commit

[21:54](#msg57d08c7989655972304b361b)also concerning \[getting data out](https://gitter.im/red/help?at=57cc59646efec7117ca78ed6) of it, I found http://data.stackexchange.com/help  
not as straightforward as exporting, something to fallback on just in case

## Saturday 10th September, 2016

dockimbel

[06:08](#msg57d3a365d274dbdf3505b916)We need many more SO questions with \[red] tag...

## Friday 16th September, 2016

fergus4

[14:35](#msg57dc033927a8458f7f1e3a0c)Is that the plan to use SO more? Should we start posting more questions there as opposed to here or altme? I've found SO extremely useful for finding answers when doing projects in javascript.

rebolek

[14:37](#msg57dc03abaabc89857fa9e563)Questions here or on AltME are usually answered very fast. However when anyone else is looking for such answer later, it is much harder to find the answer here (or on AltME) than on SO.

[14:38](#msg57dc03df18291e104878b502)So yes, ask your questions there. And then post the link here to get some attention ;)

[14:40](#msg57dc0449df21a7573001ce75)\*/me promises to check SO more often for Red-related questions.*

greggirwin

[22:28](#msg57dc71f833c63ba01a0b9e83)We'll try to cover things all around. Anything I post here is fair game to be re-posted elsewhere.

## Saturday 17th September, 2016

dockimbel

[04:30](#msg57dcc6f527a8458f7f20a2e8)@fergus4 Certainly, increasing Red presence on SO by posting questions with "Red" tag would be very helpful. SO questions should focus more on concepts if possible rather than features that would probably change on the road to 1.0.

## Sunday 18th September, 2016

geekyi

[17:44](#msg57ded27418291e1048804aa1)Having questions appear on the sidebar here on red/help would be useful there seems to be an issue for this https://github.com/gitterHQ/services/issues/60

[17:47](#msg57ded34333c63ba01a1190ab)I've not tried to create integrations for gitter, but it's probably not \*that* hard: https://developer.gitter.im/docs/welcome

[17:52](#msg57ded477c3e7045a305c9504)@geekyi is not sure where to begin so starts reading

## Monday 19th September, 2016

geekyi

[01:24](#msg57df3e5dc8af41d45f27c172)todo: \[integration docs](https://developer.gitter.im/docs/services), \[sample bot](https://github.com/oxinabox/GitterBots.jl/blob/master/src/stackoverflow2gitter.jl)

greggirwin

[01:53](#msg57df44ffaabc89857fb2ad22)I don't monitor SO, but it's worth experimenting.

ifgem

[11:13](#msg57dfc87333c63ba01a147972)

## Tuesday 27th September, 2016

fergus4

[16:13](#msg57ea9a98857ab70f7d46d4b6)Although Red is getting more usable with every release, red/system has a lot to offer now but I find it hard to get my head around it not having a c - lang background. I think a simple tutorial with some simple examples would be helpful. I know there are code examples available but they are not well commented. What do ya think?

rebolek

[16:25](#msg57ea9d71e045d19955068739)@fergus4 of course it’s a good idea, but...are you going to write it? ;)

greggirwin

[17:12](#msg57eaa87535e0f31c6c492bc1)I don't have inside design information, but I also imagine that Red/System will get some design updates when Red becomes self-hosted. Nenad and Qingtian have surely identified a lot of patterns they can leverage in the future, but don't want to break in the current system. Hence, detailed docs may have a short life-cycle.

rebolek

[17:13](#msg57eaa8b8e5887b81555d1b26)I guess it will be improved, but I do not think that it will change so much that current tutorials will be irrelevant.

greggirwin

[17:16](#msg57eaa978ca69aeb745b5c6c9)All depends on if the tutorials cover things that change. :^\\ But I agree that a lot will stay the same. It's a matter of someone who knows R/S making it a priority.

rebolek

[17:21](#msg57eaaa88c90661384a6e2255)I'm going through Red(/System) bugs right now and it is amazing how few R/S bugs were opened recently or are unfixed. Red/System is amazing, solid and stable piece of work. If there wasn’t so much exciting development in Red, I would love to work with R/S much more :)

greggirwin

[17:21](#msg57eaaa90857ab70f7d471a65)If there's someone coming from C, learning R/S, it would be \*fantastic* if they just kept a little notebook about their experience. For someone not familiar with C, we need primers for low level work.

[17:23](#msg57eaaaf6857ab70f7d471bd6)I was surprised what I was able to do in it, having been away from C for so long. The bigger thing, for me, is understanding the Red-&gt;R/S layer, the stack, coercing types, etc. so I feel comfortable.

rebolek

[17:38](#msg57eaaeadd02791686c3f8ec7)Yes, tutorials for that layer would be really useful.

fergus4

[20:16](#msg57ead38154302caa6f246b2e)...are you going to write it? :-) ...

[20:22](#msg57ead4f7ca69aeb745b6811b)@greggirwin Yes, that's kind of what I had in mind. Someone coming from c that is teaching themselves r/s writing notes and insight. Also, nothing wrong with commenting your code. Also, there are a few in redbol land that are known for tutorials, I just bringing up r/s as an area of possible focus.

rebolek

[20:25](#msg57ead5cae5887b81555d20f9)@fergus4 me? It’s the bifurcation point between two stable planes I know, R/S and Red :D

## Wednesday 28th September, 2016

PeterWAWood

[12:21](#msg57ebb5e0ca69aeb745b954f6)

## Tuesday 29th November, 2016

stvpwrs

[05:37](#msg583d1429381827c24d93a422)If people feel it would be helpful I'd be willing to compile some of the structures/outlines of docs for other contemporary homoiconic languages like Racket, Clojure, or even Wolfram/Mathmatica. It sounds like we want to explore what the overall structure of Red docs would look like.

geekyi

[15:00](#msg583d97f78d65e3830eb525e8)@stvpwrs Some brainstorming about docs? That would be cool :smile:

greggirwin

[19:59](#msg583dde1c16207f7b0ebf7960)We had some chat, somewhere, a long time back about some other docs that looked good. I'll see what I can dig up.

dander

[20:50](#msg583dea11444b37787670ac4a)One thing that would be useful to have would be a way to run tests on documentation examples. Both to make sure that samples are kept up-to-date, as well as another opportunity to find regressions.

## Wednesday 30th November, 2016

dockimbel

[05:12](#msg583e5fda1dec193f14095eb7)@dander Good point.

dander

[06:54](#msg583e77b473abd79c55b40f1f)To be fair, the idea is not mine. I heard about it listening to this \[podcast episode](https://www.dotnetrocks.com/?show=1366) discussing the Angular 2 docs.

stvpwrs

[06:59](#msg583e78e38255fe6b76e6c361)I believe Racket has something like this with Scribble. You can write what is essentially an annotated script that can then be published to HTML or PDF. It's written in Racket, but a Red version might be a nice long-term goal.

rebolek

[07:04](#msg583e7a0d8e29aeee601b2608)Running tests on examples is good thing. It would also be very nice, if the examples themselves were interactive, so you could experiment with them right in the documentation.

PeterWAWood

[07:07](#msg583e7abb8d65e3830eba290e)It may be simpler

[07:13](#msg583e7bff89d179bf4de19d13)To include the examples from source files and also to run them in a console and capture a screen shot of their output to include in the docs.

[07:15](#msg583e7ca7381827c24d9b776b)It should be possible to write a View script to run the console, paste the code (or paste do %example.red) and capture screenshots.

rebolek

[07:17](#msg583e7ced8e29aeee601b262a)It should also be possible to write a View script to display the documentation with editable and runnable examples.

stvpwrs

[07:23](#msg583e7e641dec193f1409f966)Racket's approach with Scribble allows for literate programming. Each section of documentation could be an actually runnable script. Not quite a swift playground though. The closer to a live playground the cooler. Kind of feels like the holy grail of language docs.

Tovim

[16:37](#msg583f003d16207f7b0ec5e969)@greggirwin I have rearranged the new-docs documentation according to your comments (Nov 28, red/red). I also have tried to transform the red-system-specs.md file to ~.adoc one. I did not manage to convert the table with colored cells. You can get it at my GH repository https://github.com/Tovim/red-system-LS. You can see it in asciidoctor rendering if you download the AsciidocFX Editor.

## Thursday 1st December, 2016

greggirwin

[01:06](#msg583f778573abd79c55ba2ac1)Thanks @Tovim. Will take a look when I get a chance.

rebolek

[10:55](#msg584001ac38afd97d3b8459d6)Some ideas about documentation:

[10:56](#msg584001f4c5bc35217da44c44)http://i.imgur.com/rAZuCXz.gif

ifgem

[11:37](#msg58400b7773abd79c55bd08df)@rebolek awesome:)

rebolek

[12:57](#msg58401e2138afd97d3b845e75)@ifgem Thanks, it’s far from awesome, but it might work, I think ;)

BlackATTR\_twitter

[14:37](#msg5840358c89d179bf4deb88fd)I like this. Doesn't have to be perfect to start out-- it's a step in the right direction, maybe a big one, we don't know yet.

[14:40](#msg584036568d65e3830ec45593)Given the early status of Red, with features/functionality changing, I also think it might be a good idea to think of ways to use automated testing for the examples. In other words, to embed in the documentation what the correct result or output would be from an example expression.

[14:40](#msg5840367573abd79c55be0c87)Ideally this would allow you to much more easily do a sweep of the documents to weed-out any incorrect examples due to changes in the interpreter. It's quite frustrating for new users to follow examples in documentation only to find that some of them don't work properly or give the expected results.

rebolek

[15:07](#msg58403cc738afd97d3b8466a9)@BlackATTR\_twitter something I found out today:

```
red>> f: func ["this is help string"] []
== func ["this is help string"][]
red>> f: func ["this is help string" "and this can be an example"] []
== func ["this is help string" "and this can be an example"][]
red>> f: func ["this is help string" "and this can be an example" "with expected result"] []
== func ["this is help string" "and this can be an example" "with exp...
red>> f: func ["this is help string" "and this can be an example" "with expected result" "cool, isn’t it?"] []
== func ["this is help string" "and this can be an example" "with exp...
```

BlackATTR\_twitter

[16:25](#msg58404eed444b3778767dbb6d)Is that intentional/expected behavior :)

greggirwin

[17:15](#msg58405aa4381827c24da670a3)I wouldn't use that approach unless the func spec dialect is documented to support it.

[17:16](#msg58405ae2444b3778767e0771)It would also only really work well for single, small examples I think. Otherwise your func spec will get very cluttered.

rebolek

[17:48](#msg5840625a8e29aeee601b726e)I know :)

[19:26](#msg5840794c38afd97d3b8478f5)@greggirwin But allowing other types, like `url!` for detailed doc in func spec is something that makes sense to me.

[19:27](#msg584079bfc5bc35217da46889)It couldn’t be a webpage, that is very dangerous attack vector, but MarkDown, AsciiDoc, or some VID doc could be useful. That is up to debate.

## Friday 2nd December, 2016

geekyi

[14:24](#msg5841840416207f7b0ed42825)&gt; It couldn’t be a webpage, that is very dangerous attack vector, but MarkDown, AsciiDoc, or some VID doc could be useful. That is up to debate.

@rebolek I think principle of least power works here too. Let conventions dictate the format

## Saturday 3th December, 2016

qtxie

[01:02](#msg5842198ebc32453c28825f6a)@rebolek Nice helpr! :-) That's remind me of the \[factor](http://factorcode.org/)'s console.

greggirwin

[18:58](#msg584315b8f666c5a138c65907)@rebolek, I see using the upcoming `ref!` type for doc references.

rebolek

[20:41](#msg58432df8f666c5a138c6d678)@qtxie Thanks!

[20:42](#msg58432e2ef666c5a138c6d78d)@greggirwin why not, I’m curious what we can achieve with documentation.

## Thursday 8th December, 2016

rebolek

[08:54](#msg58491fa89ce5147013ccd083)@dockimbel One suggestion from IRC: change the copyright string on the webpage from "Copyright 2011-2015 Nenad Rakocevic." to "Copyright 2011-2016 Nenad Rakocevic." Or maybe to "Copyright 2011-2017 Nenad Rakocevic." already ;)

RiVeND

[10:00](#msg58492f4428d755bf14dc902c)@rebolek @dockimbel Or even better, something like:

```
<div id="copydates"></div><script type="text/javascript">
var d = new Date; document.getElementById ("copydates").innerHTML = "Copyright 2011-" + d.getFullYear ();
</script>
```

## Thursday 29th December, 2016

dockimbel

[15:45](#msg58652f9bc895451b7533880a)Done, thanks!

## Friday 30th December, 2016

dockimbel

[15:16](#msg58667a48c02c1a3959cc0a8b) @Tovim Did you use a tool to do the MD to Asciidoc conversion? If so, why is the original formatting of most of the code examples lost? (like 8 spaces for a tab instead of 4)

[15:17](#msg58667a6f7a3f79ef5db9f8d6)I'm currently reviewing the Asciidoc version you made to see if we could switch to it now.

[15:30](#msg58667d9a7a3f79ef5dba09ad)The bold style is also lost from the first column in tables.
