function Export-SlackWebFile {
    Param (
        [Parameter(Mandatory)]
        [PSCustomObject]$File,
        [Parameter(Mandatory)]
        [string]$OutFolder
    )

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
    elseif ($File.mode -in ('tombstone')) {
        # Do nothing - this is a non-existing file
    }
    else {
        Write-Error -Message ('File {0} of the type "{1}" is not supported yet.' -f $File.id, $File.mode) -TargetObject $File -Exception (New-Object -TypeName 'System.NotSupportedException')
    }
}