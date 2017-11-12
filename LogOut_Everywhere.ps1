$allmachines=Get-ADComputer -Filter * | Select -Expand Name

foreach ($server In $allmachines) {

#$server   = 'a31b3ch3dms01'
$username = 'MyUserName'

$session = ((quser MyUserName /server:$server | ? { $_ -match $username }) -split ' +')[2]

if ($session) {
    logoff $session /server:$server
    echo $server
}

}