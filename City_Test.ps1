## create alias
	
	$AzCopy = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\AzCopy.exe"
	Set-Alias Az $AzCopy

    $7z = "C:\Program Files\7-Zip\7z.exe"
    Set-Alias 7z $7z
	
## create azure files
	$AzFiles = "https://imanageukworkbackupsa.file.core.windows.net/backup-share"
	$SgKey = "hYZXBX7t9DqngEONr/cOVRZe7fRsEkqrksogMR+3qlL/RrDychraMS1zQuV/BNaIkNA1V0p/B3Yjr5DJjNvnBg=="

<# ## Find directory location	
	$RootPath = "E:\Backup"
	$ClientPath = @(Get-ChildItem -Path $RootPath\*)
	
	foreach ($CB in $ClientPath)
	{ #>
##  client archive directory
    $Source = "E:\Backup\C5D9UKDMS01\Archive"

## create an array of files based on client archive directory, adjusted to the previously date 
    $Target = @(get-childitem $Source |? {$_.psiscontainer -and $_.lastwritetime -le (get-date).adddays(-1)})

## perform 7zip operation on all files that meet date criteria, set 7zip file as archive
	foreach ($file in $Target){
		&7z a -t7z ($file.FullName + ".7z") -m0=lzma2 -mx1 $file.FullName
		if ($LASTEXITCODE -eq 0) {
			$zipFile = $file.FullName + ".7z"
			echo ""
			echo "Zip file created successfully, configuring zip file as Archive files"
			echo ""
			
## set the created zip file as archive 
			Set-ItemProperty -Path $zipFile -Name attributes -Value "Archive"
		}
	}

## copy archived zip files to azure files with AzCopy	
	echo ""
	&Az /Source:$Source /Dest:$AzFiles /DestKey:$SgKey /A /XO
#}