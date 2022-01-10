function Get-SlackWebPeople {
    Param (
        [switch]$IncludeDeactivated
    )

    [int]$HideDeactivatedUsers = -not $IncludeDeactivated

    $FormData = @{
        module                 = 'people'
        hide_deactivated_users = $HideDeactivatedUsers
        custom_fields          = '{{}}' # This is '{}' masked to not confuse the formatting operator ("-f")
    }

    Invoke-SearchRequest -FormData $FormData
}