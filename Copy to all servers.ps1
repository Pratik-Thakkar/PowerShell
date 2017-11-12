$allmachines=Get-ADComputer -Filter * | Select -Expand Name

foreach ($server In $allmachines) {

	Copy-Item "C:\zabbix\get_disks.ps1" -Destination "\\$server\c$\zabbix\"
	echo $server

}