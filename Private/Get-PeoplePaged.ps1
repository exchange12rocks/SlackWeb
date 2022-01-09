function Get-PeoplePaged {
    Param (
        [Parameter(Mandatory)]
        [int]$Page,
        [switch]$IncludeDeactivated
    )

    $HideDeactivatedUsers = if ($IncludeDeactivated) {
        0
    }
    else {
        1
    }

    $FormData = @{
        module                 = 'people'
        hide_deactivated_users = $HideDeactivatedUsers
        custom_fields          = '{{}}'
        page                   = $Page
    }

    Invoke-SearchRequest -FormData $FormData
}