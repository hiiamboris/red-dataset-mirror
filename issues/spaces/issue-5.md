# Events are missed on GTK #5

**State:** open | **Created:** 2022-05-02T20:48:23+02:00 | **Updated:** 2023-10-08T18:47:06+02:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/5>
---

E.g. `over` event often refuses to work, especially on more complex layouts.
Bug is https://github.com/red/red/issues/4881 and I haven't found a workaround for it.
Basically if timer takes too much time and fires too often, other events are skipped. It may even stop drawing the window.

One can lower the rates of *all* faces (including `host` that by default runs at 100 fps), and it increases responsiveness, but doesn't fully fix it.

---
## Comments

### Comment by **hiiamboris** (**Posted:** 8-Oct-2023/18:47:06+02:00 | **Updated:** 8-Oct-2023/18:47:39+02:00):

This issue is mitigated currently by using custom event scheduler (it's included, no need to do anything). But it's experimental at the moment and causes some other problems.

---
