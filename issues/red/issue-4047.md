
#4047: changing /rgb component of image gives undocumented result
================================================================================
Issue is open, was reported by meijeru and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/4047>

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/rgb: 100
== 100
>> i
== make image! [2x2 #{640000640000640000640000}]
```
Is this intended?



Comments:
--------------------------------------------------------------------------------

On 2019-09-23T20:54:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4047#issuecomment-534280418>

    @meijeru please ask questions in Gitter chat, and save tickets for confirmed issues.

--------------------------------------------------------------------------------

On 2019-09-24T06:51:47Z, Oldes, commented:
<https://github.com/red/red/issues/4047#issuecomment-534417851>

    I consider it to be a bug and it is not compatible with any Rebol version, where the result would be:
    `make image! [2x2 #{646464646464646464646464}]`
    
    I can imagine having: `i/red` which could set or return just a red channel of the image.

--------------------------------------------------------------------------------

On 2020-03-25T15:06:44Z, 9214, commented:
<https://github.com/red/red/issues/4047#issuecomment-603893631>

    https://github.com/red/red/issues/4298#issuecomment-603877917.
    ```red
    >> i: make image! 1x1 i/rgb: 646464h i
    == make image! [1x1 #{646464}]
    >> i: make image! 1x1 i/rgb: #{646464} i
    == make image! [1x1 #{646464}]
    
    >> i: make image! 1x1 i/rgb: 64h i
    == make image! [1x1 #{640000}]
    >> i: make image! 1x1 i/rgb: #{640000} i
    == make image! [1x1 #{640000}]
    ```

