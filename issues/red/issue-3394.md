
#3394: Copy part of a face gives an error
================================================================================
Issue is closed, was reported by githubnyn and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3394>

### Expected behavior: copy part of an image
### Actual behavior: console-2018-5-12-55219[3545] <Error>: CGImageCreate: invalid image provider: NULL.
### reproducible example
```
view/tight/options [
    base 1040x480
    focus
    on-key-down [ if event/key = #"A" [  img1/image: copy/part at img2/image 0x0 81x81 ]]
    on-key [if event/key =  escape [unview]] ; escape key quits
    at 100x100 img1: base 81x81 white
    at 100x200 img2: image %/Users/apple/Desktop/red/images/test.png
][offset: 200x1240]
```
### red-12may18-142bd46d.dms - Mac 10.12.6
```
console-2018-5-12-55219[3545] <Error>: CGImageCreate: invalid image provider: NULL.
```



