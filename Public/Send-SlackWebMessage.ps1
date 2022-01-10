function Send-SlackWebMessage {
    Param (
        [Parameter(ParameterSetName = 'ChannelName', Mandatory)]
        [string]$ChannelName,
        [Parameter(ParameterSetName = 'ChannelID', Mandatory)]
        [string[]]$ChannelID,
        [Parameter(ParameterSetName = 'ChannelName', Mandatory)]
        [Parameter(ParameterSetName = 'ChannelID', Mandatory)]
        [string]$Text
    )

    if (-not $ChannelID) {
        $ChannelID = (Get-Channel -Name $ChannelName).id
    }

    foreach ($CID in $ChannelID) {
        $FormData = @{
            channel                    = $CID
            ts                         = (ConvertTo-UNIXTime -Date (Get-Date)) # current time. The original client increments the low part by one.
            type                       = 'message'
            xArgs                      = '{{}}'
            unfurl                     = '[]'
            blocks                     = ('[{{{{"type":"rich_text","elements":[{{{{"type":"rich_text_section","elements":[{{{{"type":"text","text":"{0}"}}}}]}}}}]}}}}]' -f $Message)
            include_channel_perm_error = 'true'
            client_msg_id              = [guid]::NewGuid().Guid
            token                      = '' # This property is filled by Invoke-ApiRequest
            _x_reason                  = 'webapp_message_send'
        }

        Invoke-ApiRequest -FormData $FormData -Method 'chat.postMessage'
    }
}