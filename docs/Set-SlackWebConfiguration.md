---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Set-SlackWebConfiguration

## SYNOPSIS
Allows you to change your cookie and token in module's settings.

## SYNTAX

```
Set-SlackWebConfiguration [[-Token] <String>] [[-Cookie] <String>] [<CommonParameters>]
```

## DESCRIPTION
Use this function if you want to update your token and/or d-cookie values.
You will have to reload the module for the new values to become active.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-SlackWebConfiguration -Token 'xoxc-111111111111-111111111111-1111111111111-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' -Cookie 'zJYZLiEmWCDwf1UK2Rd7MAFOesSaGVuH86on0vgPQhTXcBlkpyN3x49bjtqr5Ili54uEJRskqyM7A6FInHgUKo93pC2GSP1LVZ8f0vwDcNxadtrmWeTYBQOzbXhjTkhyzi4SLXHjY9REMGfeCQpnoAstdV0xbBc723ZOwgP8qKNav5l6IrDJW1FmUu'
```

Sets the values of the cookie and token.

## PARAMETERS

### -Cookie
The value of your d-cookie.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
The value of your web-token (xoxc-).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

## NOTES

## RELATED LINKS
