
#3504: Translate and rotate a picture using draw
================================================================================
Issue is open, was reported by Rebol2Red and has 22 comment(s).
[type.bug] [GUI] [type.design]
<https://github.com/red/red/issues/3504>

`lion: load-thru https://cdn.24.co.za/files/Cms/General/d/5441/9fe05948954c41bfa14866238a46816b.jpg
im: make image! 300x300
draw im [translate 300x0 rotate 90.0 image lion]
view/tight [image im]`

If i look through a magnifying glass i can see the picture isn't exactly aligned.
There is one white pixelline on the leftside of the picture.

Gregg Irwin:

Are you sure it's not part of the original image?

A hard proof by Toomas Vooglaid:

`im2: copy/part lion 10x10
probe im2
make image! [10x10 #{
    BDB6AEBEB7AFBDB9B0BEBAB1BDB9B0BBB7AEBAB3ABB8B1A9BBB2ABB9B0A9
    BEB7AFBFB8B0BEBAB1BEBAB1BDB9B0BBB7AEBAB3ABB9B2AABBB2ABBAB1AA
    BEB7AFBFB8B0BFBBB2BFBBB2BEBAB1BCB8AFBBB4ACB9B2AABCB3ACBAB1AA
    BFB8B0C0B9B1BFBBB2C0BCB3BFBBB2BDB9B0BCB5ADBAB3ABBDB4ADBBB2AB
    C0B9B1C1BAB2C1BDB4C1BDB4C0BCB3BEBAB1BDB6AEBCB5ADBEB5AEBCB3AC
    C1BAB2C2BBB3C2BEB5C2BEB5C1BDB4BFBBB2BEB7AFBDB6AEBFB6AFBDB4AD
    C0BCB1C1BDB2C2BEB3C3BFB4C2BEB3C0BCB1BFB8AEBDB6ACC0B7AEBEB5AC
    C1BDB2C2BEB3C3BFB4C3BFB4C2BEB3C0BCB1C0B9AFBEB7ADC0B7AEBFB6AD
    C3BFB3C2BEB2C2BEB2C1BDB1C0BCB0BFBBAFC0BAAEC0BAAEBDB5AABDB5AA
    C3BFB3C3BFB3C2BEB2C1BDB1C0BCB0BFBBAFC1BBAFC0BAAEBDB5AABDB5AA
    }]
im3: draw 10x10 [transform 90 1 1 10x0 image im2]
probe im3
make image! [10x10 #{
    FFFFFFC3BFB3C3BFB3C1BDB2C0BCB1C1BAB2C0B9B1BFB8B0BEB7AFBEB7AF
    FFFFFFC3BFB3C2BEB2C2BEB3C1BDB2C2BBB3C1BAB2C0B9B1BFB8B0BFB8B0
    FFFFFFC2BEB2C2BEB2C3BFB4C2BEB3C2BEB5C1BDB4BFBBB2BFBBB2BEBAB1
    FFFFFFC1BDB1C1BDB1C3BFB4C3BFB4C2BEB5C1BDB4C0BCB3BFBBB2BEBAB1
    FFFFFFC0BCB0C0BCB0C2BEB3C2BEB3C1BDB4C0BCB3BFBBB2BEBAB1BDB9B0
    FFFFFFBFBBAFBFBBAFC0BCB1C0BCB1BFBBB2BEBAB1BDB9B0BCB8AFBBB7AE
    FFFFFFC1BBAFC0BAAEC0B9AFBFB8AEBEB7AFBDB6AEBCB5ADBBB4ACBAB3AB
    FFFFFFC0BAAEC0BAAEBEB7ADBDB6ACBDB6AEBCB5ADBAB3ABB9B2AAB9B2AA
    FFFFFFBDB5AABDB5AAC0B7AEC0B7AEBFB6AFBEB5AEBDB4ADBCB3ACBBB2AB
    FFFFFFBDB5AABDB5AABFB6ADBEB5ACBDB4ADBCB3ACBBB2ABBAB1AABAB1AA
    }]
im3: draw 10x10 [transform 90 1 1 9x0 image im2]
probe im3
make image! [10x10 #{
    C3BFB3C3BFB3C1BDB2C0BCB1C1BAB2C0B9B1BFB8B0BEB7AFBEB7AFFFFFFF
    C3BFB3C2BEB2C2BEB3C1BDB2C2BBB3C1BAB2C0B9B1BFB8B0BFB8B0FFFFFF
    C2BEB2C2BEB2C3BFB4C2BEB3C2BEB5C1BDB4BFBBB2BFBBB2BEBAB1FFFFFF
    C1BDB1C1BDB1C3BFB4C3BFB4C2BEB5C1BDB4C0BCB3BFBBB2BEBAB1FFFFFF
    C0BCB0C0BCB0C2BEB3C2BEB3C1BDB4C0BCB3BFBBB2BEBAB1BDB9B0FFFFFF
    BFBBAFBFBBAFC0BCB1C0BCB1BFBBB2BEBAB1BDB9B0BCB8AFBBB7AEFFFFFF
    C1BBAFC0BAAEC0B9AFBFB8AEBEB7AFBDB6AEBCB5ADBBB4ACBAB3ABFFFFFF
    C0BAAEC0BAAEBEB7ADBDB6ACBDB6AEBCB5ADBAB3ABB9B2AAB9B2AAFFFFFF
    BDB5AABDB5AAC0B7AEC0B7AEBFB6AFBEB5AEBDB4ADBCB3ACBBB2ABFFFFFF
    BDB5AABDB5AABFB6ADBEB5ACBDB4ADBCB3ACBBB2ABBAB1AABAB1AAFFFFFF
    }]`

From above it is clear that in first rotation upper row from original is lost and white row is added into bottom. In second rotation upper row is just overwritten with white.


Comments:
--------------------------------------------------------------------------------

On 2018-11-23T03:48:21Z, qtxie, commented:
<https://github.com/red/red/issues/3504#issuecomment-441151519>

    No this issue on macOS backend.

--------------------------------------------------------------------------------

On 2018-11-23T09:53:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441196469>

    You can assign this to me @qtxie. It occurred to me that it doesn't make any sense to rotate around 0.5x0.5 pivot (the current implementation of `rotate`). I believe by changing pivot to 0.0x0.0 we can make everyone happy. Right?

--------------------------------------------------------------------------------

On 2018-11-23T12:08:19Z, qtxie, commented:
<https://github.com/red/red/issues/3504#issuecomment-441225361>

    @hiiamboris I'm not sure what the causes of this issue. 
    
    > It occurred to me that it doesn't make any sense to rotate around 0.5x0.5 pivot (the current implementation of rotate)
    
    We're using GDI+ on Windows. Do you mean GDI+ using 0.5x0.5 as pivot? I can not find any document about it.

--------------------------------------------------------------------------------

On 2018-11-23T12:18:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441227331>

    @qtxie I'm just stating a fact:
    ![](https://i.gyazo.com/321f6938fc21228c66d847e745c2f339.png)
    is the result of:
    `inspect i: draw 4x4 [anti-alias off rotate 90 0x0 [pen red box 0x0 3x3 pen blue line 0x0 3x0]]` (the picture in the other ticket)
    I'll try to find what led to that and will tell you.

--------------------------------------------------------------------------------

On 2018-11-23T12:53:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441234104>

    Here it is!
    The `rotate angle pivot` command transforms the matrix in 3 steps:
    https://github.com/red/red/blob/85f38b05571cecd38d38ffdc35f20f73dc0f111e/modules/view/backends/windows/draw.reds#L3309
    - move the origin to pivot (let's say it's 0x0)
    - rotate around that pivot
    - move the origin back by `0 - pivot`
    
    And then what `line` and `box` etc. commands do? Let's say I have a `line 0x0 3x0`
    `0x0` and `3x3` are endpoints of the **center** of the line.
    So the pixel center is itself the pivot!
    Ah damm, let me draw it...
    ![](https://i.gyazo.com/4c79f84c7c6afc51bdc623535890bea5.png)
    
    So in our GDI coordinate system the real origin is -0.5x-0.5

--------------------------------------------------------------------------------

On 2018-11-23T13:01:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441235812>

    I suggest L3309 to be:
    `GdipTranslateWorldTransform g as float32! center/x - 0.5 as float32! center/y - 0.5 GDIPLUS_MATRIX_PREPEND`
    
    And L3313:
    `GdipTranslateWorldTransform g as float32! 0.5 - center/x as float32! 0.5 - center/y GDIPLUS_MATRIX_PREPEND`
    
    Needs testing though.

--------------------------------------------------------------------------------

On 2018-11-23T13:11:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441237734>

    Now that I think of it, `scale` is also affected by our coordinate system choice: it will scale around the **center** of the upper left pixel. So unless we want to add 0.5x0.5 to every pen application command out there, we'll need to fix it too. That is, unless we actually want to scale around the pixel center...

--------------------------------------------------------------------------------

On 2018-11-26T20:04:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-441778569>

    I suggest we make this issue into a REP. @qtxie @greggirwin what do you think?
    
    The main problem with `rotate` is that it takes a coordinate:
    `rotate <angle> <center> [<commands>]`
    
     And if we say `rotate angle 0x0` then we should expect `0x0` be the same `0x0` we use for drawing a `line 0x0 ...` - the pixel center in the current coordinate system.
    
    However we seem to agree with @toomasv and the issue author that rotation like this is not very useful.
    In order to make the `translate`+`rotate` trick work like proposed we will have to get rid of the *center* argument:
    `rotate <angle> [<commands>]`
    It will be similar to scaling in it's current form, look:
    `scale <scale-x> <scale-y> [<commands>]` -- scale doesn't expect any pair argument
    
    Then we will be able to say that rotation occurs around the upper left corner, which is -0.5x-0.5. Either that or wait for the introduction of floating-point pair datatype.
    
    But this is not a light decision.

--------------------------------------------------------------------------------

On 2018-11-27T00:13:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3504#issuecomment-441849081>

    I agree that it needs more consideration. Is there another system that does this well, which we can emulate?

--------------------------------------------------------------------------------

On 2018-11-27T17:32:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-442147479>

    Well, we may also replace `<center>` with `<center-x> <center-y>`. But if we do that, why not add `<center-x> <center-y>` to the `scale` and `translate` as well? Scaling around 0x0 as it currently does is stupid:
    
    `inspect i: draw 4x4 [anti-alias on scale 1 1 pen red box 0x0 3x3 pen blue line 0x0 3x0]`
    ![](https://i.gyazo.com/21719dc979ae8ab6fbe2c266800db49e.png)
    
    Now scaled by 3:
    `inspect i: draw 12x12 [anti-alias on scale 3 3 pen red box 0x0 3x3 pen blue line 0x0 3x0]`
    ![](https://i.gyazo.com/d1c5a4062c3e4ff036b34920bd834660.png)
    
    However it may be just simpler without those. Or make them non-mandatory, implying -0.5x-0.5.
    
    Also, notice the corners on the first image are blended. Because the line starts and ends on half-pixel. I feel there's another bug: why is it still blended with `line-cap square`?
    `inspect i: draw 4x4 [line-cap square anti-alias on scale 1 1 pen red box 0x0 3x3 pen blue line 0x0 3x0]` produces the same output whether I choose `line-cap round` or `square` or `flat`.
    @qtxie line-cap seems to work for scale 3 and not for scale 1, is this GDI+ misbehaving?

--------------------------------------------------------------------------------

On 2018-11-29T17:49:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/3504#issuecomment-442928909>

    Further development of this issue here: https://github.com/red/REP/issues/34

