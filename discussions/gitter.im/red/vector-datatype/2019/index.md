# Archived messages from: [gitter.im/red/red/vector-datatype](/gitter.im/red/red/vector-datatype/) from year: 2019

## Tuesday 15th January, 2019

greggirwin

[21:24](#msg5c3e4f78f780a1521f16e879)Recent chat in red/bugs on vector/binary conversions. Starting \[here](https://gitter.im/red/bugs?at=5c3dbd1a95e17b452554e309)

Oldes

[22:36](#msg5c3e605420b78635b62c7242)The `length` value in the vector's `make` DSL looks useless when used with init series data. What if it would be used as `/part`?  
Now it is:

```
>> make vector! [integer! 16 2 [1 2 3]]
== make vector! [integer! 16 [1 2 3]]
```

Would not be this more useful?

```
>> make vector! [integer! 16 2 [1 2 3]]
== make vector! [integer! 16 [1 2]]
```

[22:42](#msg5c3e61c80999400604f8f1ba)Also although I initially didn't liked that the size is visible in R3, I start to think, that it may be useful when large vectors are in an object and you want to see its length in console... imagine:

```
ids: object [
	sounds: make vector! [integer! 16 1000]
	images: make vector! [integer! 16 1000]
]
? ids
```

Now it shows:

```
IDS is an object! with the following words and values:
     sounds  vector!       make vector! [integer! 16 [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
     images  vector!       make vector! [integer! 16 [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
```

So one don't see actual number of sound and image ids stored in `vector`.

greggirwin

[23:10](#msg5c3e68751cb70a372ae523ae)Shouldn't be hard to add that. `form-value` in the `help` code just needs a case added to handle it.

## Wednesday 16th January, 2019

Oldes

[06:32](#msg5c3ecff1c45b986d116aeb5e)It's not only about help... you get truncated output from prompt too.

endo64

[06:37](#msg5c3ed10d8ce4bb25b8bc42f4)&gt; The `length` value in the vector's `make` DSL looks useless when used with init series data. What if it would be used as `/part`?

@Oldes it is useful as it extends/initialize the vector, I do think it is better extending instead of truncating:

```
>> make vector! [integer! 16 5 [1]]
== make vector! [integer! 16 [1 0 0 0 0]]
```

Oldes

[06:57](#msg5c3ed5e3dab15872cea0a635)I know.. and I think it could also truncate and avoid user need to use `copy/part` when want just part of the input block to be converted. Not that it is something usual.

## Tuesday 22nd January, 2019

Oldes

[22:24](#msg5c47981620b78635b667dc9d)Is there any proposition how could look multidimensional vector?

[22:26](#msg5c479884ba355012a47ff13a)Or maybe... is it bad idea to be able set new-line info where one could specify how many values can be on line when the vector is \_molded\_?

endo64

[22:28](#msg5c479927cb47ec30008723c2)&gt; Is there any proposition how could look multidimensional vector?

I don't think so.

greggirwin

[22:43](#msg5c479c94f780a1521f523ae0)The `mold` aspect seems like something to do at the user level.

When I worked on Ren, I thought about extending `pair!` to `point!` to have more values, but Doc didn't like it. Allowing decimal values in pairs, and more coordinates, isn't as readable. But a vector syntax could use something like that for dimensions.

## Wednesday 23th January, 2019

Oldes

[11:31](#msg5c485091cb47ec30008bbce4)Hm... there are no plans to support decimal `pair!` in Red?

rebolek

[11:32](#msg5c4850d9831899452435aee9)AFAIK @dockimbel said he doesn't like current decimal pair syntax, but not that there won't be decimal pair at all.

Oldes

[11:41](#msg5c4852d695e17b4525987364)The thing I'm trying to solve now is, that I have such a data:

```
make object! [
    points: make vector! [float! 64 [
        375.0 128.0 234.0 269.0 383.0 397.0 398.0 103.0 377.0 346.0
        262.0 304.0 388.0 18.0 202.0 387.0 393.0 69.0 341.0 37.0
        14.0 102.0 1.0 191.0 127.0 148.0 144.0 378.0 273.0 266.0
    ]]
    edges: make vector! [integer! 32 [
        11 10 10 12 12 11 10 9 9 12
        12 13 13 11 7 13 13 1 1 7
        1 5 5 7 1 14 14 5 12 1
        5 2 2 7 12 14 9 6 6 8
        8 9 10 6 8 0 0 9 3 8
        6 3 3 0 14 0 0 4 4 14
        12 0 5 4 4 2 3 4 3 2
    ]]
    triangles: none
]
```

And want to visualise it. In this case, points could be `integer`, but in more complex cases these can be decimals.

rebolek

[11:43](#msg5c48536c1cb70a372a241ccb)I see. Right now you unfortunately need to round to integers (or do some transformation with `scale` in Draw).

Oldes

[11:47](#msg5c48544120b78635b66c7889)Looks that easier will be to forget `vector` type for now and get `pairs` like:

```
points: copy [] foreach [x y] o/points [ append points as-pair x y ]
```

greggirwin

[21:46](#msg5c48e09995e17b45259c746a)These are good use cases to know about, though, for design consideration.

## Tuesday 12nd March, 2019

gxlong1983

[07:45](#msg5c8763a7e527821f0a449ac5)hi everyone

rebolek

[07:46](#msg5c8763ba1c18c82b3cf9a3bc)hi

gxlong1983

[07:46](#msg5c8763e8d3b35423cba5e689)Why can the context in the {} be added after the “val io = new DCCIssueIO”?

rebolek

[07:47](#msg5c87641e0a6b91516316b5e0)There's no such thing in Red language.

gxlong1983

[07:49](#msg5c87646ff895944c087f0e07)Sorry, I should go to the gitter of chisel group. Thanks

rebolek

[07:49](#msg5c8764821c18c82b3cf9a954)No problem, good luck!

## Wednesday 9th October, 2019

djrondon

[13:36](#msg5d9de25292920c36a13bfd35)Folks, I was looking at load/csv and JSON, for Data Science. Will Red have all the libraries for data science like python using pandas, numpy, seaborn, etc? Do you have this at the Milestones? I think interfaces with TensorFlow2.0 would be good or interfaces to run using Jupyter Notebook such as R has with Jupyter.  
Don't you think ?  
I'm using red but calling other interfaces to connect to elasticsearch, mongodb, solr and processing all data using R or Python, it would be great If we could have everythin just using Red.  
What are the plans for Red for DataScience and Machine Learning ?  
Is there anybody implementing algorithms such as linear regression, logistic regression, decision trees, random forest, neural networks, NLP, etc ?

rebolek

[13:46](#msg5d9de4a3eac5612d22e149c1)Aren't those Python libs user-contributed?

djrondon

[22:39](#msg5d9e61b7fcf7602cc55fc298)https://github.com/pandas-dev/pandas

[22:40](#msg5d9e61ca0459254672231a43)https://github.com/jupyter/notebook

## Sunday 13th October, 2019

greggirwin

[22:08](#msg5da3a06d894dee56e539f48c)@djrondon data science modules will come from the community, with help from, or even starting ideas, from Team Red. We don't have the resources to build them all, and they need to be optional. A Data Science wiki page, where we can make notes, list projects like Pandas to learn from, and sketch out ideas would be great. Knowing real users needs is the most important thing, and it sounds like you're a good fit to start that.

## Thursday 17th October, 2019

SmackMacDougal

[22:57](#msg5da8f1ef2d59854e7f204790)&gt; @djrondon data science modules will come from the community, with help from, or even starting ideas, from Team Red...

Funny you mention that @greggirwin. I wrote this in chit-chat after discovering that gitter/red room (channel).

Here is one idea of mine: \[R to Red Transpiler Project](https://gitter.im/red/chit-chat?at=5da8ea6b2d59854e7f201298)
