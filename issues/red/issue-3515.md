
#3515: A variable be assigned with a static array, cannot be assigned twice
================================================================================
Issue is closed, was reported by bitbegin and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/3515>

### Expected behavior
```
Red/System []

bin: [#"^(01)" #"^(02)"]
print-line size? bin                ;-- print 2
print-line as integer! bin/1        ;-- print 1
bin: [#"^(03)" #"^(04)" #"^(05)" #"^(06)"]
print-line size? bin                ;-- print 4
print-line as integer! bin/1        ;-- print 3

```
### Actual behavior
```
Red/System []

bin: [#"^(01)" #"^(02)"]
print-line size? bin                ;-- print 2
print-line as integer! bin/1        ;-- print 1
bin: [#"^(03)" #"^(04)" #"^(05)" #"^(06)"]
print-line size? bin                ;-- print 2
print-line as integer! bin/1        ;-- print 3

```
### Steps to reproduce the problem

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 829 date: 13-Aug-2018/7:58:13 commit: #3a26e3544724c7d670d81b7fb3356ba1fffcc118 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-24T02:40:15Z, bitbegin, commented:
<https://github.com/red/red/issues/3515#issuecomment-415633778>

    After first assigned, `bin` will be set to 2 items array! (like C: `unsigned char bin[2] = {0x01, 0x02}`), not only assigned but also declared, so in its scope `size?` of it will always return 2. The second assigned, bin will be pointer to 4 items array! (like C: `bin = {0x03, 0x04, 0x05, 0x06}`).
    
    
    So: if you assign an array(not c-string!, as it's length? can be caculated everytime) more than one time, take care of using `size?` on it
    
    The issue can be avoid by this way:
    
    ```
    Red/System []
    
    bin: [#"^(01)" #"^(02)"]
    print-line size? [#"^(01)" #"^(02)"]                    ;-- print 2
    print-line as integer! bin/1                            ;-- print 1
    bin: [#"^(03)" #"^(04)" #"^(05)" #"^(06)"]
    print-line size? [#"^(03)" #"^(04)" #"^(05)" #"^(06)"]  ;-- print 4
    print-line as integer! bin/1                            ;-- print 3
    ```

--------------------------------------------------------------------------------

On 2019-09-06T14:46:52Z, dockimbel, commented:
<https://github.com/red/red/issues/3515#issuecomment-528884187>

    @bitbegin Does your commit above fix the issue? If so, then you can send a PR with it.

--------------------------------------------------------------------------------

On 2019-09-10T06:00:24Z, bitbegin, commented:
<https://github.com/red/red/issues/3515#issuecomment-529783492>

    i remembered there was some limits with the commit above

