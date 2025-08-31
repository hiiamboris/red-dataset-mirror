
#5522: Redbin save time varies by 8 times
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review] [type.design]
<https://github.com/red/red/issues/5522>

**Describe the bug**

I'm trying to save the exact same data with Redbin, but depending on the circumstances getting hugely varied timings. I also don't find a predictable correlation between the data size and the timings. 

I also noticed a few times that one (the same) byte in the output gets filled with random trash, but at the time of reporting couldn't reproduce it:
```
$ fc /b exoplanets.redbin database.redbin
Comparing files exoplanets.redbin and DATABASE.REDBIN
05F659A8: 7A D3
```

Look at the output:
```
$ red "3.red"
450 ms  [data: decompress read/binary %exoplanets.red.gz 'gzip]
483 ms  [data: load data]
2654 ms [data: bob->map data]
10120 ms        [save %database.redbin data]
4905 ms [save %database.redbin data]            <- second save is 2x faster than the 1st!
Now run me again!

$ red "3.red"
1248 ms [data: load %database.redbin]
41863 ms        [save %database.redbin data]    <- save after .redbin load is 8x slower than the 2nd save!
```

**To reproduce**

1. Download this data file:
[exoplanets.red.gz](https://github.com/user-attachments/files/16143732/exoplanets.red.gz)
2. Save this script in the same directory:
   ```
   Red []
   
   recycle/off
   
   bob->map: function [bob [block!]] [
   	map: make map! (w: length? bob/1) * (h: length? bob)
   	repeat y h [repeat x w [put map as-pair x y bob/:y/:x]]
   	map
   ]
   	
   either existed?: exists? %database.redbin [
   	clock [data: load %database.redbin]
   ][
   	clock [data: decompress read/binary %exoplanets.red.gz 'gzip]
   	clock [data: load data]
   	clock [data: bob->map data]
   	clock [save %database.redbin data]
   ]
   
   clock [save %database.redbin data]
   unless existed? [print "Now run me again!"]
   ```
3. Run the script **twice**
4. Compare the timings

Somehow the bug is not reproducible if both script runs are unified into one. Fresh Redbin load is one of the conditions for it. Leaving the block without converting it into a map also disarms the bug (except it's still 10 seconds not 5 seconds timing). Also I couldn't reproduce it with simple synthetic data.

**Expected behavior**

I think all runs should finish in the same time as the second run.

**Platform version**
```
Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e
```


Comments:
--------------------------------------------------------------------------------

On 2024-07-10T12:52:02Z, qtxie, commented:
<https://github.com/red/red/issues/5522#issuecomment-2220434906>

    Seems no problem on [nodes-gc-hashtable](https://github.com/red/red/tree/nodes-gc-hashtable) branch.

--------------------------------------------------------------------------------

On 2024-07-10T13:27:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5522#issuecomment-2220511227>

    Indeed, which is rather odd:
    ```
    552 ms  [data: decompress read/binary %exoplanets.red.gz 'gzip]
    632 ms  [data: load data]
    3414 ms [data: bob->map data]
    2609 ms [save %database.redbin data]
    2158 ms [save %database.redbin data]
    Now run me again!
    
    1407 ms [data: load %database.redbin]
    2641 ms [save %database.redbin data]
    ```

--------------------------------------------------------------------------------

On 2024-12-04T21:49:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5522#issuecomment-2518630206>

    Seems solved in `nodes-gc` branch:
    
    ```
    >> do %exo.red
    200 ms	[data: decompress read/binary %exoplanets.red.gz 'gzip]
    239 ms	[data: load data]
    1361 ms	[data: bob->map data]
    1056 ms	[save %database.redbin data]
    883 ms	[save %database.redbin data]
    Now run me again!
    >> do %exo.red
    716 ms	[data: load %database.redbin]
    987 ms	[save %database.redbin data]
    ```

