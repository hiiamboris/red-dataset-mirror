@REM don't delete the license file!

del /q minimal\*.red
call red diff-all.red
call red make-all.red

del /q ..\format\locales\*.red
copy /y minimal\*.red ..\format\locales\
copy /y red.red ..\format\locales\
copy /y locales.red ..\format\

