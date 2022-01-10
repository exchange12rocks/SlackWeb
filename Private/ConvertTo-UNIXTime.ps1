function ConvertTo-UNIXTime {
    # https://gradualdev.wordpress.com/2014/01/21/converting-from-unix-timestamp/
    Param (
        [datetime]$Date
    )

    $epoch = [timezone]::CurrentTimeZone.ToLocalTime([datetime]'1/1/1970')
    (New-TimeSpan -Start $epoch -End $Date).TotalSeconds
}