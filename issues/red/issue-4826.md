
#4826: Use `/bin/sh` instead of `/bin/bash` in case when $SHELL is not set
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4826>

At this moment, when `SHELL` is not set on POSIX OS, `/bin/bash` is used:
https://github.com/red/red/blob/18bc5f7468c71d04f3b229cf426fa7326fc672e3/runtime/call.reds#L396-L399

Wouldn't it be better to use `/bin/sh` instead? I found that clean Alpine Docker's image does not set `SHELL` by default and does not include `/bin/bash`, only `/bin/sh` and there may be cases like that.

* `sh` is standardized and portable across POSIX systems — even if they happen not to have `bash`, they are required to have `sh`.
* `sh` is a specification, not an implementation, `/bin/sh` is a symlink (or a hard link) to an actual implementation on most POSIX systems. 


I believe that systems which have alternate shells are setting the `SHELL` value.


