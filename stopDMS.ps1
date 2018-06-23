Start-Transcript -path D:\stopDMS.log -append
$service = Get-Service imDmsSvc

if($service.Status -eq "Running") {
    Stop-Service imDmsSvc -Force
    
	if ((Get-Service imDmsSvc).Status -eq "Stopped") {
        echo "DMS Service Stopped"
    }

    $getStatus = Get-Service imDmsSvc
    $processid = (get-wmiobject win32_service | where {$_.name -eq 'imDMSSvc'}).processID

    $starttime = Get-Date
    $endtime = $starttime.AddMinutes(5)

    while ($starttime -lt $endtime -and $processid -ne "0") {
        Start-Sleep -s 15
        $starttime = Get-Date
        echo $starttime
    }
    
    if ($starttime -ge $endtime) {    
        Write-Host "Timeout! Stopping process forcefully."
        Stop-Process $processid -Force
    }
    
    do {
        $shutdownFlag = (Get-Content D:\Logs\DmsLog.txt | Select -Last 1).contains("SHUTDOWN")  
    } while($shutdownFlag -ne "True")

    $startMsg = Start-Service imDmsSvc
    $t=0

    while ((Get-Service imDmsSvc).Status -ne "Running" -and $t -lt 180) {
       Start-Sleep -s 15
       $t+=15
    }

    if ((Get-Service imDmsSvc).Status -eq "Running") {
        echo "DMS Service Started"
    }
    else {
        echo "Throw OpsGinie Alert"
    }
}
else {
    Start-Service imDmsSvc
    echo "DMS Service Started"
}