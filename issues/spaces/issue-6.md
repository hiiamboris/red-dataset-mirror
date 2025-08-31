# Duplicate key events on GTK #6

**State:** open | **Created:** 2022-07-19T14:02:09+02:00 | **Updated:** 2022-07-19T14:02:09+02:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/6>
---

I've no idea why this happens and lazy to track it down right now.

When a `field` has a `hint`, triggering a show of this hint will duplicate the next `on-key` event on the field, resulting in stuttering input. The bug has other conditions, just adding a face to the pane is not enough for it to appear.

Need to eventually isolate the triggering scenario and file a Red issue report.

---
