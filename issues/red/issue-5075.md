
#5075: load-csv/as-records gives error on MacOS
================================================================================
Issue is closed, was reported by BuilderGuy1 and has 8 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/5075>

load-csv/as-records gives error "append does not allow map! for its series argument" when using the Feb 9th 2022 version of RED on MacOS.

**Describe the bug**
Read CSV file with:
   mydata: read %data_test2.csv
Loaded CSV with:
   mycsv: load-csv/as-records mydata

I used the attached "data_Test2.csv" file to create this error.


**Data File**
[Data_Test2.csv](https://github.com/red/red/files/8076653/Data_Test2.csv)

**Platform version**
```
MacOS 10.14.6 Mojave
Red 0.6.4 for macOS built 9-Feb-2022/8:46:44-08:00  commit #e343951
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-16T04:35:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5075#issuecomment-1041097793>

    Reproduced on Win10. All it takes is this:
    ```
    Time
    "30 December, 2019 7:37 PM"
    ```
    Where this works fine:
    ```
    X,Time
    A,"30 December, 2019 7:37 PM"
    ```

--------------------------------------------------------------------------------

On 2022-02-16T04:39:18Z, greggirwin, commented:
<https://github.com/red/red/issues/5075#issuecomment-1041100006>

    Guessing it's the `add-line` rule, which does `value: make map! length`. The catch of rules not capturing vars. `Value` is used for two purposes in the func. Nice find @BuilderGuy1. :+1:

--------------------------------------------------------------------------------

On 2022-02-16T13:44:27Z, rebolek, commented:
<https://github.com/red/red/issues/5075#issuecomment-1041506380>

    @BuilderGuy1 thanks!
    Also reported by @toomasv in Gitter with this example:
    ```
    load-csv/as-records {"A","B"^/"1","2"}
    ```

--------------------------------------------------------------------------------

On 2022-02-16T14:02:22Z, rebolek, commented:
<https://github.com/red/red/issues/5075#issuecomment-1041522715>

    https://github.com/red/red/pull/5077

