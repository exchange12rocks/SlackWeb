function Export-SlackWebPeople {
    Param (
        [Parameter(Mandatory)]
        [string]$OutFile,
        [switch]$IncludeDeactivated
    )

    $Result = if ($IncludeDeactivated) {
        Get-People -IncludeDeactivated
    }
    else {
        Get-People
    }
    $Result | ConvertTo-Json -Depth 10 | Set-Content -Path $OutFile
}