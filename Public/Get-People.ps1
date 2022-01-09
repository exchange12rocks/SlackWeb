function Get-People {
    Param (
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
        custom_fields          = '{{}}' # This is '{}' masked to not confuse the formatting operator ("-f")
    }

    Invoke-SearchRequest -FormData $FormData
}