
#3245: to-local-file/full inserting a redundant backskash
================================================================================
Issue is closed, was reported by snotbubble and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3245>

### Expected behaviour
asubdfile: to-local-file/full %ffmpeg/bin/ffmpeg.exe
afile: to-local-file/full %test.txt
probe asubdfile
== {C:\1\test\ffmpeg\bin\ffmpeg.exe}
probe afile
== "C:\1\test\test.txt"

### Actual behaviour
asubdfile: to-local-file/full %ffmpeg/bin/ffmpeg.exe
afile: to-local-file/full %test.txt
probe asubdfile
== {C:\1\test\\\\ffmpeg\bin\ffmpeg.exe}
probe afile
== "C:\1\test\\\\test.txt"

### Red version and build date, operating system with version.
Win10 x64
red-26feb18-bffefe9d.exe


