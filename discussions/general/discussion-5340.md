URL: <https://github.com/red/red/discussions/5340>
Date created: 2023-06-23T15:16:04Z

# Extending Extract function

What do you think about extending the `extract` function to extract a part of the series.
Currently it extracts _one column_:

```red
b: [
    1 2 3 4
    5 6 7 8
    A B C D
    E F G H
]

new-line/all (extract/index b 4 2) on
== [
    2
    6
    B
    F
]
```

It would be nice if we can extract more columns:

```red
new-line/all/skip (x/index/part b 4 2 2) on 2
== [
    2 3
    6 7
    B C
    F G
]
```

Here is the extended version:

```red
x: func [
    {Extracts values from a series at regular intervals} 
    series [series!] 
    width [integer!] "Size of each entry (the skip)" 
    /index "Extract from an offset position" 
    pos [integer!] "The position" 
    /into {Provide an output series instead of creating a new one} 
    output [series!] "Output series"
    /part "Extract more values"
    prt [integer!] "Number of values to be extracted"
][
    width: max 1 width 
    if pos [series: at series pos] 
    prt: any [prt 1]
    unless into [output: make series (length? series) * prt / width] 
    while [not tail? series] [
        append output copy/part series prt
        series: skip series width
    ] 
    output
]
```

## Comments

### hiiamboris commented at 2023-06-23T15:20:48Z:

https://github.com/red/REP/issues/95

### hiiamboris commented at 2023-06-23T15:27:28Z:

Personally I've no idea why current version even has /index refinement. You've got `skip`/`at` actions for that.

### hiiamboris commented at 2023-06-23T15:35:59Z:

/part is a misnomer, it should be understood as "limit extraction to given region"
/width from the REP is acceptable

### hiiamboris commented at 2023-06-23T15:41:38Z:

I also propose tightening the loop using copy/part pair argument:
```
extract: function [
    "Extracts values from a series at regular intervals"
    series [series!] 
    size   [integer!] "Number of columns in each series row (the skip)" 
    /into "Provide an output series instead of creating a new one" 
	    output [series!] "Output series"
    /width "Extract more values"
    	cols [integer!] "Number of consecutive columns to extract"
][
    size:   max 1 size 
    cols:   any [cols 1]
    count:  round/ceiling/to (length? series) / size 1
    output: any [output make series count * cols] 
    slice:  1 - size + as-pair 0 cols
    loop count [append output copy/part series slice: slice + size]
]
```

### greggirwin commented at 2023-06-25T19:21:53Z:

Should there be `/width + cols` as an option, or should a general refinement be either a single value or all values up to the next skip interval, with no optional `cols` param? Otherwise you can do things like this by mistake:
```
blk: [1 2 3 4 5 6 7 8 9 10]
extract/width blk 2 4
; == [1 2 3 4 3 4 5 6 5 6 7 8 7 8 9 10 9 10]
```
You can fix that with a `max` check against `size`, or should that be an error?

And once we can get multiple values, do we want `/only` support?

I don't remember if `extract` was part of @hiiamboris HOF analysis, but it may have been. It's a relatively common func from my old R2 notes, but isn't used in the Red code base hardly at all.

