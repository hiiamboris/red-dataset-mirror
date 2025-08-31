
#3195: set operations do not work as expected with block elements
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.built] [type.review] [test.written]
<https://github.com/red/red/issues/3195>

### Expected behavior
```Red
>> difference [[1][2]] [[1]]
== [[2]]
>> exclude [[1]] [[1]]
== []
>> intersect [[1][2]] [[1]]
== [[1]]
>> unique [[1][1]]
== [[1]]
```

### Actual behavior
```Red
>> difference [[1][2]] [[1]]
== [[1] [2] [1]]
>> exclude [[1]] [[1]]
== [[1]]
>> intersect [[1][2]] [[1]]
== []
>> unique [[1][1]]
== [[1] [1]]
```
### Steps to reproduce the problem
Play around with set operations (see all of them with `? "data set"`). `union` seems to work as expected. Moreover, I think this bug applies not only to `block!` elements, but also to `map!` and `object!` (I understand that it might not be intended to use them as elements of sets, but anyway), and perhaps some other `series!`.

### Red version and build date, operating system with version.
Same on Linux version.
```Red
>> about
Red for Windows version 0.6.3 built 10-Jan-2018/23:14:39+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-01-10T18:24:38Z, 9214, commented:
<https://github.com/red/red/issues/3195#issuecomment-356691632>

    I actually think that this is an expected behavior, since set operations check whenever all series-like elements are *actually* same series (i.e. reference the same underlying buffer):
    ```Red
    >> x: [1 2 3]
    == [1 2 3]
    >> unique reduce [x x]
    == [[1 2 3]]
    ```

--------------------------------------------------------------------------------

On 2018-01-10T20:18:20Z, Phryxe, commented:
<https://github.com/red/red/issues/3195#issuecomment-356723872>

    Don't you mean expected behavior of `intersect` to be?
    ```
    >> intersect [[1][2]] [[1]]
    == [[1]]
    ```

--------------------------------------------------------------------------------

On 2018-01-10T20:33:20Z, Phryxe, commented:
<https://github.com/red/red/issues/3195#issuecomment-356727776>

    Also compare this actual behavior
    ```
    >> intersect [[1][2][3]][[3][4][5]]
    == []
    >> intersect [[1][2][3]] [[3][4][5]]
    == []
    >> intersect [[1] [2] [3]] [[3] [4] [5]]
    == [[3]]
    ```
    Above code is copied straight from the console. Tried this later, but wasn't able to reproduce the correct result `[[3]]`. They were all empty.

--------------------------------------------------------------------------------

On 2018-01-10T22:46:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3195#issuecomment-356763244>

    I get the result above the first time I run it. Empty result if I just do the last line again. Then I did it in another fresh console, and got all empty results. 

--------------------------------------------------------------------------------

On 2018-01-11T01:39:44Z, gltewalt, commented:
<https://github.com/red/red/issues/3195#issuecomment-356796641>

    Probably only expected behavior if the choice was to diverge from Rebol2
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> difference [[1][2]] [[1]]
    == [[2]]
    >> exclude [[1]] [[1]]
    == []
    >> intersect [[1][2]] [[1]]
    == [[1]]
    >> unique [[1][1]]
    == [[1]]
    ```

--------------------------------------------------------------------------------

On 2018-01-17T00:15:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3195#issuecomment-358151614>

    If this is a show-stopper for you, I have some mezzanine set funcs at https://gist.github.com/greggirwin/e579c08410497b9f9ba3b9978fa45347

--------------------------------------------------------------------------------

On 2020-07-14T13:44:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/3195#issuecomment-658187734>

    Results are still random:
    ```
    >> intersect [[1][2][3]][[3][4][5]]
    == []
    >> intersect [[1][2][3]][[3][4][5]]
    == []
    >> intersect [[1][2][3]][[3][4][5]]
    == [[3]]
    >> intersect [[1][2][3]][[3][4][5]]
    == [[3]]
    >> intersect [[1][2][3]][[3][4][5]]
    == [[3]]
    >> intersect [[1][2][3]][[3][4][5]]
    == [[3]]
    >> intersect [[1][2][3]][[3][4][5]]
    == []
    ```
    
    ```
    >> recycle/off
    >> len: [0 0 0 0 0] ()
    >> loop 100000 [i: length? r: intersect copy/deep [[1][2][3][4][5]] copy/deep [[3][4][5][6][7]] len/(i + 1): len/(i + 1) + 1]
    == 42390
    >> len
    == [42312 42390 13876 1422 0]
    ```
    Expected: `len == [100000 0 0 0 0]` in current implementation, `[0 0 0 100000 0]` in the one proposed.
    
    I think it's either a set-ops bug or hashtable bug.
    
    I'll open a different issue though, as this one is about design.
    

--------------------------------------------------------------------------------

On 2020-10-30T08:04:05Z, qtxie, commented:
<https://github.com/red/red/issues/3195#issuecomment-719385753>

    Achieve the same behaviors as Rebol2 in commit b28e0d687d610d00c26acf0424a93831baf5e8c2.

