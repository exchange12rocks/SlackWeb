function Export-People {
    Param (
        [Parameter(Mandatory)]
        [string]$OutFile
    )

    Get-People | ConvertTo-Json -Depth 10 | Set-Content -Path $OutFile
}