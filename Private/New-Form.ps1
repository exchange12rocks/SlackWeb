function New-Form {
    Param(
        [Parameter(Mandatory)]
        [System.Collections.Hashtable]$FormData,
        [Parameter(Mandatory)]
        [string]$BoundaryCommonPart
    )

    $BoundaryTemplate = '--{0}{{0}}' -f $BoundaryCommonPart

    $sb = New-Object -TypeName 'System.Text.StringBuilder'

    [void]$sb.AppendLine($BoundaryTemplate)

    foreach ($Key in $FormData.Keys) {
        $FormPiece = New-FormPiece -Name $Key -Value $FormData.$Key -BoundaryTemplate $BoundaryTemplate
        [void]$sb.AppendLine($FormPiece)
    }

    $Result = $sb.ToString()
    '{0}--' -f $Result.TrimEnd("`n").TrimEnd("`r")
}