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
        $ID = (Get-Channel -Name $Name).id
    }

    foreach ($ChannelID in $ID) {
        $Messages = Get-ChannelMessages -ChannelID $ChannelID

        foreach ($Message in $Messages) {
            if ($Message.reply_count) {
                Start-Sleep -Seconds $MessageRepliesRateLimitSeconds
                $Replies = Get-MessageReplies -ChannelID $ChannelID -ts $Message.thread_ts -latest $Message.latest_reply
                $RepliesProcessed = ($Replies | ConvertFrom-Json).messages | Where-Object -FilterScript { $_.client_msg_id -ne $Message.client_msg_id }
                Add-Member -InputObject $Message -Name 'replies' -Value $RepliesProcessed -MemberType NoteProperty
            }
            if ($Message.files) {
                foreach ($File in $Message.files) {
                    if ($File.mode -in ('hosted', 'snippet', 'email', 'space')) {
                        $FileName = $File.name
                        [System.IO.Path]::GetInvalidFileNameChars() | ForEach-Object -Process { $FileName = $FileName.replace($_, '_') }
                        $FullFileName = '{0}-{1}-{2}' -f $ChannelID, $File.id, $FileName
                        if ($File.mode -eq 'email') {
                            $FullFileName = '{0}.html' -f $FullFileName
                        }
                        try {
                            Invoke-CustomWebRequest -Uri $File.url_private_download -OutFile (Join-Path -Path $OutFolder -ChildPath $FullFileName) -ErrorAction Stop
                        }
                        catch {
                            Write-Error -Message ('Error while downloading file {0} ({1}).' -f $File.id, $File.url_private_download) -TargetObject $File -Exception $_.Exception
                        }
                    }
                    else {
                        Write-Error -Message ('File {0} of the type "{1}" is not supported yet.' -f $File.id, $File.mode) -TargetObject $File -Exception (New-Object -TypeName 'System.NotSupportedException')
                    }
                }
            }
        }

        $MessagesFileName = '{0}.json' -f $ChannelID
        $Messages | ConvertTo-Json -Depth 20 | Set-Content -Path (Join-Path -Path $OutFolder -ChildPath $MessagesFileName)
    }
}