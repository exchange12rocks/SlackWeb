function Invoke-ApiRequest {
    Param (
        [string]$TeamDomain = $ModuleWideTeamDomain,
        [string]$TeamID = $ModuleWideTeamID,
        [Parameter(Mandatory)]
        [string]$Method,
        [Parameter(Mandatory)]
        [System.Collections.Hashtable]$FormData,
        [string]$token = $ModuleWideToken,
        [string]$FormBoundaryCommonPart = $ModuleWideFormBoundaryCommonPart
    )

    # https://chromium.googlesource.com/chromium/src/+/79420989569478d5b9a05e35a841a10d9d836cc4/net/base/mime_util.cc#592
    # https://source.chromium.org/chromium/chromium/src/+/main:third_party/blink/renderer/platform/network/form_data_encoder.cc;l=128?q=WebKitFormBoundary
    $FormBoundaryRandomPart = ('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' -split '' | Where-Object -FilterScript { $_ -ne '' } | Get-Random -Count 16) -join '' # Where-Object is required because the split operator inserts empty strings as the first and the last element of the collection

    if ($null -ne $FormData.token -and -not $FormData.token) {
        $FormData.token = $token
    }
    if ($null -ne $FormData.team -and -not $FormData.team) {
        if ($TeamID) {
            $FormData.team = $TeamID
        }
    }

    if ($null -eq $FormData._x_mode) {
        $FormData._x_mode = 'online'
    }
    if ($null -eq $FormData._x_mode) {
        $FormData._x_sonic = 'true'
    }

    $BodyTemplate = New-Form -FormData $FormData -BoundaryCommonPart $FormBoundaryCommonPart
    $Body = $BodyTemplate -f $FormBoundaryRandomPart

    $RelativeUri = '/api/{0}' -f $Method
    $TeamDomainString = if ($TeamDomain) {
        '{0}.' -f $TeamDomain
    }
    else {
        $null
    }
    $Headers = @{
        'method'          = 'POST'
        'authority'       = '{0}slack.com' -f $TeamDomainString
        'scheme'          = 'https'
        'path'            = $RelativeUri
        'accept'          = '*/*'
        'origin'          = 'https://app.slack.com'
        'accept-encoding' = 'gzip, deflate'
    }

    $FormBoundary = ('{0}{1}' -f $FormBoundaryCommonPart, $FormBoundaryRandomPart)

    $InvokeCustomWebRequestParameters = @{
        Uri         = ('https://{0}slack.com{1}' -f $TeamDomainString, $RelativeUri)
        Method      = 'POST'
        Headers     = $Headers
        ContentType = ('multipart/form-data; boundary={0}' -f $FormBoundary)
        Body        = ([System.Text.Encoding]::UTF8.GetBytes($Body))
    }
    Invoke-CustomWebRequest @InvokeCustomWebRequestParameters
}