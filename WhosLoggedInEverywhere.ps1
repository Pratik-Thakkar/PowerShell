$allmachines=Get-ADComputer -Filter * | Select -Expand Name

foreach ($server In $allmachines) {

#$server   = 'a31b3ch3dms01'
#$username = 'chris.bier'

$session = (quser /server:$server | findstr /V "USERNAME")
echo $server
echo $session

#if ($session) {
    #logoff $session /server:$server
#    echo $server
#}

}