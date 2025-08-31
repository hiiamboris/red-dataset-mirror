
#4205: RANDOM/SEED is not satisfactory
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [status.contribution]
<https://github.com/red/red/issues/4205>

**Describe the bug**

Run this:
```
Red []                                
                                      
loop 10 [
	random/seed form now/time/precise
	probe random 10000
]
loop 10 [
	random/seed now/time/precise
	; random/seed (t: now/time/precise t/second)    ;) same
	wait 1e-3
	print [t random 10000]
]
```

Here's 3 results:
```
2753            
3781            
1267            
2651            
4113            
4804            
2503            
2771            
7648            
9492            
0:25:19.7836 479
0:25:19.7846 479
0:25:19.7856 479
0:25:19.7866 479
0:25:19.7876 479
0:25:19.7886 479
0:25:19.7896 479
0:25:19.7906 479
0:25:19.7916 479
0:25:19.7926 479
```
```
2753             
3781             
1267             
2651             
4113             
4804             
2503             
2771             
7648             
9492             
0:26:05.2872 7661
0:26:05.2882 7661
0:26:05.2892 7661
0:26:05.2902 7661
0:26:05.2912 7661
0:26:05.2922 7661
0:26:05.2932 7661
0:26:05.2942 7661
0:26:05.2952 7661
0:26:05.2962 7661
```
```
2753             
3781             
1267             
2651             
4113             
4804             
2503             
2771             
7648             
9492             
0:26:16.4108 1290
0:26:16.4118 1290
0:26:16.4128 1290
0:26:16.4138 1290
0:26:16.4148 1290
0:26:16.4158 1290
0:26:16.4168 1290
0:26:16.4178 1290
0:26:16.4188 1290
0:26:16.4198 1290
```

So, as can be seen:
- /seed does not use fractional part of seconds when given `time!`
- /seed does nothing at all when given a `string!` (look how results are all the same thoughout all program runs)

**Expected behavior**

- either it should return an error when given an argument it can't seed with, or it should use it in full
- should use the fractional part of `float!` and `time!`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-20T13:28:19Z, loziniak, commented:
<https://github.com/red/red/issues/4205#issuecomment-589022386>

    ```
    >> loop 10 [probe to binary! to float! now/time/precise wait 1e-3]
    #{40E955695B8348F5}
    #{40E95569659AF9EC}
    #{40E955696FAA4767}
    #{40E9556979ACFFA8}
    #{40E9556983B3E9A7}
    #{40E955698DAE3E6C}
    #{40E9556998288052}
    #{40E95569A22B3893}
    #{40E95569AC215B9A}
    #{40E95569B6134CE4}
    ```
    First 32 bits are the same, and they are taken for `_random/seed` in `float/random`, which `time/random` is inherited from.

--------------------------------------------------------------------------------

On 2022-09-13T17:12:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4205#issuecomment-1245705424>

    @dockimbel `random/seed form now/time/precise` does nothing at all. I think it should raise an error if it ignores it's argument.

--------------------------------------------------------------------------------

On 2022-09-13T17:51:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4205#issuecomment-1245755202>

    I had a question not long ago on `random/secure`, which I'll note here. 
    ```
    loop 10 [print to binary! random/secure 2 ** 63]
    ```
    Note that the distribution of high values leads to leading bit patterns. This came from the need to generate 16 random bytes in a `binary!` to make UUIDs. The best combination of speed and memory pressure turned out to be using tuples. It's a special case, and something people can solve with R/S themselves if needed.

--------------------------------------------------------------------------------

On 2022-09-13T18:00:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4205#issuecomment-1245768725>

    Patterns are expected since they come from IEEE float format encoding.

--------------------------------------------------------------------------------

On 2022-09-13T19:13:48Z, greggirwin, commented:
<https://github.com/red/red/issues/4205#issuecomment-1245850490>

    I understand that.

