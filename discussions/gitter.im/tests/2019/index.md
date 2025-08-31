# Archived messages from: [gitter.im/red/tests](/gitter.im/red/tests/) from year: 2019

## Sunday 24th February, 2019

endo64

[15:21](#msg5c72b66aa378ef11f63164b9)@PeterWAWood In `red\tests\source\environment\functions-test.red` file there is a part as below:

```
===start-group=== "sqrt tests"
	--test-- "sqrt test"
		--assert "24" = rejoin [1 + 1 2 * 2]
===end-group===
```

I think it is a copy/paste error, we at least should update its name.

PeterWAWood

[22:54](#msg5c732096c776985d8f486368)@endo64 I agree and have changed it.

## Tuesday 2nd April, 2019

PeterWAWood

[02:51](#msg5ca2ce4d8148e555b23391f4)@greggirwin To continue the discussion on tests of the GUI here rather than an issue. It is possible to write GUI regression tests without a GUI Test Framework or any external tools. It is simply a matter of comparing an image of a layout against a stored image correctly produced by using the same layout. This will require images to be generated for each supported GUI/OS combination.

Here is an example of how GUI regression tests could be written:

```
>> "First save an image of the layout"
== "First save an image of the layout"
>> view/no-wait test-layout: layout [title "Simple Test" button "Do Nothing Verbosely"]
== make object! [
    type: 'window
    offset: 630x425
    size: 179...
>> test-img: to image! test-layout
== make image! [358x100 #{
    EBECEBEBECEBEBECEBEBECEBEBECEBEBECEBEBEC...
>> save/as %/Users/Peter/Desktop/SiimpleTest.png to image! test-img 'png
>> unview
== []
>> 
>> "Then run a regression test to check against the stored image"
== {Then run a regression test to check against the stored image}
>> view/no-wait test-layout: layout [title "Simple Test" button "Do Nothing Verbosely"]
== make object! [
    type: 'window
    offset: 630x425
    size: 179...
>> test-img: to image! test-layout
== make image! [358x100 #{
    EBECEBEBECEBEBECEBEBECEBEBECEBEBECEBEBEC...
>> equal? to image! test-layout load/as %/Users/Peter/Desktop/SiimpleTest.png 'png
== true
>> unview
== []
```

[04:43](#msg5ca2e868016a930a454add47)Even that little test was helpful as I uncovered a bug in Red GUI - #3835

endo64

[06:25](#msg5ca30060759abc043c50bd3b)Equality test is a bit too strict, as different DPI/scaling options could result differently. Or we could warn during the test if scaling is different for tow images.

[09:15](#msg5ca3282f7ecbdc29cae7b624)Sure, I understood, we can start something like that then improve it. There are some similar test tools for web sites / browser testing.

## Thursday 4th April, 2019

greggirwin

[01:32](#msg5ca55ea831aec969e84b8598)We \*can* do it, and I'm all for it, the question is the ROI and when it adds more value in Red's lifecycle.
