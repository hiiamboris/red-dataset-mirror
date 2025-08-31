
#3086: sort arguments passed to compare function with /compare/all are sometimes incorrect
================================================================================
Issue is closed, was reported by dander and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3086>

### Expected behavior
When sorting based on multiple values with a custom compare function, the function should get a block of values for its two arguments when /all is used.
### Actual behavior
In some cases (could be related to the length of sort input) only the first values are passed into the `function!`.
### Steps to reproduce the problem
This input works:
```
>> comp: func [a b][probe reduce [a b] probe either a/2 = b/2 [a/1 < b/1] [a/2 > b/2]]
== func [a b][probe reduce [a b] probe either a/2 = b/2 [a/1 < b/1] [a/2 > b/2]]
>> sort/all/skip/compare [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2] 2 :comp
[[#"a" 1] [#"b" 1]]
true
[[#"d" 1] [#"b" 1]]
false
[[#"e" 2] [#"d" 1]]
true
(snip)
== [#"c" 2 #"e" 2 #"f" 2 #"g" 2 #"a" 1 #"b" 1 #"d" 1]
```
After adding one additional input pair, it doesn't work.
```
>> sort/all/skip/compare [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2 #"h" 1] 2 :comp
[#"c" #"b"]
*** Script Error: path a/2 is not valid for char! type
*** Where: =
*** Stack: probe
```
### Red version and build date, operating system with version.
```
>> about
Red for Windows version 0.6.3 built 22-Oct-2017/1:26:34-07:00
>> system/options/boot 
== {C:\ProgramData\Red\gui-console-2017-10-22-10391.exe}
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-23T17:55:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3086#issuecomment-338743465>

    `/skip + /compare` seems to be the issue. 
    ```
    >> sort/all/skip [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2 #"h" 1] 2 
    == [#"a" 1 #"b" 1 #"c" 2 #"d" 1 #"e" 2 #"f" 2 #"g" 2 #"h" 1]
    >> comp-2: func [a b][probe reduce [a b] a < b]
    == func [a b][probe reduce [a b] a < b]
    >> sort/all/skip/compare [#"b" 1 #"a" 1  #"d" 1 #"e" 2 #"c" 2 #"f" 2 #"g" 2 #"h" 1] 2 :comp-2
    [#"c" #"b"]
    [#"h" #"c"]
    [[#"c" 2] [#"a" 1]]
    [[#"c" 2] [#"d" 1]]
    [[#"c" 2] [#"h" 1]]
    [[#"c" 2] [#"g" 2]]
    [[#"c" 2] [#"f" 2]]
    [[#"c" 2] [#"b" 1]]
    [[#"c" 2] [#"e" 2]]
    [[#"c" 2] [#"e" 2]]
    [[#"a" 1] [#"b" 1]]
    [[#"d" 1] [#"e" 2]]
    [[#"f" 2] [#"e" 2]]
    [[#"g" 2] [#"f" 2]]
    [[#"h" 1] [#"g" 2]]
    == [#"a" 1 #"b" 1 #"c" 2 #"d" 1 #"e" 2 #"f" 2 #"g" 2 #"h" 1]
    ```

--------------------------------------------------------------------------------

On 2017-10-23T17:57:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3086#issuecomment-338743892>

    Your `/all` example fails on your `a/2` access, because it's not getting a block as expected. 

--------------------------------------------------------------------------------

On 2017-10-23T18:07:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3086#issuecomment-338746982>

    Maybe something with the int math calc'ing `len` and `flags` from `step` (internally in `sort`).

--------------------------------------------------------------------------------

On 2017-10-23T18:09:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3086#issuecomment-338747639>

    Seems to only affect the internal quicksort algo. If you use `/stable`, mergesort is used and it doesn't choke.

--------------------------------------------------------------------------------

On 2017-10-23T18:11:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3086#issuecomment-338748016>

    i.e. not in the block `sort` action, but in the underlying quicksort itself.

--------------------------------------------------------------------------------

On 2017-10-24T11:17:41Z, qtxie, commented:
<https://github.com/red/red/issues/3086#issuecomment-338957210>

    @greggirwin Thanks for investigating it.

