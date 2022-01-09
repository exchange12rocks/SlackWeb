function Get-ChannelMessages {
    Param (
        [Parameter(Mandatory)]
        [string]$ChannelID,
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
        Get-ChannelMessages -ChannelID $ChannelID -cursor $ResponseProcessed.response_metadata.next_cursor
    }
}