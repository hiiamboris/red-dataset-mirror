
#3297: [R/S] cannot compile float -0.0
================================================================================
Issue is closed, was reported by qtxie and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3297>

The code below cannot be compiled anymore.
### Code
```
Red/System []
probe -0.0
```
Compiling error:
```
Compiling to native code...
*** Compilation Error: unknown directive .0- 
*** in file: %/D/Work/tests.reds 
*** at line: 2 
*** near: [#.0-]
```
### Version (run `about` in the Red Console and paste the result here) also add OS version.
Win7 64bit
master branch commit [e65fcfec8a3a5c63cda5f4a862f9929ec803ac4a]


Comments:
--------------------------------------------------------------------------------

On 2018-03-30T15:06:56Z, dockimbel, commented:
<https://github.com/red/red/issues/3297#issuecomment-377544818>

    Support for special float values is not implemented yet in R/S.

--------------------------------------------------------------------------------

On 2018-03-30T15:44:02Z, meijeru, commented:
<https://github.com/red/red/issues/3297#issuecomment-377553152>

    What is so special about `-0.0`?

--------------------------------------------------------------------------------

On 2019-02-04T07:19:12Z, rebolek, commented:
<https://github.com/red/red/issues/3297#issuecomment-460151566>

    @dockimbel see https://github.com/red/red/issues/3763#issuecomment-459890255 , it crashes for                            very non-special value of `-0.01` also.

--------------------------------------------------------------------------------

On 2019-09-15T21:11:27Z, dockimbel, commented:
<https://github.com/red/red/issues/3297#issuecomment-531599708>

    @meijeru Signed zeros are special values in IEEE754 floating point standard: https://en.wikipedia.org/wiki/Signed_zero

--------------------------------------------------------------------------------

On 2019-09-18T13:40:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3297#issuecomment-532688918>

    Support for special float values added in `negative-zero` branch, merged in master now.

