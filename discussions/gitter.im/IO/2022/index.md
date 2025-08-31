# Archived messages from: [gitter.im/red/IO](/gitter.im/red/IO/) from year: 2022

## Friday 22nd April, 2022

rebolek

[08:30](#msg626267c3f43b6d783f60cf96)If anyone is interested to test HTTP client and server for the new IO branch, let me know. I’m currently rewriting my standalone client to a scheme.

ldci

[08:52](#msg62626cdbf43b6d783f60dde6)@rebolek Thanks a lot :)

pekr

[13:27](#msg6262ad5d99d94f5f0cb06337)Count me in, please 🙂

rebolek

[14:01](#msg6262b5499a09ab24f305d5d7)Of course :) You just need to build IO version of Red and then clone my \[Castr repo](https://gitlab.com/rebolek/castr/) and check out the `open-url` branch. I’ll merge it into the master branch soon to make it easier.

Testing the client:

\* you can use `%open-url.red` that provides two functions, async `open-url` and blocking `read-url`. This is the old version and the script would be removed soon.  
\* or, recommended, use `%http-scheme.red` that provides two schemes: `http` and `https`. I’m porting the `open-url` code to the scheme.  
\* however, `read-url` is the only function that handles the redirection. It’s understandable, as redirection is technically two or more connections done in series and I’m not sure right now if it can be properly implemented in an async matter. Probably yes but I need to think about it.  
\* it seems, that `read http://example.com` currently uses the `simple-io` version of http(s), so you need to use `port: open http://example.org wait port close port`.  
\* response data are either returned on `close` event or available in `port/extra/response`. On `close` only the content is returned, in `port/extra/response` you have everything including the headers.  
\* If you want to modify the request (use another method than `GET`, additional headers, or some data), you can use `insert port data`, but that’s WIP and it’s not fully supported yet. `open-url` gives you finer control currently.

If you have any questions, feel free to ask.

pekr

[14:45](#msg6262bf733ae95a1ec1fd5f9b)Hi Rebolek. Thanks for the pointer. I have question towards schemes. I can see repetitive task of assigning an `awake` function (handler?). Is tere planned to be some kind of template, in other words - working with pure TCP ports, will I have to provide a handler each time?

I do remember Carl stating, that introducing async networking is also about trade-offs. Because in the past, we mostly opened the port, added it to the wait-list, waited on that list for events, dispatched events, inserted into port, copy from the port, closed the port.

I can see more of manual work is going to be needed, so just curious, if we can have kind of template or schemes, whic could make it easier?

E.g. opening a http:// port, would already provide the awake function? Is that correct?

rebolek

[15:27](#msg6262c949c43500250050fd39)&gt; we mostly opened the port, added it to the wait-list, waited on that list for events, dispatched events, inserted into port, copy from the port, closed the port.

That’s what the `awake` function does. For HTTP there’s of course need for some preprocessing (creating a request) and postprocessing (parsing a response).  
You can also use `open`, `insert`, `close`, etc. But that would work for small data only, once you hit some limit, you need to deal with repeated reading in the awake function.

[15:28](#msg6262c9970466b352a47cbe47)Is there going to be some syntactic sugar on the top of it? I think yes, but that needs to be decided how it’s going to look. And I think we need more experience with async IO in Red to decide what the best model is for Red.

[15:29](#msg6262c9be99d94f5f0cb0a217)So, don’ be afraid of the `awake` function, it’s not hard to work with it.

## Saturday 23th April, 2022

pekr

[08:53](#msg6263be729bd1c71eca0522fb)@rebolek There seems to be recent commit "FEAT: use port! to read and write url!", which seems to use ports instead of simple-io. Will it simplify situation / allow new things towards the IO transition?

## Sunday 24th April, 2022

rebolek

[09:47](#msg62651cba8db2b95f0acf79d2)Before that commit, when using the new HTTP scheme, you were able to do `open`, `copy`, ... actions, but `read` used simple-IO directly. This commit enables using `read` with the new scheme.

[09:49](#msg62651d47161ffc40d71bbc08)So yes, it simplifies working with the new IO.

GiuseppeChillemi

[17:02](#msg626582a7f43b6d783f669003)Nice Group!

[17:03](#msg626582c53ae95a1ec102764f)@greggirwin Thank you for having created it  
@pekr Thank you for having requested it!

## Monday 25th April, 2022

planetsizecpu

[06:39](#msg6266423bd1b64840dbcfe8e7)Much encouragement @rebolek a lot of work towards you!

rebolek

[06:43](#msg6266432bd1b64840dbcfeb0f)@planetsizecpu thanks :) Actually, HTTP is mostly done. Two things are missing, cookie management and caching, but they’re not crucial and can be added later.

[06:52](#msg62664543ddcba117a2885be8)HTTP v1. On v2, I did some initial research. And I haven’ started with v3 at all yet.

[08:28](#msg62665ba6e9cb3c52ae7f4c8c)Question time: I’ve been re-reading some Carl's post, and in \[this one](http://www.rebol.net/r3blogs/0130.html) he writes:

&gt; So, the HTTP port is doing whatever "magic decoding" it needs to do in order to create the result we need.

&gt; Using this approach, we can say that maybe we can allow read of an HTTP port to return properly decoded text. In such a case, read is returning a string datatype not a binary datatype. That may be fine.

&gt; Of course, we want to determine how far to go with that model. For example, if I read an image using HTTP, do we get an image returned from read? I'd say no. In that case it may return a byte stream, because we may not want the image fully decoded at this point. For example, if it is JPEG, we might want to write it as a JPG file.

My HTTP scheme currently decodes even images. I understand his reasoning but there are few problems with his approach.

\* We can’t offload the decoing to `load` completely. HTTP scheme needs to decode at least textual data from binary. But if we have a good MIME decoder, then it can be used both in HTTP scheme and in `load`

\* To use the MIME decoder, we must provide it with a proper MIME type. That’s available in headers, but I guess we agree that `read http://example.org` should return just the content, not the headers. HTTP scheme provides headers in `port/extra/response/header`, so you \*can* get the proper type, it’s just a bit unconfortable. Another possibilty is to return converted data on `read` and bytestream on `read/binary`. Franky, I’m not sure what is the best way.

So, what are your thoughts?

hiiamboris

[11:21](#msg626684390466b352a48399cd)&gt; Another possibilty is to return converted data on read and bytestream on read/binary.

Sounds good

[11:22](#msg6266847d9bd1c71eca0a24fa)Is there an easy way to get both header and decoded data and/or binary source?

rebolek

[11:24](#msg626685089bd1c71eca0a25f1)It’s in `port/extra/response`. Raw data aren’t there, they’re converted on the fly and discarded. I could add them at the cost of higer memory usage.

[11:33](#msg626686f209092523188d7bfa)Using `read` and `read/binary` has another problem though. It’s usable only with (blocking) `read`. If you want to do it manually, with `open`, `copy`, `close`, there’s no way to pass the `/binary` refinement. One idea is to trigger the conversion with the `close` action, so until you `close` the port, you would have raw data, after `close`the converted data. But maybe it’s getting too confusing?

hiiamboris

[11:42](#msg6266893dc43500250057cf52)Too confusing.

[11:43](#msg6266895de9cb3c52ae7fa862)I don't see why `read` can't decode that by itself? Why do you need `close` to do that?

[11:44](#msg626689959bd1c71eca0a2e9d)If someone uses open close he can decode that manually.

rebolek

[11:51](#msg62668b5b3ae95a1ec1045b57)Sorry for the confusion, `read` can decode it and currently does. And it does it in the `close` event, because you need whole data before decoding (unlike headers, which are converted to Red on the fly).

[11:53](#msg62668ba0257a357825951b62)HTTP data are mostly gziped, once we cat compression ports, it would be possible to decompress on the fly, for now, everything needs to be downloaded first.

[11:53](#msg62668bd1f43b6d783f686d6a)So to answer your question, why do I need `close` to do that - because when I hit `close`, I know I have all the data.

hiiamboris

[11:57](#msg62668cb96b912423209ca502)I see what you mean. I thought of the `close` action first, not `close` event.

rebolek

[11:58](#msg62668cfc99d94f5f0cb779d1)I know, it’s confusing sometimes.

hiiamboris

[11:59](#msg62668d3ac61ef0178edb7a88)So if all that lies inside `read` call and is opaque to the user, why should we care how it works internally?

rebolek

[12:01](#msg62668d980466b352a483ad44)I was talking about the situation when user does it manually, without `read`.

hiiamboris

[12:15](#msg626690cfd1b64840dbd0879c)Still not getting it :( If it's done manually, what about /binary refinement you mentioned?

rebolek

[12:20](#msg626691f49a09ab24f30ce1f0)OK, let me try to explain it. You have two metods for reading from web: `read` and `open/copy/close`.

Currently, when data are read from web, they are converted on the `close` event. So `read` always returns converted data.

I'm thinking on adding a special mode, where `read/binary` would return the raw byte stream, while `read` would still do the conversion.

hiiamboris

[12:21](#msg6266925d9a09ab24f30ce2b0)Doesn't port created by `read/binary` have access to the /binary refinement?

[12:21](#msg62669264161ffc40d71e5ca4)Or what's the issue?

rebolek

[12:24](#msg62669305e9cb3c52ae7fbdf4)There’s no issue, I’m just thinking out loud, if this is the best way to deal with it.

[12:25](#msg6266932299d94f5f0cb785e3)&gt; Doesn't port created by `read/binary` have access to the /binary refinement?

I’m not sure, I’m going to find out. If not, it can certainly be added.

[12:35](#msg626695a18db2b95f0ad23960)btw, I have another question: Should `read` handle redirection? IMO yes.

hiiamboris

[12:58](#msg62669b0609092523188da2e0)Agreed.

pekr

[15:17](#msg6266bb96e9cb3c52ae8017a5)As for redirection, it was always an obstacle for Rebol users in the past, when the Rebol client was not able to do it. So +1 here.

[15:18](#msg6266bbd1c61ef0178edbde10)There was some change between the Rebol2 vs Rebol3 IIRC, namely upon what went via port. Wasn't the difference about being a string! in R2, whereas a bytestream in R3?

[15:24](#msg6266bd219a09ab24f30d3eb8)`read/binary` should imo always return a binary. As for complex protocols as http, not sure. If you give me a .jpg, I simply expect a .jpg, as I can save it to the disk, call externall app to resize it, and I can load it, if I need an image type, no? Also VID accepts image file as a parameter directly `view [image %draw-windows.png]`

rebolek

[15:26](#msg6266bdad9a09ab24f30d402c)&gt; read/binary should imo always return a binary.

Of course, no disagreement here. The question is, if `read` should return binary! also, or if it should convert to a proper type. You prefer binary, but what about HTML? Should it return binary too, or convert it to text? And JSON? Shoult it return binary, raw JSON, or convert it to map!?

pekr

[15:30](#msg6266be91f43b6d783f68db13)the question is, if you are reading a tcp:// port, or a http:// port? In case of the http://, then answer is probably clear, right? So what you ask is about reading a tcp:// port?

[15:30](#msg6266bea19a09ab24f30d41c2)Those questions can get complex pretty quickly, as I can see :-)

rebolek

[15:35](#msg6266bfd9e9cb3c52ae8020d4)no, it’s about http:// port. TCP returns binary and that’s fine.

[15:37](#msg6266c028e9cb3c52ae80218b)If you open HTTP port, it internally opens TCP port and reads from it. The question is how much processing HTTP should do.

gurzgri

[15:42](#msg6266c16f6b912423209d0fc7)Well, you can't `read %photo.jpg` from local file, but can only `load` it as `image!` or `read/binary` it. Wouldn't it therefore be the least suprising option to `load http://ima.ge/photo.jpg` as `image!`, to `read/binary` it as `binary!` and to fail for unrefined `read` in the same way as a local read would?

pekr

[15:47](#msg6266c2a78db2b95f0ad29b4c)Good arguments ....

gurzgri

[15:48](#msg6266c2bb257a357825958e66)No, drop that. `load` can't read from `port!`anyways.

hiiamboris

[16:21](#msg6266ca790466b352a48427bb)Why not

[16:21](#msg6266caa5161ffc40d71ed3d7)`load` -&gt; `read/binary` -&gt; `port` stuff

[16:22](#msg6266cac9f43b6d783f68f7b4)But it will require headers as well.

rebolek

[16:37](#msg6266ce4209092523188e0e60)Yes.

GiuseppeChillemi

[18:06](#msg6266e3239bd1c71eca0af534)Why don't you add `/mode` refinement to `read` so you can choose between various working modes. So in one you the .jpg is loaded and in another you leave it.

greggirwin

[19:11](#msg6266f24b99d94f5f0cb86c2a)@qtxie is the plan to support `open/binary` as in R2?

I agree that `read` should handle redirection.

There is a clear distinction between `read` and `load`. `Read` is for text and raw binary data. `Load` is for values. `Read/as` controls only the text encoding. `Load/as` controls codec application. For files and URLs, via extension and MIME type respectively, the codec can be determined. But if you're loading a string or binary data, `/as` is your responsibility. In the future, I imagine we'll see a `load` wrapper or module that can sniff for formats, but that will be an optional piece, as it's a special case.

## Tuesday 26th April, 2022

rebolek

[07:05](#msg626799c341f4560c6f701924)&gt; `Read/as` controls only the text encoding.

I have few points here. If you look at the source, `/as` is currently ignored. There’s no support for other codepages than UTF-8 (but that can be fixed easily, as I have support for ten most used encodings and others can be added easily). For HTTP, `/as` isn’t required, as the encoding is given in the headers. But it makes sense for overriding header encoding if it’s wrong. That happens sometimes.

[07:08](#msg62679a849db19366b2fd4bb1)Good point on `open/binary`. That probably would be required to support `read/binary` in custom schemes (like HTTP). But I’m not against a different mechanism of arg passing. Currently, you can’t redifine `read` action for your scheme, so until that’s fixed, this is just a theoretical talk. But @qtxie is aware of it and we’ll have a solution soon I hope.

[07:20](#msg62679d3841f4560c6f702009)The more I think about it, the more I think that Carl’s proposal is the way to go, but there are still some unresolved points.

\* `read/binary` would return raw binary data. I guess we all agree on that. Does that include status line and headers?  
\* `read` would return text (I guess we agree that only the content), but what about other types? If we exclude headers, we lose MIME type info. Other option is to return `block!`/`map!`/`object!`/`whatever!` with all info but that would complicate some things, like for example instead of writing `print read http://www.example.org` you would need to write something like `print select read http://www.example.org 'data` (oh, the horror!). This is the method I prefer, but I’m open to suggestions. We need to pass the metadata somehow.

hiiamboris

[07:47](#msg6267a39514df4e44f2f81a78)read/info?

rebolek

[08:18](#msg6267aac789dcc96e9cd30fe4)`/info =>`  
Well, that’s not a bad idea.

GiuseppeChillemi

[17:28](#msg62682bd6949ae940067b4b39)The synonym for `read/binary` could also be `read/raw`. I like it a little more for unprocessed data (if it has no over structures).

pekr

[17:31](#msg62682c81eaf3267f853206a4)I think the binary is fine though :-)

GiuseppeChillemi

[17:36](#msg62682d9b10cfc315bc4f8244)Second note, why don't you add an `/options` refinement to `read` so you can specify options like:

```
opt: [
   headers: true
   images: 'undecoded
   ....
]

read/options http://www.slashdot.org  opt
```

## Thursday 28th April, 2022

endo64

[22:11](#msg626b1128bb0de60c721551ab)In opinion,  
Simple `read http://example.com` should return the content by handling basic MIME types:

All `text/*` converts to `string!` (including `text/csv`)  
`application/json` to `map!`  
`image/[bmp,png,jpg,gif]` to `image!` (supported image codecs)  
Non determined MIME types (or if Content-Type header is not present) then it returns `binary!`

So for the user it is easy to check the return value is `string!` or not and decide what to do.

`read/binary` should always return `binary!` regardless of the MIME type.

For headers and other metadata, `read/info` can be used (should it make OPTIONS request?), it can return a block with headers and other metadata (should it also return the content as well?)

greggirwin

[23:11](#msg626b1f1acd35b566afbeea60)@GiuseppeChillemi `/options` is a big and general discussion. We've already gone over it quite a bit in the context of codecs.

## Friday 29th April, 2022

GiuseppeChillemi

[05:38](#msg626b79f3cd938f6ea2219ccc)@greggirwin Has it been an internal discussion or is it publicly available? I ask because I have had this discussion too with myself about its use on other functions and I have not ended to a definitive conclusion. Sometimes mapping options to refinement is good, sometimes it is better to have them in a block as keywords, sometimes as dialect, and some other times as single object. No definitive answer here.

hiiamboris

[07:29](#msg626b93ec9db19366b204f652)I think it was in codecs room.

## Monday 11st July, 2022

GiuseppeChillemi

[19:48](#msg62cc7e829a314a3ec46bb78b)In Rebol I have a problem. Sending data synchronously, sometime I receive it truncated, even with big data buffers. Does someone know the reason.

[19:48](#msg62cc7e84b408e830dccfd6ec)?

greggirwin

[20:27](#msg62cc87c2d3c8894f71475267)Example code would help.

rebolek

[21:04](#msg62cc9047ef5ee448826c2c1b)@GiuseppeChillemi How are you sending the data? What buffers do you mean? As @greggirwin said, please, provide some code.

GiuseppeChillemi

[21:18](#msg62cc93a69f29d42bed3b9dcc)Ok, later I will post it

[23:38](#msg62ccb4851227f62be35e3d2d)I have 3 scripts:

An experimental server which waits for commands and executes them. Possible commands are those of the `commands` object  
https://gist.github.com/GiuseppeChillemi/214482b96832c44a77ea3cf848362554

The `send-to` command which sends a command to an address:

https://gist.github.com/GiuseppeChillemi/bdeb3378eb8d4975036de634751e1f8c

A mini console you can use to send commands:

https://gist.github.com/GiuseppeChillemi/4416e9eb436dae38f8b0368fd12a0cd2

Everithing will print debug information with data length

Use `TEST` in the mini console to receive a big chunk of data ending with a constrol string having `!` at the end. If it wont happen and length differst between each run, you have encountered the problem.

[23:41](#msg62ccb52bef5ee448826d232a)It is a test made 2 years ago that I have abandoned for big data. Maybe I was not so skilled to understand what was happening. You have to test it in a local and remote machine to replicate a similar enviroment of my tests.  
If you spot any coding errors that could cause the truncation problem, please tell me,

## Tuesday 12nd July, 2022

GiuseppeChillemi

[00:22](#msg62ccbeb9904f20479ac5231b)Here is the truncation happening:

```
Type of result:  string!
Length of result:  413696

Server has answered >

{SCALAMATION!LAST:7246:00000000006082!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000006083!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LA
ST:7246:00000000006084!THIS-SHOULD-START/END-WITH-}

If loadable content:

SCALAMATION!LAST:7246:00000000006082!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000006083!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LAS
T:7246:00000000006084!THIS-SHOULD-START/END-WITH-

Insert a server command > test

Type of result:  string!
Length of result:  492728
...
Insert a server command > test

Type of result:  string!
Length of result:  24576

Server has answered >

{OULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000000360!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000000361!THIS-SHOULD-START/END
-WITH-AN-ESCALAMATION!LAST:7246:00000000000362!THI}

If loadable content:

OULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000000360!THIS-SHOULD-START/END-WITH-AN-ESCALAMATION!LAST:7246:00000000000361!THIS-SHOULD-START/END-
WITH-AN-ESCALAMATION!LAST:7246:00000000000362!THI

Insert a server command > test
```

Note the different lengths and problem with the control string

[00:24](#msg62ccbf4e568c2c30d38cabb3)(The truncation is at the end, you are seen only the last 200 characters)

[00:28](#msg62ccc03f3bbb3848893bafda)Expecially this:

```
Type of result:  string!
Length of result:  32768
```

As it is a power of 2, it seems to me a multiple of a buffer

[00:39](#msg62ccc2ca22c53438bc629417)note: you can run server and client on the same machine!

rebolek

[07:11](#msg62cd1ea59f73251a2c18fdf4)@GiuseppeChillemi thanks for the links, I take a look at it.

[07:57](#msg62cd29849f73251a2c1950c8)Oh, it's done in Rebol, not in Red. Is it R2 or R3? With IO branch, you can write such server in Red (or use my `rbdt://` scheme that's written exactly for this).

GiuseppeChillemi

[07:59](#msg62cd29f722c53438bc656f64)Thank you Boleslav, I am waiting for I/O merging to have I/O and ODBC together. Then I will move this micro server too on Red.

[08:00](#msg62cd2a069a314a3ec4708dc9)The client which uses it is written in Rebol

rebolek

[08:00](#msg62cd2a3922c53438bc65710f)Which version? I remember there were some buffer problems in R3 (probably fixed in Oldes' version).

GiuseppeChillemi

[08:01](#msg62cd2a47ef5ee4488270357d)R2

rebolek

[08:02](#msg62cd2a9a9a314a3ec47090ef)I see. I haven't touched R2 networking in years, so hard to say. You probably need to send in chunks.

GiuseppeChillemi

[08:03](#msg62cd2adb3bbb3848893eb807)I suspect that data could be split and received in 2 different chunks by Rebol, but still don't know in which situation this happens and how to check for it.

rebolek

[08:04](#msg62cd2b248fe56a38b55cb576)If you have a problem at 32k, just split the data in 32k parts (or maybe a bit less, to be sure) and send them one by one and join them together on the server.

GiuseppeChillemi

[08:05](#msg62cd2b4f22c53438bc6576cd)It seems safe at 8K, I have not seen data lower than this size.

greggirwin

[17:49](#msg62cdb42976cd751a2f05360b)That 8K number sounds suspiciously familiar.

GiuseppeChillemi

[17:59](#msg62cdb6769f29d42bed43c367)This bug is really strange. I could stay 10 minutes not having it and than it suddenly triggers near every time I receive the block It is shorter than it should be.

pekr

[18:01](#msg62cdb6f4ab6b634f730d316e)@GiuseppeChillemi Whyt to use R2 and not switch to Red already? Rebolek regards IO being mostly stable enough? R2 is known for some deep bugs here or there, which were never tracked and it is going to stay that way ....

GiuseppeChillemi

[18:01](#msg62cdb6f7ef5ee448827440ed)But I have a doubt I am still not able to answer: is there any case Rebol could split a transmission in two parts? So I get part of the block and then another? Hope the bug will happen again soon, so I can answer it.

[18:04](#msg62cdb7aa568c2c30d393c217)@pekr I have an application which will remain on Rebol for some time.  
@rebolek If I could easily open Red server and use it to receive commands from the application, I could move the server to Red. Have you some instructions for me?  
@gurzgri Also, I have not understood if RED-ODBC includes I/O

[23:51](#msg62ce08f6568c2c30d3960b95)However, the words used to interact with Rebol2 ports are terrible. They really confuse your brain.

## Wednesday 13th July, 2022

rebolek

[08:36](#msg62ce8405fe909e3ec79c7ef8)@GiuseppeChillemi You need to compile console from the IO branch, I expect you know how to do it.

\* Then clone my \[CASTR repo](https://gitlab.com/rebolek/castr/). Everything you need is in the `%rbdt` directory.

\* Open the Red IO console twice in the `%rbdt` directory.

\* In first console run the server: `do %rs-server.red`

\* In second console, run the client and try to send a command:

```
>> do %rs-client.red
>> write rbdt://localhost [ping]
( ...some debug omitted... )
== [pong]
```

If you really see `[pong]` as an output, congratulation, your server is running!

The protocol uses (compressed) Redbin for communication, so you're able to not send just commands, but all Red data structures such as blocks, objects, etc with their binding.

The server uses `parse` to process input from client so to use your own commands, you need to write your own rules and load them (see lines 225 and 227 in `%rs-server.red`: `load-rules rules %rules-giuseppe.red`).

The are two rulesets included: `%rules-users.red` which provides user and session handling (singup, login, sessions, tokens, expiration, ...) and `%rules-polls.red` which is simple polling application, an example how to use the server.

Rules itself are simple dialect. It's a standard Red file, so it starts with a header followed by some directives and pairs of rule names and rules.

Here's how the `ping` command would look as separate ruleset (`ping` is builtin command):

```
Red[]

name ping ; REQUIRED: name of the ruleset
extern reply ; REQUIRED: `reply` is where the server's reply is stored (this should be simplified later, but now you need to add it)

ping: [ ; rule name - currently not used, but it's intended for auto-documentation purposes
    'ping    ; the actual command expected from the client
    (reply: 'pong)    ; reply that the client will recive from the server when the rule is matched
]
```

That's it. Feel free to ask me further questions. It's a work in progress so some things may change (as the `extern` directive described above) though not the protocol format itself. And if it does, it's versioned, so future server versions would understand older clients.

[08:37](#msg62ce845fab6b634f7312ca8b)When sending the command, keep in mind https://github.com/red/red/issues/4996 - `parse` is case sensitive in `block!` mode, so the command must be `[ping]`, not `[PING]`.

[08:45](#msg62ce8631904f20479ad1b61b)Other directives in the rulesets are:  
\* `import file!` - works as `#import` in Red, but imported file is bound to ruleset only, not available globally  
\* `import word! from ruleset` - because imported files are kept in separate contexts and you may need a function from a different context, there's `import`. An example is `import match-token from users` in the `%rules-polls.red` ruleset, which imports the function `match-token` that checks if user is logged in based on provided token.

pekr

[08:49](#msg62ce8734ef5ee448827a1853)@rebolek what does `rbdt`stand for? Is that any existing standard? Or just a new acronym? And if so, could we have some more friendly name here? :-)

rebolek

[08:51](#msg62ce879d0a52264798178a63)rbdt is RedBin Data Transfer, the first thing I come up with. I'm open to suggestions.

[08:54](#msg62ce882976cd751a2f0b2683)The format is very simple:

4 bytes magic header `RBDT`  
1 byte version, `#{01}` currently  
2 bytes flags, flags are described in `%rs-client.red` file.  
4 bytes length of the payload  
payload

endo64

[08:55](#msg62ce888c0a5226479817936b)I thought `rbdt` is `ReBolek's datatype` 😊

[08:56](#msg62ce88daef5ee448827a239f)`rbin://` or `redbin://` could be easier to remember.

rebolek

[08:57](#msg62ce88e20a52264798179532):-D

[08:57](#msg62ce89118fe56a38b56699fc)it can transfer text and binary also

endo64

[08:58](#msg62ce8936568c2c30d3997590)Hmm, needs a more generic name then.

[09:00](#msg62ce899a1227f62be36b653f)What about `red://` then? Could be a little confusing but..

pekr

[09:10](#msg62ce8bfd9a314a3ec47a503f)What ALWAYS engages Redbol discussions, is the name contest :-) Back in the Rebol days, there were two - 1) name the new GUI 2) name the network services. For the latter, LNS (lightweight networking services) won (but never took off imo) - http://rebol.com/docs/services/ . And just for the record - what do you think of Carl's R/Services concept? I do remember maybe @greggirwin testing it (maybe Henrik or Robert), claiming it had its own problems, but would be nice, if Red would have its own app server.

On the other hand, and @dockimbel might correct me - one of the initial reasons for the Red was to create a Cheyenne NG. Cheyenne is an app/web server, based upon Uniserve (name which I always liked) - https://www.softinnov.org/rebol/uniserve.shtml - a multiprotocol architecture ...

[09:11](#msg62ce8c2b76cd751a2f0b4520)Yeah, and Maarten's Rugby remote procedure call system. Those were the days :-)

rebolek

[09:33](#msg62ce91669f29d42bed49f661)The main differences from Rebol/Services is that RBDT is just a communication protocol. It doesn't deal with encryption (and relies on TLS instead), authentication and other stuff, however, that can be build on the top of it, for example the `rs-server` has support for authentication.

endo64

[09:36](#msg62ce92163bbb384889489d20)&gt; if Red would have its own app server.

Cheyenne with Red could be that app server with a built in support for RBDT.

rebolek

[09:37](#msg62ce925c1227f62be36ba866)Also, with it's redbin support, it's much more tightly integrated with Red. You can use text (molded data) as well and it makes sense in a lot of cases, the overhead of redbin makes no sense with commands like `ping`, which should be transferred as plain text instead. But that needs some logic to determine which format to use.

[09:38](#msg62ce927c1227f62be36ba90e)Also, I'm thinking about making version 49 of rbdt protocol that would be plain-text instead of binary.

GiuseppeChillemi

[14:40](#msg62ced955ef5ee448827c8458)I didn't know Parse is case sensitive in block mode. I remember Rebol isn't.

rebolek

[16:18](#msg62cef0481227f62be36e415b)I believe it shouldn't and it's a bug. See #4996 for details.

## Sunday 24th July, 2022

GiuseppeChillemi

[22:43](#msg62ddcb20ab6b634f737f87a9)About this discussion on ports \*naming* and usage:

:point\_up: \[20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And Petr request: \[here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

\[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:  
\[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)  
\[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)  
\[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)  
\[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)  
\[Old Rebol3 Wiki](https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table\_Of\_Contents)

## Monday 25th July, 2022

rebolek

[05:26](#msg62de2982ab6b634f73821d3d)Thanks!

Oldes

[07:33](#msg62de47508fe56a38b5d72672)The document is not by RGChris.. it was imported from the old DocBase. Chris just edited it transparently after.

meijeru

[12:34](#msg62de8ddc9a314a3ec4ecb2fe)(Posted also in red/red) I tried to download the latest IO build, but got instead a build of the master branch.

## Saturday 6th August, 2022

GiuseppeChillemi

[13:20](#msg62ee6ab06837563d1cd8b008)I have tried to read an italian web page via `READ` and I receive an `Invalid UTF-8 encoding` because of accented characters. I see `/as econding` refinement but I receive a `reserved for future use (or not yet implemented)` when used ith `latin1` or `latin-1`. What should I use?

pekr

[14:14](#msg62ee774f72ad51741fe35015)We can't read some sites because of strict Red settings imo. The only chance in such a case is, imo, to read in a binary form and custom decode ...

GiuseppeChillemi

[14:26](#msg62ee7a22458f823ce087bc3d)  
area does not display the full text&gt;

[16:05](#msg62ee9137443b7927a71a260a)@dockimbel @qtxie @rebolek  
I still have the following issue https://github.com/red/red/issues/4791 with the latest binary.  
I have it on 2 machines: a Windows 10 one and another Windows Server 2012, so it is not OS/Machine related.  
They both have in common the \*italian language localization* and nothing more, as they have 2 different usage scenarios and installed software.  
Please, could you reopen the ticket? If needed, I am available to give you access to a machine where the problem happens.

## Friday 25th November, 2022

ne1uno

[14:55](#msg6380d75f0513b562e8c81e51)continuing from https://gitter.im/red/red/welcome?at=638044e9b1a7596436891ba0

[14:55](#msg6380d76025ca105c88d15330)is there a more recent red-win-IO executable than July22? I've never used red or rebol to post

## Sunday 27th November, 2022

meijeru

[11:48](#msg63834ea4655bc46025e6e81e)I notice that the IO branch is kept up-to-date with the master more or less regularly. Does that mean it will be released soon?

dockimbel

[14:20](#msg63837223a34b5112114d3b8c)No, it just means that we keep it updated with master commits regularly in order to check that the changes there are compatible and don't diverge too much from master. Conflicting merges can be very painful to solve and cause regressions. Merging as often as possible prevents that.

pekr

[14:20](#msg6383722cf9491f62c9d1dd40)@meijeru last I remember some chat about IO branch, was me asking @dockimbel, if he would mind renaming async IO event names. I objected mainly about `wrote`and asked for the possible change to `write`, as using a past tense with events is not consistent anyway. If I remember his reaction properly, it was something along the lines of possible IO architecture revision.

[14:20](#msg6383723f15a3885c700d8280)Ah, sorry, Doc was faster with probably more proper explanation.

meijeru

[14:52](#msg638379bf426f9311ffc3e9f7)OK, so no timeframe...

## Monday 28th November, 2022

rebolek

[08:16](#msg63846e50473cf9664806cb1f)@ne1uno while there's lack of IO updates, I must say that it's pretty powerful in current form. AFAIK there are no showstopper bugs and you can do a LOT with it.

## Tuesday 29th November, 2022

Oldes

[16:54](#msg63863949f9491f62c9d722e3)Will be Red ports full duplex? I was playing with Websockets in Rebol3 and it looks that there are serious issues as Rebol's implementation is only half-duplex:/ (Incoming message may corrupt outgoing one)

dockimbel

[19:59](#msg6386649ba34b51121152d4a4)AFAICT, it's full-duplex, in/out buffers are different. @qtxie can confirm.

## Wednesday 30th November, 2022

qtxie

[08:17](#msg638711b6326f06602c704371)Yes. It's full-duplex.
