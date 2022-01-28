@{
    RootModule           = 'SlackWeb.psm1'
    ModuleVersion        = '0.1.2'
    GUID                 = '0c253c7c-e520-483e-89f9-c24cea05691b'
    Author               = 'Kirill Nikolaev'
    Description          = 'Enables you to work with Slack via the web-API rather then the regular API. This allows you to automate Slack actions w/o registering an application in your workspace.'
    PowerShellVersion    = '3.0'
    RequiredModules      = @(
        'Configuration'
    )
    FunctionsToExport    = @(
        'Clear-SlackWebConfiguration'
        'Export-SlackWebChannelHistory'
        'Export-SlackWebPeople'
        'Get-SlackWebChannelMessages'
        'Get-SlackWebChannel'
        'Get-SlackWebConfiguration'
        'Get-SlackWebPeople'
        'Send-SlackWebMessage'
        'Set-SlackWebConfiguration'
    )
    CmdletsToExport      = @()
    AliasesToExport      = @()
    HelpInfoURI          = 'https://github.com/exchange12rocks/SlackWeb/blob/main/README.md'
    PrivateData          = @{
        PSData = @{
            Tags                       = @()
            LicenseUri                 = 'https://github.com/exchange12rocks/SlackWeb/blob/main/LICENSE'
            ProjectUri                 = 'https://github.com/exchange12rocks/SlackWeb/'
            ReleaseNotes               = ''
        }
    }
}
