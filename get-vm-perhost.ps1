get-vm | Foreach {$_ | Select name,
#Get data prosesor
@{n='vCore' ; e={($_ | Get-VMProcessor).count}},
#Get data memory
@{n='Memory (GB)' ; e={echo "$($_.MemoryStartup/1gb)GB"}},
#Get data storage
@{n='Storage (GB)' ; e={($_.Vmid | Get-VHD) | foreach{echo "$($_.size/1gb)GB"}}}} | Export-Csv -Path "C:\Temp\Get-VM Host 44.csv" -NoTypeInformation -Append