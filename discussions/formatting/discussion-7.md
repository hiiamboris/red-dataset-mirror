URL: <https://github.com/hiiamboris/red-formatting/discussions/7>
Date created: 2021-08-13T18:11:58Z

# `form-num-with-group-seps` discussion

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L155-L159

I should note that implementation uses `form` and it's out of our control:
```
>> form-num-with-group-seps/every 1.234e24 3
== "1.234,e24"
>> form-num-with-group-seps/every 1.23e24 3
== "1,.23,e24"
```
To properly implement it will require way more effort. And to expose it to outside world it has to be reliable.

## Comments

### hiiamboris commented at 2021-08-13T18:16:56Z:

Do we even want this?

Docs say this function is included because it's faster than mask-based formatters. Unusual argument coming from @greggirwin ☺

My opinion is let's put effort into speeding up mask formatters rather than into supporting this alternative (and documenting the differences and limitations, and dealing with consequences).

And if such function is useful on it's own, it can then just be a shortcut into the mask formatter.

For now I think this one should be kept in a private context. Then we don't care how limited it is.

### hiiamboris commented at 2021-08-13T18:19:26Z:

https://github.com/hiiamboris/red-formatting/blob/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae/format.red#L159

If it stays, let's ensure we use `/skip` refinement.

### hiiamboris commented at 2021-08-13T18:22:35Z:

It's not implemented, but do we want separators between fractional digits? Do we want to control it via refinement?
We can of course postpone this feature, but should plan ahead.

For /skip I think it will apply symmetrically to both left and right parts then: `1'23'45.67'89'01`, `1'234.567'89`.

### hiiamboris commented at 2021-08-17T13:06:25Z:

L10N question here is what separators and dot to choose. `'` and `.` are loadable, readable and unambiguous. The other choices are not, and only preferable for a certain known target audience.

