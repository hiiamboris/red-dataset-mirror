
#2812: image: alpha channel not correctly displayed
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[type.review]
<https://github.com/red/red/issues/2812>

In tuple representation, the fourth element is 255 - A, that is understood (default 0 means opaque, hence 255).
However, in binary representation, the last byte of `/argb` differs from the byte of `/alpha` see below. 
```
>> i: make image! 1x1
== make image! [1x1 #{FFFFFF}]
>> i/1
== 255.255.255.0
>> i/rgb
== #{FFFFFF}
>> i/argb
== #{FFFFFFFF}
>> i/alpha
== #{00}  ;;; should be #{FF}
```



Comments:
--------------------------------------------------------------------------------

On 2017-06-15T01:25:07Z, qtxie, commented:
<https://github.com/red/red/issues/2812#issuecomment-308602402>

    Yes, you're right. The alpha channel specify the `Opacity` in ARGB color. So
    * `i/1` should give `255.255.255.255`.
    * ` i/argb` should give `#{FFFFFFFF}`.
    * `i/alpha` should give `#{FF}`.

--------------------------------------------------------------------------------

On 2017-06-15T07:52:25Z, meijeru, commented:
<https://github.com/red/red/issues/2812#issuecomment-308656847>

    I think the tuple should still have 4th element 255 - A, since the default with 3-element tuples is 4th element = 0, and the default for A is 255. Thus 255 - A, as currently for tuples, is OK.

--------------------------------------------------------------------------------

On 2018-11-28T21:28:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/2812#issuecomment-442611110>

    There seem to be a misconception here.
    The default color used for new images is opaque white (255.255.255.0 = 255.255.255). I think it comes from the fact that white was so chosen for draw: https://doc.red-lang.org/en/draw.html#_default_values and also there's a `draw/transparent` refinement to override that.
    So that the following holds true:
    ```
    >> i1: make image! 2x2
    == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
    >> i2: draw 2x2 []
    == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
    >> i1 = i2
    == true
    ```
    So, `i/1 = 255.255.255.0` and `i/alpha = #{00}` and `i/rgb = #{FFFFFF}` all make sense.
    
    However the binary representation probably follows another (and more common) definition of alpha channel, where alpha is a synonym for opacity. I've always seen MS to follow this convention. Like [here](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.color?view=netframework-4.7.2) it says:
    > The alpha component specifies the transparency of the color: 0 is fully transparent, and 255 is fully opaque.
    
    So `i/argb = #{FFFFFFFF}` also makes sense if the binary is the raw data of the image buffer.
    If that is so, the question is then if it's worth exposing the raw data (will it be cross platform?). If not then certainly `i/argb` should be `#{FFFFFF00}` for consistency.

--------------------------------------------------------------------------------

On 2020-03-15T02:53:14Z, qtxie, commented:
<https://github.com/red/red/issues/2812#issuecomment-599160782>

    > Yes, you're right. The alpha channel specify the `Opacity` in ARGB color. So
    > 
    > * `i/1` should give `255.255.255.255`.
    > * ` i/argb` should give `#{FFFFFFFF}`.
    > * `i/alpha` should give `#{FF}`.
    
    I think we should do this change. I don't see a good reason to make it different in Red than the rest of the world. As @hiiamboris points out, 
    
    > The alpha component specifies the transparency of the color: 0 is fully transparent, and 255 is fully opaque.
    
    It's the same definition on all the platforms we support, also the same on Web CSS. 

