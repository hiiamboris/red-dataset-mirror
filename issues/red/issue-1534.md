
#1534: read from a file with messy code, lost data
================================================================================
Issue is closed, was reported by bitbegin and has 8 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/1534>

This is a test file with messy code:

[test.txt](https://github.com/red/red/files/87442/test.txt)

It shows below in notepad++.

```
hello ? world!
```

However, the `read` funciton return a cut off string.

```
red>> read %test.txt
== "hello �"
red>> to binary! read %test.txt
== #{68656C6C6F20EFBFBD}
red>>
```



Comments:
--------------------------------------------------------------------------------

On 2016-01-12T22:41:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1534#issuecomment-171084767>

    The current `read` function expects text to be encoded in UTF-8 format.
    
    If you look at your input as if it was UTF-8 encoded it would be like this:
    
    68 - h
    65 - e
    6C - l
    6C - l
    6F - o
    20 - (space)
    EF - Start of a 3 character UTF-8 sequence
    EF BF BD - Is the UTF-8 replacement character
    
    This indicates that your file included an invalid UTF-8 sequence, hence the input was truncated.

--------------------------------------------------------------------------------

On 2016-01-13T01:26:43Z, bitbegin, commented:
<https://github.com/red/red/issues/1534#issuecomment-171123282>

    The test file was created on purpose. 
    
    I just think if there are messy codes, `to string!` function can hold these codes and transfer the rest data instead of truncation

--------------------------------------------------------------------------------

On 2016-01-13T05:17:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1534#issuecomment-171170223>

    The IO in Red 0.6.0 is temporary. Such features are likely to be included when IO support is developed for Red 0.7.0.

--------------------------------------------------------------------------------

On 2016-03-10T09:14:26Z, qtxie, commented:
<https://github.com/red/red/issues/1534#issuecomment-194746950>

    Should report an error now with the latest version.

