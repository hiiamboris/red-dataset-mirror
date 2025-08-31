
#4156: Bugs in GUI Console keyboard shortcuts
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.wish] [GUI]
<https://github.com/red/red/issues/4156>

**Describe the bug**

- `Shift+DEL` should work as `^X` but it works as `DEL`
- `Ctrl+DEL` should delete the word right, but works as `DEL`
- `Ctrl+Left/Right` word navigation is nonstandard (and annoying IMO): it stops twice around a single space char: `|word word` -> `word| word` -> `word |word` -> `word word|` (should skip a word every time)
- func `delete-text ctrl?` is a mess: `delete-text yes/no` deletes a word/char *back*, `delete-text/backward yes/no` deletes only a *single char* *forward*
- `TAB` inserts an invisible character at indexes 4, 8, 12 ...

**To reproduce**

Try pushing buttons ;)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Nov-2019/22:56:56+03:00 commit #6b28faf
```



