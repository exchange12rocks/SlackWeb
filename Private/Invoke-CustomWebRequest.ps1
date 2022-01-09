function Invoke-CustomWebRequest {
    Param (
        [Parameter(ParameterSetName = 'InitRequest', Mandatory)]
        [Parameter(ParameterSetName = 'ApiRequest', Mandatory)]
        [Parameter(ParameterSetName = 'FileDownload', Mandatory)]
        [uri]$Uri,
        [Parameter(ParameterSetName = 'InitRequest')]
        [Parameter(ParameterSetName = 'ApiRequest')]
        [Parameter(ParameterSetName = 'FileDownload')]
        [string]$Cookie = $ModuleWideCookie,
        [Parameter(ParameterSetName = 'InitRequest')]
        [Parameter(ParameterSetName = 'ApiRequest')]
        [Parameter(ParameterSetName = 'FileDownload')]
        [string]$UA = $ModuleWideUA,
        [Parameter(ParameterSetName = 'FileDownload', Mandatory)]
        [string]$OutFile,
        [Parameter(ParameterSetName = 'ApiRequest', Mandatory)]
        [string]$Method,
        [Parameter(ParameterSetName = 'InitRequest', Mandatory)]
        [Parameter(ParameterSetName = 'ApiRequest', Mandatory)]
        [System.Collections.Hashtable]$Headers,
        [Parameter(ParameterSetName = 'ApiRequest', Mandatory)]
        [string]$ContentType,
        [Parameter(ParameterSetName = 'ApiRequest', Mandatory)]
        [object]$Body
    )

    $WebSession = New-Object -TypeName 'Microsoft.PowerShell.Commands.WebRequestSession'
    $WebSession.UserAgent = $UA
    $WebSession.Cookies.Add((New-Object -TypeName 'System.Net.Cookie' -ArgumentList ('d', $Cookie, '/', '.slack.com')))

    $InvokeWebRequestParameters = @{
        UseBasicParsing = $true
        Uri             = $Uri
        WebSession      = $WebSession
    }

    if ($OutFile) {
        $InvokeWebRequestParameters.Add('OutFile', $OutFile)
    }
    if ($Method) {
        $InvokeWebRequestParameters.Add('Method', $Method)
    }
    if ($Headers) {
        $InvokeWebRequestParameters.Add('Headers', $Headers)
    }
    if ($ContentType) {
        $InvokeWebRequestParameters.Add('ContentType', $ContentType)
    }
    if ($Body) {
        $InvokeWebRequestParameters.Add('Body', $Body)
    }

    $CurrentProgressPreference = $ProgressPreference
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest @InvokeWebRequestParameters
    $ProgressPreference = $CurrentProgressPreference
}