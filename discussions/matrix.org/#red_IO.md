# Archived messages from: https://app.gitter.im/#/room/#red_IO:gitter.im (https://app.gitter.im/#/room/!OBcSUFlZVwaoKCLPMd:gitter.im)

## 22-Apr-2022

[8:31:13](#PRMiBDIVQZZK_r7dgT2tu6rp2zvNVAPVFGYJN-yEyV0) <rebolek (Boleslav Březovský)>:
If anyone is interested to test HTTP client and server for the new IO branch, let me know. I’m currently rewriting my standalone client to a scheme.

[8:52:43](#uX80FqEUyDJCpxPqceqMRlSd2hBBDyVD-6gXhTvRsoc) <ldci (François Jouen)>:
@rebolek Thanks a lot :)

[13:27:58](#NNhDyQXNniBRiUU00TKQ30PJ9jaJzRmLBJrNioLO7X8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Count me in, please ������

[14:01:46](#L2X2ZRdh123b6yWiTjUMPHR6FlRBVXY-RWr33sOPIMU) <rebolek (Boleslav Březovský)>:
Of course :) You just need to build IO version of Red and then clone my [Castr repo](https://gitlab.com/rebolek/castr/) and check out the `open-url` branch. I’ll merge it into the master branch soon to make it easier.

Testing the client:

* you can use `%open-url.red` that provides two functions, async `open-url` and blocking `read-url`. This is the old version and the script would be removed soon.
* or, recommended, use `%http-scheme.red` that provides two schemes: `http` and `https`. I’m porting the `open-url` code to the scheme.
* however, `read-url` is the only function that handles the redirection. It’s understandable, as redirection is technically two or more connections done in series and I’m not sure right now if it can be properly implemented in an async matter. Probably yes but I need to think about it.
* it seems, that `read http://example.com` currently uses the `simple-io` version of http(s), so you need to use `port: open http://example.org wait port close port`.
* response data are either returned on `close` event or available in `port/extra/response`. On `close` only the content is returned, in `port/extra/response` you have everything including the headers.
* If you want to modify the request (use another method than `GET`, additional headers, or some data), you can use `insert port data`, but that’s WIP and it’s not fully supported yet. `open-url` gives you finer control currently.

If you have any questions, feel free to ask.

[14:45:08](#Umgw9xNyKQR2a-NoLGyRWwz295zw3SppCoC-5oujW6w) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Hi Rebolek. Thanks for the pointer. I have question towards schemes. I can see repetitive task of assigning an `awake` function (handler?). Is tere planned to be some kind of template, in other words - working with pure TCP ports, will I have to provide a handler each time?

I do remember Carl stating, that introducing async networking is also about trade-offs. Because in the past, we mostly opened the port, added it to the wait-list, waited on that list for events, dispatched events, inserted into port, copy from the port, closed the port. 

I can see more of manual work is going to be needed, so just curious, if we can have kind of template or schemes, whic could make it easier? 

E.g. opening a http:// port, would already provide the awake function? Is that correct?

[15:27:06](#eNwprfTXohC3_mH_vjxVLYFL01J7W9p4JdjDQOHSbB4) <rebolek (Boleslav Březovský)>:
> we mostly opened the port, added it to the wait-list, waited on that list for events, dispatched events, inserted into port, copy from the port, closed the port. 

That’s what the `awake` function does. For HTTP there’s of course need for some preprocessing (creating a request) and postprocessing (parsing a response).
You can also use `open`, `insert`, `close`, etc. But that would work for small data only, once you hit some limit, you need to deal with repeated reading in the awake function.

[15:28:24](#OOyfiAuH2A4pD8LDRAM2RyG8geTaLruFg1NnHHwLipg) <rebolek (Boleslav Březovský)>:
Is there going to be some syntactic sugar on the top of it? I think yes, but that needs to be decided how it’s going to look. And I think we need more experience with async IO in Red to decide what the best model is for Red.

[15:29:02](#2UqIZqpg0MVcAU8uBIO4vZ-INbnME5BHX-nPCN7BckQ) <rebolek (Boleslav Březovský)>:
So, don’ be afraid of the `awake` function, it’s not hard to work with it.

## 23-Apr-2022

[8:53:07](#V2OaY0MQzNevvTDz2N8jaf3iiJeIAKWt8XUN9SMkBBk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@rebolek There seems to be recent commit "FEAT: use port! to read and write url!", which seems to use ports instead of simple-io. Will it simplify situation / allow new things towards the IO transition?

## 24-Apr-2022

[9:47:39](#qUlUGQkNUzTiQvgnQTjNKOeuQhjk26cv4ZHjEexUBes) <rebolek (Boleslav Březovský)>:
Before that commit, when using the new HTTP scheme, you were able to do `open`, `copy`, ... actions, but `read` used simple-IO directly. This commit enables using `read` with the new scheme.

[9:50:00](#NkXZWL8bp4CZbwIzzCwy8f-0zOu__ybjmuMFH-xFmsU) <rebolek (Boleslav Březovský)>:
So yes, it simplifies working with the new IO.

[17:02:31](#HKg7Xa6nQFFF0YlEA_xJIN3XL0CdnqtfDJ5mJvVXlPs) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice Group!

[17:03:01](#27-Zi_kP8C17LW4Pu6r4CS_9HtG81pUT5L4f1f2xbyQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Thank you for having created it
@pekr Thank you for having requested it!

## 25-Apr-2022

[6:39:55](#0S839pHqgZtuDybMoEX9ILCWxE-al6_m1jLx5tRn1Wk) <planetsizecpu (Jose Luis)>:
Much encouragement  @rebolek   a lot of work towards you!

[6:43:55](#tR9cI7h-8wbSb2hY_40jE3dgCksjbaTJfWrRkTChFh8) <rebolek (Boleslav Březovský)>:
@planetsizecpu thanks :) Actually, HTTP is mostly done. Two things are missing, cookie management and caching, but they’re not crucial and can be added later.

[6:52:51](#ykyVAL-gduit-M0uGVxetwxIx9LiUpF-ZvSFgAH40xM) <rebolek (Boleslav Březovský)>:
HTTP v1. On v2, I did some initial research. And I haven’ started with v3 at all yet.

[8:28:23](#yxNyCGS6IhhWy5ea7MHKCuSrnt_7oR0EgaUFn3ZAt9Y) <rebolek (Boleslav Březovský)>:
Question time: I’ve been re-reading some Carl's post, and in [this one](http://www.rebol.net/r3blogs/0130.html) he writes:

> So, the HTTP port is doing whatever "magic decoding" it needs to do in order to create the result we need.

> Using this approach, we can say that maybe we can allow read of an HTTP port to return properly decoded text. In such a case, read is returning a string datatype not a binary datatype. That may be fine.

> Of course, we want to determine how far to go with that model. For example, if I read an image using HTTP, do we get an image returned from read? I'd say no. In that case it may return a byte stream, because we may not want the image fully decoded at this point. For example, if it is JPEG, we might want to write it as a JPG file.

My HTTP scheme currently decodes even images. I understand his reasoning but there are few problems with his approach.

* We can’t offload the decoing to `load` completely. HTTP scheme needs to decode at least textual data from binary. But if we have a good MIME decoder, then it can be used both in HTTP scheme and in `load`

* To use the MIME decoder, we must provide it with a proper MIME type. That’s available in headers, but I guess we agree that `read http://example.org` should return just the content, not the headers. HTTP scheme provides headers in `port/extra/response/header`, so you *can* get the proper type, it’s just a bit unconfortable. Another possibilty is to return converted data on `read` and bytestream on `read/binary`. Franky, I’m not sure what is the best way.

So, what are your thoughts?

[11:21:29](#VdDUykUpW41eoIP93MHY4jVCAFIZxVRcLMKugYpM_t0) <hiiamboris (NOT THIS ONE)>:
> Another possibilty is to return converted data on read and bytestream on read/binary.

Sounds good

[11:22:37](#Loqv3OIsF_kFpUHpHE-nXPj100Nr9mhPX2_ZeFSO67Y) <hiiamboris (NOT THIS ONE)>:
Is there an easy way to get both header and decoded data and/or binary source?

[11:24:57](#qplk4d86CURxiPycvKyxgh50dt8NWVBazUddlgZTiBQ) <rebolek (Boleslav Březovský)>:
It’s in `port/extra/response`. Raw data aren’t there, they’re converted on the fly and discarded. I could add them at the cost of higer memory usage.

[11:33:07](#U3lDPDM306E8MZOqyCaDZlaYkLd6VOn51FobXhyJsNo) <rebolek (Boleslav Březovský)>:
Using `read` and `read/binary` has another problem though. It’s usable only with (blocking) `read`. If you want to do it manually, with `open`, `copy`, `close`, there’s no way to pass the `/binary` refinement. One idea is to trigger the conversion with the `close` action, so until you `close` the port, you would have raw data, after `close`the converted data. But maybe it’s getting too confusing?

[11:42:54](#_kCK6aVNfoIL56JfJTJEBKf5k24G0LpSG-Vlnnc2F48) <hiiamboris (NOT THIS ONE)>:
Too confusing.

[11:43:25](#IDawtsN5V0omtORNGnWw9qAgWacHX0KV_YPH14ey0Dw) <hiiamboris (NOT THIS ONE)>:
I don't see why `read` can't decode that by itself? Why do you need `close` to do that?

[11:44:21](#HGz3SKdXA3_-I6cCM61omJDwYC9XbL2-EucWQQ16Cko) <hiiamboris (NOT THIS ONE)>:
If someone uses open close he can decode that manually.

[11:51:56](#oqGCSjGizI58ww28qtSjMYBNIIlG9kg8OygdC-uHrTc) <rebolek (Boleslav Březovský)>:
Sorry for the confusion, `read` can decode it and currently does. And it does it in the `close` event, because you need whole data before decoding (unlike headers, which are converted to Red on the fly).

[11:53:05](#SmVp5oeKflJ7eudWc_b2_leOD89dG9tfLtiVLKJJLAk) <rebolek (Boleslav Březovský)>:
HTTP data are mostly gziped, once we cat compression ports, it would be possible to decompress on the fly, for now, everything needs to be downloaded first.

[11:53:53](#AZ1NC1iMdkNPiWiDTasEeVM6B6_Oo7DnpIWHzo2lys8) <rebolek (Boleslav Březovský)>:
So to answer your question, why do I need `close` to do that - because when I hit `close`, I know I have all the data.

[11:57:46](#3cEK5vKr0JLLZSp9_yqbRf2XinD7ciu7B7L55urYXrA) <hiiamboris (NOT THIS ONE)>:
I see what you mean. I thought of the `close` action first, not `close` event.

[11:58:52](#Yr5FWpu7Ci6TqiguA4Y1JXN8UoCGaLrAzyvZeO9geTE) <rebolek (Boleslav Březovský)>:
I know, it’s confusing sometimes.

[11:59:55](#fK976DWG9JGJRDkAgmXFqQ458jVPPn_fVLSaC6hH-Sw) <hiiamboris (NOT THIS ONE)>:
So if all that lies inside `read` call and is opaque to the user, why should we care how it works internally?

[12:01:28](#J-DFV-9Z_fGknYo7MkCOhSBotS36BWerKVfoHyAD8Vc) <rebolek (Boleslav Březovský)>:
I was talking about the situation when user does it manually, without `read`.

[12:15:11](#dllUDkUBPePYQHoEYb8oNrPkI0BMw4jPEIk9FhgzGl4) <hiiamboris (NOT THIS ONE)>:
Still not getting it ������ If it's done manually, what about /binary refinement you mentioned?

[12:20:05](#JxZ6VrzVgsrCs-uD6Lp65P6cfkaN2xJNRy4pDyNC5Lk) <rebolek (Boleslav Březovský)>:
OK, let me try to explain it. You have two metods for reading from web: `read` and `open/copy/close`.

Currently, when data are read from web, they are converted on the `close` event. So `read` always returns converted data.

I'm thinking on adding a special mode, where `read/binary` would return the raw byte stream, while `read` would still do the conversion.

[12:21:49](#4Lfi37e-xQHnMPmrbSwfji8nGknGvbB2_FdS4SpXln4) <hiiamboris (NOT THIS ONE)>:
Doesn't port created by `read/binary` have access to the /binary refinement?

[12:21:57](#67ZVA1xdHGYg9yeqROBLX5T0fleZHrRKosg4nyj6l3Q) <hiiamboris (NOT THIS ONE)>:
Or what's the issue?

[12:24:37](#6ilNBjroJWPORstuNhVndfpm3xWtFE1cDQ2goS33Aos) <rebolek (Boleslav Březovský)>:
There’s no issue, I’m just thinking out loud, if this is the best way to deal with it.

[12:25:06](#pJyi_RPouw7s7l5SBTK85tkGL4ESJOKoAF-_FB3aiLg) <rebolek (Boleslav Březovský)>:
> Doesn't port created by `read/binary` have access to the /binary refinement?

I’m not sure, I’m going to find out. If not, it can certainly be added.

[12:35:46](#jwF2UDe6VWX7LIMyfqqlZ67hQrlF-B-r8pnTbGaEdAw) <rebolek (Boleslav Březovský)>:
btw, I have another question: Should `read` handle redirection? IMO yes.

[12:58:47](#OKIa87mKxd0iXgW3tS585n7FAH1JcqekkxIqRVB1-gc) <hiiamboris (NOT THIS ONE)>:
Agreed. 

[15:17:43](#cxRznPHxifJJUZ9QVZlXkTfCnrUIANSr-m1RomyC0AA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
As for redirection, it was always an obstacle for Rebol users in the past, when the Rebol client was not able to do it. So +1 here.

[15:18:42](#NkKr8GEQIto4rBgplhvIzQs32TbGV9HWN5C2pXqnoqI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
There was some change between the Rebol2 vs Rebol3 IIRC, namely upon what went via port. Wasn't the difference about being a string! in R2, whereas a bytestream in R3?

[15:24:18](#vDjnNdHL-PW806NALKe7ofg8O3irLquik21GYQtvWjk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
`read/binary` should imo always return a binary. As for complex protocols as http, not sure. If you give me a .jpg, I simply expect a .jpg, as I can save it to the disk, call externall app to resize it, and I can load it, if I need an image type, no? Also VID accepts image file as a parameter directly `view [image %draw-windows.png]` 

[15:26:38](#Rfh6gdzrTF4jO9GSD0cQ_75lXwINboaNPRirVl4Oalc) <rebolek (Boleslav Březovský)>:
> read/binary should imo always return a binary.

Of course, no disagreement here. The question is, if `read` should return binary! also, or if it should convert to a proper type. You prefer binary, but what about HTML? Should it return binary too, or convert it to text? And JSON? Shoult it return binary, raw JSON, or convert it to map!?

[15:30:26](#Q3ei2eEkYl1dVYdyBPGiTG-HfxpzPcGdGaWGt3QW02U) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
the question is, if you are reading a tcp:// port, or a http:// port? In case of the http://, then answer is probably clear, right? So what you ask is about reading a tcp:// port?

[15:30:42](#OXGDEKM6Gg2LR6jNoBGMbqOJx2Cue-msYADe_7xJ6N8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Those question get complex pretty quickly, as I can see :-)

[15:30:51](#rF1g8SY1OpUm0QCWUoqyeuC_FV-IDSJH30SHXn28ddw) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
* Those questions can get complex pretty quickly, as I can see :-)

[15:35:53](#i3Wg9lp_NggiwWaL6cGapUuK1H6s5KWfxPFHe-Zvs4g) <rebolek (Boleslav Březovský)>:
no, it’s about http:// port. TCP returns binary and that’s fine.

[15:37:12](#WCm1JRUVJUrixaiC9ea33tu4fwiZR7Whx3veIA_jJEs) <rebolek (Boleslav Březovský)>:
If you open HTTP port, it internally opens TCP port and reads from it. The question is how much processing HTTP should do. 

[15:42:39](#lpFdiE4I4GPjCDcJAVaJQzhnrQYSmc2xp0gdTOYUWG0) <gurzgri>:
Well, you can't `read %photo.jpg` from local file, but can only `load` it as `image!` or `read/binary` it. Wouldn't it therefore be the least suprising option to `load http://photo.jp` as `image!`, to `read/binary` it as `binary!` and to fail for unrefined `read` in the same way as a local read would?

[15:43:41](#UhJZfN8NGgPYYQIIqnp7AViEhEnRxObcEBUguc4g8p8) <gurzgri>:
* Well, you can't `read %photo.jpg` from local file, but can only `load` it as `image!` or `read/binary` it. Wouldn't it therefore be the least suprising option to `load http://ima.ge/photo.jpg` as `image!`, to `read/binary` it as `binary!` and to fail for unrefined `read` in the same way as a local read would?

[15:47:52](#b1fEuA9d08x8MI0RpraDlRB0L58ycTC53kV1zUbdy-Q) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Good arguments ....

[15:48:11](#GmfCJ6_W689DBe8HbyUHs89qp5cT2ciIPGEvY6ggVqs) <gurzgri>:
No, drop that. `load` can't read from `port!`anyways.

[16:21:13](#uVqTO-qEnf19aRUvBCLJqF-nz8jOzswq3NsXMvxE-P8) <hiiamboris (NOT THIS ONE)>:
Why not

[16:21:57](#hJ3DkIpj2EDKucPFCq6q4W3Z4P1duAfqA4pAz_6KcHY) <hiiamboris (NOT THIS ONE)>:
`load` -> `read/binary` -> `port` stuff

[16:22:34](#RGBjWMiL1hN12kA21YOOwY6NTg5Wg3JeDnmrYaG2A6M) <hiiamboris (NOT THIS ONE)>:
But it will require headers as well.

[16:37:22](#HaNU-GIF7gOulQ2bLjp2OFKOKI2vOnmlLdR5zhJuRJ4) <rebolek (Boleslav Březovský)>:
Yes.

[18:06:28](#6zJSz7rLVvPRiGUH2RnBODwOqRyXYeR6riifzVY1pm4) <GiuseppeChillemi (GiuseppeChillemi)>:
Why don't you add `/mode` refinement to `read` so you can choose between various working modes. So in one you  the .jpg is loaded and in another you leave it. 

[19:11:08](#BSn3ixzahUaXz_xy2el0Y7hGCWZnGw_JYwjNxIGywAw) <greggirwin (Gregg Irwin)>:
@qtxie is the plan to support `open/binary` as in R2?

I agree that `read` should handle redirection.

There is a clear distinction between `read` and `load`. `Read` is for text and raw binary data. `Load` is for values. `Read/as` controls only the text encoding. `Load/as` controls codec application. For files and URLs, via extension and MIME type respectively, the codec can be determined. But if you're loading a string or binary data, `/as` is your responsibility. In the future, I imagine we'll see a `load` wrapper or module that can sniff for formats, but that will be an optional piece, as it's a special case.

## 26-Apr-2022

[7:05:40](#m8AJ0bmWMavusfjDAWCheGYZz_VIiXnrL-OlhS6nn-E) <rebolek (Boleslav Březovský)>:
> `Read/as` controls only the text encoding.

I have few points here. If you look at the source, `/as` is currently ignored. There’s no support for other codepages than UTF-8 (but that can be fixed easily, as I have support for ten most used encodings and others can be added easily). For HTTP, `/as` isn’t required, as the encoding is given in the headers. But it makes sense for overriding header encoding if it’s wrong. That happens sometimes.

[7:08:53](#1Le7OaP2OrOY4aPSnhVj82u4mWdhHAPDlZgYgV0SICk) <rebolek (Boleslav Březovský)>:
Good point on `open/binary`. That probably would be required to support `read/binary` in custom schemes (like HTTP). But I’m not against a different mechanism of arg passing. Currently, you can’t redifine `read` action for your scheme, so until that’s fixed, this is just a theoretical talk. But @qtxie is aware of it and we’ll have a solution soon I hope.

[7:20:24](#TF24Nh6MxkAWTGVTx0GwZhkyZVtvszpOOwbr7msoglU) <rebolek (Boleslav Březovský)>:
The more I think about it, the more I think that Carl’s proposal is the way to go, but there are still some unresolved points.

* `read/binary` would return raw binary data. I guess we all agree on that. Does that include status line and headers?
* `read` would return text (I guess we agree that only the content), but what about other types? If we exclude headers, we lose MIME type info. Other option is to return `block!`/`map!`/`object!`/`whatever!` with all info but that would complicate some things, like for example instead of writing `print read http://www.example.org` you would need to write something like `print select read http://www.example.org 'data` (oh, the horror!). This is the method I prefer, but I’m open to suggestions. We need to pass the metadata somehow.

[7:47:34](#lG--IrJ1jWS0EiUqaO9bu_c733L83ikVE7qOXOlkSgw) <hiiamboris (NOT THIS ONE)>:
read/info?

[8:18:16](#YG74OXBWiQeMgwB8oMsdC1zhQ8ATtfEjpUEQc1ZqEK4) <rebolek (Boleslav Březovský)>:
`/info        =>                                 `
Well, that’s not a bad idea.

[17:28:55](#yzkQSl0kbpRidGkfKXhV22XprQg2dbWOPLZlx_x_RhM) <GiuseppeChillemi (GiuseppeChillemi)>:
I synonym for `read/binary` could also be `read/raw` I like it a little more for unprocessed data (if it has no over structures).

[17:29:04](#gyZ15IrDAqe4_s3XJxHLzyQhUBTfFN_2U7hmHbrTE40) <GiuseppeChillemi (GiuseppeChillemi)>:
* The synonym for `read/binary` could also be `read/raw` I like it a little more for unprocessed data (if it has no over structures).

[17:29:14](#d2u801WEgRZkDncsJjGTiUBNVjBT0sEegB_G7o51Gck) <GiuseppeChillemi (GiuseppeChillemi)>:
* The synonym for `read/binary` could also be `read/raw`. I like it a little more for unprocessed data (if it has no over structures).

[17:31:46](#9LsCQoAglz6CloyZ9GHxPTCKqszmb5z7sHOijrC6baY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I think the binary is fine though :-)

[17:36:28](#CssnZo_zhqMIFK4DlElo7nWcdZwS8fq-7aqfQHk_lYo) <GiuseppeChillemi (GiuseppeChillemi)>:
Second note, why don't you add an `/options` refinement to `read` so you can specify options line:
```
options: [
   headers: true
   images: ' undecoded
   ....
]


read/read ...  ... 

[17:36:48](#EcK9uBX6vgrIWcbyfIKT2tucjsf_nvRZLYKBocjVJ-c) <GiuseppeChillemi (GiuseppeChillemi)>:
* Second note, why don't you add an `/options` refinement to `read` so you can specify options like:
```
options: [
   headers: true
   images: ' undecoded
   ....
]
```

[17:37:09](#fGuBCRTkH-IPK0_FZGmUD0EDxO0BwrziLcVqkxFGseE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Second note, why don't you add an `/options` refinement to `read` so you can specify options like:
```
opt: [
   headers: true
   images: ' undecoded
   ....
]

read/options ... ... opt
```

[17:37:35](#5T9hZ5gl5VuPmXnxBc_2s23wQk7UAxMIKNDBoKaldVI) <GiuseppeChillemi (GiuseppeChillemi)>:
* Second note, why don't you add an `/options` refinement to `read` so you can specify options like:
```
opt: [
   headers: true
   images: ' undecoded
   ....
]

read/options http://www.slashdot.org  opt
```

[17:38:01](#mChImNAteS5uJzOOoRoZgX8F6rplEK4TEozQmH98hro) <GiuseppeChillemi (GiuseppeChillemi)>:
* Second note, why don't you add an `/options` refinement to `read` so you can specify options like:
```
opt: [
   headers: true
   images: 'undecoded
   ....
]

read/options http://www.slashdot.org  opt
```

## 28-Apr-2022

[22:11:54](#WYFeGnQcLOagZio8naHhcsYQnta2yejfvUGzaKrcrb4) <endo64>:
In opinion,
Simple `read http://example.com` should return the content by handling basic MIME types:

All `text/*` converts to `string!` (including `text/csv`)
`application/json` to `map!`
`image/[bmp,png,jpg,gif]` to `image!` (supported image codecs)
Non determined MIME types (or if Content-Type header is not present) then it returns `binary!`

So for the user it is easy to check the return value is `string!` or not and decide what to do.

`read/binary` should always return `binary!` regardless of the MIME type.

For headers and other metadata, `read/info` can be used (should it make OPTIONS request?), it can return a block with headers and other metadata (should it also return the content as well?)


[23:11:22](#r73usjgAR1OjzyiGfylyUBKGdaCJjrIy59osCTsYcjw) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi `/options` is a big and general discussion. We've already gone over it quite a bit in the context of codecs.

## 29-Apr-2022

[5:39:01](#erF1ye-BxHrV6iVMroNor3SnNhd_UR74wSCqj9Rl5q4) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Has it been an internal discussion or is it publicly available? I ask because I have had this discussion too with myself about its use on other functions and I have not ended to a definitive conclusion.  Sometimes mapping options to refinement is good, sometimes it is better to have them in a block as keywords, sometimes as dialect, and some other times as single object.  No definitive answer here.

[7:29:49](#LWJtnUgpuh8TVsetHljQjDkygalmiwSmYWLmtBS99qQ) <hiiamboris (NOT THIS ONE)>:
I think it was in codecs room.

## 11-Jul-2022

[19:48:19](#_H9HLG_sWz8JumEUzHN7fpXxpeFGMNG0h2RuA3pW478) <GiuseppeChillemi (GiuseppeChillemi)>:
In Rebol I have a problem. Sending data synchronously, sometime I receive it truncated, even with big data buffers. Does someone know the reason.

[19:48:21](#l7EMMXrWVfmIcQdqWq77PbRiis-eLK_ALbbwOcUOJM8) <GiuseppeChillemi (GiuseppeChillemi)>:
?

[20:27:47](#kCMCkAoOYMMWHAT-gpLvVXfgz06OAhGKp3h4gQQoAF4) <greggirwin (Gregg Irwin)>:
Example code would help.

[21:04:08](#EwtLucyq95bcI6QQzNU4yyp5BMQEYGjDiSbRLenfb9k) <rebolek (Boleslav Březovský)>:
@GiuseppeChillemi How are you sending the data? What buffers do you mean? As @greggirwin said, please, provide some code.

[21:18:31](#l6JmHqf_qGy5JxuZCSgKY4QzxcybKsgz6i0rrX-U7N8) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, later I will post it

[23:38:46](#wD9NRvxgPw0WPBg1dFijbhcY6qkV3aj20FUyooNVsqk) <GiuseppeChillemi (GiuseppeChillemi)>:
I have 3 scripts:

An experimental server which waits for commands and executes them. Possible commands are those of the `commands` object
https://gist.github.com/GiuseppeChillemi/214482b96832c44a77ea3cf848362554

The `send-to` command which sends a command to an address:

https://gist.github.com/GiuseppeChillemi/bdeb3378eb8d4975036de634751e1f8c

A mini console you can use to send commands:

https://gist.github.com/GiuseppeChillemi/4416e9eb436dae38f8b0368fd12a0cd2

Everithing will print debug information with data length

Use `TEST` in the mini console to receive a big chunk of data ending with a constrol string having `!` at the end. If it wont happen and length differst between each run, you have encountered the problem.




[23:41:31](#EFju7JIKbt0MwXfvsmsaAMxpamd06BUgdFxYC7CRY68) <GiuseppeChillemi (GiuseppeChillemi)>:
It is a test made 2 years ago that I have abandoned for big data. Maybe I was not so skilled to understand what was happening. You have to test it in a local and remote machine to replicate a similar enviroment of my tests.
If you spot any coding errors that could cause the truncation problem, please tell me,

## 12-Jul-2022

[0:22:18](#T3iaWntHC2ThtkAfEg031U9FtnLJquzEiqkNde0ZQho) <GiuseppeChillemi (GiuseppeChillemi)>:
Here is the truncation happening:

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

[0:24:47](#5rb1Be6tTJLJYvLJu7uxMG9XNabONQQ54fUUMW_3peg) <GiuseppeChillemi (GiuseppeChillemi)>:
(The truncation is at the end, you are seen only the last 200 characters)

[0:28:48](#ym57sPvjZL-Wa3LtRG-OvHdtwKYNwXP1jdxkZplg4E8) <GiuseppeChillemi (GiuseppeChillemi)>:
Expecially this: 
```
Type of result:  string!
Length of result:  32768
```
As it is a power of 2, it seems to me a multiple of a buffer 

[0:39:39](#GlHmLhv2OmK9eAwiXPEKySCNjYLeAx5LeNoH_vKhG_U) <GiuseppeChillemi (GiuseppeChillemi)>:
note: you can run it on the same machine!

[0:40:00](#1OE_eTJ_dRPf1UU2GtvXSk1lOfJlF9z0lrLsiEPn_40) <GiuseppeChillemi (GiuseppeChillemi)>:
* note: you can run server and client on the same machine!

[7:11:34](#wIlAXCHWh5X3HDG6Q5u4g_4ysqoB1YFS8BPrAnGPIos) <rebolek (Boleslav Březovský)>:
@GiuseppeChillemi thanks for the links, I take a look at it.

[7:57:56](#7rjfiO_DuDoVynxceBYpUPMpNibXWa_qNoUvK0PWIRc) <rebolek (Boleslav Březovský)>:
Oh, it's done in Rebol, not in Red. Is it R2 or R3? With IO branch, you can write such server in Red (or use my `rbdt://` scheme that's written exactly for this).

[7:59:51](#sZPGsxh92rpmC3nyuK5e6-fhNJGJG1wCrk1XYqAHmic) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you Boleslav, I am waiting for I/O merging to have I/O and ODBC together. Then I will move this micro server too on Red.  

[8:00:06](#gfPuI_JYbyvDj7WhpPVWBbFVhdDNjdH0O_gpxqPkQlM) <GiuseppeChillemi (GiuseppeChillemi)>:
The client which uses it is written in Rebol

[8:00:57](#uLvhrEAU2pCaGmJtjOzpcpPEPJXZN0uiWRRJtXsUyqM) <rebolek (Boleslav Březovský)>:
Which version? I remember there were some buffer problems in R3 (probably fixed in Oldes' version).

[8:01:11](#efvYLir2AfjXw4lTMjUlKkbXCJvoyv6iGA0QkZ--2aM) <GiuseppeChillemi (GiuseppeChillemi)>:
R2

[8:02:35](#Bf-WmAwcHlgpw8TSD1n5X9Du4bK6GUXJ94L_TYWytUk) <rebolek (Boleslav Březovský)>:
I see. I haven't touched R2 networking in years, so hard to say. You probably need to send in chunks.

[8:03:39](#n07Qwrx9eITATVS1iwYp6ivOsiTIp1ntrQ33FzZp5ss) <GiuseppeChillemi (GiuseppeChillemi)>:
I suspect that data could be split and received in 2 different chunks by Rebol, but still don't know in which situation this happens and how to check for it.  

[8:04:52](#mrC3Gc0YEQeSfjAEJuBMMtDl80TSVvsdSkwYMBvG8ds) <rebolek (Boleslav Březovský)>:
If you have a problem at 32k, just split the data in 32k parts (or maybe a bit less, to be sure) and send them one by one and join them together on the server.

[8:05:35](#zzINDLDOY7NapMeU3zzNeLSbJ76KHGbcR7-NzQ8L2r8) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems safe at 8K, I have not seen data lower than this size.

[17:49:30](#CB80UNcNrhTalqGUuK-4AwzzYjjrK6uMlahBtLyCktg) <greggirwin (Gregg Irwin)>:
That 8K number sounds suspiciously familiar. 

[17:59:19](#6EX-RcTu4EqZFE4qchJWynk6REnwDZeADeIaXahDW70) <GiuseppeChillemi (GiuseppeChillemi)>:
This bug is really strange. I could stay 10 minutes not having it and than it suddenly triggers  near every time I receive the block It is shorter than it should be.

[18:01:25](#Bra5Yb2NlwwPSMhPjb8yoT3Dtl5JxaDdwOlJvNYVR0I) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@GiuseppeChillemi Whyt to use R2 and not switch to Red already? Rebolek regards IO being mostly stable enough? R2 is known for some deep bugs here or there, which were never tracked and it is going to stay that way ....

[18:01:28](#X82vj28ZRRx8aSbQZ4k0vFY4yRuU06Ye-W0rudXzFB0) <GiuseppeChillemi (GiuseppeChillemi)>:
But I have a doubt I am still not able to answer: is there any case Rebol could split a transmission in two parts? So I get part of the block and then another? Hope the bug will happen again soon, so I can see it.

[18:01:41](#4qWHHlJ6by9CF8H7aVQVbXs1o1HGCSsl-AobifDaL7o) <GiuseppeChillemi (GiuseppeChillemi)>:
* But I have a doubt I am still not able to answer: is there any case Rebol could split a transmission in two parts? So I get part of the block and then another? Hope the bug will happen again soon, so I can answer it.

[18:04:26](#VMFqESr0s242ojkWuOJmMJnqfza-yHSpJLS6XFIUwWY) <GiuseppeChillemi (GiuseppeChillemi)>:
@pekr I have an application which will remain on Rebol for some time.  
@rebolek If I could easily open Red server and use it to receive commands from the application, I could move the server to Red. 
@gurzgri Also, I have not understood if RED-ODBC includes I/O

[18:04:56](#CfFvhHQaALZfzvPKnOXcVPZ5IYOpNqjt7HjDYeblm8k) <GiuseppeChillemi (GiuseppeChillemi)>:
* @pekr I have an application which will remain on Rebol for some time.  
@rebolek If I could easily open Red server and use it to receive commands from the application, I could move the server to Red. Have you some instruction for me?
@gurzgri Also, I have not understood if RED-ODBC includes I/O

[18:09:42](#CVDKwa9_eMgEvOhfIX44KLkpc2CWldndpPG5IwmIpk8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @pekr I have an application which will remain on Rebol for some time.  
@rebolek If I could easily open Red server and use it to receive commands from the application, I could move the server to Red. Have you some instructions for me?
@gurzgri Also, I have not understood if RED-ODBC includes I/O

[23:51:19](#vAwlYi8RvaD3ZO5GX_UGBSdkZ1S42SPcJo6u7ATW2To) <GiuseppeChillemi (GiuseppeChillemi)>:
However, the words used to interact with Rebol2 ports are terrible. They really confuse your brain. 

## 13-Jul-2022

[8:36:22](#HkA66ZNdH0IQd6WIM79yF5VLm4MZS0SEUXmtl4nCbKM) <rebolek (Boleslav Březovský)>:
@GiuseppeChillemi You need to compile console from the IO branch, I expect you know how to do it.

* Then clone my [CASTR repo](https://gitlab.com/rebolek/castr/). Everything you need is in the `%rbdt` directory.

* Open the Red IO console twice in the `%rbdt` directory.

* In first console run the server: `do %rs-server.red`

* In second console, run the client and try to send a command:

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

[8:37:52](#kExddhYk4nfUJofgmaSauJGVM1PF1gqFrFSmqAhZse0) <rebolek (Boleslav Březovský)>:
When sending the command, keep in mind https://github.com/red/red/issues/4996 - `parse` is case sensitive in `block!` mode, so the command must be `[ping]`, not `[PING]`.

[8:45:38](#WBucrAzjeLhQrMk12OEk609q_twqu4i7QziSNyK3u-A) <rebolek (Boleslav Březovský)>:
Other directives in the rulesets are:
* `import file!` - works as `#import` in Red, but imported file is bound to ruleset only, not available globally
* `import word! from ruleset` - because imported files are kept in separate contexts and you may need a function from a different context, there's `import`. An example is `import match-token from users` in the `%rules-polls.red` ruleset, which imports the function `match-token` that checks if user is logged in based on provided token. 

[8:49:56](#U7VfK_s4TlwY7XjDmaQwc7oWMNb9uA24JpLj7yfF7dY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@rebolek what does `rbdt`stand for? Is that any existing standard? Or just a new acronym? And if so, could we have some more friendly name here? :-)

[8:51:41](#Couj38L6rXLlC1ZtS5uX7YiQ4cKNUdSiWHAN47p3XsQ) <rebolek (Boleslav Březovský)>:
rbdt is RedBin Data Transfer, the first thing I come up with. I'm open to suggestions.

[8:54:01](#UZQuqCzdVLvwPrHBpllQK8rV2Pt3ob1RdQws9e2CDkg) <rebolek (Boleslav Březovský)>:
The format is very simple:

4 bytes magic header `RBDT`
1 byte version, `#{01}` currently
2 bytes flags, flags are described in `%rs-client.red` file.
4 bytes length of the payload
payload

[8:55:41](#ncQPaZkq4HvQAbD1zv1qRSirRihUAmppOZEZMzA7uVI) <endo64>:
I thought `rbdt` is `ReBolek's datatype` ������

[8:56:59](#Wzb-8RcRDW53rK0XTCyj5sZ34CxIGB7v5PmGPUBLMEQ) <endo64>:
`rbin://` or `redbin://` could be easier to remember.

[8:57:07](#CIhyyCN8DxB-eaoywGhXrOcZBDZuGlB5uzzDAWpWCKQ) <rebolek (Boleslav Březovský)>:
������

[8:57:53](#IYPNAMa0wV7dO0ANPPBwh9vBsXuE8a95c0aZ7rEHsd4) <rebolek (Boleslav Březovský)>:
it can transfer text and binary also

[8:58:31](#p9QILtTWdJhEONES7gBo74TVWCuwEmCytTZVBo8QsvU) <endo64>:
Hmm, needs a more generic name then.

[9:00:11](#YEXFwE_MxRwvhhbFJafd6A-tMbCg9abGgrcyJkQMJd0) <endo64>:
What about `red://` then? Could be a little confusing but..

[9:10:22](#taABaI04Nrn3eHUn-SqqTiX3orOLwF27qjjgz7ZwxmE) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
What ALWAYS engage Redbol discussions, is the name contest :-) Back in the Rebol days, there were two - 1) name the new GUI 2) name the network services. For the latter, LNS (lightweight networking services) won (but never took off imo) - http://rebol.com/docs/services/ . And just for the record - what do you think of Carl's R/Services concept? I do remember maybe @greggirwin testing it (maybe Henrik or Robert), claiming it had its own problems, but would be nice, if Red would have its own app server. 

On the other hand, and @dockimbel might correct me - one of the initial reasons for the Red was to create a Cheyenne NG. Cheyenne is an app/web server, based upon Uniserve (name which I always liked) - https://www.softinnov.org/rebol/uniserve.shtml - a multiprotocol architecture ...

[9:11:07](#ejX6nuugYdKQLxOa_P8ZA7fzxuaK5eSQHjPPLccdTJY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Yeah, and Maarten's Rugby remote procedure call system. Those were the days :-)

[9:11:28](#4rTF-UCkCP8htLyHqPd3wE3Gu5S9JFPmHVnJQTqqe3c) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
* What ALWAYS engages Redbol discussions, is the name contest :-) Back in the Rebol days, there were two - 1) name the new GUI 2) name the network services. For the latter, LNS (lightweight networking services) won (but never took off imo) - http://rebol.com/docs/services/ . And just for the record - what do you think of Carl's R/Services concept? I do remember maybe @greggirwin testing it (maybe Henrik or Robert), claiming it had its own problems, but would be nice, if Red would have its own app server. 

On the other hand, and @dockimbel might correct me - one of the initial reasons for the Red was to create a Cheyenne NG. Cheyenne is an app/web server, based upon Uniserve (name which I always liked) - https://www.softinnov.org/rebol/uniserve.shtml - a multiprotocol architecture ...

[9:33:26](#0-eELHaOv6tsi0WUL8BkXwjDaMFP7J7giywpEIDAeTc) <rebolek (Boleslav Březovský)>:
The main differences from Rebol/Services is that RBDT is just a communication protocol. It doesn't deal with encryption (and relies on TLS instead), authentication and other stuff, however, that can be build on the top of it, for example the `rs-server` has support for authentication.

[9:36:22](#MUFOAY58nR-ypmDk0zxYSt5uc_G9IZ8ZbnyWNc-RAl4) <endo64>:
> if Red would have its own app server.

Cheyenne with Red could be that app server with a built in support for RBDT. 

[9:37:32](#uGSreFXFlWQZM0Y6ZtTpr_Nd0TYXb-znphVaP_n95x0) <rebolek (Boleslav Březovský)>:
Also, with it's redbin support, it's much more tightly integrated with Red. You can use text (molded data) as well and it makes sense in a lot of cases, the overhead of redbin makes no sense with commands like `ping`, which should be transferred as plain text instead. But that needs some logic to determine which format to use.

[9:38:04](#PW56LqKXHVJB_EOJk5Ci5q4B2CN72bT4vt9-5KxDZqY) <rebolek (Boleslav Březovský)>:
Also, I'm thinking about making version 49 of rbdt protocol that would be plain-text instead of binary.

[9:39:39](#mM7cFwlYRUc1g03jjUS0j-dQYlzdnTHHxnC8OHgsIOs) <rebolek (Boleslav Březovský)>:
Of course. I'm planning to add rbdt module to my Hub webserver once it's more settled, or if there will be future version of Cheyenne, even there.

[14:40:22](#aK5cRgVeFy9Z0TseXL3Cg2KldcfR-6CGuVoTZPigN4c) <GiuseppeChillemi (GiuseppeChillemi)>:
I didn't know Parse is case sensitive in block mode. I remember Rebol isn't.

[16:18:17](#UhOeDAco5bkJsmKH2M-cZRYMhK7TMnFeN4qn8VJIVlQ) <rebolek (Boleslav Březovský)>:
I believe it shouldn't and it's a bug. See #4996 for details.

## 24-Jul-2022

[22:43:44](#8i-Srh3WWPRrMeqpde1hm95YMZvKJMypqI6PvD1HoZo) <GiuseppeChillemi (GiuseppeChillemi)>:
About this discussion on ports naming and usage:

☝ [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And [Petr request:] https://github.com/red/red/issues/5112

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:44:01](#1CvWb_PnHwG0xt9spOk6LhQonuijAy3GV3zTkyX16uA) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And [Petr request:])https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:44:11](#4mO8MZjUiJZoConKaGxvRJsHrMOlrJERh3rYnS8Ptqc) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And [Petr request:](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:44:30](#1m6nXlrQqGxuM9G8JRqwKnyD_hRX2k8Kvy0ZXH1fhlo) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And [Petr request:][here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:44:47](#-OwfObGtl6RguVkfkKSG7uR-rKItvz-29HGRi5tIl2E) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And Petr request: [here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by CRGill](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:46:15](#viA7ONI50uQb-ydwk1aADS1v5Uee-DasVVRhHp4WJTU) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And Petr request: [here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki] (https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:46:31](#kO6wDVIIgL4d2orGmIwreJcOTkDDGjoisHHvwCH7wAI) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports naming and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And Petr request: [here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki](https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



[22:47:27](#p3hlCYGa557hj3wqwJumlow5Q-WpgTxVAOkF-SNz8Lw) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this discussion on ports *naming* and usage:

:point_up: [20 luglio 2022 02:43](https://gitter.im/red/red?at=62d74fb8d3c8894f719442ba)

And Petr request: [here](https://github.com/red/red/issues/5112)

I have received another document with an organized list of port actors on R3:

[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)

So far, the documentation we have is:
[Draft on Red Ports](https://github.com/red/red/wiki/%5BDraft%5D-Ports)
[Red I/O Tests](https://github.com/red/red/tree/IO/tests/IO)
[Rebol 3 Actors by RGChris](https://github.com/r3n/rebol-wiki/wiki/Port-Actors)
[Ren-C/Rebol3 Wiki on Ports](https://github.com/r3n/rebol-wiki/wiki/Ports)
[Old Rebol3 Wiki](https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table_Of_Contents)



## 25-Jul-2022

[5:26:26](#OX7lQ0QGJnYxzLmBWEIsGdcKFMnPPYCtpwW7PQtpTbQ) <rebolek (Boleslav Březovský)>:
Thanks!

[7:33:37](#_hoUobHH_n25f1c3A5kPdJq0i2BaXgJzbl_gj6V_5M8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
The document is not by RGChris.. it was imported from the old DocBase. Chris just edited it transparently after.

[12:34:37](#0z5TRIOK-VU_BhDhuQsDtpW2b6-i0-V0PgfwsHeSwX8) <meijeru (Rudolf Meijer)>:
(Posted also in red/red) I tried to download the latest IO build, but got instead a build of the master branch.

## 6-Aug-2022

[13:20:50](#BI59vEejspKBHvcXXNmMWYvExpwqM7wysWtsAneF__0) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried to read an italian web page via `READ` and I receive an `Invalid UTF-8 encoding`. I see `/as econding`  refinement but I receive a `reserved for future use (or not yet implemented)`. What should I use?

[13:21:30](#sXQM1ghsMuPKt_qWx5bU9PrwlYk_XF9VND1Cfzb7I_8) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried to read an italian web page via `READ` and I receive an `Invalid UTF-8 encoding` because of accented characters. I see `/as econding`  refinement but I receive a `reserved for future use (or not yet implemented)` when used ith `latin1` or `latin-1`. What should I use?

[14:14:40](#b5s3wKrWVr2SaPuVJ_J_nanDfeuucCISIqRc2R7jWV0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
We can't read some sites because of strict Red settings imo. The only chance in such a case is, imo, to read in a binary form and custom decode ...

[14:26:43](#KtwBdf1SqF44IRn0W0SjCWOT6YcRrex1A4e94qdU3kY) <GiuseppeChillemi (GiuseppeChillemi)>:

I have posted in gui-branch. I have read it using Boleslav HTML tools but I have some errore

[14:27:06](#NUKeVb8WJNcehjDAlx82XG8z_pdHZUD80p70Y6_WQ2k) <GiuseppeChillemi (GiuseppeChillemi)>:
* 
I have posted in gui-branch. I have read it using Boleslav HTML tools but I `area` does not display the full text

[16:05:11](#vWPhPgVo1i1VFoandox8Orv1rDKO1h50RPBidu4euX0) <GiuseppeChillemi (GiuseppeChillemi)>:
@dockimbel @qtxie 
I still have the following issue https://github.com/red/red/issues/4791 with the latest binary.
I have it on 2 machines: a Windows 10 one and another Windows Server 2012, so it is not OS/Machine related. 
They both have in common the *italian language localization* and nothing more, as they have 2 different usage scenarios and installed software. 
Please, could you reopen the ticket? If needed, I am available to give you access to a machine where the problem happens.

[16:05:22](#Y_WaMhjlA87QDBq1bS0jKIs78HT3Nj7R8B9fKnwOlRU) <GiuseppeChillemi (GiuseppeChillemi)>:
* @dockimbel @qtxie @boleslav
I still have the following issue https://github.com/red/red/issues/4791 with the latest binary.
I have it on 2 machines: a Windows 10 one and another Windows Server 2012, so it is not OS/Machine related. 
They both have in common the *italian language localization* and nothing more, as they have 2 different usage scenarios and installed software. 
Please, could you reopen the ticket? If needed, I am available to give you access to a machine where the problem happens.

[16:05:34](#m02jw27HJpVfyG-lxtReraUQ7ulQgMH-6uOw-WLmopo) <GiuseppeChillemi (GiuseppeChillemi)>:
* @dockimbel @qtxie @rebolek
I still have the following issue https://github.com/red/red/issues/4791 with the latest binary.
I have it on 2 machines: a Windows 10 one and another Windows Server 2012, so it is not OS/Machine related. 
They both have in common the *italian language localization* and nothing more, as they have 2 different usage scenarios and installed software. 
Please, could you reopen the ticket? If needed, I am available to give you access to a machine where the problem happens.

## 25-Nov-2022

[14:55:29](#B8xMIxKUca6KHNATlaUBVtcpvr8SLvy_jv467Hiy0V0) <ne1uno (ne1uno)>:
is there a more recent red-win-IO executable than July22?  I've never used red or rebol to post

[14:55:29](#MysqHsM0WUpkHzMZMo1ZdTA1x04-sudWDLSWiP8AJWw) <ne1uno (ne1uno)>:
continuing from https://gitter.im/red/red/welcome?at=638044e9b1a7596436891ba0

## 27-Nov-2022

[11:48:53](#ttY05aTywLb-ldGs5lVTACOsduprym-85MeptYyDjDk) <meijeru (Rudolf Meijer)>:
I notice that the IO branch is kept up-to-date with the master more or less regularly. Does that mean it will be released soon?

[14:20:20](#Nbniz97yQM4_0gxAdzk2LSzWj1V2qwXvg338MjPczpM) <dockimbel>:
No, it just means that we keep it updated with master commits regularily in order to check that the changes there are compatible and don't diverge too much from master.

[14:20:29](#qWvG2eDAE8P5DwwXpcrbiCDdTis5saDFPGnJ0EMcu-I) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@meijeru last I remember some chat about IO branch, was me asking @dockimbel, if he would mind renaming async IO event names. I objected mainly about `wrote`and asked for the possible change to `write`, as using a past tense with events is not consistent anyway. If I remember his reaction properly, it was something along the lines of possible IO architecture revision.

[14:20:42](#n_q6petWaes4MS3b5F4VUIecYBDZ1jt7tdffjr37WGQ) <dockimbel>:
* No, it just means that we keep it updated with master commits regularly in order to check that the changes there are compatible and don't diverge too much from master.

[14:20:48](#8ZHXHeGpFEux7U9HyHDthkbWQqWuDqk8tMJ6jA_0-fc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Ah, sorry, Doc was faster with probably more proper explanation. 

[14:21:41](#skyVinq0J17Di3z1fKjKndzeFqg8gBK-g5VjH_LYVW0) <dockimbel>:
* No, it just means that we keep it updated with master commits regularly in order to check that the changes there are compatible and don't diverge too much from master. Conflicting merges can be very painful to solve and cause regressions. Merging as often as possible prevents that.

[14:52:48](#4ZLBrFXgrk9a9zQhYYWn_DnNznKMjVnsNE3n29E5wDM) <meijeru (Rudolf Meijer)>:
OK, so no timeframe...

## 28-Nov-2022

[8:16:18](#S6xZVrTbDyieIT-z1Uv-JtjRG0NfEb6_t7k_M5OoPnE) <rebolek (Boleslav Březovský)>:
@ne1uno while there's lack of IO updates, I must say that it's pretty powerful in current form. AFAIK there are no showstopper bugs and you can do a LOT with it.

## 29-Nov-2022

[16:54:34](#sG74kK8k65nJBhOW3z5NF5Y7un_nSD2avycHgfHCL_A) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Will be Red ports full duplex? I was playing with Websockets in Rebol3 and it looks that there are serious issues as Rebol's implementation is only half-duplex������

[16:55:57](#8PAQcN3HfumdcpivpOCwJ_HY0IY1T3g_M-0YkMXaQgk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Will be Red ports full duplex? I was playing with Websockets in Rebol3 and it looks that there are serious issues as Rebol's implementation is only half-duplex:/ (Incoming message may corrupt outgoing one)

[19:59:23](#quHyidfW7s1cXC--XJiMRdq7pvoQ5yCH46r-FdUp9NQ) <dockimbel>:
AFAICT, it's full-duplex, in/out buffers are different. @qtxie can confirm.

## 30-Nov-2022

[8:18:00](#362uGSStqOZ_9CheL0Ky7yl50oDnRMo6nqkyHDy4Des) <qtxie>:
Yes. It's full-duplex.

## 7-Jul-2023

[13:52:59](#E67U8aws9_rr66Dpkhpe98FPdI0g3PL1PWTjqXf1CVA) <Benoit de Valois>:
Hello
If I want make some tests with these branch, where can I find some doc ? Use internal red help command ?

[15:19:09](#hUv2usTi9CoFKinrJAl-FOdMwZpgGOuqjzXgsJbGl8Q) <hiiamboris>:
see https://github.com/red/red/tree/IO/tests/IO maybe it will help you

[15:40:45](#2nJxSpWL0gDjLiF_QvWCBvQ37RaPe7aHpMlScAgcko4) <Benoit de Valois>:
thx

## 9-Jul-2023

[20:35:49](#v7Ogn48becHkRhys9-BVeHNS9mKF7EqFPgJAIO-BHiQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Has anyone worked with oauth

[20:36:23](#moleLPeZ5SLei85N9apxFUhhmIC6HamOoWtIRwlDpvs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Has anyone worked with oauth2.0? I Need to connect to Google People API

## 10-Jul-2023

[6:13:26](#e50OYXMqcPd7o8hZHga2aRCrMrvkIpIifPGqSFwJt3M) <Oldes (@oldes.h:matrix.org)>:
[Here is OAuth2 for Spotify written in Rebol3](https://github.com/Oldes/Rebol3/blob/4e8d95a621c670ce6611c2a8ef3afd16f75d3d5b/src/modules/spotify.reb#L36-L157). The principe should be same.

[15:44:54](#QFyVeOkzXcobCLJeSXg1HL957KCKAzdE43sZjbCaQo4) <rebolek (Boleslav Březovský)>:
OAuth2 is relatively easy but very provider-specific. It's basically impossible to provide OAuth2 library.

[15:50:33](#Umeo_83LW-mr7FFLr_jH_AbJ2tO3DoyiBBxwh-cfhaw) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
How can standards be provider specific? ������

[22:38:26](#VVyH5gWYk8v10XDg5heV8r9EJFcKAICj49MMao6MD68) <greggirwin (Gregg Irwin)>:
They're more like guidelines, really. :^\

## 11-Jul-2023

[18:49:45](#me1iZZCZkAGJKfDghOZ0kW3C3BP-5Yg6zEaD_kjX73M) <rebolek (Boleslav Březovský)>:
Exactly. There's RFC 6749 and 6750, you can read it to know how it works but then when you want to implement OAuth for some service (for example Spotify, like Oldes did in R3 and me in Red) and then another service, you'll find there's too little common to abstract.

[19:07:34](#fZi5nl7n4d2KVxbDAOOxwbMtefIeGUa5yaBOBjJsK9Q) <Oldes (@oldes.h:matrix.org)>:
Actually the OAuth2 for Spotify and for Google is almost same.

[20:02:25](#iaSyVm-gXCgb0bw1G8vtMYO50JI6YGiBcV7SkngAf7E) <rebolek (Boleslav Březovský)>:
almost

[20:28:51](#eo58agm52yazzLW1NGo7I8wIaN5NYubwHw1jzTOrgB0) <Oldes (@oldes.h:matrix.org)>:
Some.. if you don't count different scopes.

## 26-Oct-2023

[22:23:02](#j1kU08pyuxX1Jz3oRHwJtRAb4QepEzvG2td_rexWUPY) <fergus4 (Alan Macleod)>:
Can red post a request to an api that requires compression - gzip? Getting a message: 'Accept-Encoding [ gzip;q=1.0, identity; q=0.5, *;q=0     ] - NOTE: using http-tools as I am not sure what red https can do yet!

## 27-Oct-2023

[5:02:41](#jAwt6MvHmtoA4f7SiUG3IdpQYseTza2DUV-SmBb3U24) <rebolek (Boleslav Březovský)>:
fergus4 (Alan Macleod): HTTP scheme for the IO branch handles compression.

[14:25:57](#Be9_KHlF_mwAvfmgI2BpmA_1CL4mnURsB8Ii5fOdyIo) <fergus4 (Alan Macleod)>:
That's good to know. Are there any examples of how to use it and Authorization using a bearer token?

[15:11:47](#T5ujGGottEaok4QBv3xSkb-ggBAP2PQ_KKpsAyhP_cQ) <rebolek (Boleslav Březovský)>:
fergus4 (Alan Macleod): 
1) grab [CASTR repo](https://gitlab.com/rebolek/castr)
2) 
```
do %http-scheme.red
write http://www.example.org [POST bearer #ABCD1234 #(json-data: "something")]
```

[16:05:47](#iY7NhQpxB_fAJDbiNiWJfOhptGsyZy5YITFacX6_-cA) <fergus4 (Alan Macleod)>:
Boleslav, i keep getting this error when doing http-scheme.red: ```*** Script Error: repend does not allow map! for its series argument
*** Where: repend
*** Near : repend system/codecs [name codec]
*** Stack: do-file ```

[16:42:41](#B75MEEKUSS30CigUwsPa3Ov6m2Zicthn4D94MkIxWR0) <rebolek (Boleslav Březovský)>:
fergus4 (Alan Macleod): are you using Red's IO branch?

[20:01:38](#fio_mWHcvVluIQ8EHmm_9YgVhHN4mUD63Zyf4_2fJZk) <fergus4 (Alan Macleod)>:
No

## 28-Oct-2023

[6:57:17](#4qhUhKDof1xKfSNw-Undt9MpR-EaYWod9aMVc9GRVOs) <rebolek (Boleslav Březovský)>:
Then it'đ not going to work, you need the IO branch for the HTTP scheme.

[15:15:59](#c-Caf-llwDnrOkbDbAx5Ra60SN15CzKjfYX-wveWC_c) <fergus4 (Alan Macleod)>:
I see you did say io branch above...i'm a dope. Where is io branch located? I have SDK.

[18:39:26](#o3jiP-PypYWHRJjtye9BzeW9MwlsUKb5UL1ZEG8F0q0) <rebolek (Boleslav Březovský)>:
fergus4 (Alan Macleod): have you tried to build Red from source available on GitHub? Are you familiar with Git? I can help you set it up, SDK isn't needed btw, free R2 is enough.

## 29-Oct-2023

[15:01:24](#FTtcxXlU9KiU0d5zNBINsY-ls5Xm1p6_UhWBgbJGKRI) <fergus4 (Alan Macleod)>:
That would be great. Thanks. I've used Git, yes. I search for docs to do this (and not bother you) but I can't find anything on it.

## 30-Oct-2023

[10:16:29](#baMcLQf9tPf3r6wdlcuxUhykLjSmqVwIKTitVVtahV8) <rebolek (Boleslav Březovský)>:
1) Install Git
2) clone the repo: `git clone https://github.com/red/red.git`
3) cd to repo: `cd red`
4) switch to IO branch: `git checkout IO`
5) download Rebol 2.7 for your platform and put it o the `red` directory
6) run `rebol`
7) compile Red: `do/args %red.r environment/console/CLI/console.red`
8) wait for a minute until compilation ends
9) exit Rebol
10) now you have a new file in `red` directory - `console`. That's a build of Red on IO branch. Copy the file where you want to (maybe add executable flag if not present) and you'll be able to use new IO features.

[13:56:18](#Nh_ejPK1pbYq8wGCn--AyHtukHDlTsXCsViRcxowe3Y) <isqwy (尘墨)>:
download the master zip and uncompressed,then follow step 5:
```
>> do/args %red.r %environment/console/CLI/console.red
Script: "Red command-line front-end" (none)
*** Driver Internal Error: Script Error : Invalid /part count:
*** Where: arg-end
*** Near:  [keep copy/part s' e'
if
]
```

[14:26:40](#esEiU0pcwelLl3VJ-PqCU0BZrm-VOyqyBTcHDB0n3-M) <rebolek (Boleslav Březovský)>:
what version of Rebol do you have?

## 31-Oct-2023

[6:03:38](#xp3HlLI0XZ86hX-NPyr047FwUDZNatDqGcRe9VvkZNo) <isqwy (尘墨)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> what version of Rebol do you have?

`rebol-core-278-3-1.exe`

[13:27:01](#B2En16UB7ppYw9EMo6sSAn46MK6qZLghXEzKiyKuFfo) <rebolek (Boleslav Březovský)>:
Interesting. I can confirm it on Linux. I'll report it.

[16:02:56](#OyhJu3-122-gMaWIM-KgHNV_Bzp7usTa5MSFqT7FxvI) <rebolek (Boleslav Březovský)>:
isqwy (尘墨): Try with `-r`:
```
do/args %red.r "-r %environment/console/CLI/console.red"
```

## 1-Nov-2023

[2:37:31](#CVcwIr9oWh7tUH9QtXJYxe9tqFe2sVWOwmG0Vo6zRdU) <isqwy (尘墨)>:
it's done,thanks!

## 2-Nov-2023

[11:37:07](#bouSmkuyX5VK2hk47--tZyYd3Va3qllUyH8D01akjAo) <dockimbel>:
You don't have to bother with `git` if you don't want to. Just download the zipped repo content from IO branch from: https://github.com/red/red/archive/refs/heads/IO.zip

[11:38:09](#_-pFmuXfVOJxuvRLSRChGOO595NrhPXAU2_YgEqQgT8) <dockimbel>:
 * You don't have to bother with `git` if you don't want to. Just download the zipped repo content from IO branch from: https://github.com/red/red/archive/refs/heads/IO.zip

Put a Rebol executable in the top folder of the repo and use the compilation command-line.

## 19-Dec-2023

[12:44:02](#yHi8leQQvAUB1sgAcp0tv_zxCoxZVW8Ne3B7MoJKiUc) <GiuseppeChillemi (GiuseppeChillemi)>:
rebolek (Boleslav Březovský): I remember your framework has a function to replace a parameter with its value in an URL but I don't remind which is.

## 26-Feb-2024

[22:27:56](#3M8SFckHESv_fD56bIs9i8HrSCk01WS7fT6eYtaRne4) <fergus4 (Alan Macleod)>:
Was IO branch merged in Red 0.6.5?

[22:34:02](#1kxadUFuXD8ujFiTwyb2vMPTsIQTSYSyGzqF8HHjDNg) <greggirwin (Gregg Irwin)>:
No. The change to 0.6.5 was because of the syntax swap between maps and construction syntax.

[23:32:15](#reYCHAEabd-_wqVXBSc20VZ6Sc8S68hVD5_PgjOwakk) <GiuseppeChillemi (GiuseppeChillemi)>:
dockimbel: if the migration to 64bit is in early stages, why not complenting I/O, so we have a wonderful instrument to play with until 64 bit is completed?

## 27-Feb-2024

[3:35:49](#nmbhTaEUhcCJQUoi1A8Pz8QM4FxUdy5d5nODQP7U8nM) <GiuseppeChillemi (GiuseppeChillemi)>:
dockimbel: if the migration to 64bit is in early stages, why not complenting I/O, so we have a wonderful instrument to play with until 64 bit is completed?

[7:18:31](#hlyQwgzAvTmdAbF7HmCccuGx_6a4WaGaxIiLsDcvUOk) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
0.6.5. got merged into the new IO2 branch, hence I expect some potential new developments towards the IO happening in there ....

[10:14:31](#l0dFIQmzuQ9J-u4rhfHkH0MNVBv63ZyGRecwAvJIEB0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@pekr:matrix.org> 0.6.5. got merged into the new IO2 branch, hence I expect some potential new developments towards the IO happening in there ....

I have just seen. We have also one about Table in View

## 17-Oct-2024

[14:38:53](#Jv-6HrUSTmPksaDxi4DdPqwrW1aM8JOdqrHDTd2BL6Y) <Oldes (@oldes.h:matrix.org)>:
Any ideas how should work a directory port? Currently there is just an atomic action which collects all directory files. Do we want to support opening a directory and reading file names in chunks? What about resolving additional file info in such a case to avoid additional requests?

[14:43:48](#RbsCx6YSpH0MlrUnIp7vSbnD_6sHOECeMJ6wg6v8Jlo) <hiiamboris>:
reading in chunks makes sense for network listings

[20:25:31](#B37eB7OoOrA6TupsQ6IcMuBiWM-5DubOu1bPcj-VYgM) <greggirwin (Gregg Irwin)>:
A file system is a hierarchical data store. We should have an interface that allows easy reading of fs-info, metadata, pattern matching (globbing), and limits and/or pagnination.

For many use cases, an indexing system is valuable. There are cases where we access unknown stores (generic file browsers), but most systems use conventions of some kind to organize data. Something to keep in mind for the layers that will use the lower level ports.

[20:27:01](#I7Wckq62Rkqd1Pd9-N8CTTZpyOgovRIma5mYE7SQVMw) <greggirwin (Gregg Irwin)>:
Identifying what the upper layers do helps nail down what the lower layers should provide.

## 18-Oct-2024

[7:09:47](#idToL5WiBQokOpMcEMgvS-WG9iXfUEkg1YxTczoH6aQ) <hiiamboris>:
The low level system also could provide a search handler (object/port) which would cache the data it already has. So if you requested the filenames and the OS provides file sizes and dates together with filenames, it would keep all the data but only give you what you ask. Then you may query some additional data without extra FS reads.

[7:10:35](#7H9mHM1HnYBjzqHU-flVu9AkQQOfYlJL9xc9dOptaE4) <hiiamboris>:
* The low level system also could provide a search handle (object/port) which would cache the data it already has. So if you requested the filenames and the OS provides file sizes and dates together with filenames, it would keep all the data but only give you what you ask. Then you may query some additional data without extra FS reads as long as you keep the handle.

[7:49:57](#iMoe9ODHx6JQLgLNax7G3uQZQ9VpoeBVK8MX3Bf7GWc) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
IIRc, for the metadata, we used the `query` in R2?

[13:20:32](#cYw_FeeLC0kt83QI4euX_CIdtp5UPxCVRhLGYxdeLds) <greggirwin (Gregg Irwin)>:
And `get-modes` for file attributes like `read-only`.

