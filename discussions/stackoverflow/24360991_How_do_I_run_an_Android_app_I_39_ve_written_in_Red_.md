# How do I run an Android app I&#39;ve written in Red?

**Link:**
<https://stackoverflow.com/questions/24360991/how-do-i-run-an-android-app-ive-written-in-red>

**Asked:** 2014-06-23 07:58:30 UTC

------------------------------------------------------------------------

When I enter this in the Windows CMD\...

    red -c -t Android hello.red

\...Red outputs a file called `hello` with no filename extension. If I
transfer this file to my Android device, it doesn\'t know what to do
with it.

What additional steps must I follow to test my Red code on my Android
device? Which of those steps, if any, must I do differently, depending
on whether or not my code will attempt to use the Android bridge?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by DocKimbel

The Android port is a work in progress done in the
[android](https://github.com/red/red/tree/android){rel="nofollow noreferrer"}
branch. In that branch, using:

    red -t Android <script.red>

will use the APK backend for the new packaging layer that will handle
the whole process of APK generation for you (provided that you have a
JDK1.6+ pre-installed). If all went well, you will get an APK in your
working folder.

In case you need to debug the building process, you need to edit the
`system/formats/APK.r` file and set on line 11 the `verbose` word to
yes.

Note: We are working on removing all the external dependencies one by
one.

EDIT: *The Android Red port has been moved to a private branch and
actively worked on. It will be made public once beta stage is reached.*

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

Unless you package up the executable into an .APK, then for security
reasons Android throws up some walls in your path to chmod +x it and
run.

I followed [these
directions](http://kevinboone.net/android_native.html){rel="nofollow"},
just with:

    $ cd /data/data/jackpal.androidterm/shared_prefs

    $ cat /sdcard/Download/hello.bin > hello

    $ chmod 755 ./hello

    $ ./hello

Without rooting or otherwise, you wind up with that weirdness like using
`cat` instead of `cp`, and slipping the file into a strange directory
where execution is allowed.

Tested on Nexus 5.

*Comment by WiseGenius:* Halfway there. This worked for
`%tests/hello.red`, but not for the bridge examples:
`%bridges/android/samples/eval/eval.red` `%bridges/java/hello.red` For
me, the prompt simply returned to the next line without any errors or
actions after `./eval` or `./hello`. When intending to use the bridge,
is it necessary to package the executable into an .APK after all? What
else must I do before I can use the bridge?

*Comment by earl:* The Java bridge example is intended to run with a
plain JVM with JNI support. Instructions how to run it are contained in
the [accompanying
README](https://github.com/red/red/blob/master/bridges/java/README.md){rel="nofollow noreferrer"}.
The Android bridge example is only a proof of concept and indeed needs
to be packaged up into an .APK. To do so, you either run
[build.r](https://github.com/red/red/blob/master/bridges/android/build.r){rel="nofollow noreferrer"}
from Rebol 2, or download the pre-built .APK linked to in [the blog post
announcing the Android
proof-of-concept](http://www.red-lang.org/2013/08/033-released-shared-libraries-and.html){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

### Answer (score: 1) --- by Oldes

I\'ve not tried yet, but check this:
[http://www.red-lang.org/2011/12/arm-support-released.html](http://www.red-lang.org/2011/12/arm-support-released.html){rel="nofollow"}
Also you may know, that there is an experimental Android version here:
[https://github.com/red/red/tree/android](https://github.com/red/red/tree/android){rel="nofollow"}

*Comment by Oldes:* Note that Red is still in alpha state, so don\'t
expect too much;-)

------------------------------------------------------------------------

### Answer (score: 1) --- by Respectech

It appears the question has been answered, but for those who want more,
there is an article for getting started with Red for Linux and Android
in the March 2014 issue of ODROID Magazine at
[http://magazine.odroid.com](http://magazine.odroid.com){rel="nofollow"}
.

There is also going to be a short how-to article in the July 2014
edition (released in the next few days) by Gregory Pecheret that will
demonstrate building an .apk from scratch in Red.

------------------------------------------------------------------------

## Comments on question
