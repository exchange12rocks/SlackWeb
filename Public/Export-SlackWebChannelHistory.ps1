function Export-SlackWebChannelHistory {
    Param (
        [Parameter(ParameterSetName = 'Name', Mandatory)]
        [string]$Name,
        [Parameter(ParameterSetName = 'ID', Mandatory)]
        [string[]]$ID,
        [Parameter(ParameterSetName = 'Name', Mandatory)]
        [Parameter(ParameterSetName = 'ID', Mandatory)]
        [ValidateScript({ Test-Path -Path $_ -PathType Container })]
        [string]$OutFolder,
        [Parameter(DontShow)]
        [int]$MessageRepliesRateLimitSeconds = $ModuleWideMessageRepliesRateLimitSeconds
    )

    if (-not $ID) {
        $ID = (Get-SlackWebChannel -Name $Name).id
    }

    foreach ($ChannelID in $ID) {
        $Messages = Get-SlackWebChannelMessages -ChannelID $ChannelID

        foreach ($Message in $Messages) {
            if ($Message.reply_count) {
                Start-Sleep -Seconds $MessageRepliesRateLimitSeconds
                $Replies = Get-MessageReplies -ChannelID $ChannelID -ts $Message.thread_ts -latest $Message.latest_reply
                $RepliesProcessed = ($Replies | ConvertFrom-Json).messages | Where-Object -FilterScript { $_.client_msg_id -ne $Message.client_msg_id }
                Add-Member -InputObject $Message -Name 'replies' -Value $RepliesProcessed -MemberType NoteProperty
            }
            if ($Message.files) {
                foreach ($File in $Message.files) {
                    Export-SlackWebFile -File $File -OutFolder $OutFolder
                }
            }
        }

        $MessagesFileName = '{0}.json' -f $ChannelID
        $Messages | ConvertTo-Json -Depth 20 | Set-Content -Path (Join-Path -Path $OutFolder -ChildPath $MessagesFileName)
    }
}