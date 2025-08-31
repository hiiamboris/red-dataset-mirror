
#1345: Strange crash when compiled red script in gui branch.
================================================================================
Issue is closed, was reported by red-eco and has 0 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1345>

In `gui` branch.

```
Red []

url: http://autocomplete.wunderground.com/aq?format=JSON&lang=zh&query=Beijing
;probe "read"                       ;@@ uncomment it, will work fine.
json: read url
```



