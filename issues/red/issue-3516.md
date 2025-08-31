
#3516: Picking an element of an image is not bound-checked
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3516>

### Expected behavior
Using an index of an image beyond its size (width x height) should give an error
### Actual behavior
```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/size
== 2x2
>> length? i
== 4
>> i/5
== 66.131.46.255
>> pick i 5
== 66.131.46.255
```
### Steps to reproduce the problem
Execute above code
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 845 date: 20-Aug-2018/0:39:55 commit: #318673b7ae1c33b5852087f80905f2293ce5bd3f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-22T16:55:14Z, meijeru, commented:
<https://github.com/red/red/issues/3516#issuecomment-415102366>

    Curiously, the code in `%image.reds` _**seems**_ OK. It must be a subtle error...

--------------------------------------------------------------------------------

On 2018-08-22T20:44:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3516#issuecomment-415173275>

    Fencepost error?
    ```
    >> i: make image! 2x2
    == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
    >> i/size
    == 2x2
    >> length? i
    == 4
    >> i/4
    == 255.255.255.0
    >> i/5
    == 66.144.137.255
    >> i/6
    == none
    ```

--------------------------------------------------------------------------------

On 2018-08-22T20:44:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3516#issuecomment-415173392>

    i.e., one unintitialized pixel can be accessed.

--------------------------------------------------------------------------------

On 2018-10-12T07:54:45Z, bitbegin, commented:
<https://github.com/red/red/issues/3516#issuecomment-429238498>

    #3560 

--------------------------------------------------------------------------------

On 2018-10-12T18:50:59Z, qtxie, commented:
<https://github.com/red/red/issues/3516#issuecomment-429424412>

    Fixed by commit https://github.com/red/red/commit/1ec7ea6322ddfecab0c6a7cede089de6d17473c6.

