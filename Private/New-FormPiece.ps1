function New-FormPiece {
    Param(
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$Value,
        [Parameter(Mandatory)]
        [string]$BoundaryTemplate
    )

    'Content-Disposition: form-data; name="{0}"

{1}
{2}' -f $Name, $Value, $BoundaryTemplate
}