@echo off

SET "dst=C:\Users\pratik.thakkar\Desktop\173305_DeletedFiles"
SET "file_list=C:\Users\pratik.thakkar\Desktop\File_location.txt"
SET "out=C:\Users\pratik.thakkar\Desktop\result.log"
echo > %out%

FOR /F "usebackq eol=| delims=" %%f IN ("%file_list%") DO (
            echo "%%f >> %out%
            @copy /y "%%f" "%dst%" 
        )
    ) ELSE (
        echo %%f is not found! >> %out%
    )
)