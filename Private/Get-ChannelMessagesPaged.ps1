function Get-ChannelMessagesPaged {
    Param (
        [Parameter(Mandatory)]
        [string]$ChannelID,
        [string]$cursor
    )

    $FormData = @{
        channel           = $ChannelID
        limit             = 10
        ignore_replies    = 'true'
        include_pin_count = 'true'
        inclusive         = 'true'
        no_user_profile   = 'true'
        include_stories   = 'true'
        token             = '' # This property is filled by Invoke-ApiRequest
        _x_reason         = 'message-pane/requestHistory'
    }

    if ($cursor) {
        $FormData.Add('cursor', $cursor)
    }

    Invoke-ApiRequest -FormData $FormData -Method 'conversations.history'
}