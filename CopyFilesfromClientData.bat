@echo off

SET "dst=X:\198509_Documents"
SET "file_list=C:\Users\pratik.thakkar\Desktop\docloc.txt"
SET "out=C:\Users\pratik.thakkar\Desktop\output.log"
echo > %out%

FOR /F "usebackq eol=| delims=" %%f IN ("%file_list%") DO (
            echo "%%f >> %out%
            @copy /y "%%f" "%dst%" 
        )
    ) ELSE (
        echo %%f is not found! >> %out%
    )
)