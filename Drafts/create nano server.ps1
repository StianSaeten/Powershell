Set-Location C:\NanoServerImageGenerator
Import-Module .\NanoServerImageGenerator -Verbose


$pwd = ConvertTo-SecureString -AsPlainText -Force -String 'Password99'

1..3 | % {
    New-NanoServerImage -MediaPath f:\ -TargetPath "c:\VM\nano-hc-0$_.vhd" -DeploymentType Guest -Edition Datacenter `    -ComputerName "Nano-HC-0$_" -AdministratorPassword $pwd `    -InterfaceNameOrIndex Ethernet -Ipv4Address "10.0.10.10$_" -Ipv4SubnetMask 255.255.255.0 -Ipv4Dns 10.0.10.10 `    -Storage -Clustering -Compute -EnableRemoteManagementPort    }    New-NanoServerImage -MediaPath f:\ -TargetPath "c:\VM\nano-iis.vhd" -DeploymentType Guest -Edition Datacenter `    -ComputerName "Nano-IIS" -AdministratorPassword $pwd `    -InterfaceNameOrIndex Ethernet -Ipv4Address "10.0.10.110" -Ipv4SubnetMask 255.255.255.0 -Ipv4Dns 10.0.10.10 `    -Packages Microsoft-NanoServer-IIS-Package