
#3835: Results of saving layout on macOS as a png differ from those on Windows
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3835>

**Describe the bug**
When an image created from a layout on macOS is saved as a PNG, only the contents of the Window are captured and artefacts are added at the bottom corners of the image. 
**To reproduce**
1. Run the following code in a RedGUI console on macOS:
```text
view/no-wait test-layout: layout [title "Simple Test" button "Do Nothing Verbosely"]
 test-img: to image! test-layout
save/as %<path>/SimpleTest.png to image! test-img 'png
```
2. View the image and compare it with that shown in the Red GUI Window.
**Expected behavior**
The image saved in the PNG should be identical to that displayed on screen. 
**Screenshots**
Red GUI Screen macOS
<img width="291" alt="Red GUI macOS" src="https://user-images.githubusercontent.com/697434/55376678-02863e00-5544-11e9-9641-84a66f6a2507.png">

Saved Image macOS
![Saved Image macOS](https://user-images.githubusercontent.com/697434/55376799-92c48300-5544-11e9-934e-557bb93769d8.png)


Red GUI Windows
<img width="169" alt="Red GUI Windows" src="https://user-images.githubusercontent.com/697434/55376702-221d6680-5544-11e9-8493-fffa5678c6e7.png">

Saved Image Windows
<img width="216" alt="Saved Image Windows" src="https://user-images.githubusercontent.com/697434/55376717-2b0e3800-5544-11e9-94d5-852f7e8b3c89.png">

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for macOS built 27-Mar-2019/6:32:26+08:00
```


