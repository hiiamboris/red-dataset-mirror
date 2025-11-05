# Issue #5664: [Regression] Some Linux HTTP requests are sending a wrong verb
<https://github.com/red/red/issues/5664>

**Describe the bug**

It sends `Delete` instead of `DELETE` and `Options` instead of `OPTIONS`.

**To reproduce**
```
>> r: write/info https://httpbin.dev/delete [DELETE [header: "value"] {text}]
>> ? r/3
R/3 is a string! value: "method Delete not allowed^/"

>> r: write/info https://httpbin.dev/options [OPTIONS [header: "value"] {}]
>> ? r/3
R/3 is a string! value: "method Options not allowed^/"
```

**Expected behavior**

Proper verb case.


**Platform version**
```
Red 0.6.6 for Linux built 2-Nov-2025/15:30:23  commit #604db4b
```


<no comments>
