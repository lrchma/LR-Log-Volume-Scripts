$EventLog = $args[0]
$StartDate=(get-date)
$TotalEvents = Get-EventLog $EventLog | measure | format-wide -Property Count | Out-String
$LastEventLog = Get-EventLog $EventLog | select-object -last 1 | format-wide -Property TimeWritten | Out-String
$Duration = New-Timespan –Start $StartDate –End $LastEventLog
$MPStemp =  $TotalEvents / $Duration.TotalSeconds
$MPS = $MPStemp -replace "-"
Write-Host "MPS :" $MPS

#Variation of the above but broken down by Day, Hour or Minute
#Thanks to Brent Branson @LR

#Get-EventLog -LogName Security -After ((Get-Date).Date.AddDays(-30)) | Group-Object {$_.TimeWritten.Date}
#Get-EventLog -LogName Security -After ((Get-Date).Date.AddDays(-1)) | Group-Object {$_.TimeWritten.Hour}
#Get-EventLog -LogName Security -After ((Get-Date).Date.AddHours(-1)) | Group-Object {$_.TimeWritten.Minute}
