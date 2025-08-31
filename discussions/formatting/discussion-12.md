URL: <https://github.com/hiiamboris/red-formatting/discussions/12>
Date created: 2021-08-17T12:06:39Z

# `form-logic` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L578-L581

I'd give it 8/10 confidence score.

## Comments

### hiiamboris commented at 2021-08-17T12:07:51Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L584-L588

I propose adding case variants to the above: `yes-no`, `Yes-No`, `YES-NO`, etc. to eliminate the need for extra capitalize/uppercase/lowercase call.

### hiiamboris commented at 2021-08-17T12:09:32Z:

Localization is missing. https://github.com/hiiamboris/red-formatting/discussions/14

### greggirwin commented at 2021-08-19T02:40:02Z:

> https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L578-L581
> 
> I'd give it 8/10 confidence score.

Should we set 8/10 as good enough to move forward, and include for public comment?

### greggirwin commented at 2021-09-22T21:27:02Z:

Per a comment in https://github.com/hiiamboris/red-formatting/discussions/21, `mold-logic` should probably be a standalone func, and not dispatched inside `format`.

