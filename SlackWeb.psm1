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

$Headers = @{
    'method'          = 'GET'
    'authority'       = '{0}.slack.com'
    'scheme'          = 'https'
    'path'            = ('/api/auth.test?token={0}' -f $ModuleWideToken)
    'accept'          = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
    'accept-encoding' = 'gzip, deflate, br'
}
$InitUri = 'https://slack.com/api/auth.test?token={0}' -f $ModuleWideToken
$Response = Invoke-CustomWebRequest -Uri $InitUri -Headers $Headers
$TeamInfo = $Response.Content | ConvertFrom-Json
[uri]$TeamInfoUri = $TeamInfo.url
$ModuleWideTeamUri = $TeamInfoUri.Host.Substring(0, $TeamInfoUri.Host.IndexOf('.'))
$ModuleWideTeamID = $TeamInfo.team_id