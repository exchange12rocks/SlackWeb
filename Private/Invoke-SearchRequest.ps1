function Invoke-SearchRequest {
    Param (
        [Parameter(Mandatory)]
        [System.Collections.Hashtable]$FormData
    )

    $ClientReqID = [guid]::NewGuid() # Anecdotical evidence shows that this value generates randomly for each search request.
    $BrowserSessionID = [guid]::NewGuid() # Anecdotical evidence shows that this value generates randomly for each search request.

    $FormDataCommon = @{
        query                  = ''
        client_req_id          = $ClientReqID.Guid
        browse_session_id      = $BrowserSessionID.Guid
        page                   = 1
        extracts               = 0
        highlight              = 0
        extra_message_data     = 1
        no_user_profile        = 1
        count                  = 50
        team                   = '' # This property is filled by Invoke-ApiRequest
        max_filter_suggestions = 10
        sort                   = 'name'
        sort_dir               = 'asc'
        browse                 = 'standard'
        token                  = '' # This property is filled by Invoke-ApiRequest
        _x_reason              = 'browser-query'
    }

    foreach ($Key in $FormData.Keys) {
        $FormDataCommon.$Key = $FormData.$Key
    }

    $Response = (Invoke-ApiRequest -FormData $FormDataCommon -Method 'search.modules').Content | ConvertFrom-Json
    $Response.items

    $PageCount = $Response.pagination.page_count
    if ($PageCount -gt 1) {
        for ($Page = 2; $Page -le $PageCount; $Page++) {
            $FormDataCommon.page = $Page
            $Response = (Invoke-ApiRequest -FormData $FormDataCommon -Method 'search.modules').Content | ConvertFrom-Json
            $Response.items
        }
    }
}