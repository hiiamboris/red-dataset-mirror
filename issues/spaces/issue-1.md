# Colors on Linux (GTK) and Mac default to B&W for now #1

**State:** open | **Created:** 2021-05-14T19:43:26+02:00 | **Updated:** 2022-11-28T15:32:54+01:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/1>
---

This is known. Mac backend is low priority, and GTK one is not actively developed by the Red Team, so there's a number of issues that will be there until some champion fixes them.

One of the issues is [red/red#4740](https://github.com/red/red/issues/4740): these backends does not fill `system/view/metrics/colors` map from the OS data. So I *cannot know* what colors are used in the OS.

And these colors need to be accounted for in the font used, and font cannot be recreated often because it's not garbage collected. So font is initialized on startup only, along with the colors. 

These lines in `styles.red` file initialize the colors:
https://gitlab.com/hiiamboris/red-spaces/-/blob/master/styles.red#L13-15

Workaround for now is to define these colors yourself and *reinclude* the `styles.red`:
```
system/view/metrics/colors/text: purple
system/view/metrics/colors/panel: cyan
#include %red-spaces/styles.red
```
Or to define them *before* including `%everything.red`:
```
system/view/metrics/colors: make map! reduce ['text purple 'panel cyan]
#include %red-spaces/everything.red
```

---
## Comments

### Comment by **hiiamboris** (**Posted:** 14-May-2021/19:44:31+02:00 | **Updated:** 14-May-2021/19:44:31+02:00):

changed the description

---
### Comment by **hiiamboris** (**Posted:** 15-May-2021/16:05:42+02:00 | **Updated:** 15-May-2021/16:05:42+02:00):

changed title from **Colors on Linux default to B&W for now** to **Colors on Linux {+and Mac +}default to B&W for now**

---
### Comment by **hiiamboris** (**Posted:** 15-May-2021/16:07:38+02:00 | **Updated:** 15-May-2021/16:07:38+02:00):

changed the description

---
