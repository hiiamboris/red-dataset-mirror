
#3537: Red/System wrong casting float! to integer!
================================================================================
Issue is closed, was reported by haolloyin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3537>

### Expected behavior
See below.

### Actual behavior
See below.

### Steps to reproduce the problem
```rebol
Red/System []

a: 0.9030899869919435
b: 0.3010299956639812

probe a / b                 ;=> 3.0
probe as-integer (a / b)    ;=> 2  wrong! Should be 3

c: a / b                    ; cache the result first
probe as-integer c          ;=> 3    right

probe (b * 3)               ;=> 0.9030899869919435 (a)
probe (a / 3)               ;=> 0.3010299956639812 (b)
```

### Red and platform version
```
>> any [attempt[about/debug] about]

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "macOS Sierra" OS: 'macOS arch: 'x86-64 version: 10.12.6 build: "16G1408" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-19T17:59:42Z, haolloyin, commented:
<https://github.com/red/red/issues/3537#issuecomment-422900511>

    Answer from @9214 at 
    https://gitter.im/red/red/system?at=5ba2304cbe4f300626b7d6e5
    > `either` is limited for now, better avoid using it nested (assigning its return value to a variable is safe). The limitation comes from an early version of R/S where `either` could not be nested at all, so the code emitter is not capable to handle that properly across the various target architectures.
    
    And answer from @BeardPower  at 
    https://gitter.im/red/red/system?at=5ba234278909f71f75f8128b
    > This issue can give you real headaches. Its better to cache an intermediary value and use that for the expression instead of nesting.
    `as-<data-type>` is just an alias for `as <data-type>!`, which is the new syntax, which should be preferred, as its reflecting the type.
    
    Thanks!

