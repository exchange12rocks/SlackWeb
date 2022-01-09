function Get-MessageReplies {
    Param (
        [Parameter(Mandatory)]
        [string]$ChannelID,
        [Parameter(Mandatory)]
        [string]$ts,
        [Parameter(Mandatory)]
        [string]$latest
    )

    $FormData = [ordered]@{
        channel   = $ChannelID
        ts        = $ts
        inclusive = $true
        limit     = 28
        latest    = $latest
        token     = '' # This property is filled by Invoke-ApiRequest
        _x_reason = 'history-api/fetchReplies'
    }

    Invoke-ApiRequest -FormData $FormData -Method 'conversations.replies'
}