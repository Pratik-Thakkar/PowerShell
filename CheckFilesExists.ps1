$filestocheck = get-content C:\Users\pratik.thakkar\Desktop\File_location.txt

foreach ($file in $filestocheck)
{$result = Test-Path
write-host $result}