function Get-SlackWebChannelMessages {
    Param (
        [Parameter(Mandatory)]
        [string]$ChannelID,
        [Parameter(DontShow)]
        [string]$cursor
    )

    $GetChannelMessagesPagedParameters = @{
        ChannelID = $ChannelID
    }

    if ($cursor) {
        $GetChannelMessagesPagedParameters.Add('cursor', $cursor)
    }

    $Response = Get-ChannelMessagesPaged @GetChannelMessagesPagedParameters
    $ResponseProcessed = $Response.Content | ConvertFrom-Json
    $ResponseProcessed.messages

    if ($ResponseProcessed.response_metadata.next_cursor) {
        Get-SlackWebChannelMessages -ChannelID $ChannelID -cursor $ResponseProcessed.response_metadata.next_cursor
    }
}