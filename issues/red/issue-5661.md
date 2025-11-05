# Issue #5661: `query` behavior is highly filesystem-specific
<https://github.com/red/red/issues/5661>

**Describe the bug**

I was trying to use `query` as a poor man's dir-or-file detector:
- `query %dir/` -> not-none
- `query %file/` -> none (if `file` is not a directory)

That works on NTFS on *clean paths*. As long as there's a reparse point in the path (junction, symlink, volume mount point) - `query %file/` succeeds as if it was a directory.

The faulty behavior is not observed on Linux, only on Windows (Mac not tested, assumed Linux-like).

**To reproduce**
1. In the shell:
   ```cmd
   $ mkdir test$ & mklink /j link$ test$ & echo. >test$\1
   ```
2. In Red:
   ```
   query %test$/1/        ;) => none
   query %link$/1/        ;) => date! value
   ```

**Expected behavior**

Returns `none` in both cases

**Platform version**
```
Red 0.6.6 for Windows built 9-Sep-2025/3:21:04+08:00  commit #c8b6ebc
```



## dockimbel on 2025-10-31T17:36:59Z
Not Red's fault:

> When you call GetFileAttributesExW(L"link$\\1\\", ...), Windows must resolve the junction before evaluating the rest of the path.
> 
> The junction link$ points to test$.
> So internally, the resolved path is the same as "test$\\1\\".
> 
> You’d expect the same failure — but:
> 
> When you access through a reparse point, the file system driver (NTFS) sometimes normalizes paths differently:
> 
> The object manager and NTFS reparse resolution strip extra trailing slashes after the reparse resolution.
> 
> As a result, "link$\\1\\" can be effectively resolved as "test$\\1" before attribute lookup.
> 
> Thus, GetFileAttributesExW() succeeds, because it ends up querying "test$\\1" — a valid file.
> 
> This behavior is not officially documented, but it has been observed in practice:
> junctions and symbolic links sometimes tolerate redundant trailing backslashes that normal file paths reject.

https://github.com/red/red/blob/master/runtime/simple-io.reds#L1095


## dockimbel on 2025-10-31T17:46:31Z
@hiiamboris If you want to make a PR for this ticket, I'll merge it, otherwise, I'll mark it "won't fix" as it's too much work for making a workaround to this odd Windows behavior.


## hiiamboris on 2025-11-01T08:37:55Z
Maybe we can just insert a check if it's physically a directory? 
I'll test if something as simple as that will work...


## hiiamboris on 2025-11-01T08:41:41Z
I guess that was an AI response? It's a good practice to always ask it to reinforce the answer with URLs, otherwise it may write garbage that looks very convincing :)


## dockimbel on 2025-11-01T10:17:19Z
Yeah, AI answer. :) I've tried to force it to source that information, but it failed, so it's not authoritative.

> Maybe we can just insert a check if it's physically a directory?

How do you propose to do that? `GetFileAttributesExW()` is the usual way to achieve it.


## hiiamboris on 2025-11-02T14:06:56Z
I tested and indeed the AI is right. Weird behavior.
I just [added an extra check](https://github.com/red/red/pull/5663):
- if you request `path/file` then both directory and file results are acceptable
- if you request `path/file/` then only directory should be acceptable, so if Windows returns data for a file, we abort


