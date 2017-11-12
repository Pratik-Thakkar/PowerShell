param([string[]]$remoteserver)

Copy-Item \\Salt-Minion-2015.8.8-2-AMD64-Setup.exe -Destination \\$remoteserver\C$
Invoke-Command -ComputerName $remoteserver -ScriptBlock {Start-Process 'C:\Salt-Minion-2015.8.8-2-AMD64-Setup.exe' -ArgumentList "/S /master= /minion-name=$remoteserver /start-service=1" -Wait }
