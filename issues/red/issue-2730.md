
#2730: [macOS VID] backdrop should accept image as its argument
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2730>

```
view [ size 200x200 title "OK" backdrop %ld.jpeg ]
```
backdrop should accept word! that bound to image!, image url!, or image file! as its argument.



Comments:
--------------------------------------------------------------------------------

On 2017-06-02T02:42:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2730#issuecomment-305674198>

    You can use ```compose``` to achieve the same effect:
    ```text
    my-image: %ld.jpeg
    view compose [ size 200x200 title "OK" backdrop (:my-image) ]
    ```

--------------------------------------------------------------------------------

On 2017-06-02T03:07:51Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2730#issuecomment-305677352>

    Thanks Peter. I've tried your solution on Windows, it worked. But on MacOS, It didn't work.

