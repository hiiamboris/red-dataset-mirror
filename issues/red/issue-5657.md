# Issue #5657: `mold` of `binary!` doesn't respect indentation
<https://github.com/red/red/issues/5657>

**Describe the bug**
```
>> probe new-line/all reduce [append/dup #{} 1 40 append/dup #{} 2 30] on ()
[
    #{
0101010101010101010101010101010101010101010101010101010101010101        ;) <- what happened here?
0101010101010101
}
    #{020202020202020202020202020202020202020202020202020202020202}
]

>> probe new-line/all reduce [new-line/all reduce [new-line/all reduce [append/dup #{} 1 40 append/dup #{} 2 30] on] on] on ()
[
    [
        [
            #{
0101010101010101010101010101010101010101010101010101010101010101        ;) no matter the level
0101010101010101
}
            #{020202020202020202020202020202020202020202020202020202020202}
        ]
    ]
]
```
Also with images:
```
>> probe make image! reduce [4x4 append/dup #{} 1 16 * 3 append/dup #{} 2 16] ()
make image! [4x4 #{
    010101010101010101010101010101010101010101010101010101010101
    010101010101010101010101010101010101
    } #{
02020202020202020202                            ;) <- this part has drawn our attention
020202020202}]
>> probe new-line/all reduce [make image! reduce [4x4 append/dup #{} 1 16 * 3 append/dup #{} 2 16]] on ()
[
    make image! [4x4 #{
        010101010101010101010101010101010101010101010101010101010101
        010101010101010101010101010101010101
        } #{                                    ;) <- this part is too much indented
02020202020202020202                            ;) <- this part is very badly looking
020202020202}]
]
```

**To reproduce**
```
probe new-line/all reduce [append/dup #{} 1 40 append/dup #{} 2 30] on ()
probe make image! reduce [4x4 append/dup #{} 1 16 * 3 append/dup #{} 2 16] ()
```

**Expected behavior**

Human readable and consistent indentation.

**Platform version**
```
Red 0.6.6 for Windows built 9-Sep-2025/3:21:04+08:00  commit #c8b6ebc
```



## dockimbel on 2025-10-13T09:26:36Z
It seems that behavior was reproduced from both R2 and R3. I see no good reason why not to indent in such case, but maybe there was an historical rationale for that? Maybe a copy/paste to/from shell/Rebol console constraint/optimization? @greggirwin 


## hiiamboris on 2025-10-13T11:45:50Z
@Oldes I confirm it's in R3 as well. Slightly different for images, not better.


## Oldes on 2025-10-13T13:19:54Z
I wonder what your requested result looks like. I believe it is the way it is for historical reasons. Back when terminals had no more than 80 columns, and seeing binaries with indentation in deeply nested blocks could look even worse due to automatic line wrapping.


## Oldes on 2025-10-13T13:26:14Z
Reason for the image output is, that there are 10 pixels per line (30 bytes for the RGB part and 10 for alpha). 


## hiiamboris on 2025-10-13T15:12:15Z
> I wonder what your requested result looks like. I believe it is the way it is for historical reasons. Back when terminals had no more than 80 columns, and seeing binaries with indentation in deeply nested blocks could look even worse due to automatic line wrapping.

That indeed makes sense: when enforced everywhere and for 4-byte values (though I doubt looking at image pixels in hex dump is very efficient anyway...). Not for our time though.

We may still maintain the 10px per row limit, so that it'll be easier to locate i-th pixel by looking at the i/10-th line. Though for less than 10px wide images we could take their pixel width as limit.

Then my expected image output will be:
```
>> probe new-line/all reduce [make image! reduce [4x4 append/dup #{} 1 16 * 3 append/dup #{} 2 16]] on ()
[
    make image! [4x4 #{
        010101010101010101010101010101010101010101010101010101010101    ;) 010101 * 10
        010101010101010101010101010101010101
    } #{
        02020202020202020202                                            ;) 02 * 10
        020202020202
    }]
]
```
Or:
```
[
    make image! [4x4 #{
        010101010101010101010101
        010101010101010101010101
        010101010101010101010101
        010101010101010101010101
    } #{
        02020202
        02020202
        02020202
        02020202
    }]
]
```
For binaries I'd rather have a pretty 4x4x2 format (I think it was proposed somewhere already):
```
>> >> probe new-line/all reduce [append/dup #{} 1 40 append/dup #{} 2 30] on ()
[
    #{
        01010101 01010101 01010101 01010101  01010101 01010101 01010101 01010101    ;) 32 bytes
        01010101 01010101
    }
    #{020202020202020202020202020202020202020202020202020202020202}    ;) single line may be unspaced
]
```


## Oldes on 2025-10-14T14:42:37Z
I prefer to have the large binary blobs without indentation (for example when I was looking on @hiiamboris examples in email on my phone, the output was completely broken because of automatic line breaks).

Anyway.. if you now have indented 16bit binary output, you should indent other binary types (2bit and 64bit) as well... at least once `system/options/binary-base` will have some effect on console output in Red.


## hiiamboris on 2025-10-14T18:14:47Z
Good point about base. Though if you prefer it without inside indentation, I doubt you're really trying to make out any pixels in the binary output :) And then what is it dumped for?


## dockimbel on 2025-10-14T21:48:45Z
Is `system/options/binary-base` really worth supporting? I never used it so far in R2 nor R3. Beyond that use-case, there's no direct way to `mold` a binary! series to any other base than 16.


## Oldes on 2025-10-15T06:10:06Z
The binary base is used in Rebol to make scripts with included binary values smaller. It is used for example in the source pre-processor (`prebol`), which collects all scripts into a one. To make scripts small was also the reason, why there was no indentation. As Red is using `redbin` binary format for this purpose, the option is not so needed.

It was used also when transmitting content in a textual form... like in this script:
http://www.rebol.org/view-script.r?script=mailfilescomp.r 
or this:
http://www.rebol.org/view-script.r?script=rbbs.r


