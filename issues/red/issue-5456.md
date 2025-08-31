
#5456: Console interpretes '-<- as a lit-word ('-) and a word (<-)
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/5456>

**Describe the bug**
The test `lexer-test.red` crashes with a script error:
```
>> do %lexer-test.red
~~~started test~~~ lexer
*** Script Error: --assert does not allow word! for its assertion argument
*** Where: --assert
*** Near :
*** Stack: do-file
```
The issue is caused by the fourth assertion in test  #4562, line 1571
```
1565    ===start-group=== "issues"
1566                                                                                                                                         
1567         --test-- "#4562"
1568                 --assert [<< '<< <<: :<<] == transcode "<< '<< <<: :<<"                                                                 1569                 --assert ['=<= :=<= =<=:] == transcode "'=<= :=<= =<=:"
1570                 --assert word? transcode/one "=<="                                                                                      1571                 --assert '-<- == transcode/one "-<-"
```

**To reproduce**
```
>> '-=-
== -=-
>> '->-
== ->-
>> '-<-
*** Script Error: <- has no value
*** Where: catch
*** Near : <-
*** Stack:

>> <-: 1
== 1
>> '-<-
== 1
```

**Expected behavior**
-<- should be interpreted as a single lit-word not a lit-word and a word

**Platform version**
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]
--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2024-01-10T16:43:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5456#issuecomment-1885213431>

    The lexical rules for allowing `<` inside a word (or at the beginning of a word) are not precisely defined currently. This is not an easy task as it can easily conflict with the "sticky tag" rule, allowing a word sticking to a tag to be separated by the lexer and producing two values:
    
    ```
    >> load "<p>text</p>"
    == [<p> text </p>]
    ```

--------------------------------------------------------------------------------

On 2024-01-10T19:29:46Z, greggirwin, commented:
<https://github.com/red/red/issues/5456#issuecomment-1885573613>

    Since all other bracketing chars break words lexically, `<` probably should too. That makes it non-orthogonal with `>` being allowed, but is otherwise consistent. Just need to shift `<` from one list to the other in https://github.com/red/docs/blob/master/en/datatypes/word.adoc#3-literal-syntax. 
    
    The argument for supporting it in words would be that you can make nifty arrow-like words that go in both directions, but you could still do that with Unicode chars, and is far less common than lexing data where they may be together.

