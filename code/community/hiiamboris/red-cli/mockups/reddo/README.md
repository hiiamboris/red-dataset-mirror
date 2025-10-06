Ever missed the `--do "code"` option of REBOL?
This tiniest script implements it.

Usage: `red reddo.red "code ..."` or `reddo "code ..."` (latter calling `reddo.bat` wrapper)

Compile: `red -r reddo.red` if you wanna fix the Red version.

```
>reddo "print {Directory listing:} foreach x read %. [print [sp x]]"
Directory listing:
  README.md
  reddo.bat
  reddo.red
  test.bat
```
Binaries: [Windows](https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/reddo.exe), [Linux](https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/reddo)