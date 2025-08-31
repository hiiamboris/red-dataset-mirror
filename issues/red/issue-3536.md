
#3536: make! hash loops when spec block contains a large number of items.
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3536>

### Expected behavior
This is from a Rebol Console session:
```text
>> blk: copy []                            
== []
>> loop 1000000 [ append blk copy "abcde" ]
== ["abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde"...
>> do [
[    st: now/precise                         
[    hsh: make hash! blk                     
[    et: now/precise                         
[    difference et st                        
[    ]
== 0:00:00.060786
```

### Actual behavior
When the same expressions are evaluated in a Red Console, cpu usage rises to ~100% and remains at that level. I aborted the following red console session after it had consumed more than 19 minutes of cpu time.
```text
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> blk: copy [] 
== []
>> loop 1000000 [ append blk copy "abcde" ]
== ["abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "abcde" "...
>> do [
[    st: now/precise
[     hsh: make hash! blk
[    et: now/precise
[    difference et st  
[    ]
^C
```
### Steps to reproduce the problem
See above.
### Red and platform version
commit 6115b00130e64436f0127e442a4fdd8316182371 (HEAD -> master, origin/master, origin/HEAD)
macOS 10.12.6


Comments:
--------------------------------------------------------------------------------

On 2018-09-18T18:08:13Z, qtxie, commented:
<https://github.com/red/red/issues/3536#issuecomment-422492589>

    We need to optimize the hashtable for this case.

