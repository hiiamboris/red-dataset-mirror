
#4844: [Regression, D2D] Images read from clipboard are often transparent and buggy
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4844>

**Describe the bug**

Images read behave as opaque in some scenarios and as transparent in other. Alpha channel manipulation is bugged. Copy is not identical.

I can see that `OS-image/from-HBITMAP` [gets called](https://github.com/red/red/blob/81cf6866454d36c0155d8af0b894dd8a21cac7b6/runtime/clipboard.reds#L302) whereas previously there was no such branch. Apparently it doesn't work as expected.


**To reproduce**

1. Open any (opaque) image in MS Paint (I also tested in FSViewer - same)
2. Copy it or it's part into clipboard, e.g.
![](https://i.gyazo.com/100010bd4a53a082fd1411bcfdc15582.png)
3. In Red:
```
>> i: read-clipboard
== make image! [349x151 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> i/alpha
== #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
```
`FF` means fully transparent!
```
>> ? i
```
Displays: ![](https://i.gyazo.com/998983be78a719355049a54a277c3ca5.png)
```
>> i/alpha
== #{
000000000000000000000000000000000000000000000000000000000000...
>> :MAGIC
```
now it says it's opaque!

Another try with [`explore`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/explore.red):
```
>> explore read-clipboard
```
![](https://i.gyazo.com/14ed545abf000db2a9b390c77bec13a2.png)
Right view shows that alpha of pixels is FF (transparent), yet the image is visible. Left view draws transparent pixels over white image and nothing is seen.

Let's try `copy`:
```
>> i: read-clipboard
== make image! [349x151 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> i/alpha
== #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> j: copy i
== make image! [349x151 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> j/alpha
== #{
000000000000000000000000000000000000000000000000000000000000...
```
copy has proper alpha

Let's try changing alpha in place:
```
>> i: read-clipboard
== make image! [349x151 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> i/alpha
== #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> i/alpha: 200
== 200
>> ? i
```
Shows opaque image (wrong!):
![](https://i.gyazo.com/da476fb7b92a988eff47552cf567a6c7.png)

Same thing with a copy:
```
>> j: copy i
== make image! [349x151 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> j/alpha
== #{
000000000000000000000000000000000000000000000000000000000000...
>> j/alpha: 200
== 200
>> ? j
```
Shows barely visible text (correct):
![](https://i.gyazo.com/b51df4f8fc62c96498bbe659fe002500.png)

**Expected behavior**

HBITMAP does not contain alpha channel so resulting alpha should be zero

**Platform version**
```
Red 0.6.4 for Windows built 1-Mar-2021/6:03:27+03:00 commit #81cf686
```



