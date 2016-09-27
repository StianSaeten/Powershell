# Laste ned siste versjon av Powershell
# https://www.microsoft.com/en-us/download/details.aspx?id=50395

# kjøre Powershell kode fra CMD
Powershell (-noexit) -command {& Get-Process}


# kjøre flere eksterne kommandoer i Powershell
ipconfig;route print

# Finne filversjon på kjørende programmer
Get-Process -Name explorer -FileVersionInfo
ps explorer -FileVersionInfo

# Finne OS versjon
[System.Environment]::OSVersion.Version

# VERB-NOUN!!

# Popup
$wshSehll = New-Object -ComObject "wscript.shell"
$wshSehll.Popup("Hello World!")

# where-object alias where

# CERT
sl cert:
sl .\\CurrentUser\AuthRoot
(gci).where({$psitem.subject -match 'entrust'})
(gci).where({$psitem.thumbprint -eq 'B31EB1B740E36C8402DADC37D44DF5D4674952F9'})

dir Cert:\CurrentUser -Recurse | ? Subject -Match 'montel'

dir -Recurse | ? NotAfter -LT "1/1/2020"
dir -Recurse | ? NotAfter -LT (get-date)

Get-ChildItem -Recurse | Where-Object { !$_.psiscontainer -and $_.NotAfter -lt '1/1/2020'} | Format-Table Notafter, Thumbprint, subject -AutoSize -Wrap

dir -Recurse | ? {$_.NotAfter -gt (Get-Date) -and $_.NotAfter -le (Get-Date).Add(30)}



# ENV
sl env:
gci


# FILES AND FOLDERS
gci | gm | where {$_.membertype -eq "property"}
gci -file -Force | gm -MemberType Property

New-Item -Path ([io.path]::GetRandomFileName()) -ItemType File
New-Item -Path ([io.path]::GetRandomFileName()) -ItemType Directory

New-TemporaryFile

New-Item -Name mytempfile -ItemType File -Value "My file"
Get-Content .\mytempfile
Add-Content .\mytempfile -Value "NEW INFO"



Get-PSDrive | ? Provider -Match filesystem | ft -AutoSize

# FUNCTIONS

sl function:
gci

gc .\Pause


# REGISTRY

Get-PSDrive  | ? Provider -Match registry

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' 
Get-ChildItem 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
Get-Item 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Dropbox'

New-Item -Path HKCU:\SOFTWARE\temp -Value "temp key"
New-Item -Path HKCU:\SOFTWARE\temp -Force -Verbose
Remove-Item -Path HKCU:\SOFTWARE\temp -Force -Verbose

Set-ItemProperty -Path HKCU:\SOFTWARE\temp -Name newproperty -Value 123 -Type DWord

if ((Get-ItemProperty -Path HKCU:\SOFTWARE\temp -name bogus -ea 0).bogus)
{
  'Property already exists'
}
Else
{
  Set-ItemProperty -Path HKCU:\SOFTWARE\temp -name bogus -Value 'bogus value'
}


Push-Location
Pop-Location


# BOK : Windows Powershell Best Practices