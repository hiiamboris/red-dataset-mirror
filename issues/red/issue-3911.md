
#3911: kind plea from visually impaired of Android how to try yours Android variant of RED?
================================================================================
Issue is closed, was reported by JanuszChmiel and has 6 comment(s).
<https://github.com/red/red/issues/3911>

Dear specialists,
When ever I find fast language which is able to be used on Android devices, my attention is focused on this project. And today, I have found yours Android port of Red language. Please, why did you not created .apk package? Is it possible to create GUI applications and are those apps accessible with screen reader for Android operating system? I have found on The bridges folder some classes.dex so I think, that because resulting builded app for Android do not contain .so library which uses SDL output library, that apps could be 100 % accessible with screen readers.
How can I find available commands for The Android port of Red to find out, if it is possible to create GUI with buttons, radio buttons ETC?
Is it necessary to use Gui rebor library or you have used other approach?
Because you have even not included androidmanifest.xml file, I can not use some Android packaging tool to find out, if yours interpret for Android work.
Any help will be very welcomed, because Rebor developers did not included apk builder for us.
They have included two samples with Two .apk files, which have contained encrypted Rebor sources. But because I do not know which encryption tool they have used, I can not simply modify their .apk and place my Rebor source here. And I have also found out, that Red contain much more newer functions and commands.
Thank you very much for yours help.
With kindness regards.
Janusz Chmiel



Comments:
--------------------------------------------------------------------------------

On 2019-06-05T17:22:27Z, 9214, commented:
<https://github.com/red/red/issues/3911#issuecomment-499177170>

    We have a [dedicated community chat](https://gitter.im/red/red/welcome) where you can ask that kind of questions, so, please keep issue tracker for bug reports only.
    
    [Last year announcement](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html) clearly stated that Android support is developed in a private branch, with public release planned for [0.7.1 version](https://trello.com/c/zsGMrT3n/145-071-android-gui-support). Android bridge in the main branch is an old, unsupported prototype.
    
    You can find show-cased APK [here](https://static.red-lang.org/build/red-eval4.apk) (note that camera usage requires permissions setup).

--------------------------------------------------------------------------------

On 2019-06-14T15:56:53Z, willsheppard, commented:
<https://github.com/red/red/issues/3911#issuecomment-502164178>

    May I humbly suggest that if a user tries to cross-compile to Android, they be shown a warning/link similar to the message above. And remove that warning when the release happens.

--------------------------------------------------------------------------------

On 2019-08-19T21:27:46Z, endo64, commented:
<https://github.com/red/red/issues/3911#issuecomment-522760860>

    @dockimbel @greggirwin We can close this issue. Can also add a note to wiki about cross compiling to Android.

