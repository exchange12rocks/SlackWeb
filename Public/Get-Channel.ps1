function Get-Channel {
    Param (
        [string]$Name,
        [string]$SearchString,
        [switch]$ExcludeMine
    )
    <# Param (
        [switch]$IncludePublic,
        [switch]$IncludePrivate,
        [switch]$IncludeArchived,
        [switch]$IncludeConnections,
        [switch]$ExcludeMine
    ) #>

    # exclude_archived = IncludePublic + IncludePrivate + IncludeConnections (All)
    # private_exclude = IncludePublic + $IncludeArchived (Public) + IncludeConnections (Public)
    # private = IncludePrivate + $IncludeArchived (Private) + IncludeConnections (Private)
    # archived = IncludeArchived (All)
    # external_shared = IncludeConnections (All)

    $Modes = @(
        'exclude_archived'
        'private_exclude'
        'private'
        'archived'
        'external_shared'
    )

    $FormData = @{
        module              = 'channels'
        exclude_my_channels = 0
    }
    if ($ExcludeMine) {
        $FormData.exclude_my_channels = 1
    }

    if ($SearchString ) {
        $FormData.query = $SearchString
    }
    elseif ($Name -and -not $SearchString) {
        $FormData.query = $Name
    }

    $ReturnedItems = New-Object -TypeName 'System.Collections.Generic.List[String]'
    foreach ($Mode in $Modes) {
        $FormData.channel_type = $Mode

        $Response = Invoke-SearchRequest -FormData $FormData
        $ProcessedItems = $Response | Select-Object -Property 'id', 'name', 'member_count', 'is_member', 'purpose'
        foreach ($Item in $ProcessedItems) {
            if ($ReturnedItems -notcontains $Item.id) {
                if ($Name -and $Item.name -like $Name -or -not $Name) {
                    $Item
                    $ReturnedItems.Add($Item.id)
                }
            }
        }
    }
}