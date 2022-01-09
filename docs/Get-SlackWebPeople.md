---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Get-SlackWebPeople

## SYNOPSIS
Returns accounts from your workspace (and all connections).

## SYNTAX

```
Get-SlackWebPeople [-IncludeDeactivated] [<CommonParameters>]
```

## DESCRIPTION
Returns accounts from your workspace (and all connections).

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SlackWebPeople
```

Returns all active accounts from your workspace (and all connections).

### Example 2
```powershell
PS C:\> Get-SlackWebPeople -IncludeDeactivated
```

Returns all accounts from your workspace (and all connections).

## PARAMETERS

### -IncludeDeactivated
Specifies that deactivated accounts should be returned too.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
