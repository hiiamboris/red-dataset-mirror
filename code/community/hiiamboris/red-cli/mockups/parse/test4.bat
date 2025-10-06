@echo.
@echo Extracting columns 8-15 from the text
@echo.
@parse -c -l --whole README.md "0 8 skip keep copy _ 0 8 skip"