$data = import-csv "D:\OrphanFiles_sample.txt"
write-output $data.count 
foreach ($line in $data)
{	
	$ValidPath = Test-Path $line.PATH 
	
	$PATH1 = $line.PATH
	
	if($ValidPath)
	{
	$outputValue = $line.PATH + " " + $ValidPath
	write-output $outputValue + " File FOUND "
	Remove-Item -Path $PATH1 -force
	}else 
	{
		write-output $outputValue + " File Not Found "
	
	}
	
}
