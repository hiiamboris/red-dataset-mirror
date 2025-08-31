
#5426: Red compiler reporting a corrupt file in some path but there's not such a file there
================================================================================
Issue is closed, was reported by cosacam1 and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5426>

**Describe the bug**

I'm trying to compile a program I wrote to test Red on Android and the compiler gives me the following warnings and error

PS E:\red-master20231114\red-master\bridges\android\samples\eval> e:\red\red-toolchain -dlib -t Android try-android.red

-=== Red Compiler 0.6.4 ===-

Compiling E:\red-master20231114\red-master\bridges\android\samples\eval\try-android.red ...
...compilation time : 2812 ms

Target: Android

Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Warning: node! macro in R/S is redefined
*** Warning: red-value! macro in R/S is redefined
*** Warning: red-any-word! macro in R/S is redefined
*** Warning: red-all-word! macro in R/S is redefined
*** Warning: red-any-list! macro in R/S is redefined
*** Warning: red-any-path! macro in R/S is redefined
*** Warning: red-any-block! macro in R/S is redefined
*** Warning: red-any-function! macro in R/S is redefined
*** Warning: red-any-object! macro in R/S is redefined
*** Warning: red-any-string! macro in R/S is redefined
*** Compilation Error: undefined symbol: red/platform/prin-2hex*
*** in file: %/E/red-master20231114/red-master/bridges/android/samples/eval/utils.reds
*** in function: prin-molded-byte
*** at line: 40
*** near: [red/platform/prin-2hex* i prin-byte #")"]
PS E:\red-master20231114\red-master\bridges\android\samples\eval>

But utils.reds is not in that path
It is  in red-master20231114/system/runtime folder and it does have a print-molded-byte function but that function calls prin-2hex, not prin-2hex*

**To reproduce**

So far I guess the problem is in the compiler (not that I'm saying that my program is error free but I can't test my program if I can't compile it) Anyway, here is my program (which I put it in redmaster20231114/bridges/android/samples/eval/ folder) and the corresponding manifest.xml (also in that same folder)

Red [
    Title: "Trying Red on Android"
    Author: "Cosme Antonio Caso Machín"
    File: %try-android.red
    Disclaimer: {
        This is an exercise based in some code from:
        - Nenad's eval.red  (from redmaster/bridges/android/samples/eval/ at github)
        - Nenad's hello.red (from redmaster/bridges/java/ at github)
        - Nenad's gui.red   (from redmaster/modules/view/backends/android/ at github)
        - Paul Laughton's RFO-Basic! source code available at http://www.java2s.com/example/java-src/pkg/com/rfo/basic/run-b0f31.html
    }
]

; this program's file should be located at redmaster/bridges/android/samples/eval/
; so the following relative path works
; (or you can place it elsewhere and modify the next path)

#include %../../../java/bridge.red

activity-obj: vibr-obj: none    ; I think the vibrator object is an intent in Android jargon, isn't it?

alert: func [msg /local obj][
	obj: java-new ["android/app/AlertDialog$Builder" activity-obj]
	java-do [obj/create]
	java-do [obj/setTitle msg]
	java-do [obj/show]
]

do-vibrate: func [
    "Vibrates a number of times according to a pattern"
    pattern [block!]        "Pattern of 'play and stop' sequence in milliseconds eg: [500 100 500] play stop play"
    num-plays [integer!]    "-1: play pattern once     0: play forever     > 0: cancel playing"
    /local err [string!]
][
    numbers: has [ok] [
        ok: true
        forall pattern [
            unless all [
                integer? pattern/1
                positive? pattern/1 ; I guess zero should not be allowed; it's no sense to play or stop during 0 msec.
            ][ok: false break]
        ]
        ok
    ]    
    
    either any [none? pattern   empty? pattern  not numbers][
        alert "Pattern must be a list of positive integers"
    ][
        alert "Pattern is ok"   ; @@ remove this line later, just for 'debugging' now
        if error? try [
            if none? vibr-obj [vibr-obj: java-new [android.os.Vibrator activity-obj]]
            either num-plays > 0 [
                java-do [vibr-obj/cancel]
            ][java-do [vibr-obj/vibrate pattern num-plays]]
        ][
            alert "Your application has no permission to use the phone vibrator."
            vibr-obj: none      ; is this enough for freeing the vibrator object ?
                            ; should I use null instead on none ? 
                            ; I guess not because null is R/S not Red
        ]
    ]
]

cancel-vibrator: does [     ; this function can be used in a cleanup process at the end of the app
    unless none? vibr-obj [
        vibr-obj/cancel
        vibr-obj: none
    ]
]

on-java-event: function [face [integer!] type [integer!] event [integer!]][
	switch/default type [
		1 [     ; maybe it should be another number (other than 1) I don't know
           do-vibrate [200 100 200 100 200 100 500 100 500 100 500 100 200 100 200 100 200] -1 ; . . . _ _ _ . . .
		]
		201 [   ; I guess 201 is the type of the event created by BACK key used for closing the app
			system: java-new [java.lang.System]	
			java-do [system/exit 0]
		]
	][
		print ["java event:" event]
	]
]

HORIZONTAL: 0
VERTICAL: 	1

main: func [this [integer!]][   ; this is the entry-point
                                ; I guess it must match the one in manifest.xml file
                                ; <action android:name="android.intent.action.MAIN" />
	activity-obj: to-java-object this

	lay: java-new [android.widget.LinearLayout activity-obj]
	java-do [lay/setOrientation VERTICAL]

	btnVibrate: java-new [android.widget.Button activity-obj]
	java-do [btnVibrate/setText "S.O.S."]   ; plays Morse code in the phone's vibrator
	java-do [btnVibrate/setId 101]          ; is this 101 an arbitrary ID or some rule must be observed?
	btn-click: java-new [org.redlang.eval.ClickEvent]
	java-do [btnVibrate/setOnClickListener btn-click]
	java-do [lay/addView btnVibrate]    
    
	java-do [activity-obj/setContentView lay]
]

<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="org.redlang.try-android"
    android:versionCode="1"
    android:versionName="1.0" >

    <uses-sdk
        android:minSdkVersion="10"
        android:targetSdkVersion="17" />

    <application
        android:debuggable="true"
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme">
        <activity
            android:name="org.redlang.try-android.MainActivity"
            android:label="Trying Red on Android" >
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

**Expected behavior**

The compiler must report the true error in a file located where it really is

**Platform version**

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5049 date: 7-Nov-2023/12:45:54 commit: #febf277a3962f34ab040b52e9287f315489d19ab ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2023-11-15T18:30:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5426#issuecomment-1813047676>

    That old version of Android port is not maintained. A newer version has been worked on, but on a private branch for now.

--------------------------------------------------------------------------------

On 2023-11-16T02:40:42Z, cosacam1, commented:
<https://github.com/red/red/issues/5426#issuecomment-1813700937>

    Thanks for replying. So you guys are already working on Red for Android.
    Will it be done using java-new and java-do? Can anyone of us help? I'm
    willing to help, even for free. Is it possible? Android development has
    been delayed for so long! And I think it is so necessary for Red to be used
    by most programmers. We are too few yet. Best wishes for Red team
    
    El mié., 15 nov. 2023 13:31, Nenad Rakocevic ***@***.***>
    escribió:
    
    > That old version of Android port is not maintained. A newer version has
    > been worked on, but on a private branch for now.
    >
    > —
    > Reply to this email directly, view it on GitHub
    > <https://github.com/red/red/issues/5426#issuecomment-1813047676>, or
    > unsubscribe
    > <https://github.com/notifications/unsubscribe-auth/AUQUDU3UUVFHUDINNFFIOVLYEUC6ZAVCNFSM6AAAAAA7LMYQ2WVHI2DSMVQWIX3LMV43OSLTON2WKQ3PNVWWK3TUHMYTQMJTGA2DONRXGY>
    > .
    > You are receiving this because you authored the thread.Message ID:
    > ***@***.***>
    >

