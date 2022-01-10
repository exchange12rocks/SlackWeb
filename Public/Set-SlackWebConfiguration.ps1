function Set-SlackWebConfiguration {
    Param (
        [string]$Token = $ModuleWideToken,
        [string]$Cookie = $ModuleWideCookie,
        [Parameter(DontShow)]
        [switch]$InitialConfiguration
    )

    @{
        Token  = $Token
        Cookie = $Cookie
    } | Export-Configuration

    if (-not $InitialConfiguration) {
        Write-Warning -Message 'Reload the module to import new values'
    }
}