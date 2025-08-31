
#5161: Decompress doesn't work for some valid data
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5161>

**To reproduce**

1. Download [gzip-data.txt](https://github.com/red/red/files/9126981/gzip-data.txt)
2. Decompress the data
```
data: do %gzip-data.txt
decompress data 'gzip
```
Got error:
```
*** Script Error: data not in correct format: none
*** Where: decompress
*** Near : 'gzip
*** Stack:
```
**Expected behavior**
Decompress the data correctly.

**Platform version**
all platforms, commit ccc7e088d487e537287c1fd4d0bf1c19a7bf6751



