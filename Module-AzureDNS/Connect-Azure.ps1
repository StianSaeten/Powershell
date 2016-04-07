function Connect-Azure
{
    <#
            .SYNOPSIS
            Connects to AzureRM
            .DESCRIPTION
            .SYNOPSIS
            Connects to AzureRM
            .EXAMPLE
            Connect-Azure -AzureRmSubscription 'Pay-As-you-Go'
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [Object]
        $AzureRmSubscription
    )
    
    Add-AzureRmAccount
    
    
    Set-AzureRmContext -SubscriptionName $AzureRmSubscription
}