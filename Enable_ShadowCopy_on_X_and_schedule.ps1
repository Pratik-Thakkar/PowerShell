#Invoke-Command -ComputerName '' -ScriptBlock {
If (Test-Path X:) {
    $tenpercent=[math]::Truncate(((Get-WmiObject Win32_LogicalDisk -ComputerName localhost -Filter "DeviceID='C:'" | Select-Object Size).Size * 0.1) / 1024000)
    vssadmin Add ShadowStorage /For=X: /On=X: /MaxSize=$tenpercent"MB"
    vssadmin Create Shadow /For=X:

    $Action=new-scheduledtaskaction -execute "c:\windows\system32\vssadmin.exe" -Argument "create shadow /for=X:"
    $PrincipalUser=New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    $Trigger=new-scheduledtasktrigger -weekly -WeeksInterval 1 -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday -at 7:00AM
    Register-ScheduledTask -TaskName ShadowcopyX -Principal $PrincipalUser -Trigger $Trigger -Action $Action -Description "ShadowCopy X at 7AM week-daily"
}
