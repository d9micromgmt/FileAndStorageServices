configuration FileServer
{
    Param
    (
        [Parameter(Mandatory)]
        [String] $DomainName,
        [Parameter(Mandatory)]
        [String] $RetryCount,
        [Parameter(Mandatory)]
        [String] $RetryIntervalSec
    )

Import-DSCResource -modulename xActiveDirectory

    Node localhost
    {
    WindowsFeature file-services 
        {
        Name = file-services
        Credential = [PSCredential] 
        Ensure = [string] { Absent | Present }  
        IncludeAllSubFeature = [bool] 
        LogPath = [string] 
        DependsOn = [string[]] 
        Source = [string] 
        }
    xWaitForADDomain DscForestWait
        {
            DomainName = $DomainName
            DomainUserCredential = $domainCred
            RetryCount = $RetryCount
            RetryIntervalSec = $RetryIntervalSec
            DependsOn = "[WindowsFeature]ADDSInstall"
        }
    }
}