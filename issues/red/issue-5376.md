
#5376: Wish: `random` should accept `hash!` series
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/5376>

**Describe the bug**

Looks like support was never added?
```
>> random/only make hash! [1 2 3]
*** Script Error: random does not allow hash! for its value argument
*** Where: random
*** Near : random/only make hash! [1 2 3]
*** Stack:  

>> random make hash! [1 2 3]
*** Script Error: random does not allow hash! for its value argument
*** Where: random
*** Near : random make hash! [1 2 3]
*** Stack:  
```

**Expected behavior**

As with blocks.

**Platform version**

`Red 0.6.4 for Windows built 1-Sep-2023/19:17:00+03:00  commit #8fa47cf`



Comments:
--------------------------------------------------------------------------------

On 2023-09-02T13:00:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5376#issuecomment-1703826583>

    That implies rebuilding the whole hash, so just randomize the block from which the hash is built or convert back to a block, randomize, then convert back to an hash. Moreover, the use-cases are so rare that it's not worth supporting it in the standard library.

--------------------------------------------------------------------------------

On 2023-09-02T14:02:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5376#issuecomment-1703842757>

    I agree for `random` itself, but it makes total sense to support `random/only`.

--------------------------------------------------------------------------------

On 2023-09-02T14:17:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5376#issuecomment-1703846155>

    Not worth supporting it if general `random` is not needed. Very simple alternative exists:
    
    ```
    >> pick make hash! [1 2 3 4 5] random 5
    == 3
    >> pick make hash! [1 2 3 4 5] random 5
    == 1
    >> pick make hash! [1 2 3 4 5] random 5
    == 2
    ```
    
    The `/only` refinement is just an handy shortcut to `pick <series> random <value>` afterall.

--------------------------------------------------------------------------------

On 2023-09-02T23:11:39Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5376#issuecomment-1703960954>

    I would add my 2 cents
    
    I have tested it: `pick [...1000 hashed keys...] random 1000` takes about half of the computation time in simple strict loop selection of 20 millions items so composed:
    * the whole loop with 20 million `select` using the randomized Key obtained takes 9.5 seconds, 
    
    * the `loop` with the pick ... random... code alone repeated 20 million times takes  0:00:04 seconds.
    
    * the `select` alone takes 3,5 seconds
    
    * 0,5 + 1,5 seconds are consumed by the empty `loop` and a conditional `if`
    
    The support for `hash!` in `random/only` could help in such randomized key selection and everywhere a random value in a block could be needed fast.
    
    This is the needing arose from coding the speed test. 
    
    To you if you wish to implement it in your language
    

--------------------------------------------------------------------------------

On 2023-09-05T09:27:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5376#issuecomment-1706265865>

    @GiuseppeChillemi That's irrevelant. Both your testing method and results are flawed. If one had a real need for such feature in a specific benchmark test, he could just write a routine to cover it.

--------------------------------------------------------------------------------

On 2023-09-05T17:08:13Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5376#issuecomment-1706994812>

    Why you think they are flawed? Where is the mistake(s)?

--------------------------------------------------------------------------------

On 2023-09-07T12:36:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5376#issuecomment-1710078090>

    You lack enough knowledge and understanding about basic datastructures, algorithmic time complexity and reliable testing methods in order to make any relevant benchmarking in that area.
    
    Here are some examples of flaws:
    
    > It is clear that hashed blocks and paths have some kind of cache. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$I14hP-OXM2MmF_dM3pKG5wNTM9YHt-lMP8HwUh8DWdY?via=gitter.im&via=matrix.org&via=tchncs.de))
    
    No they don't and there's nothing in the test results that suggests that, so it cannot be "clear" at all. Your lack of testing methodology and knowledge about the properties of hashtables are the issues there.
    
    > It is also clear that when looping instructions are used, times skyrockets. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$I14hP-OXM2MmF_dM3pKG5wNTM9YHt-lMP8HwUh8DWdY?via=gitter.im&via=matrix.org&via=tchncs.de))
    
    Comparing an hashtable lookup implemented at native level, with a linear search at mezz level... That's like comparing oranges to lemon trees... You have no clue what you are doing there and the value of such test is zero, as it provides no new information at all to anyone with basic knowledge about datastructures, complexity, ...
    
    > To make the cache unuseful I have added a randomized key selection with 1000 random keys in the pool selecting on object with 500.000 keys. 
    
    There is no cache and the lookups order has no effect on the performance of the hashtable, so that test is useless. Again, your ignorance about basic datastructures properties shows here.
    
    > 20 milion selection in 9 seconds. About 1 every 4,5*1e-10 seconds if I have calculated correctly. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$Q5jqWolfO6epz4HCth0iRGaDHXiQxdRpL4xg9Rp705o?via=gitter.im&via=matrix.org&via=tchncs.de))
    
    Well, you haven't...
    ```
    >> 9 / 20e6
    == 4.5e-7
    ```
    
    > I think when we will have the optimization backend, all these number will change. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$I14hP-OXM2MmF_dM3pKG5wNTM9YHt-lMP8HwUh8DWdY?via=gitter.im&via=matrix.org&via=tchncs.de))
    
    That conclusion has the same level of information as "I think when we will have a new weather tomorrow, all the measured temperatures will change.".

--------------------------------------------------------------------------------

On 2023-09-07T20:51:10Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5376#issuecomment-1710755650>

    > > It is clear that hashed blocks and paths have some kind of cache. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$I14hP-OXM2MmF_dM3pKG5wNTM9YHt-lMP8HwUh8DWdY?via=gitter.im&via=matrix.org&via=tchncs.de))
    > 
    > No they don't and there's nothing in the test results that suggests that, so it cannot be "clear" at all. Your lack of testing methodology and knowledge about the properties of hashtables are the issues there.
    
     .....
     > Comparing an hashtable lookup implemented at native level, with a linear search at mezz level... That's like comparing oranges to lemon trees... You have no clue what you are doing there and the value of such test is zero, as it provides no new information at all to anyone with basic knowledge about datastructures, complexity, ...
    
      I have started these tests to discover which approach gives the best results. I have done this just because I am an ignorant coder using your project which needs answers. It is not meant to judge if Red routines have been coded properly, my only purpose is just to understand which is the different speed of one approach against another to search for an element. So I have tested if foreach is slower than a path with a numerical index; if select is as fast as a path.  So now I know that an `hash!` table is really a lot faster than using a foreach, but I have also discovered that a select is way faster than it too even using a simple block. Finally It seems that the block of block structure is better to be accessed using a path than a forall.
    
      These where the results I was searching for: answer not written elsewhere....
    
    
    > There is no cache and the lookups order has no effect on the performance of the hashtable, so that test is useless. Again, your ignorance about basic datastructures properties shows here.
    
      About cache, with @hiiamboris  sometime we have talked about cached paths. I have just learnt that this is not applicable here.  
    
    > > 20 milion selection in 9 seconds. About 1 every 4,5*1e-10 seconds if I have calculated correctly. ([source](https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$Q5jqWolfO6epz4HCth0iRGaDHXiQxdRpL4xg9Rp705o?via=gitter.im&via=matrix.org&via=tchncs.de))
    > 
    > Well, you haven't...
    > 
    > ```
    > >> 9 / 20e6
    > == 4.5e-7
    > ```
    
    Yes, I have calculated 9 / 20.000.000.000 ... adding 3 zeroes. My fault ;-)
    
    

