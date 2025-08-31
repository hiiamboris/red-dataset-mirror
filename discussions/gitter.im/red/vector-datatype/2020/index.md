# Archived messages from: [gitter.im/red/red/vector-datatype](/gitter.im/red/red/vector-datatype/) from year: 2020

## Monday 20th January, 2020

Oldes

[16:55](#msg5e25db8f1e4b0e69d082838b)What would be the best syntax for changing vector type without need to traverse all values?

[16:56](#msg5e25dbc360ffd038abcd7006)I mean... when I have 32 bit integers in vector, but need to convert it to 16 bit.

[17:10](#msg5e25df23a33d6607d57927c8)Let's have:

```
v: make vector! [integer! 16 [0 0 0 0 0]]
```

Could we have this available?

```
>> v/size
== 16
>> v/size: 32
== 32
>> v
== make vector! [integer! 32 [0 0 0 0 0]]
```

## Tuesday 21st January, 2020

rebolek

[09:10](#msg5e26c00a075a19397cddfc62)@Oldes what it would do with unsupported values? Most 32bit integers won’t fit into 16bits.

Oldes

[09:12](#msg5e26c0883b40ea043c76a53f)Crop or use max number instead.

[09:13](#msg5e26c0c9364db33faa07d359)My use case is that I have 16 bit integers in vector data and need 32 bit for better precision.

[09:15](#msg5e26c13069a7b51d4d5652db)Of course that I can traverse all values and insert these into a new vector, but these are steps which could be handled by runtime for me.

rebolek

[09:16](#msg5e26c1843b40ea043c76ab5f)I understand. You probably should write \[REP](https://github.com/red/red/wiki/%5BDOC%5D-Red-Enhancement-Proposal-Process) for it, I think it may be an useful feature.

Oldes

[09:17](#msg5e26c18fb674071d4ecce437)Anyway.. the more I work with vectors, I'm not feeling good with its syntax.

[09:18](#msg5e26c1ea62d24d60f1fb41dd)I would really like to figure out some more compact form :-(

[09:21](#msg5e26c281258edf397bbee5ec)The best what I can imagine so far is something like:

```
#[ui8! [0 0 0 0]]
#[si8! [0 0 0 0]]
#[ui16! [0 0 0 0]]
#[si16! [0 0 0 0]]
#[ui32! [0 0 0 0]]
#[si32! [0 0 0 0]]
#[f16! [0.0 0.0]]
#[f32! [0.0 0.0]]
```

rebolek

[09:21](#msg5e26c2b2b674071d4eccee63)hm

Oldes

[10:18](#msg5e26d00b342e1054d0599c0c)Problem is, that there maybe other types in the vector, so something like this would be also necessary:

```
#[vector! percent! 64 [0% 0%]]
```

## Wednesday 22nd January, 2020

greggirwin

[03:30](#msg5e27c1d76b64bc54d12c8722)What is the goal of the more compact form?

pekr

[05:25](#msg5e27dcae78472574f45e9f59)Being the Rebol way? :-)

Oldes

[08:21](#msg5e280610342e1054d06234e9)I never liked the `make` constructs and for vector it is super ugly.. especially when you add unsigned word.. which Red does not support yet.

[08:57](#msg5e280e9169a7b51d4d5f7112)Another thing I would like to see in vector construction is use of get-word/get-path datatypes.. so instead of:

```
make vector! reduce ['integer! wav/bits wav/data]
```

I could write just:

```
make vector! [integer! :wav/bits :wav/data]
```

greggirwin

[17:59](#msg5e288d9c45c0577cffaeed71)@Oldes may I ask what, specifically, is ugly about it to you? And since I haven't used vectors in real work, what are the best examples I should look at to see the notation in use?

Oldes

[18:15](#msg5e28914d075a19397ceb0bc4)I don't like like molding it does not evoke that result is a single value, but piece of code instead. That is related to all `make *** [...]` results.

[18:16](#msg5e28917f3b40ea043c837576)I don't have any real Red code as for me Red's vector is not mature enough.

[18:19](#msg5e28921c78472574f463ec7f)I think it is fine to have current `make` dialect with little extensions like the one above, but I would also like to have more compact results.

[18:28](#msg5e28943569a7b51d4d6349ac)If I would talk also about R3's implementation (where is also available to use `unsigned` types), I found confusing, that I can write:

```
>> make vector! [unsigned integer! 32 4]
== make vector! [unsigned integer! 32 4 [0 0 0 0]]
```

But not: `make vector! [signed integer! 32 4]`

[18:29](#msg5e28949378472574f4640496)For using compact forms, I believe, that this looks better:

```
cam-Position: #[f32! [4.0 3.0 3.0]] ;Camera is at (4,3,3), in World Space
cam-Target:   #[f32! [0.0 0.0 0.0]] ;and looks at the origin
cam-Head:     #[f32! [0.0 1.0 0.0]] ;Head is up
```

than:

```
cam-Position: make vector! [float! 32 [4.0 3.0 3.0]] ;Camera is at (4,3,3), in World Space
cam-Target:   make vector! [float! 32 [0.0 0.0 0.0]] ;and looks at the origin
cam-Head:     make vector! [float! 32 [0.0 1.0 0.0]] ;Head is up
```

[18:31](#msg5e2895169797b560f2d021e0)To have Red's vector usable for my needs, it would have to support conversions from/to binary data.

greggirwin

[19:26](#msg5e28a1e978472574f4646bec)My question is: Does Red need to support this new syntax? Why not use a helper func?

Oldes

[20:35](#msg5e28b2193b40ea043c847483)And my question is, if Red will support construction syntax, like `#[string! "foo"]` in Rebol? I suppose that it will, and than why not to use it?

[20:36](#msg5e28b2579797b560f2d0ed57)Btw.. what name these helper functions should have?

## Thursday 23th January, 2020

greggirwin

[02:18](#msg5e290289364db33faa17ebfd)Construction syntax is fine, and would likely look like your example above: `#[vector! percent! 64 [0% 0%]]`

If they are helper functions, you can use your short names. It just means they're not standard in Red. Make it a vector dialect even. It can always considered for standardization later.

henrikmk

[06:19](#msg5e293aef3b40ea043c882836)@Oldes you mean that it should support construction syntax better than REBOL does. Things like #\[word! "myword"] aren't possible, neither in R2 nor R3, which is quite inconvenient, when trying to convert objects to and from JSON.

greggirwin

[17:53](#msg5e29dd86a420263e038828ac)Red has a standard JSON codec, so you shouldn't have to worry about that particular use case.

## Thursday 30th January, 2020

Oldes

[16:13](#msg5e3300c158f02e34974adb9c)I'm studying how Julia deals with vectors (arrays) and it seems to convert type of values with each math operation into the largest type and creates a copy of the vector:

```
julia> v = Array{Int8}([1 2])
1×2 Array{Int8,2}:
 1  2

julia> v .+ 2
1×2 Array{Int64,2}:
 3  4

julia> v
1×2 Array{Int8,2}:
 1  2
```

[16:17](#msg5e3301b158f02e34974ae2c8)But it looks they have special operator for modification..:

```
julia> v .+= 2
1×2 Array{Int8,2}:
 3  4

julia> v
1×2 Array{Int8,2}:
 3  4
```
