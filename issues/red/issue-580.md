
#580: insert/part & append/part to index broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/580>

red>> b: next a: [1 2 3]
== [2 3]
red>> append/part c: [] a b
== [1 2]
red>> c
== [1 2]
red>> b: next a: "123"
== "23"
red>> append/part c: "" a b
== "12"
red>> c
== "12"

In other cases the deviation is more than one position.



Comments:
--------------------------------------------------------------------------------

On 2013-11-27T20:36:12Z, iArnold, commented:
<https://github.com/red/red/issues/580#issuecomment-29418091>

    I tried this too. Is this not just exactly what it should do? 

--------------------------------------------------------------------------------

On 2013-11-28T23:10:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/580#issuecomment-29488816>

    No. R3:
    
    > > b: next a: [1 2 3]
    > > == [2 3]
    > > append/part c: [] a b 
    > > == [1]
    > > c
    > > == [1]
    > > 
    > > b: next a: "123"  
    > > == "23"
    > > append/part c: "" a b 
    > > == "1"
    > > c
    > > == "1"

--------------------------------------------------------------------------------

On 2013-11-29T22:11:32Z, iArnold, commented:
<https://github.com/red/red/issues/580#issuecomment-29539493>

    Posted a reply on the mailinglist. What I found is that the index? of b seems to be the determining part, not the value of b at that index. So issue is very valid indeed.

--------------------------------------------------------------------------------

On 2013-11-30T21:03:37Z, iArnold, commented:
<https://github.com/red/red/issues/580#issuecomment-29560988>

    Additional testing maybe the results are helpfull:
    
    -=== Red Console alpha version ===-
    (only ASCII input supported)
    red>> a: [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    == [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    red>> b: [12 3 6]
    == [12 3 6]
    red>> append/part c: [] a b
    == [1]
    red>> c
    == [1]
    red>> b
    == [12 3 6]
    red>> a
    == [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    red>>
    And also this result is not in line with my expectation:
    red>> a
    == [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    red>> b: [3 11 5]
    == [3 11 5]
    red>> b: next b
    == [11 5]
    red>> append/part c: [] a b
    == [1 2]
    red>> c
    == [1 2]
    red>> b: next b
    == [5]
    red>> append/part c: [] a b
    == [1 2 3]
    red>>
    
    Now it looks as if the index? value of b is the reference.
    (red-28nov13-1989757.exe)

--------------------------------------------------------------------------------

On 2016-05-12T15:12:28Z, iArnold, commented:
<https://github.com/red/red/issues/580#issuecomment-218788402>

    I cannot find any use of the series (let alone pair!) in R3 documentation. Testing some more on try,rebol.nl
    a: [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    b: next next a
    append/part c: [] a b
    Has a result in R3
    a: [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16]
    b: [12 3 6]
    append/part c: [] a b
    Also fails for R3. 
    So 
    a. I wonder what it should do
    b. Wonder who will use it (and what for) 
    c. there will be a workaround for such a use case.
    d. It is R3 functionality, not even R2, and on top of all
    e. it is afaiac undocumented.
    
    ?

