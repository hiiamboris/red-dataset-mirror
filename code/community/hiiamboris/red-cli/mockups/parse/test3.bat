@echo.
@echo Displaying all mixed-case words:
@echo.
@parse -c --init "mixed?: function [w][s: to string! w not any [s == uppercase copy s  s == lowercase copy s]]" README.md "[any { } copy w word!] opt [if (mixed? w) keep (transcode/one w)]"