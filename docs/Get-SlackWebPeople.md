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
Get-SlackWebPeople [-IncludeDeactivated]
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

## INPUTS

### None

## OUTPUTS

## NOTES

## RELATED LINKS
