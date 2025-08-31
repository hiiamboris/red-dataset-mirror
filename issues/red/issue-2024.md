
#2024: READ/SEEK seeks from tail. It should seek form head.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2024>

``` red
red>> write %test.txt "abcdef" 
red>> read/seek %test.txt 1
== "abcde"
red>> read/seek %test.txt 2
== "abcd"
red>> read/seek %test.txt 3
== "abc"
red>> read/seek %test.txt 4
== "ab"
red>> read/seek %test.txt 5
== "a"
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T05:55:19Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2024#issuecomment-226094937>

    I am using Mac OS X.

