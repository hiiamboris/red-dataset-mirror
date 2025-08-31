
#2797: possible memory leak associated with reading file into word multiple times
================================================================================
Issue is closed, was reported by michaeldesu and has 10 comment(s).
[status.wontfix]
<https://github.com/red/red/issues/2797>

Here's a test case.

```
>> write %test.txt "red is best"
>> stats
== 3317760
>> loop 1000 [s: read %test.txt]
== "red is best"
>> stats
== 3399680
```

This was tested using Red 0.6.2 on Windows 7.

Thanks.


Comments:
--------------------------------------------------------------------------------

On 2017-06-12T09:18:51Z, geekyi, commented:
<https://github.com/red/red/issues/2797#issuecomment-307735019>

    ```red
    write %test.txt "red is best"
    write/append %test.txt tab
    stats
    loop 1000 [s: read %test.txt]
    stats
    ```
    No difference for me with `tab` as last character:
    ```
    >> stats
    == 3317760
    >> loop 1000 [s: read %test.txt]
    == {red is best#"^^-"#"^^-"}
    >> stats
    == 3399680
    ```

--------------------------------------------------------------------------------

On 2017-06-12T22:36:34Z, michaeldesu, commented:
<https://github.com/red/red/issues/2797#issuecomment-307953361>

    Yeah, as noted on the red board, it was my misunderstanding. I will try to re-reproduce the tab issue. I was tempted to remove this issue since it's unrelated, however I think I'll leave it as this is still a genuine and frankly more important issue to resolve eventually, as a reminder (which will be done later as I understand it).

--------------------------------------------------------------------------------

On 2017-06-18T23:23:20Z, geekyi, commented:
<https://github.com/red/red/issues/2797#issuecomment-309309723>

    There was an update on [gitter June 13, 2017 ](https://gitter.im/red/help?at=593f3c7d142826e972ac4fc3):
    > [..] small update about the 'extra tab' issue. I spend some time researching.. see what you think of the following (in progress investigation)
     ```red
    ; attempt 1
    >> stats
    == 3317760
    >> loop 231 [s: read %c.txt]
    == {aaaaaaaa^/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    >> stats
    == 3317760
    ; attempt 2
    >> stats
    == 3317760
    >> loop 232 [s: read %c.txt]
    == {aaaaaaaa^/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    >> stats
    == 5419008
    ```
    >the file is 6685 bytes. The above data was obtained from starting the REPL from scratch  for each attempt. I can look into this some more, if you think it's worth it - ie.. not something known or expected from this version (0.6.2 on Windows). 
    
    `probe stats/info` gives more info on this (before and after the loop)
    This was a normal thing, because of heap(?) from the OS, memory allocation in big chunks.
    
    Nothing unusual, except a tiny bug about `stats` vs `stats/info` differing
    
    ## Conclusion
    
    Expected jump in memory. But bug in `stats/info` reporting
    

--------------------------------------------------------------------------------

On 2017-06-18T23:42:39Z, geekyi, commented:
<https://github.com/red/red/issues/2797#issuecomment-309310621>

    For anyone interested 😉  , you can find the relevant functions in: 
    [natives.reds](https://github.com/red/red/blob/master/runtime/natives.reds#L1042) and [debug-tools](https://github.com/red/red/blob/master/runtime/debug-tools.reds)

--------------------------------------------------------------------------------

On 2019-08-19T20:41:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2797#issuecomment-522745561>

    Currently:
    ```
    >> write %test.txt "red is best"
    >> write/append %test.txt tab
    >> stats
    == 2587348
    >> loop 1000 [s: read %test.txt]
    == {red is best#"^^-"}
    >> stats
    == 2727712
    >> recycle
    >> stats
    == 2465612
    ```
    Given that the GC seems to properly recover the memory and that the file I/O code will get replaced soon by a totally new implementation, I'll close this ticket.

