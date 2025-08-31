
#4505: [Core] [Regression] interpreter started consuming a lot of RAM
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4505>

**Describe the bug**

Try this script:
```
Red []
recycle/off
b: reduce [o: object []]
probe stats
loop 1000000 [find/same b o]
probe stats
```
Output of May 28th build `36857eb87` and before:
```
2221848        
2222324        
0:00:00.470027 
```
Current build `3d23acd0f`:
```
2240204      
234240912    
0:00:01.33608
```

**Expected behavior**

Stable memory usage.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 8-Jun-2020/20:17:38
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-08T22:12:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4505#issuecomment-640914957>

    @qtxie Please have a look to see which commit caused that.

--------------------------------------------------------------------------------

On 2020-06-09T01:07:16Z, qtxie, commented:
<https://github.com/red/red/issues/4505#issuecomment-640967579>

    This commit: https://github.com/red/red/commit/c2f0d8999dbd79ef458cfbe6e5d7c42f46d8b1fd

--------------------------------------------------------------------------------

On 2020-06-17T22:40:55Z, dockimbel, commented:
<https://github.com/red/red/issues/4505#issuecomment-645663373>

    It is caused by the copying of the call value on the stack, so that the arguments cache datastructures are linked to the value on the stack instead of the original value, resulting in losing the cache once the call ends, and having to rebuild it at every next call.

--------------------------------------------------------------------------------

On 2020-06-28T13:11:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4505#issuecomment-650755008>

    @dockimbel we are in the new chapter of the saga... ;)
    
    ```
    Red []
    ; 1 % 2 - 3		;) spell of protection
    recycle/off
    ix: random collect [repeat i 10000 [keep i]]
    print ["here" stats / 1e6 "M"]
    sort/compare ix func [a b][loop 10 [1 - 1] a <= b]
    print ["there" stats / 1e6 "M"]
    recycle
    print "freed"
    ```
    Output:
    ```
    here 3.110888 M
    there 328.279812 M
    freed
    ```
    ---
    ```
    Red []
    ; 1 % 2 - 3		;) spell of protection
    recycle/off
    ix: random collect [repeat i 50000 [keep i]]
    print ["here" stats / 1e6 "M"]
    parse/trace ix [any skip] func [e m r y s][
    	loop 10 [1 - 1]
    	yes
    ]
    print ["there" stats / 1e6 "M"]
    recycle
    print "freed"
    ```
    Output:
    ```
    here 4.683952 M
    there 352.695444 M
    freed
    ```
    ---
    ```
    Red []
    ; 1 % 2 - 3		;) spell of protection
    recycle/off
    ix: append/dup "" "1 " 10000
    print ["here" stats / 1e6 "M"]
    transcode/trace ix func [e i t l k][
    	loop 10 [1 - 1]
    	yes
    ]
    print ["there" stats / 1e6 "M"]
    recycle
    print "freed"
    ```
    Output:
    ```
    here 2.64916 M
    there 72.413856 M
    freed
    ```
    ---
    All is not lost however, for the pure of heart may uncomment the spell at line 2 and banish the undying bug away ☻

--------------------------------------------------------------------------------

On 2020-06-28T17:34:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4505#issuecomment-650797929>

    If only we believed in magic. :^) :+1:

--------------------------------------------------------------------------------

On 2020-06-29T10:10:57Z, dockimbel, commented:
<https://github.com/red/red/issues/4505#issuecomment-651038165>

    _Expecto patronum_ ... fixed!

--------------------------------------------------------------------------------

On 2020-06-29T18:32:33Z, greggirwin, commented:
<https://github.com/red/red/issues/4505#issuecomment-651288255>

    I had to loo up _Expecto patronum_, which was good because I guessed its meaning incorrectly. I thought it meant that Nenad expected me to send him a bottle of Patrón for fixing the bug.

