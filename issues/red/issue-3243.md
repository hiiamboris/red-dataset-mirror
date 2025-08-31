
#3243: Loss of precision when serialising and deserialising a float!
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.built] [type.review] [test.written]
<https://github.com/red/red/issues/3243>

### Expected behavior
A float! when molded and loaded should not lose precision i.e.
    float-number == load mold float-number

### Actual behavior
Precision is lost when molding and loading a float! value:
```text
>> 
>> f: 11.651178950846456
== 11.65117895084646
>> f == load mold f
== false
>> f - load mold f
== -3.5527136788005e-15
>> 
```

### Steps to reproduce the problem
See above

### Red version and build date, operating system with version.
>> system/build
== make object! [
    date: 5-Feb-2018/7:28:22+08:00
    config: make object! 
>> 

macOS 10.12.6


Comments:
--------------------------------------------------------------------------------

On 2018-03-03T09:19:05Z, qtxie, commented:
<https://github.com/red/red/issues/3243#issuecomment-370133379>

    Using [dtoa](www.netlib.org/fp/dtoa.c) will solve it.

--------------------------------------------------------------------------------

On 2018-03-12T08:24:37Z, dockimbel, commented:
<https://github.com/red/red/issues/3243#issuecomment-372227129>

    This is a known limitation of the current string-to-float parser. It's a notoriously complex task to handle, and the `dtoa` lib is the best option, though, it's a huge and complex dependency that will add ~40KB to the runtime payload. We have a R/S version of it and we plan to integrate it at some point, though, it requires extra work (like separating the bignum support from the conversion code) and lacks unit testing.

--------------------------------------------------------------------------------

On 2018-04-20T06:21:08Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3243#issuecomment-382991690>

    What unit tests are needed?

--------------------------------------------------------------------------------

On 2020-04-03T20:26:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/3243#issuecomment-608642706>

    Let's reopen! :)
    Same issue with percents exists:
    ```
    >> f: 11.651178950846456%
    == 11.65117895085%           ;) cut down in the output
    >> to float! f
    == 0.1165117895084646
    >> f = load mold/all f
    == false
    >> f = load mold/all to float! f
    == true
    ```
    
    This will be hard to fix btw, because:
    ```
    >> f: 0.11651178950846456
    >> f / 100 * 100 == f
    == false
    ```
    and percents are multiplied by 100 before being formed

--------------------------------------------------------------------------------

On 2020-04-04T00:24:08Z, qtxie, commented:
<https://github.com/red/red/issues/3243#issuecomment-608889881>

    It's a percent! issue. I prefer to open a new issue for it.

