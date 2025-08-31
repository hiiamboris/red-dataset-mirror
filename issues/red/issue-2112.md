
#2112: UTF-8 encoding (unit=0) in SeriesBuffer! struct will cause "divide-by-zero" Error
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
<https://github.com/red/red/issues/2112>

I am making a Red/System application which needs to serialize and unserialize Red value from file system. When it comes to Red-String!, I choose to use UTF-8 as the string format in SeriesBuffer!. So I set unit bits (in SeriesBuffer/Flags) to 0, and I get the following information.

``` Red
*** Runtime Error 13: integer divide by zero
*** in file: /Users/jenniferlee/datatypes/string.reds
*** at line: 904
```

If I set unit to 1, the code can run without error message, but only strings in ASCII (which take 1 byte) can show correctly, Chinese strings are decoded wrongly.

The line 904 is as follows

``` Red
    size:  (as-integer s1/tail - s1/offset) + (unit1 / unit2 * size2)       ;-- account for keep?
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-13T23:09:55Z, qtxie, commented:
<https://github.com/red/red/issues/2112#issuecomment-232513156>

    @JenniferLee520 Currrently `UTF-8` encoding is not supported in `series-buffer/flags`. To serialize a red-string!, use following code:
    
    ```
    Red/System []
    
    ;-- convert red-string! to utf8 encoding c string
    ;-- set `len: -1` to convert the whole string
    ;-- the length of the converted string will be set in `len` (in bytes)
    len: -1
    c-str: unicode/to-utf8 red-str :len
    
    ;-- write it to file (pseudo code)
    write %file1 c-str len
    
    ;-- read it back (pseudo code)
    buffer: allocate len
    len: read %file1 buffer
    
    ;-- convert data to red-string!
    red-str: string/load as c-string! buffer len UTF-8
    ```

--------------------------------------------------------------------------------

On 2016-07-14T03:18:37Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2112#issuecomment-232546629>

    Thanks. your code works well. You can close this issue, or keep it open as a reminder of UTF-8 support in SeriesBuffer!.

