URL: <https://github.com/hiiamboris/red-formatting/discussions/16>
Date created: 2021-08-18T11:42:13Z

# `format-number-via-masks` (urgh) discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L871-L874

This function logic is simple enough, and raises only a few questions, but the whole idea of it doesn't resonate with me. If we have to use different masks for positive/negative/zero cases, then maybe our masks format is flawed? Can we patch the format to cover the whole real number range instead of this?

## Comments

### hiiamboris commented at 2021-08-18T11:44:29Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L873
https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L917
`value` cannot be `none` with the `number!` typeset
And should it be supported? What's the use case? Why only `none` and not `any-type! except number!`?

### hiiamboris commented at 2021-08-18T11:49:32Z:

I know I [asked already](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975948) why do we even need this function but the argument is still not convincing. It looks to me like we're including something *just because* it's in the spreadsheets.

If spreadsheets are the only use case, I'm sure spreadsheet authors will be able to also make a few lines of dispatching logic. If not the only, then I'd like to see the use cases.

My proposal is to delay inclusion of this function until it's proven of worth outside of spreadsheet context.

