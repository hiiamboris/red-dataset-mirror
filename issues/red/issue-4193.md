
#4193: [Parse] preemptive BREAK and REJECT
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.design]
<https://github.com/red/red/issues/4193>

Related to: https://github.com/red/red/issues/3478

**Describe the bug**

* `break` forces wrapping block rule to succeed and breaks the loop currently in use (`any`, `some`, `while`, `integer!`);
* `reject` forces wrapping block rule to fail and breaks the loop currently in use.

Both keywords achieve loop breaking by setting an internal flag. Unfortunately, this flag is not properly reset, making it possible to break loops _before_ they are used.

Basically, usage of `break` or `reject` permits only 1 iteration of a yet-to-come loop to happen.

**To reproduce**

`3 word!` manages to match only once and fails (because it supposed to match 3 times). The identical alternative rule, on the other hand, succeeds in matching 3 words, because the flag was reset.

```red
>> parse [a b c][[break] 3 word! | 3 word!]
== true
```

`[reject]` instantly backtracks, `some word!` manages to match only once, "gets broken" and succeeds (because `some` succeeds if it matched _at least once_) `2 word!` match the rest of the input.

```red
>> parse [a b c][[reject] | some word! 2 word!]
== true
```

`break` saves the day and prevents the infinite loop from happening: `while` matches `none` once and then stops, despite `none` never failing by the very definition of it.

```red
>> parse [a b c][[break] while none to end]
== true
```

`break` permits only 1 iteration of the next loop. `1 word!` matches exactly once, breaks and succeeds (because, well, it matched 1 time), thus permitting `some` to eat all the input.

```red
>> parse [a b c][[break] some 1 word!]
== true
```

**Expected behavior**

Design of control flow keywords is an open design question, but I'd expect `break` and `reject` to not be as clairvoyant as they are now.

**Platform version**

The latest build, all platforms.


