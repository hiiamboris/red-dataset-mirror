
#3312: Red GUI console uses ctrl+c for copy on macOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3312>

### Expected behavior
CMD+c should copy highlighted text from the Red GUI console
### Actual behavior
Red GUI console ignores the CMD modifier key. "c" will appear next to the input prompt.
Red GUI copies highlighted text with ctrl+c
### Steps to reproduce the problem
Highlight text in the Red GUI console and press CMD+c
### Version (run `about` in the Red Console and paste the result here) also add OS version.
>> about
Red 0.6.3 for macOS built 2-Apr-2018/23:21:48



