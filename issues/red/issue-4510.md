
#4510: Possible to create invalid reactions that will never fire
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.design]
<https://github.com/red/red/issues/4510>

**Describe the bug**

`react` & `react/link` do not check if after the object comes a word:
```
>> react/link/later func [a b] [probe a/('data)] [a b]
== func [a b][probe a/('data)]        ;) reactivity does not support such paths
>> dump-reactions             ;) yet it does add them
1
:---  Source: object [type offset size text image color menu data enabled? visible? selected flags option
   Field: data
  Action: func [a b][probe a/('data)]
    Args: [object [type: 'face offset: none size: none text: none image: none color: none menu: non
>> a/data: 1             ;) and they become a dead weight
== 1
```
```
>> clear-reactions
== []
>> react/later [probe a/('data)]
== [probe a/('data)]
>> dump-reactions
1
:---  Source: object [type offset size text image color menu data enabled? visible? selected flags option
   Field: data
  Action: [probe a/('data)]
```

**To reproduce**
```
clear-reactions
a: make face! []
b: make face! []
react/later [probe a/('data)]
react/link/later func [a b] [probe a/('data)] [a b]
dump-reactions
```

**Expected behavior**

Should ignore anything but words after the object, as such dynamic paths are out of reactivity's scope.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



