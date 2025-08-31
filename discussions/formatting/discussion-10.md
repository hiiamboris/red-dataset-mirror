URL: <https://github.com/hiiamboris/red-formatting/discussions/10>
Date created: 2021-08-15T15:45:35Z

# `format-number-by-width` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L1014-L1024

I would hide this in a private context and not exposed. Let it be used internally by `format` only.

I think it should be implemented as a simple wrapper around https://github.com/hiiamboris/red-formatting/discussions/11

## Comments

### hiiamboris commented at 2021-08-16T13:06:54Z:

https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35974764
I concluded from my own experience that both *total+frac* and *whole+frac* modes are important. However long as this function serves as an internal wrapper, I don't care about it's interface. What we expose in `format` and `short-format` is what I will care about, but we can start small and fill in more modes as we go.

