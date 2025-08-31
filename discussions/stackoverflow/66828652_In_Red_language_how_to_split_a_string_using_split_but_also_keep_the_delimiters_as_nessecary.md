# In Red language, how to split a string using split, but also keep the delimiters as nessecary

**Link:**
<https://stackoverflow.com/questions/66828652/in-red-language-how-to-split-a-string-using-split-but-also-keep-the-delimiters>

**Asked:** 2021-03-27 06:35:16 UTC

------------------------------------------------------------------------

I want to split a string with the `split`, meanwhile the string contains
the string used as delimiter which should not be treated as delimiter. I
tried in this way as shown in the following code:

    >> split {1 + 3 `to-string #"^(60)"`c} "`"
    == ["1 + 3 " {to-string #"} {"} "c"] ;;I think it should be ["1 + 3 " {to-string #"^(60)"}"c"] 

`to-string #"^(60)"` used here is to avoid the appearance of \"\`\`\"
which would be referred as delimiter, but it fails. It seems that the
`^(60)` is evaluated to \"\`\`\`\" and then is used as delimiter by
`split`. So, what is the mechanism of the `split` in Red language? And
how to split a string meanwhile keeping those delimiters that should not
be treated as delimiter.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by 9214

`^(60)` is a so-called *codepoint form* that gets loaded as a `` ` ``
character.

    >> "^(60)"
    == "`"

If you want to avoid that, you should either escape it manually:

    >> {1 + 3 `to-string #"^^(60)"` c}
    == {1 + 3 `to-string #"^^(60)"` c}

Or use raw strings:

    >> %{1 + 3 `to-string #"^(60)"` c}%
    == {1 + 3 `to-string #"^^(60)"` c}

`split`ting it afterwards is trivial:

    >> split %{1 + 3 `to-string #"^(60)"` c}% #"`"
    == ["1 + 3 " {to-string #"^^(60)"} " c"]

------------------------------------------------------------------------

In case you want to keep `` ` `` character there, then `split` won\'t
cut it. You need something like Parse:

    >> string: {1 + 3 `to-string #"`"` c}
    == {1 + 3 `to-string #"`"` c}
    >> parse string [collect [keep to " `" " `" keep to "` " "` " keep copy match to end]]
    == ["1 + 3" {to-string #"`"} "c"]
    >> parse string [collect some [keep copy _ to copy match [" `" | "` " | end] match]]
    == ["1 + 3" {to-string #"`"} "c"]

*Comment by 9214:* \@lyl your toolchain is outdated, try to
[get](https://www.red-lang.org/p/download.html){rel="nofollow noreferrer"}
the latest, *automated* build (not the stable one). I don\'t think raw
strings are mentioned anywhere (poor documentation is Red\'s motto,
unfortunately); basically it\'s a string that does not require escaping
of any special characters within it, they are all treated as-is in their
raw form (hence the name). The syntax is `%...{...}...%` where number of
`%` on both sides should match (in case the string itself contains `%`
character).

*Comment by lyl:* Many thanks. And I updated my last comment. Would you
have a look at it?

*Comment by lyl:* I copied your code %{1 + 3 `to-string #"^(60)"` c}%
and run it, then get a wrong message
`*** Script Error: % operator is missing an argument`. Why? And where
can I find detail description about \"raw strings\"? Escape \"\^(60)\"
with an extra \"\^\" i.e. \"\^\^(60), then it can\'t return to
\"`" as shown in this example: rejoin split {a`b`c^^(60)d} "`\". This
will get \"abc\^\^(60)d\" not \"abc\`d\". Would you help me with this?
Thank you.

------------------------------------------------------------------------

## Comments on question

*Comment by A Haworth:* If you add a tag to your question which shows
which language you are using you are more likely to attract people who
can help.

*Comment by lyl:* Thank you for your reminder. I have updated my issue.

*Comment by pippo1980:* An example of input string and output string
both expected and actually gotten would help.
