
#4960: de/compress functions should not allow combinations of multiple formats
================================================================================
Issue is closed, was reported by Oldes and has 100 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4960>

At this moment there are supported 3 compression formats: `gzip`, `zlib` and `deflate`. The use of the last 2 of them is defined by refinements. If both are used, [only `zlib` is done](https://gitter.im/red/help?at=613fa272d206b85e4f97abeb) and [it confuses people](https://gitter.im/red/help?at=6140903d117934696617b7ef). 
 
Currently:
```red
>> decompress/zlib/deflate bin 0 0
== #{
D2844DA2012604487BE6C5772C322501A058F9A401624652061A612CAD29041...
```
While it should be something like:
```red
>> decompress/zlib/deflate bin 0 0
** Script error: incompatible or invalid refinements
** Where: decompress
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-15T15:04:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4960#issuecomment-920102827>

    I think the whole `decompress` interface needs to be improved. Using a mandatory `0` argument to specify an optional argument is a bad fit for Red. Here is a proposition:
    
    ```
    decompress: make native! [[
        {Decompresses data. Data in GZIP format (RFC 1952) by default} 
        data [binary!] 
        /method "Specify an different uncompressing method"
            format [word!]  "'zlib or 'deflate"
        /size "Specify an uncompressed data size (ignored for GZIP)"
           usize [integer!] "uncompressed data size"
    ]]
    ```

--------------------------------------------------------------------------------

On 2021-09-15T15:36:51Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-920130644>

    Sounds good.... also there could be `/part length` so one could decompress from a binary stream without using `copy/part`.

--------------------------------------------------------------------------------

On 2021-09-15T15:41:51Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-920134986>

    Maybe the there could be shorter `/as method` instead of `/method format`.
    So it would be like `load`, where is also used `/as` and above mentioned `/part`.

--------------------------------------------------------------------------------

On 2021-09-15T16:36:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4960#issuecomment-920180757>

    `/as` is fine. Then it should also be change in `checksum`. For `/part`, I don't think it is needed, as the compressed payload should contain a header with size information, so that extra bytes will be ignored. @qtxie can give us a better view on that.

--------------------------------------------------------------------------------

On 2021-09-15T17:05:56Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920206124>

    `Checksum` doesn't have a default method. so `/as` doesn't apply. The question is whether `decompress` should have the method be optional. In Rebol it made sense, because it was proprietary (not very much so, but still :^). The benefit of a default only exists if that's the only format a system uses. Then all your calls are shorter, but not documented as to the format. With the default method, shorter calls are not auto-doc'd with the method, but other calls are, and all get longer because of the refinement. Making its interface match `checksum` makes sense to me. I'll look at the size option next.

--------------------------------------------------------------------------------

On 2021-09-15T17:36:12Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920226595>

    On `size`, what is that for? I get that you can tell it to allocate a big buffer so it doesn't have to do it twice inside, but how is the user supposed to guess at that number? The only place it seems to make sense is if you store the original length separately and have that available when you decompress it. Then it's a nice optimization, but we could always add it later.

--------------------------------------------------------------------------------

On 2021-09-15T18:06:18Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-920257780>

    The `size` is usually part of the container's structures... like in `zip` file format. It's not just optimization.

--------------------------------------------------------------------------------

On 2021-09-15T18:10:23Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920260500>

    I understand that, but the user has no idea what the size is, without sniffing. The internal decompressor is the one that either sniffs it from a header or calls an API that returns it, often by spec'ing a zero size buffer. What I mean is that it would be a user level optimization, but why would the internals ever need it?

--------------------------------------------------------------------------------

On 2021-09-15T18:19:09Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-920266699>

    Checking how Red deals with `size`, and it really looks that it is so far used just for pre-allocation.
    For example:
    ```red
    >> c: compress/zlib "hellohello"
    == #{7801CB48CDC9C907130016BC0429}
    >> length? decompress/zlib c 5
    == 10 ;<--- I was expecting to get 5 as requested
    ```
    Also... there are many types of users... some of them cares just to have some data to have compressed, and other want to deal with complex data structures... <s>having `deflate` without `size` is a nonsense imho</s>.
    
    The `size` should be optional, that is for sure. After checking my sources, so far I use it only in `zip` and `swf` codecs. 

--------------------------------------------------------------------------------

On 2021-09-15T19:42:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920324050>

    We will surely have more methods in the future, each of which has different control knobs for dictionary and window sizes, etc. `Size` is too specific for that. That's why I proposed the same spec as `checksum`, though `/with` can even be TBD. In the future, if someone wants to add more controls, we add `/with spec | options`.

--------------------------------------------------------------------------------

On 2021-09-15T19:47:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920327253>

    Looking at @rebolek's %zip.red, the common use case comes up, where `size` is used. The ZIP format itself stores the original size for each file in the header, so it's available for use. 

--------------------------------------------------------------------------------

On 2021-09-15T21:42:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-920403091>

    If it's just pre-allocation, why not use `/into` like everywhere else?

--------------------------------------------------------------------------------

On 2021-09-15T22:06:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-920415399>

    `/into` is only used with block results so far. So we'd have to decide what happens if the binary buffer is too small, since `decompress` allocates in that case. That is, user buf is too small, does `decompress` fail or allocate a new one, which makes `/into` no longer meaningful. 

--------------------------------------------------------------------------------

On 2021-09-15T22:12:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-920422612>

    Replace `decompress` with `append`. What `append make binary! 0 #{AB}` does?

--------------------------------------------------------------------------------

On 2021-09-15T23:07:12Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-920450753>

    > 
    > 
    > Sounds good.... also there could be `/part length` so one could decompress from a binary stream without using `copy/part`.
    
    Yes. It could be good to avoid an extra `copy/part` if the data is big. Also if we could use `/part length` for streaming mode... Maybe deflate port is a better way to do streaming.

--------------------------------------------------------------------------------

On 2021-09-15T23:43:12Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-920464814>

    Only `gzip` format contains the original size. Those information are usually stored in the containers, ZIP, PNG, etc. 
    | size\format     | gzip | zlib | deflate |
    |-----------------|------|------|---------|
    | compressed size | no   | no   | no      |
    | original size   | yes  | no   | no      |

--------------------------------------------------------------------------------

On 2021-09-16T19:30:49Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-921186817>

    @qtxie I like the idea of ports for streaming. Rebol used it for encryption as well. Thanks for the notes on orig-size too. 

--------------------------------------------------------------------------------

On 2021-09-16T20:23:11Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-921218886>

    What if we do this:
    ```
    compress: make native! [[
    		"Compresses data"
    		data	[any-string! binary!]
    		method	[word!]	"zlib deflate gzip"
    		return: [binary!]
    	]
    	#get-definition NAT_COMPRESS
    ]
    
    decompress: make native! [[
    		"Decompresses data"
    		data	[binary!]
    		method	[word!]	"zlib deflate gzip"
    		/size "Specify an uncompressed data size (ignored for GZIP)"
    			sz [integer!] "Uncompressed data size; must not be negative"
    		return: [binary!]
    	]
    	#get-definition NAT_DECOMPRESS
    ]
    ```
    It's possible that we'll want `/with spec` in the future, but that's a bigger design project, including research. Right now, we know we want `/size`, at least I think the benefits are worth the cost.
    
    If size is ignored for gzip, should that be an error of incompatibility?
    
    `Checksum` has a support system for method options, which `compress/decompress` do not at this time. Setting up the symbols and using a `compression` context and `compression/known-method?` is straightforward. This is a win if we add more methods. That leads to asking how compression formats align with codecs (including func names encode/decode vs compress/uncompress). They are used inside, going hand in hand with, other formats and containers, and those will continue to evolve whether we like it or not. 
    
    Zooming out even further, can complex codecs be defined as grammars in a way that makes our lives better. That ties to binary parsing, so this whole thing kind of explodes the design space. Future considerations. For now, improving the current func specs and planning so we can add more methods seems like a good start.

--------------------------------------------------------------------------------

On 2021-09-16T20:29:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-921223046>

    I hesitate to even mention this thought, but also don't want to forget it. Given the model the new fast lexer has shown us, for some formats it may be possible to "compile" dynamic parsers that are blazing fast. That's more fun research than anything. Our goal should be to support other formats for interop, at the Red level, and promote redbin as the fast format. If protobuf, msgpack, etc. are correct and let people mix Red into their stack, that's a win for everybody. If they aren't fast, because we write them for clarity in `parse`,  someone will eventually address that if they need to.

--------------------------------------------------------------------------------

On 2021-09-17T06:38:53Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-921538904>

    > Yes. It could be good to avoid an extra copy/part if the data is big. Also if we could use /part length for streaming mode... Maybe deflate port is a better way to do streaming.
    
    @qtxie deflate port would not help as the `/part` is meant for case when you are reading some complex data stream where you have for example 4 bytes for uncompressed length, 4 bytes for compressed length and following X bytes, which you want to decompress using information from the 2 lengths. Following other data in the stream, which are not compressed.

--------------------------------------------------------------------------------

On 2021-09-17T06:45:03Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-921541664>

    > Setting up the symbols and using a `compression` context and `compression/known-method?` is straightforward. 
    
    @greggirwin If you are talking about list of supported compression methods. It can be listed under `system/catalog` where it can be under one roof with other data... like supported `checksum` methods. 

--------------------------------------------------------------------------------

On 2021-09-17T19:20:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-922026318>

    I'm all for `system/catalog` as metadata, but I can't say if that makes sense on the R/S side here. I do think that we should do as much in Red as possible, e.g. all non-performance related bits like dispatching. It also opens the possibilities where new catalog entries can be added for FFI elements which may be external.

--------------------------------------------------------------------------------

On 2021-09-28T22:26:34Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-929670155>

    To move this forward, so we can close it out, is everybody OK with the above proposed interface specs for `compress/decompress`? And should `/size` with `gzip` throw an error?

--------------------------------------------------------------------------------

On 2021-09-29T00:02:25Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-929709442>

    I'm OK with that.

--------------------------------------------------------------------------------

On 2021-09-29T07:30:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-929914654>

    1. OK with method argument
    2. Prefer /into over /size as more consistent and more general (e.g. I can read 10 files of 1.44 MB size, sum their decompressed sizes and preallocate, then fill the buffer in a series of decompress calls without extra allocations)

--------------------------------------------------------------------------------

On 2021-09-29T18:07:40Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-930420094>

    If we use `/into`, gzip can use it compatibly, but would still have to expand the buffer if needed.
    
    The only use case I can think of where you'd have 10 compressed files and want to decompress them all into the same buffer is if a file was chunked to begin with, and the chunks were compressed separately to be reassembled later. Ports are a better solution there. But even in @hiiamboris' scenario, for it to have an impact of any kind it would have to be done a _lot_.
    
    While `/into` may be more general, its _main_ purpose is not preallocation, but because you want results to end up in the same series (contextual data). It clarifies that intent, avoiding extra code. In this case, we're also allocating big chunks, not growing series incrementally, which is where you take the big hit if not for preallocation. Still, it _is_ an existing word with a clear meaning. However, it now means the user has to manage it.
    
    (I wrote a lot more here, but it wouldn't have helped much, so I removed it.)
    
    Ultimately, I'm personally biased against `/into` in general. It does have use cases, but I think its benefit doesn't outweigh its complexity (e.g. you have to know where the series insertion point is, which can be an expression itself), it moves the target to the end of the express, and it's used as a premature optimization where it trades off clear meaning. By far the best use case for it IMO is `collect`, and even there I tend not to love it.

--------------------------------------------------------------------------------

On 2021-09-29T18:23:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-930432479>

    Well then `decompress` will become even better use case for `/into`, since we don't want to take that big hit ;)

--------------------------------------------------------------------------------

On 2021-09-29T18:34:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-930440853>

    > for it to have an impact of any kind it would have to be done a lot.
    
    This is a wrong way of thinking about it by the way. I recall recently some guy tried to make an archiver with Red and he hit the max size of data he can handle. Being 32-bit limits us at 4GB roughly, minus compressed size. But *if we do not preallocate* this huge buffer, with our current dumb reallocation strategy we will hit the wall at about 1.3 GB (4 / 3), because when we reach 1.3 GB size we would need to allocate 1.3x2 = 2.6 GB for expansion, copy stuff over, and that just goes a little over 4GB available. But even if we had the smartest algorithm to expand series, our filesize limit would be 2GB, not 4GB. This is a much bigger argument for having preallocation IMO.
    
    Another scenario: if we keep huge amount of data for a long time but use only part of it, we can compress long unused *parts of the series* to free RAM, and then later we may want to decompress those back exactly where they were without the risk of hitting the RAM limit.

--------------------------------------------------------------------------------

On 2021-09-29T19:48:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-930491352>

    > Well then `decompress` will become even better use case for `/into`, since we don't want to take that big hit ;)
    
    Given your scenario, you can still preallocate the full buffer size and append into that, if you know all the original sizes to begin with. You do still take the hit for the internal buffer `decompress` uses of course.

--------------------------------------------------------------------------------

On 2021-09-29T19:57:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-930496730>

    On 1.3GB vs 4GB files, we are currently 32-bit, but won't be forever. I'm optimistic anyway. :^) So, yes, it buys us an incremental increase in the size of data we can handle right now. The long term design is more important to me. So I could say _you're_ thinking about it the wrong way. Or we could say we're coming at it from different priorities.
    
    For the huge data in memory scenario, we'd be better of looking at a clean way to use memory mapped files and let he OS handle all the details.

--------------------------------------------------------------------------------

On 2021-09-29T20:30:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-930520031>

    No matter how you discard RAM-related arguments I can always find more ;)
    E.g. my W10 tends to be crash-happy when I cross the 8GB margin (apparently it uses another 8GB as Video RAM and doesn't like to mix these 2 chunks). Doesn't matter virtual or not. With OS sitting at ~2GB, 2 browsers eating 1GB each and some W10 services (like Desktop Window Manager) *occasionally* eating up to 4GB because they're full of holes, it's always kind of a risk. Now picture me just as a user. If I run a Red program and it crashes the OS, I will likely blame either program, or Red. And that could have been avoided with less neglecting attitude towards memory management. No matter how much RAM we can address, less used is better.

--------------------------------------------------------------------------------

On 2021-09-29T20:41:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-930527326>

    That said, I would rather have series consist of linked chunks than be a continuous buffer to solve this than using `/into`. Some under the hood smarts over an abstraction layer could probably remove the need for `/into` completely. But in the shorter term I see it's usefulness.

--------------------------------------------------------------------------------

On 2021-09-29T20:48:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-930531477>

    > No matter how you discard RAM-related arguments I can always find more ;)
    
    And no matter how many you find, I can probably counter them. :^) So we use `/into`, and now Red is not at fault because it's up to the user to use it correctly. But said user makes a mistake and doesn't allocate or `clear` their buffer in all cases, and since we now want to grow it as needed, it just keeps growing until it has the same problem you describe above. `/into` doesn't solve the problem, it just pushes it around.

--------------------------------------------------------------------------------

On 2021-09-30T02:46:10Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-930705144>

    I think they provide different level of control to the user. When you don't care about speed and memory usage, you don't have to use them. But they will definitely make things complicated. People will use them when it's not necessary, people like to control things, especially newbies. ;-) 
    
    If no `/size`, decompress will first decompress the data with a null buffer to determine the uncompressed size. If the data size is small, we may find it OK to waste some time as it's still quite fast. For big data and in most cases you have the uncompressed size from the containers, that why we introduced `/size`. Be aware when you use `/size`, decompress will not expand the buffer when it's not enough, it will just decompress the exact size of `/size` specified.
    
    For `/into`, it gives control of memory allocation plus all the functions of `/size`. It's OK to replace `/size` with `/into`. But it's harder to use IMHO.
    ```
    ;; Simple case, Using /size
    data: decompress/size compressed-data 'zlib decompressed-size
    
    ;; Simple case, Using /into
    data: make binary! decompressed-size
    decompress/into compressed-data 'zlib data
    
    ;; Advanced case, Using /size
    buffer: make binary! (part-x + part-y + part-z)
    append buffer decompress/size compressed-data-x 'zlib part-x
    append buffer decompress/size compressed-data-y 'zlib part-y
    append buffer decompress/size compressed-data-z 'zlib part-z
    
    ;; Advanced case, Using /into
    buffer: make binary! (part-x + part-y + part-z)
    decompress/into compressed-data-x 'zlib buffer
    decompress/into compressed-data-y 'zlib tail buffer
    decompress/into compressed-data-z 'zlib tail buffer
    ```
    Be aware when you use `/into`, decompress will not expand the buffer when it's not enough, it will stop when the `/into` buffer is full.

--------------------------------------------------------------------------------

On 2021-09-30T06:48:19Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-930867860>

    @qtxie when you do `data: make binary! 1234`, the actual size of the buffer is not `1234`, but more... so how many bytes is decompressed in your `decompress/into` example?
    
    And in the _advanced_ cases,  where is stored the decompression state, when `compressed-data` is just a plane binary? I guess that it is more work for a compression scheme. But neither `read` or `copy` have `/into` for giving target location so there would not be precise control either :-/
    
    I guess that so far we could just keep the `/size`, because that is what is mostly used.

--------------------------------------------------------------------------------

On 2021-09-30T07:26:53Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-930921685>

    > when you do data: make binary! 1234, the actual size of the buffer is not 1234, but more... so how many bytes is decompressed in your decompress/into example?
    
    I should use `decompressed-size` instead. If using arbitrary size, like 1234 , let's say the actual size of the buffer is 1300. If the decompressed data more than 1300 bytes, then just 1300 bytes decompressed. Same rule for `/size` except the size of decompressed data is exactly what you specified, so 1234 bytes decompressed instead of 1300. If the decompressed data less than 1300, let's say 1000, then 1000 bytes decompressed.
    
    The whole point of `/size` is that you already know the size of the decompressed data, same for `/into`. So it's fine if the actual size of the buffer is a bit larger.
    
    The only difference between `/size` and `/into` is who allocate the buffer. `decompress` or the user.
    
    > And in the advanced cases, where is stored the decompression state, when compressed-data is just a plane binary? 
    
    I should use `compressed-data-x/y/z`. Each compressed data is standalone. No need to manage decompression state.

--------------------------------------------------------------------------------

On 2021-09-30T08:40:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-931045919>

    Small size works not like you describe it @qtxie 
    ```
    >> s: append/dup "" 1 100000
    >> length? decompress/zlib compress/zlib s 10
    == 100000
    >> length? decompress/deflate compress/deflate s 10
    == 100000
    ```

--------------------------------------------------------------------------------

On 2021-09-30T08:57:38Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-931080215>

    @hiiamboris I think that we are talking about proposition how it should work and not how it works now. The `/size` now does not limit the number of decompressed bytes.

--------------------------------------------------------------------------------

On 2021-09-30T08:59:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-931085064>

    Any reason to make it limit it?

--------------------------------------------------------------------------------

On 2021-09-30T11:06:10Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-931221265>

    Hmm, the current implementation does more work than I thought. If the buffer was not enough, the underlying `uncompress` function will continue to get the right size then return an error code. In this case, `decompress` will try again with a big enough buffer. So it's even worse than not use `/size`, the first allocation of the buffer is a waste.
    
    I think either the current behavior or the limited one is OK. With current behavior you always get all the decompressed data. With limited size, you can just decompress part of the data. e.g. Decompress the first 100MB out of 1GB data.

--------------------------------------------------------------------------------

On 2021-09-30T11:58:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-931254830>

    If I decompress first 100 MB, what I'm gonna do with this partial data? Or how can I decompress the next 100MB and so on?
    
    If it would be possible to decompress whole data in chunks, RAM would no longer be a problem and that's a win. I'm all for it. But then maybe we can just later create a decompressor *port* instead?

--------------------------------------------------------------------------------

On 2021-09-30T12:41:29Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-931285359>

    @hiiamboris what if I want to decompress just first 1024 bytes to get some metadata and decide, if I want to decompress complete file? For example when I have ZIP archive full of images and I want to get only these, which has exact size. You never know what people may want to do.

--------------------------------------------------------------------------------

On 2021-09-30T13:00:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4960#issuecomment-931298781>

    I'm not very familiar with zip format. Is zip header (and file list) compressed at all? If it is, can't I just `read/part` the header and feed it to `decompress`?

--------------------------------------------------------------------------------

On 2021-09-30T13:06:48Z, Oldes, commented:
<https://github.com/red/red/issues/4960#issuecomment-931304548>

    Each file inside ZIP is compressed separately. You will not find image size inside (zip) file header, but you will find there info, how many bytes have uncompressed/compressed data in this file... you may want to decompress just first few bytes and if you know how, you can parse image type and size of it... anyway, that was just an example, that being able to decompress just part of data may be useful.

--------------------------------------------------------------------------------

On 2021-10-01T00:04:45Z, qtxie, commented:
<https://github.com/red/red/issues/4960#issuecomment-931790116>

    > If it is, can't I just read/part the header and feed it to decompress?
    
    Is the `copy/part` data still valid compressed data?
    
    Great! It crashes the console. 😅 
    ```
    >> decompress/zlib copy/part compress/zlib append/dup "" 1 100000 100 0
    root: 4746/7457, runs: 2, mem: 7754076 => 2548636, mark: 2.1ms, sweep: 5.0ms
    
    *** Runtime Error 1: access violation
    *** in file: /D/EE/QW/red/runtime/crypto.reds
    *** at line: 306
    ***
    ***   stack: red/crypto/adler32 00000000h 9549
    ***   stack: red/zlib-uncompress 00000000h 0103FB7Ch 057B4340h 100
    ***   stack: red/natives/decompress* false 1 -1
    ```

--------------------------------------------------------------------------------

On 2021-10-06T18:55:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-936905411>

    1) I want to keep this simple, and get it done.
    
    2) Being able to decompress just part of data may be useful, but is an advanced use case, as is the `/into` proposal. I think both of those can be better handled with de/compressor ports in the future. Encryption ports should be kept in mind for consistency. 
    
    3) Keeping `/size` gives us a good balance, because we do win big on any container format that includes the size, but it's still simple and easy to use, and we can throw an error if used with `gzip`.
    
    4) If there's no error, always return all the data. 
    
    5) Using the specs I proposed earlier should cover the vast majority of use cases, while avoiding extra complexity and changes right now.
    
    Who wants to make it so?

--------------------------------------------------------------------------------

On 2021-10-06T19:04:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-936920729>

    References to keep in mind:
    
    - https://en.wikipedia.org/wiki/Zip_bomb
    - https://en.wikipedia.org/wiki/List_of_archive_formats#Comparison
    - https://en.wikipedia.org/wiki/BagIt

--------------------------------------------------------------------------------

On 2021-10-12T22:56:46Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-941713795>

    Not related to the interface, but https://gitter.im/red/red?at=61651512ee6c260cf7136e26 @ldci (Francois) noted how slow `decompress` is, and posted sample code. Low priority, but it will be interesting to find out why.

--------------------------------------------------------------------------------

On 2021-10-13T07:29:38Z, rebolek, commented:
<https://github.com/red/red/issues/4960#issuecomment-942006857>

    > I'm not very familiar with zip format. Is zip header (and file list) compressed at all? If it is, can't I just `read/part` the header and feed it to `decompress`?
    
    ZIP format is crazy and the header can be either at the start of the file or at the end of the file or both. 

--------------------------------------------------------------------------------

On 2021-10-13T16:27:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4960#issuecomment-942477674>

    More reference notes, thanks to @qtxie.
    
    The R/S version is ported from this C code:
    https://gist.github.com/vurtun/760a6a2a198b706a7b1a6197aa5ac747
    
    We can compare the C version with zlib, then we know how much is the C version slower than zlib.
    
    The R/S deflate use static Huffman tree encoding only. If using dynamic tree as zlib, it should be much slower. But the compression ration should be much better.

