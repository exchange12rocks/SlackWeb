---
external help file: SlackWeb-help.xml
Module Name: SlackWeb
online version:
schema: 2.0.0
---

# Export-SlackWebPeople

## SYNOPSIS
Exports all user accounts into a JSON-file.

## SYNTAX

```
Export-SlackWebPeople [-OutFile] <String> [-IncludeDeactivated] [<CommonParameters>]
```

## DESCRIPTION
Exports all user accounts from your workspace (and connected to it) into a JSON-file.

## EXAMPLES

### Example 1
```powershell
PS C:\> Export-SlackWebPeople -OutFile .\people.json
```

Exports all active user accounts from your workspace (and connected to it) into a JSON-file "people.json".

### Example 1
```powershell
PS C:\> Export-SlackWebPeople -IncludeDeactivated -OutFile .\people.json
```

Exports all user accounts from your workspace (and connected to it) into a JSON-file "people.json".

## PARAMETERS

### -IncludeDeactivated
Specifies that deactivated accounts should be exported too.

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

### -OutFile
A path to the resulting file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
