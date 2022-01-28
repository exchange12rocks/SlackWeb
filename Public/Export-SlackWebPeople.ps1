function Export-SlackWebPeople {
    Param (
        [Parameter(Mandatory)]
        [string]$OutFile,
        [switch]$IncludeDeactivated
    )

    $Result = if ($IncludeDeactivated) {
        Get-SlackWebPeople -IncludeDeactivated
    }
    else {
        Get-SlackWebPeople
    }
    $Result | ConvertTo-Json -Depth 10 | Set-Content -Path $OutFile
}