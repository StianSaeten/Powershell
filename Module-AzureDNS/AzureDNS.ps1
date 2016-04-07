#requires -Version 1 -Modules AzureRM.Dns, AzureRM.Profile


$AzureRmSubscription = 'Pay-As-You-Go'



Add-AzureRmAccount



Set-AzureRmContext -SubscriptionName $AzureRmSubscription




#Create
#A

$RecordType = 's'

$name = 'cname-test-stian'
$cname = 'www.saeten.com'
$zoneName = 'montel.de'
$ResouceGroupName = 'Montel-DNS'



 
if ($RecordType -ne 'A' -Or $RecordType -ne 'CNAME')
{
    Write-Host -Object 'The script only support A and CNAME records' -ForegroundColor Red
    #exit 
}



$rs = New-AzureRmDnsRecordSet -Name $name -RecordType $RecordType -Ttl 3600 -ZoneName $zoneName -ResourceGroupName $ResouceGroupName 
  


if ($RecordType -eq 'A')
{
    Add-AzureRmDnsRecordConfig -RecordSet $rs -Ipv4Address '1.2.3.4'
}
  
elseif ($RecordType -eq 'CNAME')
{
    Add-AzureRmDnsRecordConfig -RecordSet $rs -Cname $cname
}



  
Set-AzureRmDnsRecordSet -RecordSet $rs -Verbose
