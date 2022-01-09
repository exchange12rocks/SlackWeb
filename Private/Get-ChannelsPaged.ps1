function Get-ChannelsPaged {
    Param (
        [Parameter(Mandatory)]
        [int]$Page,
        [ValidateSet('exclude_archived', 'private_exclude', 'private', 'archived', 'external_shared')]
        [string]$Mode = 'exclude_archived'
    )

    $FormData = @{
        module                 = 'channels'
        channel_type           = $Mode
        exclude_my_channels    = 0
        page                   = $Page
    }

    if ($ExcludeMyChannels) {
        $FormData.exclude_my_channels = 1
    }

    Invoke-SearchRequest -FormData $FormData
}