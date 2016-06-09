$EventLog = $args[0]
$StartDate=(get-date)
$TotalEvents = Get-EventLog $EventLog | measure | format-wide -Property Count | Out-String
$LastEventLog = Get-EventLog $EventLog | select-object -last 1 | format-wide -Property TimeWritten | Out-String
$Duration = New-Timespan –Start $StartDate –End $LastEventLog
$MPStemp =  $TotalEvents / $Duration.TotalSeconds
$MPS = $MPStemp -replace "-"
Write-Host "MPS :" $MPS
