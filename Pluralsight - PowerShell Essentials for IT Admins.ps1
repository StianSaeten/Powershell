$a = ''

$a =+ 9..19


$a[3]

$b = @{
    Name = 'Stian';
    ComputerName = $env:COMPUTERNAME;
    Date = (get-date)
    }

$b.Add({Get-Random -Maximum 100 -Minimum 10})



$txt = Get-ChildItem -Path C:\Windows -Filter *.txt -Recurse -ErrorAction SilentlyContinue

$txt | measure -Property Length -Sum


Get-Process | where company | group Company | sort Count -Descending

Get-Process | where StartTime| sort Starttime | select ID, Name, WorkingSet, StartTime -First 10



Get-EventLog -list | gm

Get-EventLog -LogName System | select -Last 100 | 
    select TimeGenerated, @{Name = 'HowOld'; expression = {(Get-Date) - $_.TimeGenerated}}, Source, EntryType, @{n = 'ComputerName'; e = {$_.MachineName}}