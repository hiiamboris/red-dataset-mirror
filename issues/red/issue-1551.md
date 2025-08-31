
#1551: `layout` ignores `font-size` until `view` is called
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1551>

```
Red []

b: [text "Hello, World!" font-size 36]

l: layout b
view l

l: layout b
view l
```

The first window looks like this:
![hello1](https://cloud.githubusercontent.com/assets/7657453/12537710/8b211cc6-c311-11e5-8290-9b0a0dec6d25.png)

The second window looks like this:
![hello2](https://cloud.githubusercontent.com/assets/7657453/12537713/95337eb6-c311-11e5-98f5-58b11844e966.png)

This behavior is the same in Windows XP, Windows 7, and when `font-size 36` is replaced with `font [size: 36]` or `text` is replaced with `field`, etc.



Comments:
--------------------------------------------------------------------------------

On 2016-01-25T06:41:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1551#issuecomment-174417119>

    Also, it behaves this way whether it's interpreted or compiled.

