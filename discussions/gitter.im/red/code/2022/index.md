# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2022

## Tuesday 8th February, 2022

rebolek

[09:18](#msg6202357f708e9c3dd76a887d)@greggirwin I was looking at the Red/code repo, where to put XML functions. See the description from https://github.com/red/code/tree/master/Library :

This is a collection of useful Library functions and modules that can be included in Red programs. Its two sub-sections are Red and Red/System. All library functions and modules have API documentation.

There are actually no subsections. Either the description should be changed or the subsections should be created.

[09:20](#msg620235c4708e9c3dd76a8921)I’ll leave XML-tools in the `markup` repo for now until we decide how to organize the stuff in `code`.

greggirwin

[16:33](#msg62029b6941e3293d65e14f3b)Both red/code and red/community probably need a maintainer to see if the organization makes sense. Subsections make sense to me.

## Sunday 21st August, 2022

cosacam1

[20:08](#msg630290b811a6a83d0448b62e)Hi there. The user enters a number (actually an amount of money) but he/she is free to type it with/without decimal places, and as much decimal places as wanted so the user can enter 123 or 123.4 or 123.45 or 123.456. However I want to truncate at the cents and not to have any currency symbol. I made this function `with-cents: func [s][return remove to-string to-money s]` which works fine when the amount is under 1000, else it returns something like `"123'456.00"` with the thousand separator. I know it's related to how is currency set in the PC but I want it to work no matter the settings in any PC. I tried round/to 123 1.00 expecting to force to two decimals but it returned a float with one decimal place. So, any help? Thanks

hiiamboris

[20:11](#msg63029181b16e8236e30d8eba)`system/options/money-digits: 0`

cosacam1

[20:12](#msg630291989d3c18629993bb06)I could do something with find to detect the dot position in the string then to add it and the zeroes if not enough present or the other way round, remove extra decimals, all this in a while or an until, well I'm just looking for a format function or something, I guess there must be one just I don't remember now

dsunanda

[20:12](#msg630291c9443b7927a7a83c85)@cosacam1 Not entirely sure I understand what you are trying to do - but does this do it?

```
round/to 4578457845.454545 0.01
== 4578457845.45
```

hiiamboris

[20:16](#msg63029289aa09177429a119bf)If you only want to omit `.00`, then `clear find .. ".00"` will help

cosacam1

[20:18](#msg6302931005ad4a3701838774)Sure, not 1.00 but 0.01 as format. Thanks dsunanda. And yes, I want to keep .00 if any, thanks anyway hiiamboris

dsunanda

[20:20](#msg6302938d7ccf6b6d456a0dfe)You may need to use round/down/to for what you want:

```
>> round/to/down 4578457845.999999 0.01
== 4578457845.99
>> round/to 4578457845.999999 0.01
== 4578457846.0
```

hiiamboris

[20:24](#msg63029490aa09177429a127ef)maybe just use `mold` instead of `to-string`?

cosacam1

[20:28](#msg6302956605ad4a3701839926)Yes I've just noticed /to only returns one decimal place, so /to/down is the answer. Thanks... well, no. It works for numbers that already have more than two decimals but not with those with one or no decimals

[20:33](#msg6302969472ad51741f72bf5c)It works with mold.

```
with-cents: func [s][return remove mold to-money s]
```

Thanks both
