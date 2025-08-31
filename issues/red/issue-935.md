
#935: Cannot open Android app.
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/935>

I have no trouble installing and running the apk downloaded from here:
http://static.red-lang.org/eval.apk

However, if I build the apk myself from the Android branch, although it seems to install without any problems, the installed app won't run.
When I tap the `Red on Android` app to open it, nothing happens.
It is then listed when I look at my open apps, but when I try to switch to it, it switches back to where I was before.

This happens whether I compile from Ubuntu with JDK6, or if I compile from Windows XP with JDK7 using the replaced files suggested in the version-mismatch-fix for #883.

Is eval.red itself is out of date?
This conversation made me wonder this:
http://chat.stackoverflow.com/transcript/message/18192376#18192376

Is there a different sample I should be testing instead?

Should I wait until Qtxie's 3rd-party-dependancy-free code is on Github before continuing any testing?

Here's the output when compiling from Windows XP:

```
>> do/args %red.r "-t Android %bridges/android/samples/eval/eval.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.4.3 ===-

Compiling /H/red-android/red-android/bridges/android/samples/eval/eval.red ...
...compilation time : 265 ms

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 13360 ms
...linking time     : 156 ms
...output file size : 585948 bytes
...output file      : H:\red-android\red-android\eval.so
cmd: {xcopy "bridges\android\res\drawable-hdpi" "H:\Documents and Settings\All Users\Red\builds\eval\res\drawab
le-hdpi" /Y /E /I}
bridges\android\res\drawable-hdpi\ic_launcher.png
1 File(s) copied
cmd: {xcopy "bridges\android\res\drawable-mdpi" "H:\Documents and Settings\All Users\Red\builds\eval\res\drawab
le-mdpi" /Y /E /I}
bridges\android\res\drawable-mdpi\ic_launcher.png
1 File(s) copied
cmd: {xcopy "bridges\android\res\drawable-xhdpi" "H:\Documents and Settings\All Users\Red\builds\eval\res\drawa
ble-xhdpi" /Y /E /I}
bridges\android\res\drawable-xhdpi\ic_launcher.png
1 File(s) copied
cmd: {xcopy "bridges\android\res\drawable-xxhdpi" "H:\Documents and Settings\All Users\Red\builds\eval\res\draw
able-xxhdpi" /Y /E /I}
bridges\android\res\drawable-xxhdpi\ic_launcher.png
1 File(s) copied
...generating apk
cmd: {"H:\Documents and Settings\All Users\Red\builds\tools\aapt" package -v -f -M "H:\Documents and Settings\A
ll Users\Red\builds\AndroidManifest.xml" -S "bridges\android\res" -I "H:\Documents and Settings\All Users\Red\b
uilds\tools\api\android.jar" -F "H:\Documents and Settings\All Users\Red\builds\eval-unsigned.apk" "H:\Document
s and Settings\All Users\Red\builds\eval"}
Processing raw dir 'H:\Documents and Settings\All Users\Red\builds\eval'
Found 6 asset files in H:\Documents and Settings\All Users\Red\builds\eval
Configurations:
 (default)
 hdpi
 mdpi
 xhdpi
 xxhdpi
 sw600dp
 sw720dp-land

Files:
  drawable\ic_launcher.png
    Src: (hdpi) bridges\android\res\drawable-hdpi\ic_launcher.png
    Src: (mdpi) bridges\android\res\drawable-mdpi\ic_launcher.png
    Src: (xhdpi) bridges\android\res\drawable-xhdpi\ic_launcher.png
    Src: (xxhdpi) bridges\android\res\drawable-xxhdpi\ic_launcher.png
  lib\armeabi\libRed.so
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\lib\armeabi\libRed.so
  res\drawable-hdpi\ic_launcher.png
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\res\drawable-hdpi\ic_launcher.png
  res\drawable-mdpi\ic_launcher.png
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\res\drawable-mdpi\ic_launcher.png
  res\drawable-xhdpi\ic_launcher.png
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\res\drawable-xhdpi\ic_launcher.png
  res\drawable-xxhdpi\ic_launcher.png
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\res\drawable-xxhdpi\ic_launcher.png
  values\dimens.xml
    Src: () bridges\android\res\values\dimens.xml
    Src: (sw600dp) bridges\android\res\values-sw600dp\dimens.xml
    Src: (sw720dp-land) bridges\android\res\values-sw720dp-land\dimens.xml
  values\strings.xml
    Src: () bridges\android\res\values\strings.xml
  values\styles.xml
    Src: () bridges\android\res\values\styles.xml
  AndroidManifest.xml
    Src: () H:\Documents and Settings\All Users\Red\builds\AndroidManifest.xml
  classes.dex
    Src: () H:\Documents and Settings\All Users\Red\builds\eval\classes.dex

Resource Dirs:
  Type drawable
    drawable\ic_launcher.png
      Src: (hdpi) bridges\android\res\drawable-hdpi\ic_launcher.png
      Src: (mdpi) bridges\android\res\drawable-mdpi\ic_launcher.png
      Src: (xhdpi) bridges\android\res\drawable-xhdpi\ic_launcher.png
      Src: (xxhdpi) bridges\android\res\drawable-xxhdpi\ic_launcher.png
  Type values
    values\dimens.xml
      Src: () bridges\android\res\values\dimens.xml
      Src: (sw600dp) bridges\android\res\values-sw600dp\dimens.xml
      Src: (sw720dp-land) bridges\android\res\values-sw720dp-land\dimens.xml
    values\strings.xml
      Src: () bridges\android\res\values\strings.xml
    values\styles.xml
      Src: () bridges\android\res\values\styles.xml
Including resources from package: H:\Documents and Settings\All Users\Red\builds\tools\api\android.jar
applyFileOverlay for drawable
applyFileOverlay for layout
applyFileOverlay for anim
applyFileOverlay for animator
applyFileOverlay for interpolator
applyFileOverlay for xml
applyFileOverlay for raw
applyFileOverlay for color
applyFileOverlay for menu
applyFileOverlay for mipmap
Processing image: bridges\android\res\drawable-hdpi\ic_launcher.png
Processing image: bridges\android\res\drawable-mdpi\ic_launcher.png
Processing image: bridges\android\res\drawable-xhdpi\ic_launcher.png
Processing image: bridges\android\res\drawable-xxhdpi\ic_launcher.png
    (processed image bridges\android\res\drawable-mdpi\ic_launcher.png: 98% size of source)
    (processed image bridges\android\res\drawable-hdpi\ic_launcher.png: 98% size of source)
    (processed image bridges\android\res\drawable-xhdpi\ic_launcher.png: 98% size of source)
    (processed image bridges\android\res\drawable-xxhdpi\ic_launcher.png: 97% size of source)
    (new resource id ic_launcher from hdpi\drawable\ic_launcher.png #generated)
    (new resource id ic_launcher from mdpi\drawable\ic_launcher.png #generated)
    (new resource id ic_launcher from xhdpi\drawable\ic_launcher.png #generated)
    (new resource id ic_launcher from xxhdpi\drawable\ic_launcher.png #generated)
Creating 'H:\Documents and Settings\All Users\Red\builds\eval-unsigned.apk'
Writing all files...
      'lib/armeabi/libRed.so' (compressed 78%)
      'res/drawable-hdpi/ic_launcher.png' (not compressed)
      'res/drawable-mdpi/ic_launcher.png' (not compressed)
      'res/drawable-xhdpi/ic_launcher.png' (not compressed)
      'res/drawable-xxhdpi/ic_launcher.png' (not compressed)
      'AndroidManifest.xml' (compressed 61%)
      'classes.dex' (compressed 44%)
      'resources.arsc' (not compressed)
Generated 8 files
Included 0 files from jar/zip files.
Checking for deleted files
Done!
...signing apk
cmd: {jarsigner -verbose -keystore "H:\Documents and Settings\All Users\Red\builds\androidtest.keystore" -store
pass android -keypass android -sigalg MD5withRSA -digestalg SHA1 -signedjar "H:\Documents and Settings\All User
s\Red\builds\eval-signed.apk" "H:\Documents and Settings\All Users\Red\builds\eval-unsigned.apk" testkey}
   adding: META-INF/MANIFEST.MF
   adding: META-INF/TESTKEY.SF
   adding: META-INF/TESTKEY.RSA
  signing: lib/armeabi/libRed.so
  signing: res/drawable-hdpi/ic_launcher.png
  signing: res/drawable-mdpi/ic_launcher.png
  signing: res/drawable-xhdpi/ic_launcher.png
  signing: res/drawable-xxhdpi/ic_launcher.png
  signing: AndroidManifest.xml
  signing: classes.dex
  signing: resources.arsc
jar signed.

Warning:
No -tsa or -tsacert is provided and this jar is not timestamped. Without a timestamp, users may not be able to
validate this jar after the signer certificate's expiration date (2041-12-01) or after any future revocation da
te.
...aligning apk
cmd: {"H:\Documents and Settings\All Users\Red\builds\tools\zipalign" -v -f 4 "H:\Documents and Settings\All Us
ers\Red\builds\eval-signed.apk" "H:\Documents and Settings\All Users\Red\builds\eval.apk"}
Verifying alignment of H:\Documents and Settings\All Users\Red\builds\eval.apk (4)...
      50 META-INF/MANIFEST.MF (OK - compressed)
     500 META-INF/TESTKEY.SF (OK - compressed)
    1017 META-INF/TESTKEY.RSA (OK - compressed)
    2185 lib/armeabi/libRed.so (OK - compressed)
  133548 res/drawable-hdpi/ic_launcher.png (OK)
  139632 res/drawable-mdpi/ic_launcher.png (OK)
  142884 res/drawable-xhdpi/ic_launcher.png (OK)
  152016 res/drawable-xxhdpi/ic_launcher.png (OK)
  169826 AndroidManifest.xml (OK - compressed)
  170543 classes.dex (OK - compressed)
  171060 resources.arsc (OK)
Verification succesful
...all done!
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-17T03:31:29Z, dockimbel, commented:
<https://github.com/red/red/issues/935#issuecomment-55844849>

    Indeed, the precompiled %classes.dex file is the newer version of the bridge used with the prototype new VID GUI dialect. The JNI event functions do not match with older test scripts.
    
    The new bridge should work fine with this script: %tests/android/vid.red. If you want to compile the %eval.red script, you need to checkout an older version of Android branch, before the change on %classes.dex file.
    
    Anyway, I need to update %eval.red to use the new bridge API.

--------------------------------------------------------------------------------

On 2014-09-17T07:32:33Z, qtxie, commented:
<https://github.com/red/red/issues/935#issuecomment-55858745>

    @WiseGenius You need to modify two places to get a runnable apk.
    1. classes.dex. You can use the older one or download [this one](https://raw.githubusercontent.com/qtxie/red/aapt/bridges/android/dex/classes.dex).
    2. eval.red. Change `main: function [this [integer!] /extern [input output]]` to `main: function [this [integer!] /extern input output]`
    
    Or you can use the [aapt](https://github.com/qtxie/red/tree/aapt) branch, helping us to test the internal android tool chain. ;-)

--------------------------------------------------------------------------------

On 2014-09-17T15:44:04Z, WiseGenius, commented:
<https://github.com/red/red/issues/935#issuecomment-55913771>

    @dockimbel Thank you! vid.red does work for me! Only a quarter of it fits on my screen, but that's not surprising. There were a couple of issues I noticed right away, but I'll report them separately.
    
    @qtxie Thank you! eval.red works for me now!

--------------------------------------------------------------------------------

On 2014-09-18T15:46:57Z, dockimbel, commented:
<https://github.com/red/red/issues/935#issuecomment-56058661>

    "Only a quarter of it fits on my screen" Right, this is caused by static coordinates for the widgets in the VID prototype. We'll add dynamic positioning/scaling later in VID.
    
    I keep this ticket open until %eval.red gets updated for the new bridge.

--------------------------------------------------------------------------------

On 2019-08-15T11:40:09Z, dockimbel, commented:
<https://github.com/red/red/issues/935#issuecomment-521612505>

    The Android support in master is superseded by the new Android private repo code, so I will close this ticket, as it is not relevant anymore. 

