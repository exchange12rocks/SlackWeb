#Requires -Version 3.0

$ModulePath = $PSScriptRoot

foreach ($FunctionType in @('Private', 'Public')) {
    $Path = Join-Path -Path $ModulePath -ChildPath ('{0}\*.ps1' -f $FunctionType)
    if (Test-Path -Path $Path) {
        Get-ChildItem -Path $Path -Recurse | ForEach-Object -Process { . $_.FullName }
    }
}

$ModuleConfiguration = Get-SlackWebConfiguration
$ModuleWideMessageRepliesRateLimitSeconds = $ModuleConfiguration.MessageRepliesRateLimitSeconds
$ModuleWideFormBoundaryCommonPart = $ModuleConfiguration.FormBoundaryCommonPart
$ModuleWideUA = $ModuleConfiguration.UA
$ModuleWideToken = $ModuleConfiguration.Token
$ModuleWideCookie = $ModuleConfiguration.Cookie

$WriteDownConfig = $false
if (-not $ModuleWideToken) {
    Write-Warning -Message 'Your token value is not defined. Please, set it now.'
    $ModuleWideToken = Read-Host -Prompt 'Your token, please'
    $WriteDownConfig = $true
}
if (-not $ModuleWideCookie) {
    Write-Warning -Message 'Your d-cookie value is not defined. Please, set it now.'
    $ModuleWideCookie = Read-Host -Prompt 'Your d-cookie, please'
    $WriteDownConfig = $true
}

if ($WriteDownConfig) {
    Set-SlackWebConfiguration -InitialConfiguration
}

$FormData = [ordered]@{
    include_unlisted_if_admin = $false
    token                     = '' # This property is filled by Invoke-ApiRequest
    _x_reason                 = 'conditional-fetching'
}

$Response = Invoke-ApiRequest -Method 'team.info' -FormData $FormData

$TeamInfo = $Response.Content | ConvertFrom-Json
$ModuleWideTeamID = $TeamInfo.team.id
$ModuleWideTeamDomain = $TeamInfo.team.domain