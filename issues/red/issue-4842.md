
#4842: The DT Cinderella BUG
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 12 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/4842>

**Describe the bug**
If DT passes midnight while measuring a block, it returns negative errors

**To reproduce**
Run [this script](https://gist.github.com/GiuseppeChillemi/0f67922e5b5c76cff445c3c38b103987
), the dataset address is inside the header

Here is the output of the script when the last test has passed midnight while running:

```
Start Time: 27-Feb-2021/23:54:51+01:00
"-- start read file--"
Source-size:  91265933 Characters to-scan:  1000 time: 0:00:00
"-- start read file--"
Source-size:  91265933 Characters to-scan:  10000 time: 0:00:00.0040034
"-- start read file--"
Source-size:  91265933 Characters to-scan:  100000 time: 0:00:00.064964
"-- start read file--"
Source-size:  91265933 Characters to-scan:  500000 time: 0:00:01.17734
"-- start read file--"
Source-size:  91265933 Characters to-scan:  1000000 time: 0:00:04.99314
"-- start read file--"
Source-size:  91265933 Characters to-scan:  2000000 time: 0:00:23.0888
"-- start read file--"
Source-size:  91265933 Characters to-scan:  3000000 time: 0:00:53.2765
"-- start read file--"
Source-size:  91265933 Characters to-scan:  4000000 time: 0:01:49.5493
"-- start read file--"
Source-size:  91265933 Characters to-scan:  5000000 time: -23:57:10.2192
(halted)
```


**Platform version**
Windows 10
```
Red 0.6.4 for Windows built 25-Feb-2021/1:27:54+01:00 commit #0645c80
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-28T07:44:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4842#issuecomment-787411732>

    This has already been reported however
    https://github.com/red/red/commit/fa26eb0340b6eeb88b1c8c8e3801625c4f11362f#commitcomment-39343233

--------------------------------------------------------------------------------

On 2021-02-28T13:19:45Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4842#issuecomment-787451195>

    Nice, we know also where the bug is located. Differently thank your comment, it won't glitch just near 23:59:59 but on any time which belongs to the previous day. The reason in simple:
    
    Now/Time/Precise returns a time that has no date:
    
    ```
    >> probe now/time/precise
    14:15:29.2892
    == 14:15:29.2892
    ```
    
    It should be: now/precise but it returns a different format:
    
    ```
    >> probe now/precise
    28-Feb-2021/14:15:33.7406+01:00
    == 28-Feb-2021/14:15:33.7406+01:00 
    ```
    
    That Red seems not able to convert/calculate or converts for calculations using a datatype with too low precision.
    
    ```
    >> tm: now/precise wait 3 probe now/precise - tm
    0
    == 0
    ```
    
    
    

--------------------------------------------------------------------------------

On 2021-02-28T14:01:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4842#issuecomment-787457130>

    > it won't glitch just near 23:59:59 but on any time which belongs to the previous day
    
    True, I didn't presume anyone would use `dt` on hour intervals ;)
    Your other speculations are leading you to reinvent `difference`.

--------------------------------------------------------------------------------

On 2021-02-28T14:37:01Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4842#issuecomment-787462546>

    > True, I didn't presume anyone would use dt on hour intervals ;)
    
    Have you ever heard about `uptime`? ;-)
    
    > Your other speculations are leading you to reinvent difference.
    
    I would like to teach him that days exist `28-Feb-2021/15:35:09.81424+01:00` and it is not good to ignore them! ;-)
    

--------------------------------------------------------------------------------

On 2021-02-28T14:52:26Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4842#issuecomment-787464796>

    However, a new term has born: cinderbug!
    

--------------------------------------------------------------------------------

On 2021-02-28T15:17:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4842#issuecomment-787468554>

    > I would like to teach him that days exist `28-Feb-2021/15:35:09.81424+01:00` and it is not good to ignore them! ;-)
    
    It knows. In fact, from R2 times or even before that:
    ```
    >> difference now 1970/1/1
    == 448479:18:30
    >> ?? dt
    dt: func [
        {Delta-time - returns the time it takes to evaluate the block.}
        block [block!] /local
        start
    ][
        start: now/precise
        do block
        difference now/precise start
    ]
    >> about
    REBOL/View 2.7.8.3.1 1-Jan-2011
    ```

